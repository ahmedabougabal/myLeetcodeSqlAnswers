with
  first_login_table as (
    select
      player_id,
      min(event_date) as first_login_date
    from
      Activity
    group by
      player_id
  )
select
  round(
    count(
      case
        when DATEDIFF (a.event_date, f.first_login_date) = 1 then 1
      end
    ) / (
      select
        count(distinct (player_id))
      from
        Activity
    ),
    2
  ) as fraction
from
  Activity a
  join first_login_table f on a.player_id = f.player_id;