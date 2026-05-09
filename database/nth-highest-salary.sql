CREATE FUNCTION getNthHighestSalary(@N INT) 
RETURNS INT 
AS
BEGIN
    RETURN (
        SELECT TOP 1 salary
        FROM (
            SELECT salary,
                   DENSE_RANK() OVER (ORDER BY salary DESC) AS r
            FROM Employee
        ) AS rankedSalaries
        WHERE r = @N
    );
END;
