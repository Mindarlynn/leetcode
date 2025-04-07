# Write your MySQL query statement below

select 
    a.product_id,
    a.year as first_year,
    a.quantity,
    a.price
from sales a
where a.year in (select min(b.year) from sales b where a.product_id = b.product_id)