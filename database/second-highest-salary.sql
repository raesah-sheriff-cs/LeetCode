/* Write your T-SQL query statement below */
SELECT MAX(salary) AS SecondHighestSalary
FROM (
    SELECT salary, RANK() OVER (ORDER BY salary DESC) AS r
    FROM Employee
) ranked
WHERE r = 2;