-- 1. Revenue by gender 

SELECT 
    gender, 
    SUM(purchase_amount) AS revenue
FROM customer
GROUP BY gender;

-- 2. Customers who used a discount but still spent more than the average purchase amount

SELECT 
    customer_id, 
    category,
    purchase_amount
FROM customer 
WHERE discount_applied = 'Yes' 
AND purchase_amount >= (
    SELECT AVG(purchase_amount) 
    FROM customer
);

-- 3. Top 5 products by average reviwe rating

SELECT 
    item_purchased,
    ROUND(AVG(review_rating::numeric),2) AS "Average Product Rating"
FROM customer
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
LIMIT 5;

-- 4. Average purchase amounts between Standar and Express Shipping

SELECT 
    shipping_type,
    ROUND(AVG(purchase_amount), 2)
FROM customer
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;

-- 5. Average spend and total revenue between subscribers and non-subscribers

SELECT
    subscription_status,
    COUNT(customer_id) AS total_customer,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY 
    total_revenue, 
    avg_spend DESC;

-- 6. Top 5 products by the highest percentage of purchase with discounts applied

SELECT 
    item_purchased,
    ROUND(100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*), 2)
    AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;

-- 7. Count by cutomer segment

WITH customer_type AS(
SELECT 
    customer_id, 
    previous_purchases,
CASE
    WHEN previous_purchases = 1 THEN 'New'
    WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
    ELSE 'Loyal'
    END AS customer_segment
FROM customer
)

SELECT 
    customer_segment,
    COUNT(*) AS "Number of Customers"
FROM customer_type
GROUP BY customer_segment;

-- 8. Top 3 most purchased products within each category

WITH item_counts AS (
SELECT 
    category,
    item_purchased,
    COUNT(customer_id) AS total_orders,
    ROW_NUMBER() OVER (PARTITION BY category
    ORDER BY COUNT (customer_id) DESC) AS item_rank
FROM customer
GROUP BY
    category,
    item_purchased
)

SELECT 
    item_rank,
    category,
    item_purchased, 
    total_orders
FROM item_counts
WHERE item_rank <= 3;

-- 9. Repeat buyers by subscription status (more than 5 previos purchases)

SELECT
    subscription_status,
    COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- 10. Revenue contribution by age group

SELECT 
    age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;