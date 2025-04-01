-- objectives
-- count how many friends each person , finding the one with the most number of friends

WITH
  all_friends 
  AS (SELECT requester_id as id FROM RequestAccepted
  union all
  SELECT accepter_id as id FROM RequestAccepted)
SELECT id , count(*) as num from all_friends
group by id
order by num desc
limit 1;