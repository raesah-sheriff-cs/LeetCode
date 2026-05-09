/* Write your T-SQL query statement below */
select p.product_name, 
sum(o.unit) as unit 
from Products p join Orders o
on p.product_id=o.product_id 
where MONTH(o.order_date)=2 and YEAR(o.order_date)=2020
group by o.product_id,p.product_name
having sum(o.unit)>=100