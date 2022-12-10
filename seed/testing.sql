-- TESTING
-- testing - list items
SELECT m.item_name,m.description, m.price AS '$', m.status
FROM restaurant re
JOIN menu m
ON re.restaurant_ID= m.restaurant_ID
WHERE re.restaurant_name = 'EMC';

-- list Employee work on morning shift on 2022-12-02
SELECT em.employee_name, sh.start_time, sh.end_time, sh.description
FROM employee_timesheet emt
JOIN shift_info sh
ON emt.shift_number=sh.shift_number
JOIN employee em
ON emt.employee_ID=em.employee_ID
WHERE emt.work_date='2022-12-02'&& sh.description = 'Open shift';

-- list specific order
SELECT o.order_number,m.item_name, oi.quantity, m.price, cu.customer_name
FROM `order` o
JOIN order_item oi
ON o.order_number=oi.order_number
JOIN customers cu
ON o.customer_id = cu.customer_id
JOIN menu m
ON oi.item_id=m.item_id
WHERE o.order_number = 9;

-- bill
SELECT b.bill_number,oi.order_number,b.bill_date, b.time, Sum(oi.quantity*m.price) AS 'total price of items',
 (sum(oi.quantity*m.price)- d.discount_percentage*sum(oi.quantity*m.price)) AS 'after discount', 
((sum(oi.quantity*m.price)- d.discount_percentage*sum(oi.quantity*m.price))* ta.tax_percentage)+
(sum(oi.quantity*m.price)- d.discount_percentage*sum(oi.quantity*m.price)) AS 'price+tax'
FROM bill b
JOIN order_item oi
ON b.order_number=oi.order_number
JOIN menu m
ON oi.item_id=m.item_id
JOIN tax ta
ON ta.area_id=b.area_id
JOIN discount d
ON d.discount_id=b.discount_ID
WHERE b.bill_number=1;

-- Employee task on order number 3
SELECT em.employee_ID, em.employee_name, et.order_number, et.description
FROM employee_task et
JOIN employee em
ON et.employee_ID=em.employee_ID
WHERE order_number = 3;