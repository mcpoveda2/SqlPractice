select 
	emp_no,
    salary,
    lag(salary) over w as previus_salary,
    lead(salary) over w as next_salary,
    salary - lag(salary) over w as diff_salary_current_previus,
    lead(salary) over w - salary as diff_salary_next_current
from salaries
where emp_no = 10001
window w as (order by salary);

use employees;

select 
	emp_no,
    salary,
    lag(salary) over w as previus_salary,
    lead(salary) over w as next_salary,
    salary - lag(salary) over w as diff_salary_current_previus,
    lead(salary) over w - salary as diff_salary_next_current
from salaries
where salary > 80000 and emp_no between 10500 and 10600
window w as (partition by emp_no order by salary asc)
;

## ejercicio 2

select 
	emp_no,
    salary,
    lag(salary) over w as previus_salary,
	lag(salary,2) over w as previus_previus_salary,
    lead(salary) over w as next_salary,
    lag(salary,2) over w as next_next_salary
from salaries
where emp_no between 10500 and 10600
window w as (partition by emp_no order by salary asc)