/* Write your T-SQL query statement below */
SELECT * from Cinema 
where id%2!=0 and 
description NOT LIKE '%boring%'
order by rating DESC