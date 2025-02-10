select
  product_id,
  year as "first_year",
  quantity,
  price
from
  Sales
where
  (product_id, year) in (
    select
      product_id,
      min(year)
    from
      Sales
    group by
      product_id
  );

--! CTE approach 
with
  new_table as (
    select
      product_id,
      quantity,
      price,
      min(year) as first_year
    from
      Sales
    group by
      product_id
  )
select
  s.product_id,
  s.year as first_year,
  s.quantity,
  s.price
from
  Sales s
  join new_table nt on s.product_id = nt.product_id
  and s.year = nt.first_year;