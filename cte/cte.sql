use employees;


with cte as(
select avg(salary) as avg_salary from salaries)
select 
	sum(case
		when s.salary > c.avg_salary then 1
        else 0 end) as salaries_above_avg,
	count(s.salary)
from
	salaries s
    join employees e on s.emp_no = e.emp_no and e.gender = "F"
    cross join
    cte c;
    
with cte as(
select avg(salary) as avg_salary from salaries)
select 
	sum(case
		when s.salary > c.avg_salary then 1
        else 0 end) as salaries_above_avg,
	count(case
		when s.salary > c.avg_salary then s.salary
        else null end) as count___salaries_above_avg,
	count(s.salary)
from
	salaries s
    join employees e on s.emp_no = e.emp_no and e.gender = "F"
    cross join
    cte c;

##Ejercicios 

with cte as(
select avg(salary) as avg_salary from salaries)
select 
	sum(case
			when s.salary <= c.avg_salary then 1
            else 0 end) as men_salary_below_avg_salary
from 
salaries s
join employees e on e.emp_no=s.emp_no and e.gender = "M"
cross join 
cte c;

## count
with cte as(
select avg(salary) as avg_salary from salaries)
select 
	count(case
			when s.salary <= c.avg_salary then s.salary
            else null end) as __count__men_salary_below_avg_salary
from 
salaries s
join employees e on e.emp_no=s.emp_no and e.gender = "M"
cross join 
cte c;



select
	sum(case 
		when s.salary <= c.avg_salary then 1
        else 0 end) as num
from 
salaries s
join employees e on e.emp_no=s.emp_no and e.gender = "M"
cross join (select avg(salary) AS avg_salary from salaries) as c;