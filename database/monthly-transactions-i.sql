/* Write your T-SQL query statement below */
SELECT min(FORMAT(trans_date, 'yyyy-MM')) AS month,
country,
count(state) as trans_count,
sum(CASE WHEN state='approved' THEN 1 ELSE 0 END) as approved_count,
sum(amount) as trans_total_amount, 
sum(CASE WHEN state='approved' THEN amount ELSE 0 END) as approved_total_amount
from Transactions
group by FORMAT(trans_date, 'yyyy-MM'),country
order by month