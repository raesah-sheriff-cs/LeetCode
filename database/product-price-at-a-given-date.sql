with a as(
SELECT x.product_id, x.new_price as price
from Products x join
(SELECT product_id,max(change_date) as c from Products where change_date<='2019-08-16'
group by product_id) y 
on x.product_id=y.product_id and x.change_date=y.c
)
, b as (
    SELECT distinct product_id from Products
)
SELECT b.product_id, coalesce(a.price,10) as price
from a right join b on a.product_id=b.product_id
