select distinct city
from station
where city like '%[a,e,i,o,u]'

select distinct city
from station
where city like '[a,e,i,o,u]%' and city like '%[a,e,i,o,u]' 
