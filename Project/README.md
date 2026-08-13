
# LearnTrack – LMS Analytics Pipeline

## Project Overview

LearnTrack is a batch data engineering pipeline designed to transform raw Learning Management System (LMS) data into clean, enriched, and business-ready analytical datasets.

The pipeline follows the Medallion Architecture with three layers:

- Bronze – Raw data ingestion
- Silver – Data cleaning and enrichment
- Gold – Business analytics and KPIs

The project focuses on learner engagement, course completion, instructor effectiveness, assessment performance, dropout behavior, re-enrolment patterns, category performance, learner progress, and overall LMS KPIs.

---

## Problem Statement

LMS platforms continuously generate learner activity data through course enrolments, progress tracking, assessments, completions, and dropouts.

However, raw operational data is difficult to use directly for business analysis because it may contain duplicate records, missing values, inconsistent fields, and data that requires enrichment.

LearnTrack addresses this problem by building a structured data pipeline that cleans, enriches, aggregates, and presents LMS data for analytical use.

---

## Objectives

The main objectives of the project are:

- Build a reliable batch data engineering pipeline for LMS data.
- Preserve raw source data in the Bronze layer.
- Clean and enrich data in the Silver layer.
- Generate business-focused analytical datasets in the Gold layer.
- Analyze course completion and dropout behavior.
- Analyze learner engagement and progress.
- Evaluate instructor effectiveness.
- Analyze assessment performance.
- Identify re-enrolment patterns.
- Provide overall LMS performance KPIs.

---

## Dataset

The project uses three source datasets:

| Dataset | Records |
|---|---:|
| learners.csv | 500 |
| courses.csv | 60 |
| enrolment_activity.csv | 2,000 |

The datasets cover a 90-day operational period from January to March 2024.

The source data intentionally contains data-quality issues such as duplicate enrolment records, missing instructor names, missing activity dates, and NULL assessment/completion fields.

---

## Technology Stack

- **Python** – Data generation and ingestion
- **Apache PySpark** – Distributed data processing and transformations
- **Databricks** – Spark-based development and execution environment
- **Delta Lake** – Reliable storage across pipeline layers
- **SQL** – Analytical querying and business logic

---

## Pipeline Architecture

The pipeline follows the Medallion Architecture.

### Bronze Layer

The Bronze layer stores the raw source data with minimal modification.

Its purpose is to preserve the original source data, including:

- Duplicate records
- NULL values
- Missing fields
- Original formatting

This layer acts as the raw and reproducible starting point for downstream processing.

### Silver Layer

The Silver layer establishes data quality and adds business context.

Major transformations include:

- Data type and date standardization
- Duplicate enrolment removal
- Instructor name resolution
- Learning duration calculation
- Learner and course enrichment
- Joining learners, courses, and enrolment activity

The result is an enriched enrolment-level dataset suitable for analytics.

### Gold Layer

The Gold layer contains business-oriented analytical datasets.

The pipeline generates analytical outputs for:

- Course completion
- Instructor performance
- Learner engagement
- Assessment performance
- Re-enrolment analysis
- Dropout analysis
- Category performance
- Learner progress distribution
- Platform KPI summary

---

## Gold Layer Analytics

### Course Completion

Measures total enrolments, completed enrolments, and completion rates for each course.

Courses are classified into performance categories based on their completion rate.

### Instructor Performance

Evaluates instructors using:

- Total enrolments
- Completed enrolments
- Completion rate
- Average assessment score
- Total assessment attempts

### Learner Engagement

Learners are analyzed using their latest activity date, progress percentage, and enrolment status.

Learners are categorized into engagement groups such as:

- Active
- Low Engagement
- Completed
- Dropped

### Assessment Performance

Assessment performance is analyzed using:

- Average assessment score
- Total attempts
- Assessed learners

Courses are categorized based on assessment performance.

### Re-enrolment Analysis

Repeated learner-course enrolments and assessment attempts are analyzed to identify re-enrolment behavior.

### Dropout Analysis

Dropout rates are calculated at course and category levels to identify areas with comparatively higher learner attrition.

### Category Performance

Course categories are compared using:

- Total enrolments
- Completed enrolments
- Dropped enrolments
- Completion rate
- Dropout rate

### Learner Progress Distribution

Learners are segmented according to their latest progress percentage to understand the distribution of learner progress.

### Platform KPI Summary

The final KPI summary provides:

- Total learners
- Total courses
- Total enrolments
- Completed enrolments
- Dropped enrolments
- Overall completion rate
- Overall dropout rate

---

## Final KPI Results

The completed pipeline produced the following overall metrics:

| KPI | Value |
|---|---:|
| Total Learners | 495 |
| Total Courses | 60 |
| Total Enrolments | 1,990 |
| Completed Enrolments | 818 |
| Dropped Enrolments | 411 |
| Overall Completion Rate | 41.11% |
| Overall Dropout Rate | 20.65% |

---

## Gold Layer Outputs

The pipeline validates the following Gold datasets:

- Course Completion – 60 records
- Instructor Performance – 14 records
- Learner Engagement – 495 records
- Assessment Performance – 60 records
- Re-enrolment Analysis – 460 records
- Dropout Analysis – 60 records
- Category Performance – 8 records
- Progress Distribution – 495 records
- KPI Summary – 1 record

---

## Business Value

The analytical outputs can support LMS stakeholders in:

- Identifying instructors with stronger or weaker learner outcomes
- Identifying courses with low completion rates
- Detecting learner dropout patterns
- Understanding re-enrolment behavior
- Comparing course categories
- Monitoring learner progress
- Evaluating assessment performance
- Monitoring overall LMS performance

These insights can support content improvement, learner engagement initiatives, instructor performance management, and course planning.

---

## Project Structure

```text
LearnTrack-LMS-Analytics/
│
├── README.md
├── LearnTrack_LMS_Analytics.ipynb
│
├── data/
│   ├── learners.csv
│   ├── courses.csv
│   └── enrolment_activity.csv
│
└── outputs/
    ├── bronze/
    ├── silver/
    └── gold/
````

> The exact folder structure may vary depending on the Databricks/Colab execution environment.

---

## Execution Flow

```text
Raw CSV Data
     |
     v
Bronze Layer
     |
     | Cleaning + Standardization
     v
Silver Layer
     |
     | Aggregation + Business Logic
     v
Gold Layer
     |
     v
Business Analytics & KPIs
```

---

## Validation

The pipeline performs validation of the generated Gold datasets by reading the stored Delta outputs and checking the expected analytical record counts.

The final validation confirms that all required Gold analytical datasets were successfully created.

---

## Conclusion

LearnTrack demonstrates an end-to-end batch data engineering workflow for LMS analytics using the Medallion Architecture.

The pipeline preserves raw data, establishes data quality in the Silver layer, and produces business-ready analytical datasets in the Gold layer.

The resulting datasets provide a foundation for LMS performance monitoring, learner analysis, course evaluation, instructor performance analysis, and business decision-making.


