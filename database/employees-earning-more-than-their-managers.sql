/* Write your T-SQL query statement below */
SELECT e2.name as Employee from Employee e1 inner join Employee e2 on e1.id=e2.managerId where e2.salary>e1.salary