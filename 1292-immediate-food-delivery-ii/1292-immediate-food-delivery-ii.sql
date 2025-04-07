# Write your MySQL query statement below

with
    cte as (
        select
            customer_id,
            order_date,
            customer_pref_delivery_date,
            row_number() over (partition by customer_id order by order_date asc) as rn
        from delivery
    )
select
    round(
        sum(
            if(
                order_date = customer_pref_delivery_date, 1, 0
            )
        ) / count(*) * 100, 2
    ) as immediate_percentage
from cte
where rn = 1;