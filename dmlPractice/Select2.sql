##Order by
##Group by
#HAVING
#LIMIT
Select  
*
from 
employees
order by first_name desc; #Lo ordena por el nombre


Select  
*
from 
employees
order by emp_no desc; 

Select  
*
from 
employees
order by first_name,last_name desc; #2 columnas

# Group by IMPORTANT

# group fields
# Solo uno,es como distinct en ese sentido
# Siempre incluir la columna en el select con la que se ha hecho el group by

Select 
	first_name,count(first_name) as num
from employees
group by first_name
order by num desc;


#HAVING
# IT IS LIKE THE WHERE CLAUSE BUT YOU CAN USE IT WITH AGGREGATION FUNC

SELECT
	first_name,count(first_name) as numName
from employees
group by first_name
having numName > 250
order by first_name;


#Primero lo filtar por el where
#Luego lo agrupa a esa agrupacion se le puede hacer having

SELECT 
    first_name, COUNT(first_name) AS cantidad_nombres
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING cantidad_nombres < 200
ORDER BY cantidad_nombres DESC;


#LIMIT
select 
emp_no,salary
from
salaries
order by salary desc
limit 10;




