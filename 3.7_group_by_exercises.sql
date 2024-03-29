-- 3.7_group_by_exercises.sql
;

use employees;

describe titles

emp_no	int(11)	NO	PRI	NULL	
title	varchar(50)	NO	PRI	NULL	
from_date	date	NO	PRI	NULL	
to_date	date	YES		NULL;		

-- 2 In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:

select distinct title
from titles;

     -- output 2
     Senior Engineer
Staff
Engineer
Senior Staff
Assistant Engineer
Technique Leader
Manager;

-- vs no distinct
;
select title
from titles;

-- 3 Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY. The results should be:
    
select last_name, count(last_name)
from employees
where last_name like 'e%e'
group by last_name;

	-- trying without the groupby
	--- pancake doesn't like the comment on same line as a command
	-- so [ select last_name -- count(last_name) ] does not work
	-- must delete "count(last_name)" to run or put on own line
;
select last_name
from employees
where last_name like 'e%e';


-- 4 Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.

select first_name, last_name, count(last_name)
from employees
where last_name like 'e%e'
group by last_name, first_name;

-- 5 Find the unique last names with a 'q' but not 'qu'. Your results should be:

select last_name, count(last_name)
from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name;

-- 6 Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

select first_name, last_name, count(*)
from employees
group by first_name, last_name
order by count(*) desc
limit 20;

-- 7 Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:
 
select count(gender), gender
from employees
where first_name in ('Irena', 'Vidya','Maya')
group by gender;


	-- just running a gender search 
	select count(gender)
    from employees
    where first_name in ('Irena', 'Vidya','Maya');
    
	
	
	
-- THIS ONE IS GIVING ME PROBLEMS
-- 8 Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames?

Bonus: how many duplicate usernames are there?

select concat (lower(substr(first_name, 1, 1)), lower(substr(last_name, 1, 4)), "_", substr(birth_date, -5, 2), substr(birth_date, 3, 2)) as username, first_name, last_name, birth_date, count(*)
from `employees`
group by username
order by count(*)
limit 5;

select concat (lower(substr(first_name, 1, 1)), lower(substr(last_name, 1, 4)), "_", substr(birth_date, -5, 2), substr(birth_date, 3, 2)) as username, first_name, last_name, birth_date, count(username)
from `employees`
-- group by username
group by username;
limit 5;

-- trying to copy notes form - 
SELECT LOWER(CONCAT 
              (SUBSTR(first_name,1,1),
              SUBSTR(last_name,1,4),
              '_',
              SUBSTR(birth_date,6,2),
              SUBSTR(birth_date,3,2)
              )
            ) AS username,
            COUNT(*)
 FROM employees
 GROUP BY username
 ORDER BY COUNT(*) DESC;


-- 8 Bonus: how many duplicate usernames are there?
-- Bonus: how many duplicate usernames are there?

SELECT LOWER(CONCAT 
              (SUBSTR(first_name,1,1),
              SUBSTR(last_name,1,4),
              '_',
              SUBSTR(birth_date,6,2),
              SUBSTR(birth_date,3,2)
              )
            ) AS username,
            COUNT(*)
 FROM employees
 GROUP BY username
 ORDER BY COUNT(*) DESC;





-- THESE ARE JUST EXAMPLES FM READING
-- ++++++++++++++++++++++++++++

-- ex 1 ===============================
SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name
limit 5


SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name
limit 5

-- output ex 1
Becky	227
Bedir	238
Bedrich	240
Bernd	240
Berni	234

-- ex 2. ==============================
SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 5;

-- output ex 2
1985-06-20	132
1985-03-21	131
1985-08-08	128
1985-03-24	128
1985-12-12	127

-- ex 3 ===============================
select first_name, last_name, count(*)
from employees
group by first_name, last_name
order by count(*) desc
limit 5

-- output ex 3
Rosalyn	Baalen	5
Laurentiu	Cesareni	5
Charlene	Maraist	4
Dietrich	Figueira	4
Alper	Lienhardt	4

