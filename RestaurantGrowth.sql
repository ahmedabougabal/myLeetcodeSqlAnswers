with
    daily_totals as (
        select
            visited_on,
            sum(amount) as daily_amount
        FROM
            Customer
        GROUP BY
            visited_on
    ),
    moving_data as (
        SELECT
            visited_on,
            sum(daily_amount) over (
                order by
                    visited_on rows between 6 preceding
                    and current row
            ) as amount,
            round(
                sum(daily_amount) over (
                    order by
                        visited_on rows between 6 preceding
                        and current row
                ) / 7,
                2
            ) as average_amount,
            row_number() over (
                order by
                    visited_on
            ) as rn
        from
            daily_totals
    )
select
    visited_on,
    amount,
    average_amount
from
    moving_data
where
    rn >= 7
order by
    visited_on;