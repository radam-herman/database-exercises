-- 3.7_group_by_exercises.sql


use employees

describe titles

emp_no	int(11)	NO	PRI	NULL	
title	varchar(50)	NO	PRI	NULL	
from_date	date	NO	PRI	NULL	
to_date	date	YES		NULL		

-- 2 In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:

select distinct title
from titles


-- 3 Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY. The results should be:

    -- not sure why or how example shows statring with 'Eldridge' mine starts with 'Eastman'
    
select last_name, count(last_name)
from employees
where last_name like 'e%'
group by last_name
order by count() = 1
-- limit 20


-- 4 Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.



select first_name, last_name, datediff(now(), hire_date) as days_hired
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'
limit 5

-- 5 Find the smallest and largest salary from the salaries table.

select *
from salaries
limit 5

describe salaries

emp_no	int(11)	NO	PRI	NULL	
salary	int(11)	NO		NULL	
from_date	date	NO	PRI	NULL	
to_date	date	NO		NULL	

select min(salary), max(salary)
from salaries

-- 6 Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

+------------+------------+-----------+------------+
| username   | first_name | last_name | birth_date |
+------------+------------+-----------+------------+
| gface_0953 | Georgi     | Facello   | 1953-09-02 |
| bsimm_0664 | Bezalel    | Simmel    | 1964-06-02 |
| pbamf_1259 | Parto      | Bamford   | 1959-12-03 |

  -- NOTE - SUBSTR CAN ALSO USE NEG "-"
select concat (lower(substr(first_name, 1, 1)), lower(substr(last_name, 1, 4)), "_", substr(birth_date, -5, 2), substr(birth_date, 3, 2)) as username, first_name, last_name, birth_date
from `employees`
limit 5

