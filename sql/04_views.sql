USE superstore_db;

-- Final Datasets for BI

-- General KPIs (total sales, total revenue and average ticket)
CREATE OR REPLACE VIEW vw_general_kpi AS
SELECT 
    COUNT(sales) AS total_sales,
    SUM(sales) AS total_revenue,
    AVG(sales) AS avg_ticket
FROM sales;

-- Monthly revenue
CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    MONTH(order_date) AS month_number,
    SUM(sales) AS monthly_revenue
FROM sales
GROUP BY month_number
ORDER BY month_number;

-- Top 10 best selling products
CREATE OR REPLACE VIEW vw_product_ranking AS
SELECT 
    product_name,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Profit by category
CREATE OR REPLACE VIEW vw_sales_by_category AS
SELECT 
    category,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Profit by state
CREATE OR REPLACE VIEW vw_sales_by_region AS
SELECT 
    state AS state,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY state
ORDER BY total_revenue DESC;

