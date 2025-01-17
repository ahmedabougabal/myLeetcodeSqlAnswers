-- Write your MySQL query statement below
delete p 
from Person p
inner join Person d
on p.email = d.email 
where p.id > d.id;
