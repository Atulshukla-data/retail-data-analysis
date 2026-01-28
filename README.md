# retail-data-analysis
retail customer analytics using Python, SQL, AI assisted SQL and metabase

Project Overview

This project focuses on analyzing retail customer behavior using transaction and campaign response data. The goal was to identify high-value customers, understand spending patterns, and evaluate campaign response behavior using a combination of Python, SQL, and BI tools.
The project demonstrates a real-world analytics workflow, including database creation, permission management, manual analysis, and AI-assisted exploration.

* End-to-End Workflow -
1️. Database Setup (SQL Server – SSMS)
   Created the database in SQL Server (SSMS)
   Imported CSV files into relational tables
   Verified schema, data types, and row integrity
2️. User & Permission Management -
   Created a restricted database user for Metabase
   Granted read-only access using schema-level permissions:
          [GRANT SELECT ON SCHEMA::dbo TO metabase_user;]
   Maintained separation between admin user and analytics user.
3️. Metabase Integration -
   Connected Metabase to SQL Server
   Synced database schema
   Verified table visibility and record accuracy
* Dataset Description
      - Retail_Data_Response
             customer_id
             response (0 = No, 1 = Yes)
      - Retail_Data_Transaction
             customer_id
             trans_date
             trans_amount

* Data Cleaning & Preparation (Python – Manual)
       All data cleaning and preprocessing were done manually using Python.
       Tasks Performed:-
              * Handled missing values
              * Corrected and standardized data types
              * Converted dates using to_datetime()
              * Created a month column from transaction date
              * Validated customer-level consistency
              * Python libraries used: Pandas, Matplotlib, Seaborn

* SQL Analysis (Metabase)-
          SQL analysis was performed in Metabase after database integration.
          Key SQL Operations:
          Joining transaction and response tables,
          Customer-level aggregation,
          Total and average spend calculations,
          Response rate analysis,
          Customer counts by response type (0 vs 1)
          Customer Segmentation (RFM & Spend-Based)
* Spend-Based Segmentation
          Customers were segmented into:-
          High Value,
          Medium-High Value,
          Medium Value,
          Low Value.

* RFM Analysis (Python) -
          Recency, Frequency, Monetary analysis
          Identified loyal, regular, and low-engagement customers

* Advanced Analytics -
          Cohort Analysis to identify active vs churned customers
          Trend analysis for top high-value customers
          Campaign response behavior across segments

* Visualizations (Python) -
          Revenue comparison by customer segment
          Line chart for top high-value customers
          Response rate distribution
          Monthly transaction trends

* Screenshots of Python code and visual outputs shared
 
* AI Usage Transparency -
          AI (MinusX) was used only within Metabase to:
          Speed up exploratory SQL analysis
          Assist in drafting advanced queries (RFM segmentation)
          All AI-generated queries were: -
                              * Reviewed
                              * Understood
                              * Validated
                              * Executed manually
          Core data cleaning, logic validation, and insight interpretation were done manually.
          This reflects real-world analytics workflows, where AI is used as a productivity tool—not a replacement for analytical skills.

** Key Business Insights -
          High-value customers spend approximately 15× more than low-value customers,
          High-value customers show a significantly higher probability of response = 1,
          Low-value customers contribute minimal revenue and engagement,
          Customer spending is strongly correlated with campaign responsiveness.

** Key Learnings -
          Importance of database permissions for BI tools,
          Combining Python and SQL strengthens analysis depth,
          RFM and cohort analysis provide actionable business insights,
          Responsible AI usage improves productivity without compromising understanding.

*** Conclusion ***
          This project demonstrates my ability to handle the complete data analytics lifecycle:-
          Database creation & access control,
          Manual data cleaning and visualization,
          SQL-based analysis and segmentation,
          BI-ready insights using Metabase.
