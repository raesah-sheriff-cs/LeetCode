
with unbanned_client as(
SELECT id,status, banned,request_at,
case when status like 'cancelled%' then 1 else 0 end as cc from Trips t join Users u on t.client_id=u.users_id and banned='No' and request_at between '2013-10-01' and '2013-10-03'
)
,unbanned_driver as(
SELECT id,status, banned,request_at,case when status like 'cancelled%' then 1 else 0 end as cc
from Trips t join Users u on t.driver_id=u.users_id and banned='No' and request_at between '2013-10-01' and '2013-10-03'
)
SELECT uc.request_at as Day, 
round(sum(ud.cc)*1.0/count(ud.cc),2) as [Cancellation Rate]
from unbanned_client uc
join unbanned_driver ud on uc.id=ud.id
group by uc.request_at