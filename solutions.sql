/*QUESTION 3*/

	SELECT *
	FROM shippers
	JOIN orders
	ON (orders.shippers_id = shippers_id);


/*QUESTION 5*/

	SELECT * 
	FROM customers
	JOIN orders
	ON (orders.customer_id = customers.customer_id) ;
	
	
/*QUESTION 7*/

	SELECT * 
	FROM order_items
	JOIN order_item_notes
	ON (order_items.order_id = order_item_notes.note_id AND order_items.product_id = order_item_notes.note_id) ;
	
	
/*QUESTION 8*/

	SELECT 
	c.customer_id,
	c.first_name,
	o.order_id,
	s.name
	  FROM customers c
	  INNER JOIN orders o
	  ON c.customer_id = o.customer_id
	  INNER JOIN shippers s
	  ON o.shipper_id = s.shipper_id;
	
	
/*QUESTION 11*/

	SELECT
	c.customer_id
	FROM customers c
	WHERE c.customer_id NOT IN ( 
	  SELECT o.customer_id 
	  FROM orders o);
	
	
/*QUESTION 12*/

	DELETE FROM customers   
	WHERE customer_id IN (1, 3, 4, 9); 
	

/*QUESTION 13*/

	DELETE FROM customers  
	WHERE customer_id NOT IN (  
	  SELECT o.customer_id  
	  FROM orders o); 
	
	Pour vérifier : 
	SELECT *
	FROM customers;
	

/*QUESTION 15*/

	UPDATE orders
	SET status = 1
	WHERE customer_id = (SELECT c.customer_id FROM customers c WHERE c.first_name = 'Ilene' AND c.last_name = 'Dowson');
	
	
/*QUESTION 16*/

	SELECT order_date
	FROM orders
	WHERE MONTH(order_date)='01';
	
	
/*QUESTION 17*/
 
	SELECT p.product_id, p.name, COUNT(p.product_id) AS orders_quantity
	FROM products p
	INNER JOIN order_items o
	ON p.product_id = o.product_id
	GROUP BY p.product_id
	ORDER BY orders_quantity DESC;
	
	
/*QUESTION 18*/

	SELECT p.product_id, p.name, SUM(o.quantity) AS total_quantity
	FROM products p
	INNER JOIN order_items o
	ON p.product_id = o.product_id
	GROUP BY p.product_id
	ORDER BY total_quantity DESC;
	
/*QUESTION 19*/
 
	SELECT product_id, SUM(unit_price) AS total_price
	FROM order_items
	GROUP BY product_id
	ORDER BY total_price DESC;
	
/*QUESTION 20*/
 
	SELECT c.first_name, c.last_name, p.name AS products  
	FROM orders o, order_items i, customers c, products p
	WHERE o.order_id = i.order_id AND o.customer_id = c.customer_id AND i.product_id = p.product_id AND o.customer_id = 2
	GROUP BY p.name;
	
/*QUESTION 22*/
 
	ALTER TABLE employees
	ADD manager varchar(50);
	
	UPDATE employees
	SET manager = 'Yovonnda Magrannell'
	WHERE reports_to = 37270;
	
	SELECT employee_id, first_name, manager
	FROM employees 
	WHERE reports_to = 37270;
	
/*QUESTION 23*/

	ALTER TABLE employees
	ADD manager varchar(50);
	
	UPDATE employees
	SET manager = 'Yovonnda Magrannell'
	WHERE reports_to = 37270;
	
	SELECT employee_id, first_name, manager
	FROM employees ;
	
	
/*QUESTION 24*/ 	
/* La commande SQL qui permet de lister le nom des tables d'une base est SHOW TABLES.*/
	
