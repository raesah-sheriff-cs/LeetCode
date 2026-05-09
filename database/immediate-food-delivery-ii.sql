/* Write your T-SQL query statement below */
--SELECT round((min(im*1.0)*100/min(tot)),2) as immediate_percentage
--from
with x as(SELECT 
customer_id,
sum(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END) as im,
min(order_date) as order_date,
count(*) as tot 
from Delivery
group by customer_id,order_date),
--order by order_date asc ) 
y as
(SELECT customer_id, min(order_date) as order_date
from Delivery
group by customer_id ) 

SELECT round(sum(x.im)*100.0/sum(x.tot),2) as immediate_percentage from x join y
on x.customer_id=y.customer_id and x.order_date=y.order_date
--order by y.order_date
