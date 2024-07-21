

create Temporary table f_highest_salaries
SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM 
    salaries s
    JOIN 
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no;


select * from f_highest_salaries;

drop table if exists f_highest_salaries;



## ejercicio

create temporary table male_max_salaries
select 
	s.emp_no, max(s.salary) as max_salary
from 
	employees e
join salaries s on e.emp_no = s.emp_no
where e.gender = "F"
group by s.emp_no;

select * from male_max_salaries;

## other features


create Temporary table f_highest_salaries
SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM 
    salaries s
    JOIN 
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
limit 10;


WITH cte AS (SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM 
    salaries s
    JOIN 
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no
LIMIT 10)
SELECT * FROM f_highest_salaries f1 JOIN cte c;

CREATE TEMPORARY TABLE dates
SELECT 
    NOW() AS current_date_and_time,
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later;

select * from dates;
drop table if exists f_highest_salaries;
drop table if exists dates;

CREATE TEMPORARY TABLE dates
SELECT 
    NOW() AS current_date_and_time,
    DATE_SUB(NOW(), INTERVAL 2 MONTH) AS _2month_earlier,
    DATE_SUB(NOW(), INTERVAL -2 YEAR) AS a_year_later;
select * from dates;

with ct1 as (
SELECT 
    NOW() AS current_date_and_time,
    DATE_SUB(NOW(), INTERVAL 2 MONTH) AS _2month_earlier,
    DATE_SUB(NOW(), INTERVAL -2 YEAR) AS a_year_later
)
select * from ct1 join dates;