-- 3.5.2_order_by_exercises.sql


use employees

describe employees

emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	

-- 2 Modify your first query to order by first name. The first result should be Irena Reutenauer and the last result should be Vidya Simmen.
    -- wrong way... must use IN statement
SELECT first_name, last_name
FROM employees
where first_name >= 'Irena' AND first_name <= 'Vidya'
ORDER BY first_name ASC;

   -- this is the way they wanted it
select first_name, last_name
from `employees`
where first_name in ('Irena', 'Vidya')
order by first_name

-- 3 Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.

select first_name, last_name
from `employees`
where first_name in ('Irena', 'Vidya')
order by first_name, last_name

-- 4 Change the order by clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.

select first_name, last_name
from `employees`
where first_name in ('Irena', 'Maya')
order by last_name, first_name

-- 5 Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!

select last_name, `emp_no`
from employees
where last_name like '%e%'
order by `emp_no`

-- 6 Now reverse the sort order for both queries (4 & 5???)

select first_name, last_name
from `employees`
where first_name in ('Irena', 'Maya')
order by first_name DESC, last_name Desc

select last_name, `emp_no`
from employees
where last_name like '%e%'
order by `emp_no` DESC

-- 7 Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.

select first_name, last_name, emp_no, hire_date, birth_date
from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'
order by birth_date ASC, hire_date DESC
