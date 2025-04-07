# Write your MySQL query statement below

with 
    cte as (
        select *
        from insurance a
        where 
            a.tiv_2015 in (select b.tiv_2015 from insurance b where a.pid <> b.pid) and
            (a.lat, a.lon) not in (select b.lat, b.lon from insurance b where a.pid <> b.pid)
    )

select
    round(sum(tiv_2016), 2) as tiv_2016
from cte;