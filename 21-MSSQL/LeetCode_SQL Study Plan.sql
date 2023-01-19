-- Day 1 Select
--595. Big Countries
SELECT  name, population, area
FROM    world
WHERE   (area >= 3*POWER(10, 6)) or (population >= 25*POWER(10, 6));

--1757. Recyclable and Low Fat Products
SELECT  product_id
FROM    products
WHERE   (low_fats = 'Y') AND (recyclable = 'Y');


--584. Find Customer Referee
SELECT  name
FROM    customer
WHERE   NOT referee_id = 2 OR referee_id IS NULL;

SELECT  name
FROM    customer
WHERE   NOT ISNULL(referee_id, -1) = 2;


--183. Customers Who Never Order
SELECT      name as Customers
FROM        customers c
LEFT JOIN   orders o
            ON c.id=o.customerid
WHERE       o.id IS NULL;

-- Day 2 Select & Order