-- Write your PostgreSQL query statement below
select max(salary) as SecondHighestSalary
from(
select id, salary,
dense_rank() over (order by salary desc) rnk 
from employee) t
where rnk = 2