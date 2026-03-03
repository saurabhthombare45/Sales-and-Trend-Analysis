create database Shopping_Trends_And_Customer_Behaviour;
use Shopping_Trends_And_Customer_Behaviour;
create table shopping_trends_and_customer_behaviour_table(customer_id int primary key);

SELECT * FROM shopping_trends_and_customer_behaviour_table;

-- 1.Which product category generates the highest revenue ?
SELECT category,
       SUM(`purchase_amount_(usd)`) AS total_revenue
FROM shopping_trends_and_customer_behaviour_table
GROUP BY category
ORDER BY total_revenue DESC;

-- 2.Which top 10 locations contribute the most to total sales revenue ?
SELECT location,
       SUM(`purchase_amount_(usd)`) AS total_revenue
FROM shopping_trends_and_customer_behaviour_table
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;

-- 3.Do loyal customers contribute more revenue than non-loyal customers ?
SELECT loyal_customer,
       COUNT(customer_id) AS total_customers,
       SUM(`purchase_amount_(usd)`) AS total_revenue,
       AVG(`purchase_amount_(usd)`) AS avg_purchase_value
FROM shopping_trends_and_customer_behaviour_table
GROUP BY loyal_customer;

-- 4.Does applying discounts increase purchase frequency ?
SELECT discount_applied,
       AVG(previous_purchases) AS avg_previous_purchases,
       AVG(purchase_frequency_score) AS avg_frequency_score
FROM shopping_trends_and_customer_behaviour_table
GROUP BY discount_applied;

-- 5.Does subscription status increase Customer Lifetime Value (CLV) ?
SELECT subscription_status,
       AVG(CLV) AS avg_clv,
       AVG(lifetime_value) AS avg_lifetime_value
FROM shopping_trends_and_customer_behaviour_table
GROUP BY subscription_status;

-- 6.Which age group contributes the most revenue ?
SELECT age_group,
       SUM(`purchase_amount_(usd)`) AS total_revenue,
       AVG(CLV) AS avg_clv
FROM shopping_trends_and_customer_behaviour_table
GROUP BY age_group
ORDER BY total_revenue DESC;

-- 7.Which season generates the highest revenue ?
SELECT season,
       SUM(`purchase_amount_(usd)`) AS total_revenue
FROM shopping_trends_and_customer_behaviour_table
GROUP BY season
ORDER BY total_revenue DESC;

-- 8.Identify high CLV customers who are not yet loyal 
SELECT customer_id,
       CLV,
       `Spending Level`
FROM shopping_trends_and_customer_behaviour_table
WHERE loyal_customer = 'No'
  AND CLV > 2000
ORDER BY CLV DESC;

-- 9.Which spending level segment contributes the highest revenue ?
SELECT `Spending Level`,
       COUNT(customer_id) AS total_customers,
       SUM(`purchase_amount_(usd)`) AS total_revenue
FROM shopping_trends_and_customer_behaviour_table
GROUP BY `Spending Level`
ORDER BY total_revenue DESC;

-- 10.Who are the top 10 high-value customers based on CLV ?
SELECT customer_id,
       CLV,
       lifetime_value,
       previous_purchases
FROM shopping_trends_and_customer_behaviour_table
ORDER BY CLV DESC
LIMIT 10;








