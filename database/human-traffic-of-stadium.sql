SELECT id, visit_date, people
FROM (
SELECT *,
CASE WHEN lead(id,1) over (order by id)=id+1  and lag(id,1) over(order by id)=id-1 
THEN 1 ELSE 0 end as w
FROM Stadium
where people>=100
) as fit 
where w=1

union

SELECT id, visit_date, people
FROM (
SELECT *,
CASE WHEN (
    (lead(id,1) over (order by id)=id+1  and lead(id,2) over (order by id)=id+2)
or (lag(id,1) over(order by id)=id-1  and lag(id,2) over(order by id)=id-2) 
)
THEN 1 ELSE 0 end as w
FROM Stadium
where people>=100
) as fit 
where w=1
