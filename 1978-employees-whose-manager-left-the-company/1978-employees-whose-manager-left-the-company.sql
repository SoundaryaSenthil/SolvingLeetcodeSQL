-- Write your PostgreSQL query statement below
select e.employee_id from employees e 
where e.salary<30000
AND e.manager_id is NOT NULL
AND e.manager_id not in (select m.employee_id from employees m where 
m.employee_id =e.manager_id)
order by e.employee_id asc
