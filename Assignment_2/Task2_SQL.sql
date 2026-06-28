-- ============================================
-- Celebal Summer Internship 2026
-- Week 2 - SQL Based Data Analysis
-- ============================================



CREATE DATABASE celebal_sql;
USE celebal_sql;


-- ============================================
-- Create Table : customers
-- ============================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL,
    is_premium BOOLEAN DEFAULT FALSE
);

CREATE INDEX idx_customers_city
ON customers(city);

CREATE INDEX idx_customers_state
ON customers(state);


-- ============================================
-- Create Table : products
-- ============================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0),
    stock_qty INT NOT NULL DEFAULT 0 CHECK (stock_qty >= 0)
);

CREATE INDEX idx_products_category
ON products(category);


-- ============================================
-- Create Table : orders
-- ============================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    total_amount DECIMAL(12,2) NOT NULL CHECK (total_amount >= 0),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE INDEX idx_orders_date
ON orders(order_date);

CREATE INDEX idx_orders_status
ON orders(status);


-- ============================================
-- Create Table : order_items
-- ============================================

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0),
    discount_pct DECIMAL(5,2) DEFAULT 0 CHECK (discount_pct BETWEEN 0 AND 100),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);




-- ============================================
-- Insert Data : customers
-- ============================================

INSERT INTO customers VALUES 
(101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', 
TRUE), 
(102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', 
FALSE), 
(103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', 
TRUE), 
(104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', 
FALSE), 
(105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', 
TRUE), 
(106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', 
FALSE), 
(107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', 
TRUE), 
(108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', 
FALSE);


-- ============================================
-- Insert Data : products
-- ============================================

INSERT INTO products VALUES 
(201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250), 
(202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500), 
(203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150), 
(204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120), 
(205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200), 
(206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300), 
(207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180), 
(208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400); 


-- ============================================
-- Insert Data : orders
-- ============================================

INSERT INTO orders VALUES 
(1001, 101, '2024-08-01', 'Delivered',  4498.00), 
(1002, 102, '2024-08-03', 'Delivered',  799.00), 
(1003, 103, '2024-08-05', 'Shipped',    7498.00), 
(1004, 101, '2024-08-10', 'Delivered',  3499.00), 
(1005, 104, '2024-08-12', 'Cancelled',  2999.00), 
(1006, 105, '2024-08-15', 'Delivered',  5898.00), 
(1007, 106, '2024-08-18', 'Pending',    1299.00), 
(1008, 103, '2024-08-20', 'Delivered',  899.00), 
(1009, 107, '2024-08-25', 'Shipped',    6098.00), 
(1010, 108, '2024-08-28', 'Delivered',  1598.00); 


-- ============================================
-- Insert Data : order_items
-- ============================================

INSERT INTO order_items VALUES 
(5001, 1001, 201, 2, 1499.00, 0), 
(5002, 1001, 207, 1, 899.00,  10), 
(5003, 1002, 202, 1, 799.00,  0), 
(5004, 1003, 203, 1, 2999.00, 0), 
(5005, 1003, 204, 1, 4599.00, 5), 
(5006, 1004, 205, 1, 3499.00, 0), 
(5007, 1005, 203, 1, 2999.00, 0), 
(5008, 1006, 201, 1, 1499.00, 10), 
(5009, 1006, 204, 1, 4599.00, 5), 
(5010, 1007, 206, 1, 1299.00, 0), 
(5011, 1008, 207, 1, 899.00,  0), 
(5012, 1009, 205, 1, 3499.00, 0), 
(5013, 1009, 208, 2, 599.00,  15), 
(5014, 1010, 206, 1, 1299.00, 0), 
(5015, 1010, 208, 1, 599.00,  0); 




-- ==========================================================
-- Database Verification
-- ==========================================================

SHOW TABLES;

DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_items;



-- ==========================================================
-- Q1
-- Display all columns and rows from the customers table
-- ==========================================================

SELECT *
FROM customers;

-- ==========================================================
-- Q2
-- Display first name, last name and city of all customers
-- ==========================================================

SELECT first_name, last_name, city
FROM customers;

-- ==========================================================
-- Q3
-- Display all unique product categories
-- ==========================================================

SELECT DISTINCT category
FROM products;

-- ==========================================================
-- Q5
-- Attempt to insert duplicate email
-- ==========================================================

INSERT INTO customers
VALUES
(
109,
'Rahul',
'Verma',
'aarav.s@email.com',
'Lucknow',
'Uttar Pradesh',
'2024-09-01',
FALSE
);

-- ==========================================================
-- Q6
-- Attempt to insert a product with a negative unit price
-- ==========================================================

INSERT INTO products (
    product_id,
    product_name,
    category,
    brand,
    unit_price,
    stock_qty
)
VALUES
(
    209,
    'USB Cable',
    'Electronics',
    'HP',
    -50,
    100
);

-- ==========================================================
-- Q7
-- Display all delivered orders
-- ==========================================================

SELECT *
FROM orders
WHERE status = 'Delivered';

-- ==========================================================
-- Q8
-- Electronics products with unit price greater than 2000
-- ==========================================================

SELECT *
FROM products
WHERE category = 'Electronics' AND unit_price > 2000;

-- ==========================================================
-- Q9
-- Customers from Maharashtra who joined in 2024
-- ==========================================================

SELECT *
FROM customers
WHERE state = 'Maharashtra' AND join_date BETWEEN '2024-01-01' AND '2024-12-31';

-- ==========================================================
-- Q10
-- Orders between 10 Aug and 25 Aug except cancelled
-- ==========================================================

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25' AND status <> 'Cancelled';

-- ==========================================================
-- Q11
-- Query that benefits from idx_orders_date
-- ==========================================================

SELECT *
FROM orders
WHERE order_date = '2024-08-15';

-- ==========================================================
-- Q12
-- Index-friendly query using date range
-- ==========================================================

SELECT *
FROM customers
WHERE join_date BETWEEN '2024-01-01' AND '2024-12-31';

-- ==========================================================
-- Q13
-- Count total number of orders
-- ==========================================================

SELECT COUNT(*) AS total_orders
FROM orders;

-- ==========================================================
-- Q14
-- Total revenue from delivered orders
-- ==========================================================

SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Delivered';

-- ==========================================================
-- Q15
-- Average unit price by category
-- ==========================================================

SELECT category, AVG(unit_price) AS average_price
FROM products
GROUP BY category;

-- ==========================================================
-- Q16
-- Order count and revenue by status
-- ==========================================================

SELECT status,COUNT(order_id) AS total_orders, SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;

-- ==========================================================
-- Q17
-- Maximum and minimum price in each category
-- ==========================================================

SELECT category,MAX(unit_price) AS highest_price,MIN(unit_price) AS lowest_price
FROM products
GROUP BY category;

-- ==========================================================
-- Q18
-- Categories with average price greater than 2000
-- ==========================================================

SELECT category,AVG(unit_price) AS average_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;

-- ==========================================================
-- Q19
-- Display orders with customer details
-- ==========================================================

SELECT o.order_id, o.order_date, c.first_name,c.last_name, o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- ==========================================================
-- Q20
-- Display all customers and their orders
-- ==========================================================

SELECT c.customer_id,c.first_name,c.last_name,o.order_id,o.order_date,o.status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- ==========================================================
-- Q21
-- Display order details with product information
-- ==========================================================

SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price, oi.discount_pct
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;

-- ==========================================================
-- Q23
-- Attempt to insert an order with an invalid customer_id
-- ==========================================================

INSERT INTO orders
VALUES
(
1011,
999,
'2024-09-01',
'Pending',
2500.00
);

-- ==========================================================
-- Q24
-- Classify products into price tiers
-- ==========================================================

SELECT product_name,
       unit_price,
       CASE
           WHEN unit_price < 1000 THEN 'Budget'
           WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
           ELSE 'Premium' END AS price_tier
FROM products;


-- ==========================================================
-- Q25
-- Count delivered and not delivered orders
-- ==========================================================

SELECT
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN status <> 'Delivered' THEN 1 ELSE 0 END) AS not_delivered_orders
FROM orders;

-- ==========================================================
-- Q27
-- Transaction Example
-- ==========================================================

START TRANSACTION;

INSERT INTO orders
VALUES
(
1011,
102,
CURDATE(),
'Pending',
1598.00
);

INSERT INTO order_items
VALUES
(
5016,
1011,
206,
1,
1299.00,
0
);

INSERT INTO order_items
VALUES
(
5017,
1011,
208,
1,
299.00,
0
);

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 206;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

COMMIT;



