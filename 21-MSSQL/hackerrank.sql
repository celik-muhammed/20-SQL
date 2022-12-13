--Weather Observation Station 7
select distinct city
from station
where city like '%[a,e,i,o,u]'


--Weather Observation Station 8
select distinct city
from station
where city like '[a,e,i,o,u]%[a,e,i,o,u]' 


--Type of Triangle
select 
    case
    when A+B<=C or B+C<=A or A+C<=B then "Not A Triangle"
    when A=B and A=C then "Equilateral"
    when A=B or A=C or B=C  then "Isosceles"
    else "Scalene"
    end
from triangles;


--The PADS
select CONCAT(name, "(", SUBSTRING(Occupation, 1, 1), ")")
from OCCUPATIONS
ORDER BY name;
select CONCAT("There are a total of ", count(*), " ", LOWER(occupation), "s.")
from occupations
GROUP BY occupation
ORDER BY count(*);


--Occupations
select Doctor, Professor, Singer, Actor
from 
(
    select  name, occupation,
            rn = row_number() over(partition by occupation order by name) 
    from    occupations
) t
pivot
(
    max(name) 
    FOR occupation IN ([Doctor], [Professor], [Singer ], [Actor])
) pt


--Binary Tree Nodes
SELECT N,
    CASE
    WHEN p IS null THEN "Root"
    WHEN n IN (SELECT p FROM bst) THEN "Inner"
    ELSE "Leaf"
    END
FROM bst
ORDER BY 1;


--New Companies
SELECT company_code, founder,
    (SELECT COUNT(DISTINCT lead_manager_code) 
     FROM Lead_Manager 
     WHERE company_code=c.company_code),
    (SELECT COUNT(DISTINCT senior_manager_code) 
     FROM Senior_Manager 
     WHERE company_code=c.company_code),
    (SELECT COUNT(DISTINCT manager_code) 
     FROM Manager 
     WHERE company_code=c.company_code),
    (SELECT COUNT(DISTINCT employee_code) 
     FROM Employee 
     WHERE company_code=c.company_code)
FROM Company c
ORDER BY 1;


--Revising Aggregations - The Count Function
SELECT COUNT(*)
FROM city
WHERE population >100000


--Revising Aggregations - The Sum Function
SELECT DISTINCT SUM(population) OVER ()
FROM city 
WHERE district like 'California';

select sum(population)
from city
group by district
having district like 'California';


--Revising Aggregations - Averages
select AVG(population)
from city
group by district
having district like 'California';

SELECT DISTINCT AVG(population) OVER ()
FROM city 
WHERE district like 'California';

--Average Population
SELECT FLOOR(AVG(population))
FROM city;


--Japan Population
SELECT SUM(population)
FROM city
WHERE countrycode like "JPN";


--Population Density Difference
SELECT MAX(population) - MIN(population)



FROM city;


