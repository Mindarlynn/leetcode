# Write your MySQL query statement below

(
    select name as results
    from movierating
    left join users
    using(user_id)
    group by user_id
    order by count(*) desc, name
    limit 1
)
union all
(
    select title as results
    from movierating
    left join movies
    using(movie_id)
    where unix_timestamp(created_at) between unix_timestamp("2020-02-01 00:00:00") and unix_timestamp("2020-02-29 23:59:59")
    group by movie_id
    order by avg(rating) desc, title
    limit 1
)