-- 0. Get all the users
SELECT * FROM customers;


-- 1. Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id;


-- 2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON line_items.order_id = orders.id;


-- 3. Which warehouses have cheetos?
SELECT products.description, warehouse.warehouse FROM products
JOIN warehouse_product ON (products.id = warehouse_product.product_id)
JOIN warehouse ON (warehouse_product.warehouse_id = warehouse.id)
WHERE description = 'cheetos';



-- 4. Which warehouses have diet pepsi?
SELECT products.description, warehouse.warehouse FROM products
JOIN warehouse_product ON (products.id = warehouse_product.product_id)
JOIN warehouse ON (warehouse_product.warehouse_id = warehouse.id)
WHERE description = 'diet pepsi';


-- 5. Get the number of orders for each customer. 
--NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT(orders.id) as orders_per_customers 
FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.first_name, customers.last_name;




-- 6. How many customers do we have?
SELECT COUNT(id) as total_customers FROM customers;


-- 7. How many products do we carry?
SELECT COUNT(id) as total_products FROM products;


-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT products.description, SUM(warehouse_product.on_hand) FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'
GROUP BY products.description;


