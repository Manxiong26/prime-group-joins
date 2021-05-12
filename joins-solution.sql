##Answers

-- Get all the customers and their addresses
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id;

--Get all orders and their line items (orders, quantity and product).
SELECT orders, quantity, products FROM line_items
JOIN orders ON orders.id = line_items.order_id
JOIN products ON products.id = line_items.product_id;

--which warehouse have cheetos?
SELECT * FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.id = 5;

--which warehouse have diet pepsi?
SELECT * FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.id = 6;

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, COUNT(addresses.customer_id) FROM addresses
JOIN orders ON orders.id = orders.address_id
JOIN customers ON customers.id = addresses.customer_id
GROUP BY customers.first_name, addresses.customer_id;

-- How many customers do we have?
SELECT COUNT(*) from customers;

--How many products do we carry?
SELECT COUNT(*) from products;

--What is the total available on-hand quantity of diet pepsi?
SELECT SUM (on_hand) FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.id = 6;
