# retail-data-analysis

Retail customer analytics using **Python, SQL, AI-assisted SQL, and Metabase**

---

## Project Overview
This project focuses on analyzing retail customer behavior using transaction and campaign response data.  
The goal is to identify high-value customers, understand spending patterns, and evaluate campaign response behavior.

The project demonstrates a **real-world end-to-end analytics workflow**, including:
- Database creation
- Permission management
- Manual analysis using Python
- AI-assisted SQL analysis using Metabase

---

## End-to-End Workflow

### 1. Database Setup (SQL Server – SSMS)
- Created the database in SQL Server (SSMS)
- Imported CSV files into relational tables
- Verified schema, data types, and row integrity

### 2. User & Permission Management
- Created a restricted database user for Metabase
- Granted read-only access using schema-level permissions  
  ```sql
  GRANT SELECT ON SCHEMA::dbo TO metabase_user;
- Maintained separation between admin and analytics users
### 3. Metabase Integration
- Connected Metabase to SQL Server
- Synced database schema
- Verified table visibility and record accuracy
## Dataset Description
### Tables Used
#### Retail_Data_Response
- customer_id
- response (0 = No, 1 = Yes)
#### Retail_Data_Transaction
- customer_id
- trans_date
- tran_amount

---

## Data Cleaning & Preparation (Python – Manual)
All data cleaning and preprocessing were done manually using Python.
### Tasks Performed
- Handled missing values
- Corrected and standardized data types
- Converted dates using to_datetime
- Created a month column from transaction date
- Validated customer-level consistency
### Libraries Used
- Pandas
- Matplotlib
- Seaborn

---

## SQL Analysis (Metabase)
SQL analysis was performed in Metabase after database integration.
### Key SQL Operations
- Joining transaction and response tables
- Customer-level aggregation
- Total and average spend calculations
- Response rate analysis
- Customer counts by response type (0 vs 1)
- Customer segmentation:
   - High Value
   - Medium-High Value
   - Medium Value
   - Low Value
- RFM analysis (Recency, Frequency, Monetary)
### Note:
SQL queries were generated using AI assistance (MinusX AI) inside Metabase.
Queries were reviewed, understood, and validated manually.

---

## Advanced Analytics (Python)
- RFM Analysis
- Cohort Analysis:
  - Customer churn
  - Active customer tracking
- High-value customer trend analysis using line charts

---

## Visualization
- Spend distribution analysis
- Customer segment comparison
- Response behavior by customer value
- High-value customer trend analysis
Visualizations were created using:
- Matplotlib
- Seaborn

---

## Key Insights
- High-value customers spend ~15x more than low-value customers
- High-value customers have a significantly higher probability of response (response = 1)
- Clear behavioral differences across customer segments

---

## Tools & Technologies
- Python
- SQL Server (SSMS)
- Metabase
- MinusX AI (AI-assisted SQL)
- Pandas
- Matplotlib
- Seaborn

---

## Disclaimer
- Data cleaning and analysis in Python were performed manually
- SQL analysis in Metabase used AI-assisted query generation, with full understanding and validation of outputs
