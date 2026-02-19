# Write your MySQL query statement below
SELECT project_id, 
avg(experience_years) as average_years FROM project p inner join employee e
on p.employee_id = e.employee_id
group by p.project_id order by p.project_id