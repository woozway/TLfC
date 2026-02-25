-- 1.
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM books LIMIT 10;

-- 2.
SELECT *
FROM pg_indexes
WHERE tablename IN ('books', 'customers', 'orders');

-- 3.
EXPLAIN ANALYZE SELECT customer_id, quantity
FROM orders
WHERE quantity > 18;

-- 4.
CREATE INDEX orders_customer_id_quantity_gt_18_idx
ON orders(customer_id, quantity)
WHERE quantity > 18;

-- 5.
EXPLAIN ANALYZE SELECT customer_id, quantity
FROM orders
WHERE quantity > 18;

-- 6.
EXPLAIN ANALYZE SELECT *
FROM customers
WHERE customer_id < 100;

ALTER TABLE customers
  ADD CONSTRAINT customers_pkey
    PRIMARY KEY (customer_id);

-- 7.
SELECT * FROM customers LIMIT 10;

CLUSTER customers USING customers_pkey;

SELECT * FROM customers LIMIT 10;

-- 8.
CREATE INDEX orders_customer_id_book_id_idx
ON orders(customer_id, book_id);

-- 9.
EXPLAIN ANALYZE
SELECT customer_id, book_id, quantity
FROM orders
WHERE quantity > 18;

DROP INDEX orders_customer_id_book_id_idx;
CREATE INDEX orders_customer_id_book_id_quantity_idx
ON orders(customer_id, book_id, quantity);

EXPLAIN ANALYZE
SELECT customer_id, book_id, quantity
FROM orders
WHERE quantity > 18;

-- 10.
CREATE INDEX books_author_title_idx
ON books(author, title);

-- 11.
EXPLAIN ANALYZE
SELECT *, (quantity * price_base) AS "total price"
FROM orders
WHERE (quantity * price_base) > 100;

-- 12.
CREATE INDEX orders_total_price_idx
ON orders((quantity * price_base));

-- 13.
EXPLAIN ANALYZE
SELECT *, (quantity * price_base) AS "total price"
FROM orders
WHERE (quantity * price_base) > 100;
