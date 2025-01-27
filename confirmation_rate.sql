-- # Write your MySQL query statement below
select s.user_id , 
if(count(c.action) = 0, 0.00,
round(count(case when c.action = 'confirmed' then 1 end)/
COUNT(c.action), 2)) as confirmation_rate 
from Signups s 
left join Confirmations c
on s.user_id = c.user_id
group by user_id;

-- # Write your MySQL query statement below
select s.user_id , 
IFNULL(round(count(case when c.action = 'confirmed' then 1 end)/
NULLIF(count(c.action)
,0)
, 2),0.00)
as confirmation_rate 
from Signups s 
left join Confirmations c
on s.user_id = c.user_id
group by user_id;
