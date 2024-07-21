##where

#Extract the information about all department managers who were hired between
#the 1st of January 1990 and the 1st of January 1995.

SELECT 
    e.first_name, e.last_name,e.hire_date,e.emp_no
FROM
    employees AS e
WHERE
    hire_date BETWEEN '1990-01-01' AND '1995-01-01'
        AND e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager AS dm);
            
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            #110420  111877
            
## exist 

            
##Select the entire information for all employees whose job title is “Assistant Engineer”. 

#Hint: To solve this exercise, use the 'employees' table.
SELECT 
    e.*
FROM
    employees AS e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles AS t
        WHERE
            t.emp_no = e.emp_no and t.title = 'Assistant Engineer');




SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_id
FROM
    employees e
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
WHERE
    e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no; 


DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (
   emp_no INT(11) NOT NULL,
   dept_no CHAR(4) NULL,
   manager_no INT(11) NOT NULL
);

use employees;

select * from emp_manager;



