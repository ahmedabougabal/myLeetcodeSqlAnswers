-- Write your MySQL query statement below
select
  Department,
  Employee,
  Salary
from
  (
    SELECT
      d.name AS Department,
      e.name AS Employee,
      e.salary AS Salary,
      DENSE_RANK() OVER (
        PARTITION BY
          d.name
        ORDER BY
          e.salary DESC
      ) as salary_rank
    FROM
      Employee e
      LEFT JOIN Department d ON e.departmentId = d.id
  ) as sub
where
  salary_rank <= 3
order by
  Salary desc,
  Department;