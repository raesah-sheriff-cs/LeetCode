SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales AS s
WHERE s.year IN (
    SELECT MIN(year)
    FROM Sales AS s1
    WHERE s.product_id = s1.product_id
    GROUP BY s1.product_id
)