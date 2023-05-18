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


--The Blunder
select 
CAST(
    CEILING(
        AVG(CAST(salary AS FLOAT)) - 
        AVG(CAST(REPLACE(STR(salary), "0", "") AS FLOAT))
    ) AS INT
) 
from employees;


--Top Earners
SELECT MAX(salary * months), Count(salary * months)
FROM employee
WHERE salary * months = (select max(salary * months) from employee);

-- SELECT salary * months, Count(*)
-- FROM employee
-- WHERE salary * months = (select max(salary * months) from employee)
-- GROUP BY salary * months;

-- SELECT TOP 1
--     (SELECT MAX(salary*months) from employee),
--     COUNT(*)
-- FROM employee
-- GROUP BY salary*months
-- ORDER BY salary*months DESC;

-- select concat(
--     (select max(months*salary) from employee), ' ', 
--     (select count(*) 
--      from ( select rank() over (order by months*salary desc) as rnk from employee) t 
--      where t.rnk = 1)
-- );


--Weather Observation Station 2
SELECT
    CAST(SUM(lat_n) AS NUMERIC(10, 2)),
    CAST(SUM(long_w) AS NUMERIC(10,2))
FROM station;


--Weather Observation Station 13
SELECT CAST( SUM(lat_n) AS NUMERIC(10,4) )
FROM station
WHERE lat_n BETWEEN 38.7880 and 137.2345; 


--Weather Observation Station 14
SELECT  top 1 CAST(ROUND(LAT_N, 4) AS NUMERIC(10,4))
FROM    station
WHERE   LAT_N < 137.2345
ORDER BY 1 DESC;

--Weather Observation Station 15
SELECT TOP 1 CAST(ROUND(LONG_W, 4) AS NUMERIC(10, 4))
FROM    station
WHERE   LAT_N < 137.2345
ORDER BY LAT_N DESC;

--Weather Observation Station 16
SELECT TOP 1 CAST(ROUND(LAT_N, 4) AS NUMERIC(10, 4))
FROM    station
WHERE   LAT_N > 38.7780
ORDER BY LAT_N;

--Weather Observation Station 17
SELECT TOP 1 CAST(ROUND(LONG_W, 4) AS NUMERIC(10, 4))
FROM    station
WHERE   LAT_N > 38.7780
ORDER BY LAT_N;

--Weather Observation Station 18
SELECT  CAST(ABS(MIN(LAT_N)-MAX(LAT_N)) + ABS(MIN(LONG_W )-MAX(LONG_W )) AS DECIMAL(10, 4))
FROM    station;

--Weather Observation Station 19
SELECT  CAST(SQRT(SQUARE(MIN(LAT_N)-MAX(LAT_N)) + SQUARE(MIN(LONG_W )-MAX(LONG_W ))) AS DECIMAL(10, 4))
FROM    station;

--Weather Observation Station 20
SELECT  TOP 1 LAT_N
FROM    (SELECT  TOP 50 PERCENT CAST(LAT_N AS NUMERIC(10, 4)) AS LAT_N
        FROM    station
        ORDER BY LAT_N) as a
ORDER BY LAT_N DESC;

SELECT  MAX(LAT_N)
FROM    (SELECT  TOP 50 PERCENT CAST(LAT_N AS NUMERIC(10, 4)) AS LAT_N
        FROM    station
        ORDER BY LAT_N) as a;


--Population Census
SELECT  SUM(ci.population)
FROM    city ci
LEFT JOIN   country co
            ON ci.countrycode=co.code
WHERE   co.continent = 'Asia';


--African Cities
SELECT ci.name
FROM city ci
LEFT JOIN country co
    ON ci.countrycode=co.code
-- WHERE co.continent in ("Africa");
WHERE co.continent like "Africa";


--Average Population of Each Continent
-- SELECT  co.continent, 
--         AVG(ci.population)
-- FROM city ci
-- JOIN country co
--     ON ci.countrycode=co.code
-- GROUP BY co.continent;

SELECT DISTINCT co.continent, 
                AVG(ci.population) OVER(partition by co.continent)
FROM city ci
JOIN country co
    ON ci.countrycode=co.code;


--The Report
SELECT
    -- CASE WHEN grades.grade < 8 THEN NULL
    --      ELSE students.name
    -- END,
    IIF(grades.grade < 8, NULL, students.name),
    grades.grade, 
    students.marks
FROM  students, grades
WHERE students.marks >= grades.min_mark AND students.marks <= grades.max_mark
ORDER BY grades.grade DESC, students.name


-- -- Top Competitors
-- SELECT h.hacker_id, h.name
-- FROM Hackers h
-- JOIN (
--   SELECT s.hacker_id, COUNT(DISTINCT s.challenge_id) AS count_challenge
--   FROM Submissions s
--   JOIN Challenges c ON s.challenge_id = c.challenge_id
--   JOIN Difficulty d ON c.difficulty_level = d.difficulty_level AND s.score = d.score
--   GROUP BY s.hacker_id
--   HAVING COUNT(DISTINCT s.challenge_id) > 1
-- ) AS count_challenge ON h.hacker_id = count_challenge.hacker_id
-- ORDER BY count_challenge DESC, h.hacker_id ASC;

WITH count_challenge AS (
  SELECT s.hacker_id, COUNT(DISTINCT s.challenge_id) AS count_challenge
  FROM Submissions s
  JOIN Challenges c ON s.challenge_id = c.challenge_id
  JOIN Difficulty d ON c.difficulty_level = d.difficulty_level AND s.score = d.score
  GROUP BY s.hacker_id
  HAVING COUNT(DISTINCT s.challenge_id) > 1
)
SELECT h.hacker_id, h.name
FROM Hackers h
JOIN count_challenge ON h.hacker_id = count_challenge.hacker_id
ORDER BY count_challenge DESC, h.hacker_id ASC;


--Ollivander's Inventory
-- SELECT  aa.id, bb.age, aa.coins_needed, aa.power
-- FROM    WANDS AS aa
-- JOIN    WANDS_PROPERTY AS bb 
--         ON aa.CODE = bb.CODE
-- JOIN    (
--         SELECT age AS AG, MIN(coins_needed) AS MCN, power AS PW
--         FROM WANDS AS A
--         JOIN WANDS_PROPERTY AS B ON A.CODE = B.CODE
--         WHERE IS_EVIL = 0
--         GROUP BY power, age
--         ) AS Q 
--         ON bb.age = AG AND aa.coins_needed = MCN AND aa.power = PW
-- ORDER BY aa.power DESC, bb.age DESC

SELECT  w.id,  wp.age,  w.coins_needed,  w.power
FROM    Wands AS w
JOIN    Wands_Property AS wp 
        ON w.code = wp.code
WHERE   wp.is_evil = 0 AND w.coins_needed = (
                                        SELECT  MIN(w2.coins_needed)
                                        FROM    Wands AS w2
                                        JOIN    Wands_Property AS wp2 
                                                ON w2.code = wp.code
                                        WHERE   w2.power = w.power AND wp2.age = wp.AGE)
ORDER BY  w.power DESC,  wp.age DESC;


-- Challenges
-- -- c_cnt = the number of challenges completed by each student
-- SELECT  hacker_id, name, c_cnt                    
-- FROM    (
--         -- same_cnt = the number of students having the same c_cnt
--         SELECT  hacker_id, name, c_cnt,
--                 COUNT(*) OVER(PARTITION BY c_cnt) AS same_cnt,     
--                 -- max_cnt = the maximum of c_cnt
--                 MAX(c_cnt) OVER() AS max_cnt                
--         FROM    (
--                 SELECT h.hacker_id, h.name, COUNT(*) AS c_cnt
--                 FROM Hackers h
--                 JOIN Challenges c ON h.hacker_id = c.hacker_id
--                 GROUP BY h.hacker_id, h.name
--                 ) t1
--         ) t2
-- -- Students with same c_cnt, if their c_cnt = max_cnt, include them
-- -- Students with same c_cnt, if their c_cnt != max_cnt, exclude them
-- WHERE c_cnt = max_cnt OR same_cnt = 1                
-- ORDER BY c_cnt DESC, hacker_id; 

WITH t1 AS (
    SELECT  h.hacker_id, h.name, COUNT(*) AS c_cnt
    FROM    Hackers h
    JOIN    Challenges c 
            ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
t2 AS (
    SELECT hacker_id, name, c_cnt,
           COUNT(*) OVER(PARTITION BY c_cnt) AS same_cnt,
           MAX(c_cnt) OVER() AS max_cnt
    FROM t1
)
SELECT  hacker_id, name, c_cnt
FROM    t2
WHERE   c_cnt = max_cnt OR same_cnt = 1
ORDER BY c_cnt DESC, hacker_id;


-- Contest Leaderboard
WITH max_scores
AS (
    SELECT  hacker_id, max(score) as max_score
    FROM    submissions
    GROUP BY hacker_id, challenge_id
)
SELECT  ms.hacker_id, h.name, sum(ms.max_score) as total_score
FROM    max_scores ms 
JOIN    hackers h 
        ON ms.hacker_id = h.hacker_id
GROUP BY ms.hacker_id, h.name
HAVING  SUM(ms.max_score) <> 0
ORDER BY total_score DESC, ms.hacker_id;



-- Alternative QueriesDraw 
-- Draw The Triangle 1
DECLARE @counter INT = 20;

WHILE @counter > 0
BEGIN
    PRINT REPLICATE('* ', @counter)
    SET @counter = @counter - 1;
END


-- Draw The Triangle 2
DECLARE @counter INT = 1;
DECLARE @stopper INT = 20;

WHILE @counter <= @stopper
BEGIN
    -- Code to be executed within the loop
    PRINT REPLICATE('* ', @counter)
    
    -- Increment the counter
    SET @counter = @counter + 1;
END;