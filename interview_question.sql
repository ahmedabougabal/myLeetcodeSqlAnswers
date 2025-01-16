-- first question : 
-- Write an optimized query to get the top 5 customers who spent the most, considering a
-- table orders with columns customer id, order total, and order date.
select customer_id as 'top 5 spenders' , sum(order_total) as totalSpent
from orders 
group by customer_id -- should group by only cols not aggregates or functions of aggregates
--  but with customer id to calc the total amount each customer has spent
order by totalSpent Desc
LIMIT 5


-- 2. Explain what indexes are and how they improve query performance.

-- indexes are b+ or b- data structures and are used in this context to provide fast data (rows) retrieval
-- for frequent accessed data, (not optimal to apply an index to each column as this may cause a peformance overhead
-- or a an excess storage usage as indexes consume storage space due to both pointers to actual data rows and 
-- a copy of the indexed column. 

-- types : single col index, composite index , unique index , clustered index , non clustered index  

---  Write a query to add an index to the order_date column in the orders table.
create INDEX date_index on (orders)order_date ;

