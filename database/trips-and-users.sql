
with unbanned_client as(
SELECT id,status, banned,request_at,
case when status like 'cancelled%' then 1 else 0 end as cc from Trips t join Users u on t.client_id=u.users_id and banned='No'
)
,unbanned_driver as(
SELECT id,status, banned,request_at,case when status like 'cancelled%' then 1 else 0 end as cc
from Trips t join Users u on t.driver_id=u.users_id and banned='No'
)
SELECT uc.request_at as Day, 
round(sum(uc.cc)*1.0/count(uc.cc),2) as [Cancellation Rate]
from unbanned_client uc
join unbanned_driver ud on uc.id=ud.id
group by uc.request_at