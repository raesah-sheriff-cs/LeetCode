with tt as (
    select user_id, count(*) as c
from Confirmations where action='confirmed'
group by user_id)
,
ts as(
select s.user_id, count(*) as c
from Signups s left join Confirmations c
on s.user_id=c.user_id
group by s.user_id
)

select ts.user_id, coalesce(round((tt.c*1.0/ts.c),2),0) as confirmation_rate
from ts left join tt
on tt.user_id=ts.user_id
/*
select min(s.user_id),
count(c.user_id)
as confirmation_rate from
Signups s left join Confirmations c
on s.user_id=tt.user_id
group by c.user_id*/