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
