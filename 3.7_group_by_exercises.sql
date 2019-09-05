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
    
select last_name, count(last_name)
from employees
where last_name like 'e%e'
group by last_name


-- 4 Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.

select first_name, last_name, count(last_name)
from employees
where last_name like 'e%e'
group by last_name, first_name

-- 5 Find the unique last names with a 'q' but not 'qu'. Your results should be:

select last_name, count(last_name)
from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name

-- 6 Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

select first_name, last_name, count(*)
from employees
group by first_name, last_name
order by count(*) desc
limit 20

-- 7 Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:
 
select count(gender), gender
from employees
where first_name in ('Irena', 'Vidya','Maya')
group by gender


-- THESE ARE JUST EXAMPLES FM READING
-- ++++++++++++++++++++++++++++

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name
limit 20

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

select first_name, last_name, count(*)
from employees
group by first_name, last_name
order by count(*) desc
limit 20
