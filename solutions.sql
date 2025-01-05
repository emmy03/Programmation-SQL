```sql
/* ==========================================
   Solutions aux questions du projet SQL
   Auteur : Emmy MARIE-JOSEPH
   ========================================== */

/* QUESTION 3 */
SELECT *
FROM shippers
JOIN orders
ON orders.shipper_id = shippers.shipper_id;

/* QUESTION 5 */
SELECT * 
FROM customers
JOIN orders
ON orders.customer_id = customers.customer_id;

/* QUESTION 7 */
SELECT * 
FROM order_items
JOIN order_item_notes
ON order_items.order_id = order_item_notes.order_id 
AND order_items.product_id = order_item_notes.product_id;

/* QUESTION 8 */
SELECT 
  c.customer_id,
  c.first_name,
  o.order_id,
  s.name AS shipper_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN shippers s
ON o.shipper_id = s.shipper_id;

/* QUESTION 11 */
SELECT c.customer_id
FROM customers c
WHERE c.customer_id NOT IN (
  SELECT o.customer_id
  FROM orders o
);

/* QUESTION 12 */
DELETE FROM customers   
WHERE customer_id NOT IN (
  SELECT o.customer_id
  FROM orders o
);

/* QUESTION 13 */
DELETE FROM customers  
WHERE customer_id NOT IN (  
  SELECT o.customer_id  
  FROM orders o
);
/* Vérification : */
SELECT *
FROM customers;

/* QUESTION 15 */
UPDATE orders
SET status = 'Delivered'
WHERE customer_id = (
  SELECT customer_id 
  FROM customers 
  WHERE first_name = 'Ilene' AND last_name = 'Dowson'
);

/* QUESTION 16 */
SELECT order_date
FROM orders
WHERE MONTH(order_date) = 1;

/* QUESTION 17 */
SELECT 
  p.product_id, 
  p.name, 
  COUNT(o.product_id) AS orders_quantity
FROM products p
JOIN order_items o
ON p.product_id = o.product_id
GROUP BY p.product_id
ORDER BY orders_quantity DESC;

/* QUESTION 18 */
SELECT 
  p.product_id, 
  p.name, 
  SUM(o.quantity) AS total_quantity
FROM products p
JOIN order_items o
ON p.product_id = o.product_id
GROUP BY p.product_id
ORDER BY total_quantity DESC;

/* QUESTION 19 */
SELECT 
  product_id, 
  SUM(unit_price * quantity) AS total_price
FROM order_items
GROUP BY product_id
ORDER BY total_price DESC;

/* QUESTION 20 */
SELECT 
  c.first_name, 
  c.last_name, 
  p.name AS product
FROM orders o
JOIN order_items i
ON o.order_id = i.order_id
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON i.product_id = p.product_id
WHERE o.customer_id = 2
GROUP BY p.name;

/* QUESTION 22 */
SELECT 
  e.employee_id, 
  e.first_name AS employee_name, 
  m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;

/* QUESTION 23 */
SELECT 
  e.employee_id, 
  e.first_name AS employee_name, 
  COALESCE(m.first_name, 'No Manager') AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;

/* QUESTION 24 */
SHOW TABLES;
