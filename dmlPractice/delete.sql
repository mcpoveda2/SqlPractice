use employees;

commit;

select
*
from titles
where
emp_no = 999901;

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

insert into titles
(emp_no,title,from_date,to_date)
values 
(999901,"Data Analyst","2024-06-21","2034-01-01");


DELETE FROM employees 
WHERE
    emp_no = 999901;
    
rollback;