# Write your MySQL query statement below
SELECT distinct num as ConsecutiveNums from(
SELECT num,
CASE WHEN 
    lag(num,1) over(order by id ) =num
    and lag(num,2) over(order by id )=num 
    
THEN 1 ELSE 0 end as TF
from Logs
)x
where TF=1
