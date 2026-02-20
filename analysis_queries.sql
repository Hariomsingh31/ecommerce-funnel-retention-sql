-- Funnel counts
SELECT event_type, COUNT(DISTINCT customer_id) AS users
FROM website_events
GROUP BY event_type;

-- Funnel conversion rates
WITH funnel AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type='visit' THEN customer_id END) AS visits,
        COUNT(DISTINCT CASE WHEN event_type='add_to_cart' THEN customer_id END) AS carts,
        COUNT(DISTINCT CASE WHEN event_type='purchase' THEN customer_id END) AS purchases
    FROM website_events
)
SELECT
    carts*100.0/visits AS visit_to_cart_pct,
    purchases*100.0/carts AS cart_to_purchase_pct
FROM funnel;

-- Repeat customers
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Marketing channel performance
SELECT c.acquisition_channel,
       COUNT(DISTINCT o.customer_id) AS buyers,
       ROUND(AVG(o.order_value),2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.acquisition_channel;

-- Discount impact
SELECT
    CASE WHEN discount_applied > 0 THEN 'Discounted' ELSE 'No Discount' END AS category,
    ROUND(AVG(order_value),2) AS avg_order_value
FROM orders
GROUP BY category;
