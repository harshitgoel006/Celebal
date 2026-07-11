# Week 4 - Azure Data Factory

## 📌 Overview

This project demonstrates how to use Azure Data Factory (ADF) to perform data movement and metadata extraction using Azure Blob Storage.

The lab consists of two exercises:

1. Copy Data Pipeline
2. Metadata Pipeline

---

## 🛠️ Technologies Used

- Microsoft Azure
- Azure Data Factory
- Azure Blob Storage
- Azure RBAC (IAM)

---

## Exercise 1 – Copy Data Pipeline

### Objective

Copy a CSV file from one Blob Storage container to another using Azure Data Factory.

### Steps Performed

- Created an Azure Storage Account.
- Created two Blob Containers:
  - input
  - output
- Uploaded the source CSV file into the input container.
- Created Source Dataset.
- Created Destination Dataset.
- Built a Copy Data pipeline.
- Executed the pipeline successfully.
- Verified that the file was copied into the output container.

### Result

✔ Pipeline executed successfully.

---

## Exercise 2 – Metadata Pipeline

### Objective

Retrieve metadata of files stored in Azure Blob Storage.

### Steps Performed

- Created a Metadata Pipeline.
- Added Get Metadata activity.
- Connected the Source Dataset.
- Configured metadata fields.
- Executed the pipeline successfully.
- Retrieved metadata information.

### Metadata Retrieved

- File Size
- Last Modified Time
- Child Items (if applicable)

### Result

✔ Metadata pipeline executed successfully.

---

## Screenshots

- Storage Account
- Blob Containers
- Source Dataset
- Destination Dataset
- Copy Data Pipeline
- Successful Pipeline Execution
- Metadata Pipeline
- Successful Metadata Execution

---

## Learning Outcomes

After completing this lab, I learned:

- Azure Blob Storage
- Azure Data Factory
- Dataset Creation
- Copy Data Activity
- Get Metadata Activity
- Pipeline Execution
- Azure RBAC for Storage Access
- Data Movement between Blob Containers

---

## Author

**Harshit Goel**

B.Tech CSE (Cloud Computing & Blockchain)

DIT University