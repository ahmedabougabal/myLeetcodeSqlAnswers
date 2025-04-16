select
    product_name,
    sum(unit) as unit
from
    Products p
    join Orders o on p.product_id = o.product_id
where
    year (order_date) = 2020
    and month (order_date) = 2
group by
    p.product_id
having
    sum(unit) >= 100;