#varias rows con un single value

##count	
#sum
#min 
#max
#avg
#round
#ifnull
#coalesce



-- count

select 
count(Distinct from_date)
from 
salaries;

# with * i can count null values too

select 
count(*)
from 
salaries;

-- sum
# does not work *, just num 	
SELECT 
sum(salary)
from
salaries;

-- max

Select 
min(salary)
from 
salaries;

-- avg

Select 
round(avg(salary),2)
from
salaries;