/* Write your T-SQL query statement below */
SELECT employee_id from Employees where manager_id NOT IN (SELECT employee_id from Employees) and salary<30000
order by employee_id