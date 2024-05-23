SELECT * FROM Customers;

SELECT product_name, category
FROM Product
WHERE price BETWEEN 5000 AND 10000;

SELECT *
FROM Product
ORDER BY price DESC;

SELECT COUNT(*) AS total_orders, 
       AVG(amount) AS average_amount, 
       MAX(amount) AS highest_amount, 
       MIN(amount) AS lowest_amount
FROM Orders;

SELECT product_id, COUNT(*) AS number_of_orders
FROM Orders
GROUP BY product_id;

SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 2;

SELECT TO_CHAR(order_date, 'YYYY-MM') AS month, 
       COUNT(*) AS number_of_orders
FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY TO_CHAR(order_date, 'YYYY-MM');

SELECT o.order_id, p.product_name, c.custName AS customer_name, o.order_date
FROM Orders o
JOIN Product p ON o.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id;

SELECT *
FROM Orders
WHERE order_date BETWEEN ADD_MONTHS(SYSDATE, -3) AND SYSDATE;

SELECT c.customer_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
