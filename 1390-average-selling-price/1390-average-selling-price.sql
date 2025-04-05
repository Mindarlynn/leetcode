# Write your MySQL query statement below

select product_id, coalesce(round(sum(price_sum) / sum(units), 2), 0) as average_price
from (
    select p.product_id, u.units, u.units * p.price as price_sum
    from prices p
    left join unitssold u
    on p.product_id = u.product_id and p.start_date <= u.purchase_date and p.end_date >= u.purchase_date
) as _
group by product_id;