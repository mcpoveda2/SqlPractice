select avg(salary) as avg_salaries
from salaries;

SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.gender = 'F'
GROUP BY s.emp_no;

with cte1 as (select avg(salary) as avg_salaries
from salaries),
cte2 as(SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.gender = 'F'
GROUP BY s.emp_no)
select 
	sum(case 
		when c2.highest_salary > c1.avg_salaries then 1
        else 0 end) as highest_greather_than_avg,
	count(e.emp_no) as count_emp_female
from employees e
join cte2 c2 on e.emp_no = c2.emp_no
cross join cte1 c1;



with cte1 as (select avg(salary) as avg_salaries
from salaries),
cte2 as(SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.gender = 'F'
GROUP BY s.emp_no)
select 
	count(case 
		when c2.highest_salary > c1.avg_salaries then c2.highest_salary
        else null end) as highest_greather_than_avg,
	count(e.emp_no) as count_emp_female
from employees e
join cte2 c2 on e.emp_no = c2.emp_no
cross join cte1 c1;


## valor porcentual

with cte1 as (select avg(salary) as avg_salaries
from salaries),
cte2 as(SELECT 
    s.emp_no, MAX(s.salary) AS highest_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.gender = 'F'
GROUP BY s.emp_no)
select 
	sum(case 
		when c2.highest_salary > c1.avg_salaries then 1
        else 0 end) as highest_greather_than_avg,
	count(e.emp_no) as count_emp_female,
    concat(	round((sum(case 
		when c2.highest_salary > c1.avg_salaries then 1
        else 0 end)/count(e.emp_no))*100,2),"%") as porcentage
from employees e
join cte2 c2 on e.emp_no = c2.emp_no
cross join cte1 c1;

#Ejercicio
select avg(salary) as avg_salary
from salaries;


select 
	s.emp_no,max(s.salary) as max_salary
from salaries s
join employees e on s.emp_no = e.emp_no
where e.gender = "M"
group by s.emp_no;



with cte_avg_salarys as(select avg(salary) as avg_salary
from salaries),
cte_highest_salary_men as(select 
	s.emp_no,max(s.salary) as max_salary
from salaries s
join employees e on s.emp_no = e.emp_no
where e.gender = "M"
group by s.emp_no)
select
	sum(case
			when c1.max_salary < c2.avg_salary then 1
            else 0 end) as highest_lower_than_avg
from 
	cte_highest_salary_men c1
    cross join cte_avg_salarys c2;
    
## Hacer referencia al cte anterior en el mismo query

select * from employees
where hire_date > "2000-01-01";



with emp_hired_from_jan_2000 as(
select * from employees
where hire_date > "2000-01-01"),
highest_contract_salary_values as(
select 
	e.emp_no,max(s.salary)
from 
	emp_hired_from_jan_2000 e 
    join salaries s on e.emp_no = s.emp_no
    group by e.emp_no)
select * from highest_contract_salary_values;
 

