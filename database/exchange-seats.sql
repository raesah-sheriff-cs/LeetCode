/* Write your T-SQL query statement below */
SELECT id, 
coalesce(CASE WHEN id%2=0 THEN lag(student,1) over (order by id) 
ELSE lead(student,1) over (order by id) end , student)
as student
from Seat

