# Write your MySQL query statement below

select A.name as Employee
from Employee A
join Employee B on A.managerId = B.id
where A.salary > b.salary;