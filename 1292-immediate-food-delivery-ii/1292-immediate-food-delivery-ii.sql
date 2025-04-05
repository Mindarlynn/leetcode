# Write your MySQL query statement below

with
    # first orders
    cte1 as (
        select distinct(customer_id), min(order_date) as order_date
        from delivery
        group by customer_id
    ),
    # immediate orders
    cte2 as (
        select customer_id, order_date, 1 as immediate
        from delivery
        where order_date = customer_pref_delivery_date
    )

select round(sum(immediate) / count(*) * 100, 2) as immediate_percentage
from cte1
left join cte2
using(customer_id, order_date)