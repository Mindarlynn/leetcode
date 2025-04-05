# Write your MySQL query statement below

with 
    cte as (
        select user_id, activity_type, round(avg(activity_duration), 2) as average_duration
        from useractivity
        group by user_id, activity_type
    )

select 
    a.user_id, 
    a.average_duration as trial_avg_duration,
    b.average_duration as paid_avg_duration
from cte a
left join cte b
on a.user_id = b.user_id and b.activity_type = 'paid'
where a.activity_type = 'free_trial' and b.user_id is not null;