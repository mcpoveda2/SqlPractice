use employees;
SELECT
    emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
FROM
    salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT
    emp_no,
    salary,
    RANK() OVER w AS rank_num ### si se repite, se repite el numero pero continua desde el numero
    #que cuenta
FROM
    salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT
    emp_no,
    salary,
    DENSE_RANK() OVER w AS DENSErank_num ### si se repite, se repite el numero pero continua desde el numero
    #EL ULTIMO NUMERO
FROM
    salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

#EJERCICIOS

Select 
	emp_no,
    salary,
    row_number() over () as row_num1
from salaries
where emp_no = 10560;

## 2
SELECT 
    dm.emp_no, 
    s.salary,
    dense_rank () over (partition by dm.emp_no order by salary) as rank_salary
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no;
    
SELECT
    dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;


Select 
	emp_no,
    salary,
    rank() over (partition by emp_no order by salary) as rank_num1
from salaries
where emp_no = 10560;


## with joins

SELECT
    d.dept_no,
    d.dept_name,
    dm.emp_no,
    RANK() OVER w AS department_salary_ranking,
    s.salary,
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date,
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date
FROM
    dept_manager dm
    JOIN salaries s ON s.emp_no = dm.emp_no
	and s.from_date BETWEEN dm.from_date AND dm.to_date
    AND s.to_date BETWEEN dm.from_date AND dm.to_date
    JOIN departments d ON d.dept_no = dm.dept_no
WINDOW w AS (PARTITION BY dm.dept_no ORDER BY s.salary DESC);


SELECT 
    e.emp_no,
    s.salary,
    rank () over (partition by e.emp_no order by s.salary desc) as rank_value
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
where e.emp_no between 10500 and 10600;

select * from salaries
where (to_date - from_date) < 1460;



