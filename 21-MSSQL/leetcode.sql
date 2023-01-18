--595. Big Countries
SELECT  name, population, area
FROM    world
WHERE   (area >= 3*POWER(10, 6)) or (population >= 25*POWER(10, 6));