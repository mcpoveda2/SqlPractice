use employees;


SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager AS dm);

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            e.emp_no = dm.emp_no);
            
##Ejercicio complejo


use employees;
insert into emp_manager select u.* from
(SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no,
            MIN(de.dept_no),
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager AS dm
                WHERE
                    dm.emp_no = '110022') AS manager
    FROM
        employees AS e
    JOIN dept_emp AS de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no,
            MIN(de.dept_no),
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager AS dm
                WHERE
                    dm.emp_no = '110039') AS manager
    FROM
        employees AS e
    JOIN dept_emp AS de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B

UNION SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no,
            MIN(de.dept_no),
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager AS dm
                WHERE
                    dm.emp_no = '110039') AS manager
    FROM
        employees AS e
    JOIN dept_emp AS de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C
UNION SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no,
            MIN(de.dept_no),
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager AS dm
                WHERE
                    dm.emp_no = '110022') AS manager
    FROM
        employees AS e
    JOIN dept_emp AS de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D)AS u;

select * from emp_manager;


