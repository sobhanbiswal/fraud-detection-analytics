# 💳 Credit Card Fraud Detection Analytics
### End-to-End Data Analytics Pipeline | Azure | Databricks | SQL | Power BI

![Azure](https://img.shields.io/badge/Azure-Blob%20Storage-blue)
![Databricks](https://img.shields.io/badge/Databricks-PySpark-orange)
![SQL](https://img.shields.io/badge/Azure-SQL%20Database-lightblue)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)

---

## 📋 Project Overview
End-to-end fraud detection analytics pipeline built on Microsoft Azure, 
processing 12.5 million credit card transactions to identify fraudulent 
patterns and deliver actionable insights to business stakeholders.

**Dataset:** Sparkov Synthetic Credit Card Transactions  
**Period:** January 2025 – June 2026  
**Size:** 12,553,594 transactions | 3.69 GB raw data  
**Fraud Rate:** 0.75% (94,295 fraudulent transactions)

---

## 🏗️ Architecture
Raw CSV (3.69 GB)
↓
Azure Blob Storage (raw-data container)
↓
Azure Databricks (PySpark processing)
↓ EDA + Cleaning + Feature Engineering
↓
Parquet (optimized storage → Blob Storage)
↓
Azure SQL Database (Star Schema)
↓ FactTransactions + 3 Dimension Tables
↓
Power BI Desktop
↓ 3 Dashboards + Drill Through + RLS
↓
Business Insights & Recommendations

---

## 🛠️ Tech Stack

| Tool | Purpose | Details |
|------|---------|---------|
| Azure Blob Storage | Raw data landing zone | 3.69 GB CSV upload via AzCopy |
| Azure Databricks | Data processing | PySpark, 12.5M rows, Delta Lake |
| Azure SQL Database | Data warehouse | Star schema, 4 tables |
| Power BI Desktop | Visualization | 3 dashboards, drill through, RLS |
| GitHub | Version control | SQL scripts, notebooks, docs |

---

## 📊 Project Phases

### ✅ Phase 1 — Data Ingestion
- Created Azure Blob Storage account and raw-data container
- Uploaded 3.69 GB Sparkov dataset using AzCopy CLI
- Established secure connection using storage access keys

### ✅ Phase 2 — Data Processing (Databricks)
- Connected Databricks to Azure Blob Storage via Spark config
- Loaded 12,553,594 rows into Spark DataFrame
- Performed full EDA: fraud distribution, null checks, schema validation
- Cleaned data: removed duplicates, fixed date formats
- Engineered 4 fraud detection features:

| Feature | Description | Fraud Signal |
|---------|-------------|--------------|
| `hour_of_day` | Hour extracted from unix timestamp | Fraud peaks 7pm-midnight |
| `amt_deviation` | Amount vs customer average ratio | High deviation = suspicious |
| `transaction_velocity` | Transactions per 10-min window | Rapid transactions = card testing |
| `distance_from_home` | KM between home and merchant | Far transactions = suspicious |

- Saved cleaned data as Parquet back to Azure Blob Storage

### ✅ Phase 3 — Data Warehouse (Azure SQL)
- Designed star schema with 4 tables:
  - `FactTransactions` — 12,553,594 transaction records
  - `DimCustomer` — 9,970 unique customer profiles
  - `DimMerchant` — 693 unique merchants
  - `DimDate` — 530 date records with time intelligence
- Loaded all tables from Databricks via JDBC
- Wrote 5 business SQL queries answering stakeholder questions

### ✅ Phase 4 — Dashboards (Power BI)
- Connected Power BI to Azure SQL Database
- Built `_Measures` table with 6 DAX measures
- Created 3 dashboards:
  - Executive Summary — KPIs, trends, category analysis
  - Fraud Operations — heatmap, hourly analysis, geographic map
  - Customer Risk Profile — age groups, job analysis, scatter plot
- Implemented drill through for individual customer analysis
- Implemented Row Level Security (RLS) by state

---

## 🔍 Key Business Findings

### 1. Online Fraud Dominates
Online categories have 3-10x higher fraud rates than in-person:
- `shopping_net`: **2.30%** fraud rate (highest)
- `misc_net`: **2.08%** fraud rate
- `home`: **0.18%** fraud rate (lowest)

### 2. Evening Fraud Spike
Fraud peaks dramatically in evening hours:
- Hour 20 (8pm): **3.47%** fraud rate
- Hour 21 (9pm): **2.70%**
- Daytime hours: **0.14%** (20x lower)

### 3. Fraud Rate Declining
Monthly fraud rate declined from **1.10%** (Jan 2025) 
to **0.39%** (Dec 2025) — a 65% reduction suggesting 
improving fraud detection over time.

### 4. Age Group Risk
Customers aged **60+** show highest fraud rate — 
potentially less aware of fraud prevention practices.

### 5. Total Financial Impact
- Total fraud amount: **$50.88M**
- Fraud loss rate: **5.63%** of total transaction value
- Average fraud transaction: **$538** vs $71.94 overall average

---

## 💡 Business Recommendations

1. **Implement additional authentication** for online transactions 
   above $200 in shopping_net and misc_net categories
2. **Increase fraud monitoring** between 7pm-midnight — 
   deploy real-time alerts during peak fraud hours
3. **Customer education program** targeting 60+ age group 
   on fraud prevention
4. **Geographic focus** — prioritize fraud prevention resources 
   in high-fraud states identified in Power BI map

---

## 📁 Repository Structure

fraud-detection-analytics/
├── README.md
├── .gitignore
├── sql/
│   └── business_queries.sql
├── powerbi/
│   └── fraud_detection_dashboard.pbix
└── docs/
└── screenshots/
├── 01_executive_summary.png
├── 02_fraud_operations.png
└── 03_customer_risk_profile.png

---

## 🚀 How to Reproduce

### Prerequisites
- Azure subscription (free tier works)
- Databricks Community Edition
- Power BI Desktop (free)
- SQL Server Management Studio

### Steps
1. Download Sparkov dataset from Kaggle
2. Upload to Azure Blob Storage using AzCopy
3. Run Databricks notebooks in order
4. Execute SQL scripts to create star schema
5. Open Power BI file and refresh data connection

---

## 👤 Author
**Sobhan Biswal**  
Aspiring Data Analyst | Hyderabad, India  
[GitHub](https://github.com/sobhanbiswal)

---

## 📄 Data Source
Sparkov Data Generation — Synthetic Credit Card Transactions  
Generated for fraud detection algorithm development and credit scoring.