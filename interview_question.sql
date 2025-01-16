-- first question : 
-- Write an optimized query to get the top 5 customers who spent the most, considering a
-- table orders with columns customer id, order total, and order date.
select customer_id as 'top 5 spenders' , sum(order_total) as totalSpent
from orders 
group by customer_id -- should group by only cols not aggregates or functions of aggregates
--  but with customer id to calc the total amount each customer has spent
order by totalSpent Desc
LIMIT 5




