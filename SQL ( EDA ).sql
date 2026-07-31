-- find the total number of orders from the dataset

SELECT COUNT(order_id) AS orders_count
FROM ecommerce_data;

-- Find the total sales amount from the dataset.

SELECT SUM(total_sales) AS total_sales
FROM ecommerce_data;

-- Find the average order value.

SELECT ROUND(AVG(total_sales),1) AS avg_order_value
FROM ecommerce_data;

-- Find the minimum and maximum order amount in a single query.

SELECT MIN(total_sales) AS minimum_oder_amount,
MAX(total_sales) AS maximum_order_amount 
FROM ecommerce_data;

/* Find the total sales for each category, 
and display the categories in descending order of total sales */

SELECT category, SUM(total_sales) AS total_sales
FROM ecommerce_data
GROUP BY category
ORDER BY total_sales DESC;

-- Find the top 5 customers based on their total purchase amount.

SELECT customer_id, SUM(total_sales) AS total_sales
FROM ecommerce_data
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

/*Find the number of orders placed in each category, 
but display only categories with more than 500 orders.*/

SELECT category, COUNT(*) AS order_count
FROM ecommerce_data
GROUP BY category
HAVING COUNT(*) > 500;

/* Find the average order value for each payment method, 
and display the results from highest average to lowest average*/

SELECT payment_method, ROUND(AVG(total_sales),1) AS avg_order_value
FROM ecommerce_data
GROUP BY payment_method
ORDER BY avg_order_value DESC;

-- Find the total sales and total number of orders for each month.

SELECT SUM(total_sales) AS total_sales, COUNT(*) AS orders_count, 
MONTHNAME(order_date) AS month_name
FROM ecommerce_data
GROUP BY MONTH(order_date), month_name
ORDER BY MONTH(order_date);

-- Find the top 3 categories with the highest average order value.

SELECT category, AVG(total_sales) AS avg_order_value
FROM ecommerce_data
GROUP BY category
ORDER BY avg_order_value DESC
LIMIT 3;

-- Find the number of returned and non-returned orders.

SELECT returned, COUNT(returned) AS return_count
FROM ecommerce_data
GROUP BY returned;

-- Find the top 5 customers who placed the highest number of orders

SELECT customer_id, COUNT(*) AS order_count
FROM ecommerce_data
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 5;

-- Find the total sales for returned orders only.

SELECT SUM(total_sales) AS total_sales
FROM ecommerce_data
WHERE returned = 'YES';

-- Find the top 5 products that generated the highest total sales.

SELECT product_id, SUM(total_sales) AS total_sales
FROM ecommerce_data
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;

-- Find the customers who have placed more than 10 orders.

SELECT customer_id, COUNT(*) AS order_count
FROM ecommerce_data
GROUP BY customer_id
HAVING COUNT(*) > 10
ORDER BY order_count DESC;