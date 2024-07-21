#count

select 
count(distinct dept_no)
from 
dept_emp;

#sum

SELECT 
sum(salary)
from
salaries
where
from_date > "1997-01-01";

SELECT 
avg(salary)
from
salaries
where
from_date > "1997-01-01";
