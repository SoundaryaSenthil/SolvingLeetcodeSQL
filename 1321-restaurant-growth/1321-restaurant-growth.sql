# Write your MySQL query statement below
WITH CTE AS 
(SELECT visited_on,SUM(amount) as amount
from customer
group by visited_on
)
select visited_on,
sum(amount) over (ORDER BY visited_on  ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount,
Round(AVG(amount) over (ORDER BY visited_on  ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) as average_amount
from  cte
LIMIT 1000000 OFFSET 6