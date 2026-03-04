-- Write your PostgreSQL query statement below
(select u.name as results from users u join MovieRating m 
on  m.user_id = u.user_id
group by u.user_id,u.name
order by count(m.user_id) desc,u.name asc
limit 1
)
union all
(select mv.title as results from movies mv join MovieRating m 
on  m.movie_id = mv.movie_id
where m.created_at >= '2020-02-01'
and m.created_at < '2020-03-01'
group by mv.movie_id,mv.title
order by avg(m.rating) desc,mv.title asc
limit 1
);