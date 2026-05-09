/* Write your T-SQL query statement below */
SELECT Department,
Employee,
Salary 
from
(SELECT 
d.name as Department,
e.name as Employee,
e.salary as Salary,
dense_rank() over(partition by e.departmentId order by e.salary desc) as r
FROM Department d join Employee e 
on d.id=e.departmentId) as x
where r IN (1,2,3)


