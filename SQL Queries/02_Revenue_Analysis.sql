
/* =========================================
   REVENUE ANALYSIS
========================================= */

-- Total Revenue
SELECT
    SUM(Total_Spend) AS total_revenue
FROM customers;

-- Average Revenue Per Customer
SELECT
    AVG(Total_Spend) AS avg_customer_revenue
FROM customers;

-- Revenue Lost Due To Churn
SELECT
    SUM(Total_Spend) AS lost_revenue
FROM customers
WHERE Churn_Status = 'Yes';

-- Revenue By Region
SELECT
    Region,
    SUM(Total_Spend) AS revenue
FROM customers
GROUP BY Region
ORDER BY revenue DESC;

-- Revenue By Subscription Type
SELECT
    Subscription_Type,
    SUM(Total_Spend) AS revenue
FROM customers
GROUP BY Subscription_Type
ORDER BY revenue DESC;

-- Revenue By Product Category
SELECT
    Product_Category,
    SUM(Total_Spend) AS revenue
FROM customers
GROUP BY Product_Category
ORDER BY revenue DESC;