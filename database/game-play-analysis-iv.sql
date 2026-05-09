with x as (
SELECT player_id,min(event_date) as first_login from Activity group by player_id
)
,y as 
(
SELECT a.player_id, a.event_date,
case when datediff(day,x.first_login,event_date)=1 then 1 else 0
end as f
from Activity a join x on a.player_id=x.player_id
)

SELECT round(sum(f)*1.0/count(distinct a.player_id),2) as fraction
from Activity a join y on a.player_id=y.player_id and a.event_date=y.event_date
