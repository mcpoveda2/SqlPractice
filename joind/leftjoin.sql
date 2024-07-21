#left
#right
#cross
#agg func
#multi join



# 1 Todos los valores iguales
# 2 todos los valores con no match en la otra tabla


use employees;

SELECT 
* 
FROM 
dept_manager_dup
order by dept_no;

SELECT 
* 
FROM 
departments_dup
Order by dept_no;

delete from dept_manager_dup
where emp_no = "110228";

delete from departments_dup
where dept_no = "d009";

insert into dept_manager_dup
values("110228","d003","1992-03-21","9999-01-01");

insert into departments_dup
values ("d009","Customer Service");


SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        Left JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

# SE ENCUENTRAN LOS QUE YA ESTABAN 20 DENTRO DEL JOIN (O sea que comparten los mismos valores)
# Se encuentran los id que solo se encuentran en departments_dup


SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        Left JOIN 
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

# EL ORDEN IMPORTA
# PONER EL PRIMER SELECT CON RESPECTO A LA PRIMERA COLUMNA



##RIGHT 

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        right JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY d.dept_no;
#CON RESPECTO A LA TABLA DE LA IZQUIERDA

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');


### Aggregate function

SELECT 
    e.gender, AVG(s.salary)
FROM
    employees AS e
        JOIN
    salaries AS s ON e.emp_no = s.emp_no
GROUP BY e.gender;

## Multi joins

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON e.emp_no = dm.emp_no
        JOIN
    departments AS d ON dm.dept_no = d.dept_no;
    
## EJERCICIO SALARIO POR DEPT_NAME

SELECT 
    d.dept_name, AVG(s.salary) as avgSalary
FROM
    departments AS d
        JOIN
    dept_manager AS de ON de.dept_no = d.dept_no
        JOIN
    employees AS e ON de.emp_no = e.emp_no
        JOIN
    salaries AS s ON s.emp_no = e.emp_no
GROUP BY d.dept_name

ORDER BY avgSalary desc;




