# Write your MySQL query statement below

select A.name as name, B.bonus as bonus
from Employee A
left join Bonus B on A.empId = B.empid
where B.bonus < 1000 or B.bonus is null;