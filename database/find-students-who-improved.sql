with a as(
SELECT student_id, subject, min(exam_date) as first_exam, max(exam_date) as latest_exam from Scores group by student_id, subject having count(*)>1
) 
, b as (
select s.student_id, s.subject, sum(case when s.exam_date=a.first_exam and a.student_id=s.student_id and a.subject=s.subject then s.score else 0 end) as first_score,sum(case when s.exam_date=a.latest_exam and a.student_id=s.student_id and a.subject=s.subject then score else 0 end ) as latest_score from a join Scores s on a.student_id=s.student_id group by s.student_id,s.subject
)
SELECT * from b where first_score<latest_score order by student_id, subject
