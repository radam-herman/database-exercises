-- 3.5.1_where_exercises.sql

show databases;

use employees;

-- to show the table to discern attribute name to search
describe employees;

emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	

-- 2 Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
select first_name
from `employees`
where first_name in ('Irena', 'Vidya','Maya')

-- 3 Find all employees whose last name starts with 'E' — 7,330 rows
select last_name
from employees
where last_name Like 'E%'

-- 4 Find all employees hired in the 90s — 135,214 rows
    -- find how hire_date is formatted
select first_name, birth_date, hire_date, emp_no
from employees
where first_name like 'Jeong'
		-- yyyy-mm-dd is the formatted
select emp_no, hire_date
from employees
where hire_date >= '1990-01-01' and hire_date <= '1999-12-31'

select emp_no, hire_date
from employees
where hire_date between '1990-01-01' and '1999-12-31'

-- 5 Find all employees born on Christmas — 842 rows.
select emp_no, birth_date
from employees
where birth_date like '%-12-25'
	-- note: use 'like' and not '='
	
	
-- 6 Find all employees with a 'q' in their last name — 1,873 rows
select `last_name`
from employees
where last_name like '%q%'

-- -- CONTINUED EXERCISES another 1 - 6


-- 1 Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
	
select first_name
from `employees`
where first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
   -- this is only getting 241 entries
   -- OK.. each 'OR' requires an explicit restating 'attrib ='
   
-- 2 Add a condition to the previous query to find everybody with those names who is also male — 441 rows.

select first_name, gender
from `employees`
where (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
and gender = 'M'

-- 3 Find all employees whose last name starts or ends with 'E' — 30,723 rows.
select `last_name`
from employees
where last_name like 'E%' OR last_name like '%e'

-- 4 Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
select `last_name`
from employees
where last_name like 'E%' AND last_name like '%e'
     --- could have abridged to '%e%'

-- 5 Find all employees hired in the 90s and born on Christmas — 362 rows.

select emp_no, hire_date, birth_date
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'
    -- mine has 5 more entries, ie 367 with parens
    
-- 6 Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
select `last_name`
from employees
where last_name like '%q%' AND last_name not like '%qu%'


