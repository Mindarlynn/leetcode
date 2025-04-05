# Write your MySQL query statement below
select id, 
    case
        when id % 2 = 0 then (select student from seat b where a.id - 1 = b.id)
        else ifnull((select student from seat b where a.id + 1 = b.id), a.student)
    end as student
from seat a
order by id asc;