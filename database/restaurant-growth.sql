/* Write your T-SQL query statement below */
SELECT 
visited_on,
sum(amount) over (order by visited_on rows between 6 PRECEDING AND CURRENT ROW) as amount,
round(avg(amount*1.0) over (order by visited_on rows between 6 PRECEDING AND CURRENT ROW),2) as average_amount
from (SELECT sum(amount) as amount,min(visited_on) as visited_on,avg(amount) as average_amount from Customer group by visited_on) x
order by visited_on
offset 6 rows


