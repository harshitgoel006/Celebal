# 🛒 Week 8 — E-Commerce Order Analytics System

## 📌 Overview

The **E-Commerce Order Analytics System** is a Python and SQL based data analytics project designed to simulate a real-world e-commerce data pipeline.

The project generates synthetic e-commerce data along with intentional data-quality issues, performs data cleaning and validation, verifies referential integrity, and loads the processed data into a SQLite database. The cleaned data is then used for a wide range of analytical SQL queries, from basic aggregations to advanced SQL techniques. A command-line reporting tool is also included to provide analytical results.

---

## 🎯 Objectives

The main objectives of this project are:

- Generate synthetic datasets representing an e-commerce system.
- Introduce realistic data-quality issues into the generated datasets.
- Clean, validate, and prepare the data for further processing.
- Verify referential integrity across related datasets.
- Load the cleaned datasets into a SQLite database.
- Perform basic, intermediate, and advanced SQL analysis.
- Develop a command-line reporting tool for generating reports.
- Handle the required data-quality and analytical edge cases.
- Analyze products that are frequently purchased together.

---

## 🛠️ Technologies & Tools

The project uses the following technologies:

- **Python** — Data generation, cleaning, processing, and CLI implementation
- **Pandas** — Data manipulation and data validation
- **SQLite** — Database storage and querying
- **SQL** — Data analysis and reporting
- **Python `unittest`** — Automated testing

---

## 📂 Project Structure

```text
Task_8/
│
├── data/
│   │
│   ├── raw/
│   │   ├── customers.csv
│   │   ├── orders.csv
│   │   ├── order_items.csv
│   │   └── products.csv
│   │
│   └── cleaned/
│       ├── customers_cleaned.csv
│       ├── orders_cleaned.csv
│       ├── order_items_cleaned.csv
│       ├── products_cleaned.csv
│       ├── orphan_order_items.csv
│       └── data_quality_report.md
│
├── database/
│   └── ecommerce.db
│
├── sql/
│   ├── 01_revenue_per_category.sql
│   ├── 02_top_10_customers.sql
│   ├── 03_last_12_months.sql
│   ├── 04_undelivered_customers.sql
│   ├── 05_excessive_returns.sql
│   ├── 06_category_return_rate.sql
│   ├── 07_running_totals.sql
│   ├── 08_dense_rank.sql
│   ├── 09_lag_lead.sql
│   ├── 10_multi_level_cte.sql
│   ├── 11_ntile_segmentation.sql
│   ├── 12_yoy_comparison.sql
│   ├── 13_first_last_value.sql
│   ├── 14_cumulative_distribution.sql
│   ├── 15_cohort_analysis.sql
│   ├── 16_self_join_window.sql
│   └── 17_frequently_bought_together.sql
│
├── src/
│   │
│   ├── data_generation/
│   │   └── generate_data.py
│   │
│   ├── data_cleaning/
│   │   └── clean_data.py
│   │
│   ├── database/
│   │   └── load_database.py
│   │
│   ├── analytics/
│   │   └── run_queries.py
│   │
│   └── cli/
│       └── report.py
│
├── tests/
│   └── test_task8.py
│
├── requirements.txt
└── README.md
````

---

## 🔄 Project Workflow

The overall workflow of the project can be summarized as:

```text
Synthetic Data Generation
          ↓
Data Quality Issues
          ↓
Data Cleaning & Validation
          ↓
Referential Integrity Checks
          ↓
Cleaned CSV Files
          ↓
SQLite Database
          ↓
SQL Analytics
          ↓
CLI Reporting
          ↓
Testing & Validation
```

---

## 📊 Data Generation

The project begins by generating synthetic datasets representing different components of an e-commerce system.

The raw data consists of:

* Customers
* Orders
* Order Items
* Products

Intentional data-quality issues are introduced into the generated datasets to simulate problems commonly encountered in real-world data pipelines.

---

## 🧹 Data Cleaning & Validation

The generated data is processed before being loaded into the database.

The cleaning stage includes:

* Identifying data-quality issues.
* Cleaning invalid records.
* Validating the generated datasets.
* Checking relationships between related tables.
* Identifying orphan order items.
* Generating a data-quality report.

The cleaned datasets are stored separately under:

```text
data/cleaned/
```

---

## 🗄️ Database Layer

After cleaning and validation, the processed datasets are loaded into a **SQLite database**.

Database file:

```text
database/ecommerce.db
```

The database provides a structured environment for performing SQL-based analysis across customers, orders, order items, and products.

---

## 📈 SQL Analytics

The project includes **17 SQL analysis tasks** covering different levels of SQL complexity.

### Basic & Intermediate Analysis

* Revenue per category
* Top 10 customers
* Last 12 months analysis
* Undelivered customers
* Excessive returns
* Category-wise return rate
* Running totals
* Dense ranking
* LAG and LEAD analysis

### Advanced SQL Analysis

* Multi-level CTE
* NTILE-based segmentation
* Year-over-year comparison
* FIRST_VALUE and LAST_VALUE
* Cumulative distribution
* Cohort analysis
* Self-join with window functions
* Frequently bought-together product analysis

The SQL scripts are maintained separately inside the:

```text
sql/
```

directory.

---

## 🖥️ Command-Line Reporting

A command-line reporting utility is included as part of the project.

The reporting module allows analytical results to be accessed through the command line and provides a simple interface for interacting with the analytics functionality.

Implementation:

```text
src/cli/report.py
```

---

## 🧪 Testing

The project includes automated tests using Python's built-in `unittest` framework.

Test file:

```text
tests/test_task8.py
```

The test suite is used to verify important project functionality and ensure that the required edge cases are handled correctly.

---

## 📁 Important Output Files

The project generates the following important outputs:

### Raw Data

```text
data/raw/
```

Contains the original synthetic datasets.

### Cleaned Data

```text
data/cleaned/
```

Contains the validated datasets and data-quality information.

### Database

```text
database/ecommerce.db
```

Contains the cleaned e-commerce data in SQLite format.

### SQL Queries

```text
sql/
```

Contains all analytical SQL scripts.

---

## 📚 Key Concepts Covered

This project provides practical exposure to:

* Synthetic data generation
* Data quality management
* Data cleaning
* Data validation
* Referential integrity
* Relational databases
* SQLite
* SQL aggregations
* Window functions
* Common Table Expressions (CTEs)
* Customer segmentation
* Cohort analysis
* Year-over-year analysis
* Product association analysis
* Command-line reporting
* Unit testing

---

## 🚀 Project Highlights

* Simulates a realistic e-commerce data environment.
* Includes intentional data-quality issues for validation practice.
* Separates raw and cleaned datasets.
* Uses SQLite for structured analytical processing.
* Contains 17 analytical SQL queries.
* Covers advanced SQL concepts such as CTEs and window functions.
* Includes a command-line reporting utility.
* Provides automated testing using `unittest`.

---

## 👨‍💻 Project Structure Summary

| Component              | Purpose                      |
| ---------------------- | ---------------------------- |
| `data/`                | Raw and cleaned datasets     |
| `database/`            | SQLite database              |
| `sql/`                 | Analytical SQL queries       |
| `src/data_generation/` | Synthetic data generation    |
| `src/data_cleaning/`   | Data cleaning and validation |
| `src/database/`        | Database loading             |
| `src/analytics/`       | Query execution              |
| `src/cli/`             | Command-line reporting       |
| `tests/`               | Automated tests              |
| `requirements.txt`     | Project dependencies         |
| `README.md`            | Project documentation        |

---

## ✅ Final Outcome

The completed system provides an end-to-end workflow for generating, cleaning, validating, storing, and analyzing e-commerce data. It combines Python-based data processing with SQL analytics and demonstrates how structured data pipelines can be organized into separate generation, cleaning, database, analytics, reporting, and testing components.


