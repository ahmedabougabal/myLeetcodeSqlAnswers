select
  DATE_FORMAT (trans_date, '%Y-%m') as "month",
  t.country as country,
  sum(
    case
      when state = 'approved' then 1
      else 0
    end
  ) trans_count,
  count(
    case
      when t.state = 'approved' then t.amount
      else 0
    end
  ) as approved_count,
  sum(amount) as trans_total_amount,
  sum(
    case
      when t.state = 'approved' then t.amount
      else 0
    end
  ) as approved_total_amount
from
  Transactions t
group by
  DATE_FORMAT (trans_date, '%Y-%m'),
  country;