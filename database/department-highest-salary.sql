# Write your MySQL query statement below
SELECT a.name as Department,
c.name as Employee,
c.salary from Department a 
join
(
SELECT departmentId,name,salary,
dense_rank() over (partition by departmentId order by salary desc) as t
from Employee
) as c
on a.id=c.departmentId
where t=1
