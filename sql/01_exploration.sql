USE superstore_db;

SELECT * from sales;

-- Counting total number of records
SELECT COUNT(row_id) AS total_records FROM sales;

/* Verifying Data Quality */

-- Sales with no order date
SELECT * FROM sales
WHERE order_date IS NULL;

-- Sales with negative amount
SELECT * FROM sales
WHERE sales < 0;

-- Sales without category or subcategory
SELECT * FROM sales
WHERE category = '' OR sub_category = '';

-- Categories list
SELECT DISTINCT(category) AS category FROM sales;

-- Subcategories list
SELECT DISTINCT(sub_category) AS sub_category FROM sales;

-- Duplicated records
SELECT COUNT(order_id) AS duplicated_record
FROM sales
GROUP BY row_id
HAVING duplicated_record > 1;