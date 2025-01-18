# Write your MySQL query statement below
select w.id 
from Weather w
inner join Weather s
where w.temperature > s.temperature
and datediff(w.recordDate , s.recordDate) = 1;  