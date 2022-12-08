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