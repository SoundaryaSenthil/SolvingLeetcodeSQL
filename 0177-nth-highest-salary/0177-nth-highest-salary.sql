CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      select max(salary) as NthHighestSalary
from(select id, salary,
dense_rank() over (order by salary desc) rnk 
from employee) t
where rnk = N
  );
END