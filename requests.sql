-- Найти заказчиков и обслуживающих их заказы сотрудкников
-- таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express.
-- Вывести компанию заказчика и ФИО сотрудника.
SELECT c.company_name AS customer,
       CONCAT(e.first_name, ' ', e.last_name) AS employee
FROM orders as o 
JOIN customers as c USING(customer_id)
JOIN employees as e USING(employee_id)
JOIN shippers as s ON o.ship_via = s.shipper_id
WHERE c.city = 'London'
 AND e.city = 'London'
 AND s.company_name = 'Speedy Express';

-- Найти активные продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц 
SELECT product_name, units_in_stock, contact_name, phone
  FROM products
  JOIN categories USING(category_id)
  JOIN suppliers USING(supplier_id)
 WHERE category_name IN ('Beverages', 'Seafood')
   AND discontinued = 0
   AND units_in_stock < 20
 ORDER BY units_in_stock;
 
-- Найти заказчиков, не сделавших ни одного заказа
SELECT distinct contact_name, order_id
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;

--Переписать предыдущий запрос, использовав симметричный вид джойна
SELECT contact_name, order_id
FROM orders
RIGHT JOIN customers USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;

--а теперь посчитаем сумму товаров в каждой категории, товары должны быть в продаже, товары более 5000, сортировка по убыванию
SELECT category_name, SUM(unit_price * units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE discontinued <> 1
GROUP BY category_name
HAVING SUM(unit_price * units_in_stock) > 5000
ORDER BY SUM(unit_price * units_in_stock) DESC

--соединения между таблицами
--INNER JOIN
--проводим соединение по supplier_id
SELECT product_name, suppliers.company_name, units_in_stock
FROM products
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
ORDER BY units_in_stock DESC;

--сколько единиц товаров по категориям товаров
SELECT category_name, SUM(units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT 5;

--а теперь посчитаем сумму товаров в каждой категории, товары должны быть в продаже, товары более 5000, сортировка по убыванию
SELECT category_name, SUM(unit_price * units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE discontinued <> 1
GROUP BY category_name
HAVING SUM(unit_price * units_in_stock) > 5000
ORDER BY SUM(unit_price * units_in_stock) DESC;

--хотим посмотреть на каких работников завязаны заказы
SELECT order_id, customer_id, first_name, last_name, title
FROM orders
INNER JOIN employees ON orders.employee_id = employees.employee_id;

--дату, когда был сделан заказ, какой товар был заказан, куда его доставить, цену, кол-во и скидку
SELECT order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id;

--кто сделал заказ, где работает, номер телефона, кто отвечает за заказ из сотрудников, его должность,
--дата заказа, продукт, страна доставки, цена за 1, кол-во товаров, тотал сумма заказа, скидка
SELECT contact_name, company_name, phone, first_name, last_name, title,
order_date, product_name, ship_country, products.unit_price, quantity, products.unit_price * quantity, discount
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id
WHERE ship_country = 'USA';

--хотим определить компании, которые не делали заказы никогда
SELECT company_name, order_id
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL;

--работники, которые не обрабатывают никакие заказы => все заняты работой
SELECT last_name, order_id
FROM employees
LEFT JOIN orders ON orders.employee_id = employees.employee_id
WHERE order_id IS NULL;

--сколько работников, которые не обрабатывают никакие заказы => все заняты работой
SELECT COUNT(*)
FROM employees
LEFT JOIN orders ON orders.employee_id = employees.employee_id
WHERE order_id IS NULL;

--Найти заказчиков и обслуживающих их заказы сотрудкников
--таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express.
--Вывести компанию заказчика и ФИО сотрудника.
SELECT c.company_name AS customer,
CONCAT(e.first_name, ' ', e.last_name) AS employee
FROM orders as o
JOIN customers as c USING(customer_id)
JOIN employees as e USING(employee_id)
JOIN shippers as s ON o.ship_via = s.shipper_id
WHERE c.city = 'London'
AND e.city = 'London'
AND s.company_name = 'Speedy Express';
