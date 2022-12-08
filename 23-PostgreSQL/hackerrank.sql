select distinct city
from station
where city like '%[a,e,i,o,u]'

select distinct city
from station
where city like '[a,e,i,o,u]%' and city like '%[a,e,i,o,u]' 


select 
    case
    when A+B<=C or B+C<=A or A+C<=B then "Not A Triangle"
    when A=B and A=C then "Equilateral"
    when A=B or A=C or B=C  then "Isosceles"
    else "Scalene"
    end
from triangles;
