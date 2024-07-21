
#NO CUENTA VALORES NULOS
#TIENE QUE ENCONTRARSE EN AMBAS TABLAS


#PARA ELIMINAR DUPLICADOS CON GROUP BY


Create table If not exists departments_dup(
	dept_no CHAR(4),
	dept_name VarChar(40)
);


alter table departments_dup
change column dept_name dept_name VarChar(40) Null;

insert into departments_dup(
	dept_no,
    dept_name
)
	select 
	* 
	from 
	departments;

select 
	* 
	from 
departments_dup;
    
insert into departments_dup
values("d010","investigacion");
insert into departments_dup (dept_no)
values("d010"),("d011");

insert into departments_dup (dept_name)
values("Public Relations");

delete from departments_dup
where dept_no = "d002";


DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

 

INSERT INTO dept_manager_dup
select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES       	(999904, '2017-01-01'),

			(999905, '2017-01-01'),

			(999906, '2017-01-01'),

			(999907, '2017-01-01');

 

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
    
    
    
#### RECIEN COMIENZA INNER JOIN

SELECT 
* 
FROM 
dept_manager_dup;

SELECT 
* 
FROM 
departments_dup;


SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

#NO CUENTA VALORES NULOS
#TIENE QUE ENCONTRARSE EN AMBAS TABLAS

#PARA ELIMINAR DUPLICADOS CON GROUP BY