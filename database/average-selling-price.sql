
SELECT p.product_id, 
CASE WHEN count(u.product_id) =0 THEN 0
     ELSE round(sum(p.price*u.units*1.0)/sum(u.units),2)
END as average_price
FROM Prices p left join UnitsSold u 
on p.product_id=u.product_id 
and u.purchase_date between p.start_date and p.end_date 
group by p.product_id
/*
select p.product_id,
CASE
     WHEN u.product_id=null THEN 0
     ELSE round(sum(p.price*u.units*1.0)/sum(u.units),2)
END as average_price
from Prices p left join UnitsSold u on p.product_id=u.product_id
WHERE u.purchase_date between p.start_date and p.end_date or u.purchase_date=null
group by p.product_id
SELECT p.product_id,
       CASE 
           WHEN SUM(u.units) IS NULL OR SUM(u.units) = 0 THEN 0  -- Handle NULL and zero units
           ELSE ROUND(SUM(p.price * u.units * 1.0) / SUM(u.units), 2)
       END AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;*/



