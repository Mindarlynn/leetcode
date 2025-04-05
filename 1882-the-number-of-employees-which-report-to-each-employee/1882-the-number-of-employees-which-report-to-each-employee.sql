# Write your MySQL query statement below

select a.employee_id, a.name, count(*) as reports_count, round(sum(b.age) / count(*)) as average_age
from employees a
left join employees b
on a.employee_id = b.reports_to
group by a.employee_id
having average_age is not null
order by a.employee_id