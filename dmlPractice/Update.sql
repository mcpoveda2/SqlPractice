use employees;
Select
*
from
employees
where emp_no = "999901";

update employees
set
	first_name = "Michael",
    last_name = "Poveda"
where emp_no = "999901";

COMMIT;
ROLLBACK;
