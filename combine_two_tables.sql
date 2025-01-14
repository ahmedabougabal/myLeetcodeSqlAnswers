# Write your MySQL query statement below
select firstName, lastName, city, 
state from Person 
LEFT JOIN Address ON Person.personId = Address.personid;



-----------------------------------
-- sol 2 

--another refined solution:

SELECT p.firstName , p.lastName, a.city, a.state
from Person as p 
left join Address as a 
on p.personId = a.personId;