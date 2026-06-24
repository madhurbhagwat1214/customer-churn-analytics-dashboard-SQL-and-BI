USE churn_analysis;

/* =========================================
   ADVANCED SQL
========================================= */

-- Top 10 Customers By Revenue
SELECT *
FROM
(
    SELECT
        Customer_ID,
        Customer_Name,
        Total_Spend,
        DENSE_RANK() OVER (
            ORDER BY Total_Spend DESC
        ) AS customer_rank
    FROM customers
) t
WHERE customer_rank <= 10;

-- Revenue Contribution Percentage
SELECT
    Customer_ID,
    Customer_Name,
    Total_Spend,
    100 * Total_Spend /
    SUM(Total_Spend) OVER() AS revenue_contribution_pct
FROM customers;

-- Customer Quartile Ranking
SELECT
    Customer_ID,
    Customer_Name,
    Total_Spend,
    NTILE(4) OVER (
        ORDER BY Total_Spend DESC
    ) AS customer_quartile
FROM customers;

-- Running Revenue
SELECT
    Customer_ID,
    Customer_Name,
    Total_Spend,
    SUM(Total_Spend) OVER (
        ORDER BY Total_Spend DESC
    ) AS cumulative_revenue
FROM customers;

-- Average Revenue by Churn Status
SELECT
    Churn_Status,
    AVG(Total_Spend) AS avg_revenue
FROM customers
GROUP BY Churn_Status;