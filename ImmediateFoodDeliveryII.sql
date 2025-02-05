select
  round(
    sum(
      case
        when order_date = customer_pref_delivery_date then 1
        else 0
      end
    ) * 100 / count(*),
    2
  ) as immediate_percentage
from
  Delivery
where
  (customer_id, order_date) in (
    select
      customer_id,
      min(order_date)
    from
      Delivery
    group by
      customer_id
  );

-- ! approach 2
with
  first_orders as (
    select
      delivery_id,
      customer_id,
      order_date,
      customer_pref_delivery_date,
      row_number() over (
        partition by
          customer_id
        order by
          order_date
      ) as rn
    from
      delivery
  )
select
  round(
    100 * sum(
      case
        when order_date = customer_pref_delivery_date then 1
        else 0
      end
    ) / count(*),
    2
  ) as immediate_percentage
from
  first_orders
where
  rn = 1;