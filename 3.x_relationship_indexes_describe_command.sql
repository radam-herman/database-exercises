-- 3.x_relationship_indexes_describe_command.sql



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

show tables;

-- output fm show tables from Employees DB
current_dept_emp
departments
dept_emp
dept_emp_latest_date
dept_manager
employees
salaries
titles;


describe titles;

describe current_dept_emp;
-- output 

describe departments;
-- output 

describe dept_emp;
-- output 

describe dept_emp_latest_date;
-- output 

describe dept_manager;
-- output 

describe employees;
-- output 

describe salaries;
-- output 

describe titles;
-- output 

-- In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:

select distinct title
from titles;

-- output
Senior Engineer
Staff
Engineer
Senior Staff
Assistant Engineer
Technique Leader
Manager;

-- |||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||
