# Write your MySQL query statement below

select
    user_id,
    round(sum(
        case
            when action = 'confirmed' then 1
            else 0
        end
    ) / count(*), 2) as confirmation_rate
from signups
left join confirmations 
using(user_id)
group by user_id