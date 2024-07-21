#EXAMPLE
CREATE VIEW sales_employees AS
SELECT employee_id, first_name, last_name, department
FROM employees
WHERE department = 'Sales';
