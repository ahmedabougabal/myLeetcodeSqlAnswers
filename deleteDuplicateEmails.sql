-- Write your MySQL query statement below
delete p 
from Person p
inner join Person d
on p.email = d.email 
and p.id > d.id;
