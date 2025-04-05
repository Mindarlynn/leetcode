# Write your MySQL query statement below

with 
    cte1 as (
        select distinct(product_id), new_price, change_date
        from products
        where datediff(date("2019-08-16"), change_date) >= 0
        order by change_date desc
    ),
    cte2 as (
        select *
        from cte1
        group by product_id
    ),
    cte3 as (
        select distinct(product_id)
        from products
    )

select product_id, ifnull(new_price, 10) as price
from cte3
left join cte2
using(product_id)