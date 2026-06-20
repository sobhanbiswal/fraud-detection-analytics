-- Verify all tables exist and row counts are correct:

SELECT 
    t.name AS TableName,
    p.rows AS [RowCount]
FROM sys.tables t
JOIN sys.partitions p 
    ON t.object_id = p.object_id
WHERE p.index_id IN (0,1)
ORDER BY p.rows DESC


-- Fraud Rate by Merchant Category:

SELECT 
    m.category,
    COUNT(*) AS total_transactions,
    SUM(f.is_fraud) AS fraud_count,
    CAST(SUM(f.is_fraud) * 100.0 / COUNT(*) 
        AS DECIMAL(5,2)) AS fraud_rate_pct,
    CAST(SUM(CASE WHEN f.is_fraud = 1 THEN f.amt ELSE 0 END) 
        AS DECIMAL(18,2)) AS total_fraud_amount
FROM FactTransactions f
JOIN DimMerchant m ON f.merchant = m.merchant
GROUP BY m.category
ORDER BY fraud_rate_pct DESC


-- Top 10 High Risk Customers:

SELECT TOP 10
    c.cc_num,
    c.first + ' ' + c.last AS customer_name,
    c.city,
    c.state,
    c.job,
    COUNT(*) AS total_transactions,
    SUM(f.is_fraud) AS fraud_count,
    CAST(SUM(CASE WHEN f.is_fraud = 1 THEN f.amt ELSE 0 END) 
        AS DECIMAL(18,2)) AS total_fraud_amount
FROM FactTransactions f
JOIN DimCustomer c ON f.cc_num = c.cc_num
GROUP BY c.cc_num, c.first, c.last, c.city, c.state, c.job
ORDER BY fraud_count DESC


-- Fraud by Hour of Day:

SELECT 
    hour_of_day,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_count,
    CAST(SUM(is_fraud) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS fraud_rate_pct
FROM FactTransactions
GROUP BY hour_of_day
ORDER BY fraud_rate_pct DESC


-- Monthly Fraud Trend:

SELECT 
    d.year,
    d.month,
    d.month_name,
    COUNT(*) AS total_transactions,
    SUM(f.is_fraud) AS fraud_count,
    CAST(SUM(f.is_fraud) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS fraud_rate_pct,
    CAST(SUM(CASE WHEN f.is_fraud = 1 THEN f.amt ELSE 0 END) 
        AS DECIMAL(18,2)) AS total_fraud_amount
FROM FactTransactions f
JOIN DimDate d ON f.trans_date = d.trans_date
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month