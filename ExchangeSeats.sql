select
  id,
  case
    when mod(id, 2) = 0 then (
      select
        student
      from
        Seat
      where
        id = s.id - 1
    )
    when mod(id, 2) != 0
    and id != (
      select
        count(*)
      from
        Seat
    ) then (
      select
        student
      from
        Seat
      where
        id = s.id + 1
    )
    else student
  end as student
from
  Seat s
order by
  id;