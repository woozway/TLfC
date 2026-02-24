-- 1. familiarize yourself with the database
SELECT *
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

-- 2. create a trigger to log anytime someone updates the customers table
CREATE TRIGGER customer_updated
  BEFORE UPDATE ON customers
  FOR EACH ROW
  EXECUTE PROCEDURE log_customers_change();

-- 3. confirm your trigger is working as expected
UPDATE customers
SET first_name = 'Steve'
WHERE last_name = 'Hall';

SELECT *
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

-- 4. also check when you expect it to NOT create a record in customers_log as well as when you would expect it to
UPDATE customers
SET years_old = 10
WHERE last_name = 'Hall';

SELECT *
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

-- 5. create the trigger to call the log_customers_change procedure once for every statement on INSERT to the customers table
CREATE TRIGGER customer_insert
  AFTER INSERT ON customers
  FOR EACH STATEMENT
  EXECUTE PROCEDURE log_customers_change();

-- 6. add three names to the customers table in one statement
INSERT INTO customers (first_name,last_name,years_old)
VALUES
  ('Jeffrey','Cook',66),
  ('Arthur','Turner',49),
  ('Nathan','Cooper',72);

SELECT *
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

-- 7. use function override_with_min_age()
CREATE TRIGGER customer_min_age
  BEFORE UPDATE ON customers
  FOR EACH ROW
  WHEN (NEW.years_old < 13)
  EXECUTE PROCEDURE override_with_min_age();

-- 8. test this trigger
UPDATE customers
SET years_old = 12
WHERE last_name = 'Campbell';

UPDATE customers
SET years_old = 24
WHERE last_name = 'Cook';

SELECT *
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

-- 9. if you had an update on more columns at once
UPDATE customers
SET years_old = 9,
    first_name = 'Dennis'
WHERE last_name = 'Hall';

SELECT *
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

-- 10. remove the trigger we created to set the minimum age
DROP TRIGGER IF EXISTS customer_min_age ON customers;

SELECT * FROM information_schema.triggers;
