# Write your MySQL query statement below
select e.employee_id ,e.name,count(r.reports_to) as reports_count,
ROUND(avg(r.age))as average_age from employees e
join employees r on e.employee_id = r.reports_to
group by employee_id
order by employee_id 