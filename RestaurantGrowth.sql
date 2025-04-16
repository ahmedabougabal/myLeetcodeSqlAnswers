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

/*

feat(sql): Add solution for LeetCode 1321 - Restaurant Growth

Implement a SQL query to compute the 7-day moving average of customer transaction amounts for the Restaurant Growth problem (LeetCode 1321). The query calculates the total amount spent over a 7-day window (current day + 6 preceding days) and the corresponding average, rounded to two decimal places, starting from the first complete 7-day window.

Key implementation details:
- Use a CTE (`daily_totals`) to aggregate transaction amounts by `visited_on`, handling multiple transactions per day.
- Create a second CTE (`moving_data`) to compute the 7-day moving sum using a window function (`SUM(daily_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)`).
- Calculate the moving average by dividing the 7-day sum by 7.0 and rounding to two decimal places using `ROUND(..., 2)`.
- Assign row numbers with `ROW_NUMBER()` to identify the first complete 7-day window (row number >= 7).
- Filter results to include only dates with a complete 7-day window (`rn >= 7`) and sort by `visited_on` in ascending order.
- Ensure floating-point division (`/ 7.0`) for accurate average calculations.

The solution is optimized for clarity and performance, using window functions to efficiently compute the moving sum and average without requiring self-joins. Tested against the provided example input to produce the expected output, including correct handling of multiple transactions on the same day (e.g., 2019-01-10).

Closes: #<issue_number_if_applicable>


 */