/* Write your T-SQL query statement below */
SELECT id,
CASE WHEN p_id IS NULL THEN 'Root'
WHEN id IN (SELECT distinct p_id from Tree) THEN 'Inner'
ELSE 'Leaf'
END
as type
FROM Tree