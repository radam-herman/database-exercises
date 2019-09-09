-- 3.9_temporary_tables.sql 


-- 1 Using the example from the lesson, re-create the employees_with_departments table.
;

;
--  1 
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

-- not with LIMIT 100;

-- 	1a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
;
describe employees_with_departments;
    -- output
emp_no	int(11)	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
dept_no	char(4)	NO		NULL	
dept_name	varchar(40)	NO		NULL	;    


ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);
-- actually USE 31 to absorb the SPACE between the CONCATS
;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);

-- droping and re-adding column - I bothced the VARCHAR legnth
ALTER TABLE employees_with_departments DROP COLUMN full_name;

--  b Update the table so that full name column contains the correct data
;
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, " ", last_name);

		-- test
		select * from employees_with_departments;
		
		
-- USED THIS BECAUSE I BOTCHED AND REDID - Drop table employees_with_departments;
--  c Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;


--  d What is another way you could have ended up with this same table?
;
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, dept_no, dept_name, concat (first_name, " ", last_name,) as full_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);


-- 2
CREATE TEMPORARY TABLE payments AS
select * from sakila.payment;

select * from payments;

alter table payments add cent_amount int unsigned;

update payments
set cent_amount = payments.amount * 100;

select * from payments;













--  ||||||||||||||||||||||||||||||||||||||||||||||||
--  ||||||||||||||||||||||||||||||||||||||||||||||||
select first_name, last_name, salary
from employees
join salaries on salaries.emp_no = employees.emp_no;

select first_name, last_name, salary
from employees
join salaries using(emp_no);

USE bayes_827;

CREATE TEMPORARY TABLE employee_salary AS
   select first_name, last_name, salary
   from employees.employees
   join employees.salaries using(emp_no);
   
select *
from employee_salary;

-- ||||||||||||||||||||||||||||||
-- making simpler temp table

-- table creation syntax (for permmanent tables, remove the temp keyword)
CREATE TEMPORARY TABLE  captains (
    name VARCHAR(256) not null,
    ship VARCHAR(256) not NULLIF
);

--  how to add new records to a table
INSERT INTO captains (name, ship) VALUES
    ("Jean Luc Piccard", "USS Starship Enterprise NCC1701D"),
    ("James Tiberius Kirk", "USS Starship Enterprise NCC1701A")
    
    
    
    
SELECT * FROM captains;

-- If needing delete row or rows - create the SEL statement first
SELECT * FROM captains WHERE name = "Captain Ahab"

-- 
DELEETE 



CREATE TEMPORARY TABLE fruits (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(256) NOT NULL,
   primary key(id)
);


create temporary table actorz
select * from sakila.actor;

select * 
from actorz;

