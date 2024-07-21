## USE OF DELIMITER
# NO PARAMETER PROCEDURE
# Parameter procedure
# Output procedure
# Variables

use employees;

DELIMITER $$

Create procedure show_10_names()
Begin
	Select * from employees
    limit 10;
End $$
DELIMITER ;

call employees.show_10_names();

Drop procedure if exists avg_salary;

DELIMITER $$
Create Procedure avg_salary()
Begin 
	Select avg(salary) as promedio
    from salaries;
End $$
DELIMITER ;

call avg_salary();


call emp_salary(10006);

DELIMITER $$
Create Procedure emp_avg_salary_out(in p_emp_no Integer, out p_avg_salary Decimal(10,2))
BEGIN
	Select avg(s.salary)
    INTO p_avg_salary from employees e
    join salaries s
    on s.emp_no = e.emp_no
    where p_emp_no = e.emp_no;
END $$
DELIMITER ;

Describe employees;

DELIMITER $$
Create Procedure emp_info(in p_first_name varchar(14),in p_last_name varchar(14), out p_emp_no INTEGER)
BEGIN
	select emp_no
    into p_emp_no
    from employees
    where p_first_name = first_name and p_last_name = last_name;
END $$
DELIMITER ;

select * from employees;

#VARIABLES

set @v_avg_salary = 0;
call emp_avg_salary_out(11300,@v_avg_salary);
select @v_avg_salary;

set @v_emp_no = 0;
call emp_info("Aruna","Journel",@v_emp_no);
select @v_emp_no;

## Funcion

Delimiter $$
Create Function f_emp_avg_salary (p_emp_no Integer) returns Decimal(10,2)
Deterministic
Begin
	Declare v_avg_salary Decimal(10,2);
    
    select avg(salary)
    into v_avg_salary from employees e
    join salaries s
    on s.emp_no = e.emp_no
    where e.emp_no = p_emp_no;
    
    return v_avg_salary;
end $$
Delimiter ;


DELIMITER $$

CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)

DETERMINISTIC NO SQL READS SQL DATA

BEGIN

	DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
    
SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;

SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
        
	RETURN v_salary;

END$$
DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');

SET @v_emp_no = 11300;

SELECT
    emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary##function in select
    
FROM
    employees
WHERE
    emp_no = @v_emp_no;

