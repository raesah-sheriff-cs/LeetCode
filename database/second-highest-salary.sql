/* Write your T-SQL query statement below */
SELECT MAX(salary) AS SecondHighestSalary
FROM (
    SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS r
    FROM Employee
) ranked
WHERE r = 2;