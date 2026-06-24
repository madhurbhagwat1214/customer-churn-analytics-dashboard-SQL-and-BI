
/* =========================================
   CHURN ANALYSIS
========================================= */

-- Customers By Region
SELECT
    Region,
    COUNT(*) AS customers
FROM customers
GROUP BY Region
ORDER BY customers DESC;

-- Churned Customers By Region
SELECT
    Region,
    SUM(CASE WHEN Churn_Status = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY Region
ORDER BY churned_customers DESC;

-- Churn Rate By Region
SELECT
    Region,
    100.0 *
    SUM(CASE WHEN Churn_Status = 'Yes' THEN 1 ELSE 0 END)
    / COUNT(*) AS churn_rate
FROM customers
GROUP BY Region
ORDER BY churn_rate DESC;

-- Customers By Subscription
SELECT
    Subscription_Type,
    COUNT(*) AS customers
FROM customers
GROUP BY Subscription_Type;

-- Churn By Subscription
SELECT
    Subscription_Type,
    SUM(CASE WHEN Churn_Status = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY Subscription_Type;

-- Churn Rate By Subscription
SELECT
    Subscription_Type,
    100.0 *
    SUM(CASE WHEN Churn_Status = 'Yes' THEN 1 ELSE 0 END)
    / COUNT(*) AS churn_rate
FROM customers
GROUP BY Subscription_Type
ORDER BY churn_rate DESC;

-- Churn By Product Category
SELECT
    Product_Category,
    SUM(CASE WHEN Churn_Status = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY Product_Category
ORDER BY churned_customers DESC;

-- Churn Rate By Product Category
SELECT
    Product_Category,
    100.0 *
    SUM(CASE WHEN Churn_Status = 'Yes' THEN 1 ELSE 0 END)
    / COUNT(*) AS churn_rate
FROM customers
GROUP BY Product_Category
ORDER BY churn_rate DESC;

-- Customer Segmentation
SELECT
    Customer_ID,
    Customer_Name,
    Total_Spend,
    CASE
        WHEN Total_Spend >= 80000 THEN 'High Value'
        WHEN Total_Spend >= 40000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers;

-- Revenue By Segment
SELECT
    CASE
        WHEN Total_Spend >= 80000 THEN 'High Value'
        WHEN Total_Spend >= 40000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS customers,
    SUM(Total_Spend) AS revenue
FROM customers
GROUP BY customer_segment
ORDER BY revenue DESC;