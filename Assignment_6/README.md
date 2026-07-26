# Week 6 - Spark Architecture and Data Processing using Apache Spark

## 📌 Overview

This project demonstrates the core concepts of Apache Spark Architecture and DataFrame processing using PySpark. It covers Spark architecture, Lazy Evaluation, DAG (Lineage Graph), schema handling, filtering, transformations, actions, CSV and Parquet file formats, Predicate Pushdown, and building an end-to-end data processing pipeline.

This assignment was completed as part of the **Celebal Technologies Data Engineering Internship - Week 6**.

---

## 🚀 Objectives

- Understand Spark Architecture
- Learn Driver, Cluster Manager and Executors
- Understand Lazy Evaluation and DAG
- Read CSV and Parquet files
- Perform DataFrame Transformations
- Apply Filtering and Selection
- Rename Columns and Cast Data Types
- Add New Columns
- Understand Predicate Pushdown
- Compare CSV and Parquet Performance
- Build a Data Processing Pipeline
- Save Processed Data in CSV and Parquet formats

---

## 🛠️ Technologies Used

- Apache Spark
- PySpark
- Python
- Google Colab

---

## 📂 Dataset

A sample e-commerce orders dataset was created for this assignment to demonstrate Spark DataFrame operations.

Dataset Columns:

- user_id
- product_id
- category
- old_name
- price
- base_price
- amount
- status
- region
- priority

---

## 📋 Tasks Performed

- Read CSV file with schema inference
- Selected required columns
- Applied filtering conditions
- Renamed DataFrame columns
- Casted data types
- Added calculated columns
- Filtered null values
- Read and wrote Parquet files
- Saved processed data as CSV
- Compared CSV and Parquet
- Studied Spark Architecture concepts

---

## 📁 Project Structure

```
Assignment_6
│
├── Week_6_Report.pdf
├── Celebal_Week6_Spark_Architecture.ipynb
├── ecommerce_orders.csv
├── input_parquet/
├── output_csv/
└── README.md
```

---

## ▶️ How to Run

1. Install PySpark.
2. Open the notebook in Google Colab.
3. Upload the dataset.
4. Run all notebook cells sequentially.
5. Generated outputs will be stored in CSV and Parquet formats.

---

## 📚 Concepts Covered

- Spark Architecture
- Driver
- Cluster Manager
- Executors
- Lazy Evaluation
- DAG (Lineage Graph)
- Transformations
- Actions
- Predicate Pushdown
- CSV vs Parquet
- Schema Inference
- DataFrame Operations

---

## 👨‍💻 Author

**Harshit Goel**

B.Tech Computer Science (Cloud Computing & Blockchain)

DIT University, Dehradun

---

## ⭐ Internship

Completed as part of the **Celebal Technologies Data Engineering Internship (Week 6 Assignment)**.