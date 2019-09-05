-- 3.7_group_by_exercises.sql


use employees;

show databases;

-- show databases output of employees DB
information_schema
albums_db
bayes_827
chipotle
elo_db
employees
fruits_db
iris_db
join_example_db
mall_customers
mysql
numbers
quotes_db
sakila
svi_db
telco_churn
titanic_db
tsa_item_demand
world
zillow;



describe titles;

emp_no	int(11)	NO	PRI	NULL	
title	varchar(50)	NO	PRI	NULL	
from_date	date	NO	PRI	NULL	
to_date	date	YES		NULL	;	

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


-- 3 Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY. The results should be:
    
select last_name, count(last_name)
from employees
where last_name like 'e%e'
group by last_name;

--output 3
Eldridge	174
Erbe	186
Erde	185
Erie	180
Etalle	174;


-- 4 Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.

select first_name, last_name, count(last_name)
from employees
where last_name like 'e%e'
group by last_name, first_name
limit 5;

-- output 4
Abdelaziz	Eldridge	1
Abdelkader	Eldridge	1
Abdelwaheb	Eldridge	1
Alain	Eldridge	1
Alejandra	Eldridge	1;

-- 5 Find the unique last names with a 'q' but not 'qu'. Your results should be:

select last_name, count(last_name)
from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name;

-- output5
Chleq	189
Lindqvist	190
Qiwen	168;

-- 6 Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

select first_name, last_name, count(*)
from employees
group by first_name, last_name
order by count(*) desc
limit 10;

-- output 6
Laurentiu	Cesareni	5
Rosalyn	Baalen	5
Guadalupe	Heijenga	4
Dietrich	Figueira	4
Alper	Lienhardt	4
Charlene	Maraist	4
Alejandra	Weisert	4
Gretta	Miara	4
Eben	Francisci	4
Goa	Kugler	4;


-- 7 Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:
 
select count(gender), gender
from employees
where first_name in ('Irena', 'Vidya','Maya')
group by gender;

-- output 7
441	M
268	F;

-- THIS ONE IS GIVING ME PROBLEMS
-- 8 Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames?

Bonus: how many duplicate usernames are there?;

select 
	concat(
		lower(substr(first_name, 1, 1)),
		lower(substr(last_name, 1, 4)), 
		"_", 
		substr(birth_date, -5, 2), 
		substr(birth_date, 3, 2)
		    ) as username, 
	first_name,
	last_name,
	birth_date
from `employees`;


-- 300024
-- group by username
-- order by count(*)
-- limit 5;

-- use this one for testing;


select 
	concat(
		lower(substr(first_name, 1, 1)),
		lower(substr(last_name, 1, 4)), 
		"_", 
		substr(birth_date, -5, 2), 
		substr(birth_date, 3, 2)
		    ) as username, 
	first_name,
	last_name,
	birth_date
from `employees
order by count(*) desc;




-- group by first_name, last_name, birth_date, username;
-- order by username, count(*); -- contains agg fx and applies to result of non-agg query


-- fm Ryans post
SELECT
    CONCAT(
        LOWER(SUBSTR(first_name, 1, 1)),
        LOWER(SUBSTR(last_name, 1, 4)),
        "_",
        SUBSTR(birth_date, 6,2),
        SUBSTR(birth_date, 3, 2)
    ) as username,
    first_name,
    last_name,
    birth_date
FROM employees;


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


sllsfl;

show databases;

-- show databases output of employees DB
information_schema
albums_db
bayes_827
chipotle
elo_db
employees
fruits_db
iris_db
join_example_db
mall_customers
mysql
numbers
quotes_db
sakila
svi_db
telco_churn
titanic_db
tsa_item_demand
world
zillow