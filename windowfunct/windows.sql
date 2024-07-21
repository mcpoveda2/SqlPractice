### Row number
use employees;

select 
	emp_no,
    salary,
    ROW_NUMBER() OVER (Partition by emp_no order by salary Desc) as row_num 
    
from salaries;

SELECT 
    e.emp_no,
    row_number() over(order by e.emp_no) as count_manager
FROM
    employees e
join dept_manager dm
	on e.emp_no = dm.emp_no;
    
SELECT
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM
dept_manager;

select
	first_name,
    last_name,
    row_number() over(partition by first_name order by last_name) as row_num
    
from employees;

## Si se usar mas de un row_number() pero es mejor agruparla por partition


SELECT 
    dm.emp_no,
    s.salary,
    row_number() over () as row_number1,
    row_number() over (partition by dm.emp_no order by s.salary desc) as row_number2
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
ORDER BY row_number1, dm.emp_no, s.salary ASC;
#order by dm.emp_no, s.salary;

## using window clause

select
	first_name,
    last_name,
    row_number() over w as row_num
    
from employees
window w as (partition by first_name order by last_name);

# ejercicio 
SELECT 
    emp_no,
    first_name,
    row_number () over w as row_num1
FROM
    employees
window w as (Partition by first_name order by emp_no);

##dif with group by 

SELECT a.emp_no, MAX(salary) AS max_salary
FROM (
    SELECT 
        emp_no, 
        salary, 
        ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) as row_num
    FROM 
        salaries
) a
GROUP BY a.emp_no;

SELECT a.emp_no, MAX(salary) AS max_salary
FROM (
    SELECT 
        emp_no, 
        salary
    FROM 
        salaries
) a
GROUP BY emp_no;

SELECT a.emp_no,
       a.salary AS max_salary 
FROM (
    SELECT 
        emp_no, 
        salary, 
        ROW_NUMBER() OVER w as row_num
    FROM 
        salaries
    WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
) a
WHERE a.row_num = 1;## puede servir para obtener el segundo


## ejercicios

select a.emp_no,min(salary) as min_val from
	(select
		emp_no,
		salary,
        row_number () over (partition by emp_no) as row_num1
    from salaries) a
group by a.emp_no;

SELECT 
    emp_no, MIN(salary)
FROM
    salaries
GROUP BY emp_no;

## second lowest

select a.emp_no,salary as min_val from
	(select
		emp_no,
		salary,
        row_number () over w as row_num1
    from salaries
    window w as (partition by emp_no order by salary)) a
where a.row_num1 = 2

