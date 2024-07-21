select SYSDATE();

SELECT 
    s1.emp_no, s.salary, s1.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s1.emp_no = s.emp_no
WHERE
    s1.from_date = s.from_date
        AND s.to_date > SYSDATE(); ## tiene sentido
    
## EJERCICIO
SELECT 
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MIN(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s.emp_no = s1.emp_no
WHERE
    s.from_date = s1.from_date;

#### con department

SELECT 
    de.emp_no, 
    de.dept_no, 
    de.from_date, 
    de.to_date
FROM 
    dept_emp de
JOIN (
    SELECT 
        emp_no, 
        MAX(from_date) AS from_date
    FROM 
        dept_emp
    GROUP BY 
        emp_no
) de1 
ON 
    de1.emp_no = de.emp_no
WHERE 
    de.to_date > SYSDATE()
    AND de.from_date = de1.from_date;
    
    
    
Select 
	de2.emp_no, d.dept_name, s2.salary, avg(s2.salary) over w as average
from (
	SELECT 
		de.emp_no, 
		de.dept_no, 
		de.from_date, 
		de.to_date
	FROM 
		dept_emp de
	JOIN (
		SELECT 
			emp_no, 
			MAX(from_date) AS from_date
		FROM 
			dept_emp
		GROUP BY 
			emp_no
	) de1 
    
	ON 
		de1.emp_no = de.emp_no
	WHERE 
		de.to_date > SYSDATE()
		AND de.from_date = de1.from_date
	) as de2
    join (
    SELECT 
    s1.emp_no, s.salary, s1.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s1.emp_no = s.emp_no
WHERE
    s1.from_date = s.from_date
        AND s.to_date > SYSDATE()
    ) as s2 on s2.emp_no = de2.emp_no
join departments d on d.dept_no = de2.dept_no
group by de2.emp_no,d.dept_name
window w as (partition by de2.emp_no)
order by de2.emp_no;


Select 
	de2.emp_no, d.dept_name, s2.salary, avg(s2.salary) over w as average
from (
	SELECT 
		de.emp_no, 
		de.dept_no, 
		de.from_date, 
		de.to_date
	FROM 
		dept_emp de
	JOIN (
		SELECT 
			emp_no, 
			MAX(from_date) AS from_date
		FROM 
			dept_emp
		GROUP BY 
			emp_no
	) de1 
    
	ON 
		de1.emp_no = de.emp_no
	WHERE 

		de.from_date = de1.from_date 
        and de.from_date > "2000-01-01"
        and de.to_date < "2002-01-01"
	) as de2
    join (
    SELECT 
    s1.emp_no, s.salary, s1.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s1.emp_no = s.emp_no
	WHERE
    s1.from_date = s.from_date
        and s.from_date > "2000-01-01"
        and s.to_date < "2002-01-01"
    ) as s2 on s2.emp_no = de2.emp_no
join departments d on d.dept_no = de2.dept_no
group by de2.emp_no,d.dept_name
window w as (partition by de2.emp_no)
order by de2.emp_no;
