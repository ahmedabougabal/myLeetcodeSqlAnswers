-- edge case : handling products with no price changes
-- will use case when option to detect the products with no price changes which is null and set it to 10 by default and keep other latest prices intact
select distinct
    (p.product_id),
    case
        when price is null then 10
        else latest_prices.price
    end as price
from
    Products p
    left join (
        -- get the price of the date output of the query down 
        select
            product_id,
            new_price as price
        from
            Products
        where
            (product_id, change_date) in (
                -- latest price change before or on the date below
                select
                    product_id,
                    max(change_date) as "change_date"
                from
                    Products
                where
                    change_date <= "2019-08-16"
                group by
                    product_id
            )
    ) as latest_prices on p.product_id = latest_prices.product_id;