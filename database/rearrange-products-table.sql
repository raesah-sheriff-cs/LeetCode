/* Write your T-SQL query statement below 
SELECT product_id,
CASE WHEN store1 IS NOT NULL THEN 'store1'
     WHEN store2 IS NOT NULL THEN 'store2'
     WHEN store3 IS NOT NULL THEN 'store3'
END AS store,
CASE WHEN store1 IS NOT NULL THEN store1
     WHEN store2 IS NOT NULL THEN store2
     WHEN store3 IS NOT NULL THEN store3
END AS price
from Products */
select product_id,store,price from Products
UNPIVOT
(
price
for store in (store1,store2,store3)
) as unpivoting