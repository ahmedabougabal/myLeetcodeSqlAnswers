-- # Write your MySQL query statement below
1st correct solution
select c.name as Customers
from Customers c
where id not in (select customerId from Orders); 
