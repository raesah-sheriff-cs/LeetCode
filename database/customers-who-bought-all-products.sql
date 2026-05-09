/* Write your T-SQL query statement below */
SELECT x.customer_id
from(
    SELECT c.customer_id as customer_id,c.product_key as product_key
from Customer c join Product p
on c.product_key = p.product_key
group by c.customer_id,c.product_key
)x 
group by x.customer_id 
having count(*) = (SELECT count(*) from product)