
#Order by

Select
*
From
employees
order by
hire_date desc;


SELECT 
    salary,count(emp_no) as cantEmpleados
FROM
    salaries
WHERE
    salary > 80000
group by
	salary
order by
	salary asc;
    
SELECT 
    emp_no, AVG(salary) AS promedio_sueldo
FROM
    salaries
GROUP BY (emp_no)
HAVING promedio_sueldo > 120000
order by emp_no;


select 
*
from
dept_emp;

select 
from_date,count(emp_no)
from
dept_emp
where from_date > "2000-01-01"
group by from_date;


SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;











