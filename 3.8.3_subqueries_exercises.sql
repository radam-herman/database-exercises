-- 3.8.3_subqueries_exercises.sql

-- 1 Find all the employees with the same hire date as employee 101010 using a sub-query.69 Rows

    -- tables employees 

select e.emp_no, e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date in (
    select e.hire_date
    from employees
    where e.emp_no = '101010'
    )
limit 5;

  -- 1 yay it works!!!!
select emp_no, first_name, last_name, hire_date
from employees
where hire_date in (
    select hire_date
    from employees
    where emp_no = '101010'
    );
-- limit 5;

select e.emp_no, e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date = '1990-10-22';



-- 2 Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles


select titles.title, employees.first_name, employees.last_name
from titles
where title in
(
select e.first_name
from employees as e
where first_name in (
     select first_name
     from employees
     where first_name = 'Aamod'
     ))
limit 10;

select title
from titles
where emp_no in (
     select emp_no
     from employees
     where first_name = 'Aamod'
);
-- limit 10;


select first_name, last_name, emp_no
     from employees
     where first_name = 'Aamod'
limit 10;

-- 3 How many people in the employees table are no longer working for the company?




-- 4 Find all the current department managers that are female.
  -- 4 example to match
  +------------+------------+
| first_name | last_name  |
+------------+------------+
| Isamu      | Legleitner |
| Karsten    | Sigstam    |
| Leon       | DasSarma   |
| Hilary     | Kambil     |
+------------+------------+;


-- 5 Find all the employees that currently have a higher than average salary. 154543 rows in total. Here is what the first 5 rows will look like:

-- 5 example to match
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Georgi     | Facello   | 88958  |
| Bezalel    | Simmel    | 72527  |
| Chirstian  | Koblick   | 74057  |;

-- 6 How many current salaries are within 1 standard deviation of the highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

78 salaries;

  -- ++++++++++++++++++++++++++++++++++++++++++++
    -- ++++++++++++++++++++++++++++++++++++++++++++
  -- ++++++++++++++++++++++++++++++++++++++++++++
  -- ++++++++++++++++++++++++++++++++++++++++++++

show tables;
current_dept_emp
departments
dept_emp
dept_emp_latest_date
dept_manager
employees
salaries
titles;

describe titles;
emp_no	int(11)	NO	PRI	NULL	
title	varchar(50)	NO	PRI	NULL	
from_date	date	NO	PRI	NULL	
to_date	date	YES		NULL	;

describe employees;
emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	

describe current_dept_emp;
emp_no	int(11)	NO		NULL	
dept_no	char(4)	NO		NULL	
from_date	date	YES		NULL	
to_date	date	YES		NULL	



-- BONUS 1 Find all the department names that currently have female managers.


+-----------------+
| dept_name       |
+-----------------+
| Development     |
| Finance         |
| Human Resources |
| Research        |
+-----------------+


-- BONUS 2 Find the first and last name of the employee with the highest salary.


+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Tokuyasu   | Pesch     |
+------------+-----------+

-- BONUS 3 Find the department name that the employee with the highest salary works in.


+-----------+
| dept_name |
+-----------+
| Sales     |
+-----------+