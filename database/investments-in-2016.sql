with c as(
SELECT 
*,
count(tiv_2015) over(partition by tiv_2015) as cnt
from Insurance)
,l as
   (SELECT lat,lon from Insurance group by lat,lon having count(*)=1) 

SELECT round(sum(tiv_2016),2) as tiv_2016 from c join l on c.lat=l.lat and c.lon=l.lon and c.cnt>1

