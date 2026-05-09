SELECT query_name,
round(avg(rating*1.0/position),2) as quality,
round(sum(CASE WHEN rating<3 THEN 1 ELSE 0 END)*100.0/
count(*),2) as poor_query_percentage
from Queries 
group by query_name