-- use database name
-- 3
use employees;

-- listing all tables in db
-- 4
show TABLES;

current_dept_emp
departments
dept_emp
dept_emp_latest_date
dept_manager
employees
salaries
titles



-- exploring Employees table
-- 5
describe employees;

-- 5 ans:
-- contains Integers, Dates, Varchars, and ENUM?

-- 6 numberic type tables - emp_no

-- 7 string type tables - first_name , last_name , enum???

-- 8 date type table - birth_date, hire_date

-- 9 What is the relationship between the employees and the departments tables???

show create table employees;

show create table departments;



-- 10 showing the SQL to create the table dept_manager
show create table dept_manager;

-- 10 dept_manager	CREATE TABLE `dept_manager` (↵  `emp_no` int(11) NOT NULL,↵  `dept_no` char(4) NOT NULL,↵  `from_date` date NOT NULL,↵  `to_date` date NOT NULL,↵  PRIMARY KEY (`emp_no`,`dept_no`),↵  KEY `dept_no` (`dept_no`),↵  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,↵  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE↵) ENGINE=InnoDB DEFAULT CHARSET=latin1



