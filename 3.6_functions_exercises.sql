-- 3.6_functions_exercises.sql


use employees

describe employees

emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	

-- 2 Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

select concat (first_name, " ", last_name) as full_name
from employees
where last_name like 'e%'

-- 3 Convert the names produced in your last query to all uppercase.

select concat (first_name, " ", last_name) as full_name
from employees
where last_name like 'e%'

select concat (first_name, " ", last_name) as full_name
from employees
where last_name like 'e%'

-- 4 Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results. The employee names should be:

select first_name, last_name, emp_no, hire_date, birth_date
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'
order by birth_date ASC, hire_date DESC
limit 5 offset 45

