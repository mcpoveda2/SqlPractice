SELECT 
    *
FROM
    employees
WHEre
	first_name Like ("Mark%");


SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
SELECT 
    *
FROM
    employees
WHEre
	first_name not Like ("%Jack%");
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
SELECT 
    *
FROM
    employees
WHERE
	emp_no between 10004 and 10012;
    
SELECT 
    *
FROM
    departments
where 
	dept_no between "d003" and "d006";

describe departments;
	
SELECT 
    *
FROM
    departments
where 
	dept_no is not null;
    
SELECT 
    *
FROM
    employees
where
	gender = "F" AND hire_date >= "2000-01-01";


SELECT 
    *
FROM
    salaries
where 
	salary >= 150000;
    
    
    
Select Distinct
hire_date
from 
employees;


select 
count(salary)
from 
salaries
where salary>=100000;


select
count(emp_no)
from
titles
where title = "manager";

select
count(*)
from 
dept_manager;
