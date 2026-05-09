/* Write your T-SQL query statement below */
SELECT user_id,
       UPPER(LEFT(name, 1)) + LOWER(SUBSTRING(name, 2, LEN(name))) AS name
FROM Users
order by user_id 
