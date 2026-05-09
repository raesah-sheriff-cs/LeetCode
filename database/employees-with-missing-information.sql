/* Write your T-SQL query statement below */

SELECT employee_id from Employees union SELECT employee_id from Salaries
EXCEPT
SELECT e.employee_id from Employees e join Salaries s on e.employee_id=s.employee_id 


