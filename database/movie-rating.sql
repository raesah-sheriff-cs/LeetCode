with a as(
SELECT top 1 
min(name) as results
from MovieRating mr join Users u
on mr.user_id=u.User_id
group by u.user_id
order by count(*) desc,results asc
)
, b as(
SELECT 
top 1
min(m.title) as results
from MovieRating mr join Movies m on 
mr.movie_id=m.movie_id
where month(created_at)=2 and year(created_at)=2020
group by mr.movie_id
order by round(avg(rating*1.0),2) desc, results asc
)

select results from a union all select results from b
--The query is invalid because TOP cannot be directly used with UNION, and ORDER BY cannot be applied independently within each SELECT when you're combining them with UNION.