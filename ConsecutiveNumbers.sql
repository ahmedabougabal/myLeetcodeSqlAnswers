with
  cte as (
    select
      num,
      lead (num, 1) over (
        order by
          id
      ) as next1,
      lead (num, 2) over (
        order by
          id
      ) as next2
    from
      Logs
  )
select distinct
  (num) as ConsecutiveNums
from
  cte
where
  num = next1
  and num = next2;