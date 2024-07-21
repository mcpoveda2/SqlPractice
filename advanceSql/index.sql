Create Index i_hire_date on employees(hire_date);

create index i_composite on employees(first_name,last_name);

drop index i_hire_date on employees;

select *
from salaries
where salary > 89000;

create index i_salary on salaries(salary);