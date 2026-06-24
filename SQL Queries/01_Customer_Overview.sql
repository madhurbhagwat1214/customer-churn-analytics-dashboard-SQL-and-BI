
/* =========================================
   CUSTOMER OVERVIEW
========================================= */

-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Active Customers
SELECT COUNT(*) AS active_customers
FROM customers
WHERE Churn_Status = 'No';

-- Churned Customers
SELECT COUNT(*) AS churned_customers
FROM customers
WHERE Churn_Status = 'Yes';

-- Churn Rate
SELECT
    100.0 *
    SUM(CASE WHEN Churn_Status = 'Yes' THEN 1 ELSE 0 END)
    / COUNT(*) AS churn_rate
FROM customers;

-- Average Orders Per Customer
SELECT
    AVG(Orders_Count) AS avg_orders_per_customer
FROM customers;