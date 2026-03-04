-- Write your PostgreSQL query statement below
with cte as
(select *,case when income< 20000 then 'Low Salary'
when income between 20000 and 50000 then 'Average Salary'
when income > 50000 then 'High Salary'
end as category
from accounts)
select c.category,count(cte.category) as accounts_count
from 
      (select 'Low Salary' as category
       union all  select 'Average Salary'
       union all select 'High Salary') c 
left join cte on c.category = cte.category
group by c.category
order by accounts_count desc;
