/* Write your T-SQL query statement below */
with tt as(
SELECT requester_id as id, count(requester_id) as num1 from RequestAccepted group by requester_id
UNION ALL
SELECT accepter_id as id, count(accepter_id) as num1 from RequestAccepted group by accepter_id)
SELECT top 1 id,sum(num1) as num
from tt
group by id 
order by num desc