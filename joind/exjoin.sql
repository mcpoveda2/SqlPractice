##Extract a list containing information about all managers’ employee number, 
#first and last name, department number, and hire date.

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager m ON e.emp_no = m.emp_no
ORDER BY e.emp_no;



## Left join

select 
*
from
dept_manager;


SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
		left JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    last_name = 'Markovitch';
#PARA VER A TODOS LOS TRABAJADORES
select
*
from 
titles;

select 
e.first_name,e.last_name,e.hire_date,t.title
from employees e
join titles t
on e.emp_no = t.emp_no
where e.first_name = "Margareta" and e.last_name="Markovitch";


#dept_manager table and department number 9
use employees;
select dm.*,d.*
from dept_manager as dm
Cross join departments as d
where d.dept_no = "d009";

## Return a list with the first 10 employees with all the departments they can be assigned to.

select e.*,de.*
from employees as e
cross join dept_emp as de
where e.emp_no < 10011;


## Select all managers’ first and last name, hire date, 
## job title, start date, and department name.

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title,dm.from_date, d.dept_name
FROM
    employees AS e
        JOIN
    titles AS t ON e.emp_no = t.emp_no
		JOIN 
	dept_manager as dm ON e.emp_no = dm.emp_no
		JOIN
	departments as d on d.dept_no = dm.dept_no;


#How many male and how many female managers do we have in the ‘employees’ database?

SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON e.emp_no = dm.emp_no
GROUP BY e.gender;


