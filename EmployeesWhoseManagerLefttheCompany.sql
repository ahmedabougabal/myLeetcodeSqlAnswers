select
  e.employee_id as employee_id
from
  Employees e
  left join Employees m on e.manager_id = m.employee_id -- match rows of each employee id with another emp's id (manager )
where
  e.salary < 30000
  and m.employee_id is null -- this the manager's id who had left 
  and e.manager_id is not null -- returning only employees who had previous managers
order by
  e.employee_id;