-- 3.5.3_limit_exercises.sql


use employees

describe employees

emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	

-- 2 MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:

-- SELECT DISTINCT title FROM titles;
-- List the first 10 distinct last name sorted in descending order. Your result should look like this:

select distinct `last_name`
from employees
order by last_name DESC
limit 10

-- 3 Find your query for employees born on Christmas and hired in the 90s from order_by_exercises.sql. Update it to find just the first 5 employees. Their names should be:

select first_name, last_name, emp_no, hire_date, birth_date
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'
order by birth_date ASC, hire_date DESC
limit 5

-- 4 Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results. The employee names should be:

select first_name, last_name, emp_no, hire_date, birth_date
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'
order by birth_date ASC, hire_date DESC
limit 5 offset 45

