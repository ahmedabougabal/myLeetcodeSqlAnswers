with
  cte as (
    select distinct
      (a.pid),
      a.tiv_2016
    from
      Insurance a
      join Insurance b on a.pid != b.pid
      and a.tiv_2015 = b.tiv_2015
    where
      (
        select
          count(*)
        from
          Insurance c
        where
          c.lat = a.lat
          and c.lon = a.lon
      ) = 1
  )
select
  round(sum(tiv_2016), 2) as tiv_2016
from
  cte;