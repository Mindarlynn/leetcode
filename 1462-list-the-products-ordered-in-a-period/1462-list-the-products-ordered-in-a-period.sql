# Write your MySQL query statement below

select p.product_name, sum(o.unit) as unit
from products p
left join (
    select * 
    from orders
    where order_date between date("2020-02-01") and date("2020-02-29")
) o
on p.product_id = o.product_id
group by p.product_id
having unit >= 100