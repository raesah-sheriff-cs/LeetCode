SELECT top 1 person_name
FROM (
    SELECT *,SUM(weight) OVER (ORDER BY turn) AS tw
    FROM Queue
) as x
WHERE tw<= 1000
order by tw desc
