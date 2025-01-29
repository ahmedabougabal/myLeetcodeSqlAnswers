select p.product_id, case when SUM(u.units) = 0 or SUM(u.units) = 0 is NULL then 0 else round(sum(p.price*u.units)/sum(u.units),2) end
as average_price
from Prices p
left join UnitsSold u 
on p.product_id = u.product_id 
and  u.purchase_date between p.start_date and p.end_date 
group by p.product_id;
