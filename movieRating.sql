-- building up the solution 
-- this lil query will output each user with how many times they
-- rated movies
/*

select
user_id,
count(*) as ratingCount
from
MovieRating
group by
user_id;

 */
-- will join with users to get their names
(
  select
    u.name as results
  from
    MovieRating m
    join Users u on m.user_id = u.user_id
  group by
    u.user_id
  order by
    count(*) desc,
    u.name asc
  limit
    1
)
union all -- union removes duplicates while union all allows them.
(
  select
    n.title as results
  from
    MovieRating m
    join Movies n on m.movie_id = n.movie_id
  where
    year (m.created_at) = 2020
    and month (m.created_at) = 2
  group by
    n.movie_id,
    n.title
  order by
    avg(m.rating) desc,
    n.title asc
  limit
    1
);