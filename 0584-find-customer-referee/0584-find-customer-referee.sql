# Write your MySQL query statement below
select name from customer
where id in (select id from customer where referee_id !=2
or referee_id IS NULL)
