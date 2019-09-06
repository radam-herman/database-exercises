-- 3.9_temporary_tables.sql 

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

