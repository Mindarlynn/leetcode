# Write your MySQL query statement below

select s.score, (select count(distinct score) from scores where score >= s.score) as 'rank'
from scores s
order by score desc;