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

select concat (upper(first_name), " ", upper(last_name)) as full_name
from employees
where last_name like 'e%'

-- 4 For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())

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

