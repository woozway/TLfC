-- -- 1.
-- SELECT *
-- FROM store
-- LIMIT 10;

-- 2.
SELECT COUNT(DISTINCT(order_id)) AS orders_placed
FROM store;

SELECT COUNT(DISTINCT(customer_id)) AS total_customers
FROM store;

-- 3.
SELECT customer_id, customer_email, customer_phone
FROM store
WHERE customer_id = 1;

-- 4.
SELECT item_1_id, item_1_name, item_1_price
FROM store
WHERE item_1_id = 4;

-- 5.
CREATE TABLE customers AS
SELECT DISTINCT customer_id, customer_phone, customer_email
FROM store;

-- 6.
ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

-- 7.
CREATE TABLE items AS
SELECT DISTINCT
  item_1_id AS item_id,
  item_1_name AS name,
  item_1_price AS price
FROM store
UNION 

SELECT DISTINCT
  item_2_id AS item_id,
  item_2_name AS name,
  item_2_price AS price
FROM store
WHERE item_2_id IS NOT NULL
UNION 

SELECT DISTINCT
  item_3_id AS item_id,
  item_3_name AS name,
  item_3_price AS price
FROM store
WHERE item_3_id IS NOT NULL;

-- 8.
ALTER TABLE items
ADD PRIMARY KEY(item_id);

-- 9.
CREATE TABLE orders_items AS
SELECT  
  order_id AS order_id,
  item_1_id AS item_id
FROM store

UNION ALL

SELECT  
  order_id AS order_id,
  item_2_id AS item_id
FROM store

UNION ALL

SELECT  
  order_id AS order_id,
  item_3_id AS item_id
FROM store;

-- 10.
CREATE TABLE orders AS
SELECT order_id, order_date, customer_id
FROM store;

-- 11.
ALTER TABLE orders
ADD PRIMARY KEY (order_id);

-- 12.
ALTER TABLE orders
ADD FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders_items
ADD FOREIGN KEY (item_id)
REFERENCES items(item_id);

-- 13.
ALTER TABLE orders_items
ADD FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- 14.
SELECT customer_email
FROM store
WHERE order_date > '2019-07-25';

-- 15.
SELECT customers.customer_email
FROM customers, orders
WHERE orders.customer_id = customers.customer_id
AND order_date > '2019-07-25';

-- 16.
WITH all_items AS (
	SELECT item_1_id AS item_id
	FROM store
	
	UNION ALL
	
	SELECT item_2_id AS item_id
	FROM store
	WHERE item_2_id IS NOT NULL
	
	UNION ALL
	
	SELECT item_3_id AS item_id	
	FROM store
	WHERE item_3_id IS NOT NULL
)

SELECT item_id, COUNT(*)
FROM all_items
GROUP BY(item_id);

-- 17.
SELECT item_id, COUNT(*)
FROM orders_items
GROUP BY(item_id);

-- 18.
-- 18.1)
SELECT 
	orders.customer_id, 
	COUNT(orders.order_id) AS number_of_orders,
	customers.customer_email
	
FROM orders, customers
GROUP BY orders.customer_id, customers.customer_email
HAVING COUNT(orders.order_id) > 1
ORDER BY number_of_orders DESC;

--- 18.2)
SELECT orders.order_id, orders.order_date, items.name
FROM orders, items, orders_items
WHERE orders.order_id = orders_items.order_id
AND orders_items.item_id = items.item_id
AND order_date > '2019-07-15'
AND items.name = 'lamp';

--- 18.3)
SELECT COUNT(orders.order_id)
FROM orders, items, orders_items
WHERE orders.order_id = orders_items.order_id
AND orders_items.item_id = items.item_id
AND items.name = 'chair'
GROUP BY items.name;
