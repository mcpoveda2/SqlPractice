SELECT 
    emp_no,
    first_name,
    CASE 
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
SELECT 
    emp_no,
    first_name,
    CASE gender	
        WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM 
    employees e
LEFT JOIN 
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE 
    e.emp_no > 109990;
    
    
SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM 
    employees;
    
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE 
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
    END AS salary_increase
FROM 
    dept_manager dm
JOIN 
    employees e ON e.emp_no = dm.emp_no
JOIN 
    salaries s ON s.emp_no = dm.emp_no
GROUP BY 
    dm.emp_no, e.first_name, e.last_name;


select 
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE
		When dm.emp_no is not null then "manager"
        else "chambeador"
	End as is_manager
from employees e
left join dept_manager dm
on e.emp_no = dm.emp_no
where e.emp_no > 109990
order by e.emp_no;


select 
	e.emp_no,
    e.first_name,
	e.last_name,
    max(salary)-min(salary) as gap,	
    if(max(salary)-min(salary)>0,"true","false") as estado#IF(gender = 'M', 'Male', 'Female')
    
from employees e
join dept_manager dm
on e.emp_no = dm.emp_no
join salaries s
on e.emp_no = s.emp_no
group by e.emp_no;


select * from dept_manager
order by emp_no; #110022

