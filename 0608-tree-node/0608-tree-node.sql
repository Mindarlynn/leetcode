# Write your MySQL query statement below

select a.id, if(isnull(a.p_id), "Root", if(isnull(b.id), "Leaf", "Inner")) as type
from tree a
left join tree b
on a.id = b.p_id
group by a.id