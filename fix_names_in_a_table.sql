-- # Write your MySQL query statement below
select
  u.user_id,
  CONCAT (
    UPPER(LEFT (u.name, 1)),
    LOWER(SUBSTRING(u.name, 2, LENGTH (u.name)))
  ) as name
from
  Users u
order by
  u.user_id;