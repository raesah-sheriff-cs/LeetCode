/* Write your T-SQL query statement below */
SELECT transaction_date,
sum(odd_sum) as odd_sum,
sum(even_sum) as even_sum
from(SELECT 
*,
CASE WHEN amount%2=0 THEN amount
ELSE 0 end as even_sum,
CASE WHEN amount%2!=0 THEN amount
ELSE 0 end as odd_sum
from transactions
)x
group by transaction_date
