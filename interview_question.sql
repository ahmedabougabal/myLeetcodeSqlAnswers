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



-- 3. How would you optimize a query that joins two large tables, ensuring minimal memory
-- usage and better execution time? Provide an example query.

--> this is an example query , assuming that both customers and orders tables are two large tables 
SELECT o.OrderID, o.OrderDate, c.CustomerName, c.Country
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= '2024-01-01'
ORDER BY o.OrderDate DESC;

-- optimizations : 

--> using appropriate indexes : create indexes on the join columns and frequently used cols in the where clause:
create index idx_orders_customersID on Orders(CustomerID);

create index idx_customers_CustomerID on Customers(CustomerID);

create index idx_orders_ordersDate on Orders(OrderDate);

-- use a materialized view for pre-computing and storing the join results 

CREATE MATERIALIZED VIEW mv_OrderCustomer AS
SELECT o.OrderID, o.OrderDate, c.CustomerName, c.Country
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
-- note that i have removed the where and order by clause from this query to add the later as below when quering 
-- the materialized view

-- then query the materialized view : 
SELECT * FROM mv_OrderCustomer
WHERE OrderDate >= '2024-01-01'
ORDER BY OrderDate DESC;


-- another optimization is to limit search results using 'LIMIT'  

-- sources : 
-- https://stackoverflow.com/questions/55547234/how-to-make-a-faster-query-when-joining-multiple-huge-tables
-- https://impala.apache.org/docs/build/html/topics/impala_perf_joins.html
-- https://help.hcl-software.com/commerce/7.0.0/com.ibm.commerce.developer.soa.doc/refs/rsdperformanceworkspaces.html
-- https://stackoverflow.com/questions/67771205/how-to-optimize-join-of-multiple-large-tables