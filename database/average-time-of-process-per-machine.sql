/* Write your T-SQL query statement below */
SELECT machine_id,
ROUND(AVG(CASE WHEN activity_type='start' THEN -timestamp
Else timestamp
end)*2,3) as processing_time
from Activity
group by machine_id
