select
  user_id,
  count(*) as followers_count
from
  Followers f
group by
  user_id
order by
  f.user_id asc;