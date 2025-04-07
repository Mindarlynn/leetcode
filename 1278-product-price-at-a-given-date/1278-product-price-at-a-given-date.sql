# Write your MySQL query statement below

with
    cte as (
        select
            product_id,
            first_value(new_price) over (partition by product_id order by change_date desc) as price,
            row_number() over (partition by product_id order by change_date desc) as rn
        from products
        where datediff(date("2019-08-16"), change_date) >= 0
    )

select 
    unique_product_id.product_id,
    ifnull(cte.price, 10) as price
from (select distinct(product_id) from products) as unique_product_id
left join cte
on unique_product_id.product_id = cte.product_id
where cte.rn = 1 or cte.rn is null;