-- Topics
# In
#Like
#Between
#null
#Greater (dates)
#Distinct
# min, max, count, avg, sum


-- IN

SELECT 
    *
FROM
    employees
where
	first_name not in ("John","Mark","Jacob");

-- LIKE

SELECT 
    *
FROM
    employees
where
	first_name like ("MAR%");
    
SELECT 
    *
FROM
    employees
where
	first_name like ("MAR_");
    
SELECT 
    *
FROM
    employees
where
	first_name NOT like ("MAR_");
    
-- BETWEEN    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
-- null and not null

SELECT 
    *
FROM
    employees
WHERE
	first_name is null;
    
-- greater than

Select 
*
from 
employees
where 
	hire_date > "2000-01-01";
	

# No duplicados

use employees;

Select Distinct 
gender
from 
employees;

# min, max, count, avg, sum
# does not count null values
SELECT 
    COUNT(emp_no)
FROM
    employees;
    
    
########
use employees;
SELECT 
    COUNT(Distinct first_name)
FROM
    employees;   
 