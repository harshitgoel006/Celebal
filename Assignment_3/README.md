# Celebal Technologies Internship - Week 3 SQL Assignment

## 📌 Objective

The objective of this assignment is to perform SQL-based data analysis on the Superstore dataset using advanced SQL concepts such as Subqueries, Common Table Expressions (CTEs), Window Functions, JOINs, and Aggregation techniques to solve real-world business problems.

---

## 🛠️ Tools & Technologies

- MySQL 8.0
- MySQL Workbench
- SQL
- Superstore Dataset (CSV)

---

## 📂 Dataset

The Superstore dataset contains sales transaction records including:

- Customer Information
- Order Details
- Product Information
- Sales
- Profit
- Discount
- Region
- Category
- Segment

---

## 📁 Database Structure

The following tables were created:

- `superstore_raw`
- `customers`
- `orders`
- `products`

The normalized tables were populated using `INSERT INTO ... SELECT DISTINCT` statements.

---

## 📚 SQL Concepts Covered

### 1. Subqueries

- Sales greater than average sales
- Highest sales order for each customer

### 2. Common Table Expressions (CTEs)

- Total sales per customer
- Customers with above-average sales

### 3. Window Functions

- RANK()
- ROW_NUMBER()

### 4. JOIN Operations

- Customer sales report using JOIN + CTE + Window Function

---

## 📌 Business Queries Solved

### Assignment Queries

1. Find orders where sales are greater than average sales.
2. Find the highest sales order for each customer.
3. Calculate total sales for each customer using CTE.
4. Find customers whose total sales are above average.
5. Rank customers based on total sales.
6. Assign row numbers to each order within a customer.
7. Display the top-ranked customers using Window Functions.
8. Combine JOIN, CTE, and Window Functions to generate customer sales rankings.

---

## 📊 Mini Project

Customer Sales Insights

- Top 5 Customers
- Bottom 5 Customers
- Customers Who Made Only One Order
- Customers Having Above Average Sales
- Highest Order Value Per Customer

---

## 📂 Repository Structure

```
Week-3/
│
├── Assignment_3.sql
├── Week_3_Task_Report.docx
├── README.md
└── Superstore.csv
```

---

## 📈 Key Insights

- Customers with the highest cumulative sales were identified.
- Average sales were calculated using subqueries.
- Customer performance was analyzed using CTEs.
- Window functions were used for ranking and row numbering.
- SQL JOINs were used to combine customer information with calculated sales metrics.
- The analysis demonstrates practical SQL techniques used in business reporting and sales analytics.

---

## ✅ Learning Outcomes

After completing this assignment, I gained hands-on experience with:

- Data Normalization
- SQL Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Aggregate Functions
- JOIN Operations
- Business Data Analysis using SQL
- Writing optimized SQL queries for reporting

---

## 👨‍💻 Author

**Harshit Goel**

SQL Internship Assignment – Week 3

Celebal Technologies