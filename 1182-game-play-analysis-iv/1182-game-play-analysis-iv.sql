# Write your MySQL query statement below

with cte0 as (
    select player_id, min(event_date) as event_date
    from activity
    group by player_id
),
cte1 as (
    select distinct(a.player_id), 1 as isConsecutive
    from activity a
    left join cte0 b
    on a.player_id = b.player_id and datediff(a.event_date, b.event_date) = 1
    where b.player_id is not null
),
cte2 as (
    select distinct(player_id)
    from activity
)

select ifnull(round(sum(isConsecutive) / count(*), 2), 0) as fraction
from cte2
left join cte1
using(player_id)