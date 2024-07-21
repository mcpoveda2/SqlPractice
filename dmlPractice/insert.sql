select 
*
from
employees
limit 10;

INSERT INTO employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
)values
(
	999901,
    "1982-01-01",
    "John",
    "Smith",
    "F",
    "2011-01-01"
);


select 
*
from
employees
order by emp_no desc	
limit 10;