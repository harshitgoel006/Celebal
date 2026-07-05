-- ==========================================================
-- Assignment 3
-- SQL Analysis using Subqueries, CTEs and Window Functions
-- ==========================================================

-- ==========================================================
-- Step 1 : Database Creation
-- ==========================================================

CREATE DATABASE celebal_week3;

USE celebal_week3;



-- ==========================================================
-- Step 2 : Dataset Import Verification
-- ==========================================================

SHOW TABLES;

DESCRIBE superstore_raw;

SELECT * FROM superstore_raw LIMIT 5;

SELECT COUNT(*) AS total_records FROM superstore_raw;


-- ==========================================================
-- Step 3 : Create Normalized Tables
-- ==========================================================

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50)
);


CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE products (
    product_id VARCHAR(30) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),
    sales DOUBLE,
    quantity INT,
    discount DOUBLE,
    profit DOUBLE
);

SHOW TABLES;

DESCRIBE customers;

DESCRIBE orders;

DESCRIBE products;



-- ==========================================================
-- Step 4 : Insert Data into Customers
-- ==========================================================

INSERT INTO customers (
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
)
SELECT
    `Customer ID`,
    MAX(`Customer Name`),
    MAX(Segment),
    MAX(Country),
    MAX(City),
    MAX(State),
    MAX(`Postal Code`),
    MAX(Region)
FROM superstore_raw
GROUP BY `Customer ID`;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT * FROM customers LIMIT 5;



-- ==========================================================
-- Step 5 : Insert Order Records
-- ==========================================================

INSERT INTO orders (
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id
)
SELECT
    `Order ID`,
    MAX(`Order Date`),
    MAX(`Ship Date`),
    MAX(`Ship Mode`),
    MAX(`Customer ID`)
FROM superstore_raw
GROUP BY `Order ID`;


SELECT COUNT(*) AS total_orders FROM orders;

SELECT * FROM orders LIMIT 5;


-- ==========================================================
-- Step 6 : Insert Product Records
-- ==========================================================

INSERT INTO products (
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    `Product ID`,
    MAX(Category),
    MAX(`Sub-Category`),
    MAX(`Product Name`),
    MAX(Sales),
    MAX(Quantity),
    MAX(Discount),
    MAX(Profit)
FROM superstore_raw
GROUP BY `Product ID`;


SELECT COUNT(*) AS total_products FROM products;

SELECT * FROM products LIMIT 5;





-- ==========================================================
-- Section 3 : Required SQL Queries
-- ==========================================================

-- ==========================================================
-- Q1
-- Find all orders where sales are greater than average sales
-- ==========================================================

SELECT *
FROM superstore_raw
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore_raw
);



-- ==========================================================
-- Q2
-- Find the highest sales order for each customer
-- ==========================================================

SELECT
    s.`Customer ID`,
    s.`Customer Name`,
    s.`Order ID`,
    s.Sales
FROM superstore_raw s
JOIN (
    SELECT
        `Customer ID`,
        MAX(Sales) AS max_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
) m
ON s.`Customer ID` = m.`Customer ID`
AND s.Sales = m.max_sales;


-- ==========================================================
-- Q3
-- Calculate total sales for each customer using CTE
-- ==========================================================

WITH customer_sales AS (
    SELECT
        `Customer ID`,
        `Customer Name`,
        SUM(Sales) AS total_sales
    FROM superstore_raw
    GROUP BY
        `Customer ID`,
        `Customer Name`
)
SELECT *
FROM customer_sales
ORDER BY total_sales DESC;



-- ==========================================================
-- Q4
-- Find customers whose total sales are above average
-- using CTE and Subquery
-- ==========================================================

WITH customer_sales AS (
    SELECT
        `Customer ID`,
        `Customer Name`,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM superstore_raw
    GROUP BY
        `Customer ID`,
        `Customer Name`
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY total_sales DESC;


-- ==========================================================
-- Q5
-- Rank all customers based on total sales
-- ==========================================================

WITH customer_sales AS (
    SELECT
        `Customer ID`,
        `Customer Name`,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM superstore_raw
    GROUP BY
        `Customer ID`,
        `Customer Name`
)
SELECT
    `Customer ID`,
    `Customer Name`,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS customer_rank
FROM customer_sales;


-- ==========================================================
-- Q6
-- Assign row numbers to each order within a customer
-- ==========================================================

SELECT
    `Customer ID`,
    `Customer Name`,
    `Order ID`,
    Sales,
    ROW_NUMBER() OVER (
        PARTITION BY `Customer ID`
        ORDER BY Sales DESC
    ) AS row_num
FROM superstore_raw;


-- ==========================================================
-- Q7
-- Display Top 3 Customers Based on Total Sales
-- ==========================================================

WITH customer_sales AS (
    SELECT
        `Customer ID`,
        `Customer Name`,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM superstore_raw
    GROUP BY
        `Customer ID`,
        `Customer Name`
),
ranked_customers AS (
    SELECT
        *,
        RANK() OVER (ORDER BY total_sales DESC) AS customer_rank
    FROM customer_sales
)
SELECT *
FROM ranked_customers
WHERE customer_rank <= 3;



-- ==========================================================
-- Q8
-- Final Query using JOIN + CTE + Window Function
-- ==========================================================

WITH customer_sales AS (
    SELECT
        `Customer ID`,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)
SELECT
    c.customer_id,
    c.customer_name,
    cs.total_sales,
    RANK() OVER (
        ORDER BY cs.total_sales DESC
    ) AS customer_rank
FROM customer_sales cs
JOIN customers c
ON cs.`Customer ID` = c.customer_id
ORDER BY customer_rank;



-- ==========================================================
-- Mini Project 1
-- Top 5 Customers
-- ==========================================================

SELECT
    `Customer ID`,
    `Customer Name`,
    ROUND(SUM(Sales),2) AS total_sales
FROM superstore_raw
GROUP BY
    `Customer ID`,
    `Customer Name`
ORDER BY total_sales DESC
LIMIT 5;


-- ==========================================================
-- Mini Project 2
-- Bottom 5 Customers
-- ==========================================================

SELECT
    `Customer ID`,
    `Customer Name`,
    ROUND(SUM(Sales),2) AS total_sales
FROM superstore_raw
GROUP BY
    `Customer ID`,
    `Customer Name`
ORDER BY total_sales ASC
LIMIT 5;



-- ==========================================================
-- Mini Project 3
-- Customers Who Made Only One Order
-- ==========================================================

SELECT
    `Customer ID`,
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore_raw
GROUP BY
    `Customer ID`,
    `Customer Name`
HAVING COUNT(DISTINCT `Order ID`) = 1;



-- ==========================================================
-- Mini Project 4
-- Customers Having Above Average Sales
-- ==========================================================

WITH customer_sales AS (
    SELECT
        `Customer ID`,
        `Customer Name`,
        ROUND(SUM(Sales),2) AS total_sales
    FROM superstore_raw
    GROUP BY
        `Customer ID`,
        `Customer Name`
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY total_sales DESC;



-- ==========================================================
-- Mini Project 5
-- Highest Order Value Per Customer
-- ==========================================================

SELECT
    s.`Customer ID`,
    s.`Customer Name`,
    s.`Order ID`,
    s.Sales
FROM superstore_raw s
JOIN (
    SELECT
        `Customer ID`,
        MAX(Sales) AS max_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
) m
ON s.`Customer ID` = m.`Customer ID`
AND s.Sales = m.max_sales
ORDER BY s.Sales DESC;