USE superstore_db;

/* Data Analysis */

-- KPIs
SELECT COUNT(order_id) AS total_sales FROM sales;
SELECT SUM(sales) AS total_revenue FROM sales;
SELECT AVG(sales) AS avg_ticket FROM sales;

-- Date Analysis (always first)
-- Total monthly sales and total revenue
SELECT
    MONTH(order_date) AS month_number,
    COUNT(*) AS monthly_sales,
    SUM(sales) AS monthly_revenue
FROM sales
GROUP BY month_number
ORDER BY month_number;

-- Category Analysis
-- Total sales and revenue grouped by category
SELECT
    category,
    COUNT(*) AS total_sales,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- Product Analysis
-- Top 5 best selling products
SELECT
    product_name,
    SUM(sales) AS total_revenue,
    COUNT(product_id) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Top 5 best selling products grouped by category
SELECT
    product_name,
    SUM(sales) AS total_revenue,
    COUNT(product_id) AS total_sales,
    category
FROM sales
GROUP BY product_name, category
ORDER BY total_revenue
LIMIT 5;

-- Geographical Analysis
-- Top 10 states with most amount of sales
SELECT
    state,
    COUNT(*) AS total_sales,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 profitable states
SELECT
    state,
    COUNT(*) AS total_sales,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY state
ORDER BY total_revenue
LIMIT 10;

-- Crossing
-- Top 10 profitable months grouped by category
SELECT
    MONTH(order_date) AS month_number,
    category,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY category, month_number
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 profitable category grouped by state
SELECT
    category,
    state,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY category, state
ORDER BY total_revenue DESC
LIMIT 10;