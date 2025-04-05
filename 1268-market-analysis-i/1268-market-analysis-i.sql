# Write your MySQL query statement below

with cte as (
    select buyer_id as user_id, 1 as valid
    from orders
    where unix_timestamp(order_date) between unix_timestamp("2019-01-01 00:00:00") and unix_timestamp("2019-12-31 23:59:59")
)

select u.user_id as buyer_id, u.join_date, ifnull(sum(valid), 0) as orders_in_2019
from users u
left join cte
using(user_id)
group by u.user_id