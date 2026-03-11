# Write your MySQL query statement below
select product_id ,year as first_year,quantity,price
from (select *, dense_rank()over(partition by product_id order by year) rnk from sales )t
where rnk=1