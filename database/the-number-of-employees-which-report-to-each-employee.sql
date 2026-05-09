/* Write your T-SQL query statement below 
SELECT employee_id,
min(name),
count(reports_to) as reports_count,
avg(age) as average_age
from Employees
where reports_to IS NOT NULL
group by employee_id */
SELECT e.employee_id,
min(e.name) as name,
count(m.reports_to) as reports_count,
round(avg(m.age*1.0),0) as average_age 
from Employees e join Employees m on e.employee_id=m.reports_to
group by e.employee_id
