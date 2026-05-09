/* Write your T-SQL query statement below 
select e.student_id,st.student_name,e.subject_name,
coalesce(count(e.student_id),0) as attended_exams
from Students st
cross join Subjects su
join Examinations e
on st.student_id=e.student_id
group by e.student_id,st.student_name,e.subject_name
order by e.student_id*/
select st.student_id,st.student_name,su.subject_name,
count(e.student_id) as attended_exams
from Students st
cross join Subjects su left join Examinations e on st.student_id=e.student_id
and su.subject_name = e.subject_name
group by st.student_id,st.student_name,su.subject_name
order by st.student_id 
