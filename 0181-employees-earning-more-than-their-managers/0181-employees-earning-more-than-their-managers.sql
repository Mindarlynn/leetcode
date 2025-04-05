# Write your MySQL query statement below

select B.name as Employee
from Employee A, Employee B
where
    A.id = B.managerId and
    A.salary < B.salary;