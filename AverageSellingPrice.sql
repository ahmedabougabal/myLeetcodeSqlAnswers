select p.product_id, sum(p.price*u.units)/sum(u.units)
as average_price
from Prices p
inner join UnitsSold u 
on p.product_id = u.product_id 
group by p.product_id;
