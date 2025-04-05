select s.student_id, s.student_name, ss.subject_name, sum(if(isnull(e.student_id), 0, 1)) as attended_exams
from students s
cross join subjects ss
left join examinations e
on s.student_id = e.student_id and ss.subject_name = e.subject_name
group by s.student_id, ss.subject_name
order by s.student_id;