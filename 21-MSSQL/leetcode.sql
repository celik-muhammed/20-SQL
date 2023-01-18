--595. Big Countries
SELECT  name, population, area
FROM    world
WHERE   (area >= 3*POWER(10, 6)) or (population >= 25*POWER(10, 6));

--1757. Recyclable and Low Fat Products
SELECT  product_id
FROM    products
WHERE   (low_fats = 'Y') AND (recyclable = 'Y');