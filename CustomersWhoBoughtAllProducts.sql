with
  new_table as (
    select
      count(product_key) as total
    from
      Product
  )
select
  customer_id
from
  Customer
group by
  customer_id
having
  count(distinct (product_key)) = (
    select
      total
    from
      new_table
  );