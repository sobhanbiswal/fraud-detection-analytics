# 💳 Credit Card Fraud Detection Analytics

## Project Overview
End-to-end data analytics pipeline built to detect fraudulent credit card 
transactions using the Sparkov synthetic dataset (12.5 million transactions, 
Jan 2025 – Jun 2026).

## Business Problem
A financial institution needs to identify fraudulent transactions in real time 
to minimize losses. This project analyzes transaction patterns, engineers 
risk features, and delivers executive dashboards for the fraud operations team.

## Tech Stack
| Tool | Purpose |
|------|---------|
| Azure Blob Storage | Raw data landing zone (3.69 GB CSV) |
| Azure Databricks | Data processing, EDA, feature engineering |
| Azure SQL Database | Star schema data warehouse |
| Power BI | Interactive fraud dashboards |
| GitHub | Version control and portfolio |

## Dataset
- Source: Sparkov Data Generation (synthetic)
- Period: January 2025 – June 2026
- Size: 12,553,594 transactions
- Fraud rate: 0.75% (94,295 fraudulent transactions)
- Columns: 26 (including engineered features)

## Project Architecture
Raw CSV (3.69GB)
↓
Azure Blob Storage (raw-data container)
↓
Azure Databricks (PySpark processing)
↓ Clean + Feature Engineering
↓ hour_of_day, amt_deviation,
↓ transaction_velocity, distance_from_home
↓
Parquet (optimized storage)
↓
Azure SQL Database (Star Schema)
↓ FactTransactions
↓ DimCustomer, DimMerchant, DimDate
↓
Power BI Dashboards
↓ Executive Summary
↓ Fraud Operations
↓ Customer Risk Profile

## Key Findings
- Fraud rate: 0.75% (94,295 out of 12.5M transactions)
- Fraud peaks between 10pm – 4am
- High amount deviation strongly correlates with fraud
- Certain merchant categories show disproportionate fraud rates

## Engineered Features
| Feature | Description | Fraud Signal |
|---------|-------------|--------------|
| hour_of_day | Hour extracted from unix timestamp | Fraud peaks at night |
| amt_deviation | How much amount deviates from customer average | High deviation = risk |
| transaction_velocity | Transactions per 10 min window per card | Rapid transactions = card testing |
| distance_from_home | KM between home and merchant location | Far transactions = suspicious |

## Project Phases
- [x] Phase 1 — Azure Blob Storage setup & data upload
- [x] Phase 2 — Databricks EDA, cleaning & feature engineering
- [ ] Phase 3 — Azure SQL Database star schema & business queries
- [ ] Phase 4 — Power BI dashboards
- [ ] Phase 5 — Final documentation

## Author
Sobhan Biswal | Aspiring Data Analyst
