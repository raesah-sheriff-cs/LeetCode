/* Write your T-SQL query statement below */
with cte as(select count(order_number) as total, customer_number from Orders group by customer_number)
select top 1 customer_number from cte order by total desc 