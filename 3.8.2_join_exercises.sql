-- 3.8.2_join_exercises.sql

-- Use the employees database.
use `employees`;

show tables;
current_dept_emp
departments
dept_emp
dept_emp_latest_date
dept_manager
employees
salaries
titles;


-- 2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
  -- department [name] = Department Name | current mgr = Department Manager
  
-- examine departments tb and dept_manager tb
describe departments;
dept_no	char(4)	NO	PRI	NULL	
dept_name	varchar(40)	NO	UNI	NULL	;

describe dept_manager;
emp_no	int(11)	NO	PRI	NULL	
dept_no	char(4)	NO	PRI	NULL	
from_date	date	NO		NULL	
to_date	date	NO		NULL	;

describe employees;
emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	;

-- DONT NEED describe dept_emp;
emp_no	int(11)	NO	PRI	NULL	
dept_no	char(4)	NO	PRI	NULL	
from_date	date	NO		NULL	
to_date	date	NO		NULL	;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS dmgr
  ON dmgr.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dmgr.dept_no;
  
  -- output 2 
Tonny Butterworth	Customer Service
Marjo Giarratana	Customer Service
Xiaobin Spinelli	Customer Service
Yuchang Weedman	Customer Service
DeForest Hagimont	Development
Leon DasSarma	Development
Ebru Alpin	Finance
Isamu Legleitner	Finance
Shirish Ossenbruggen	Human Resources
Karsten Sigstam	Human Resources
Margareta Markovitch	Marketing
Vishwani Minakawa	Marketing
Krassimir Wegerle	Production
Rosine Cools	Production
Shem Kieras	Production
Oscar Ghazalie	Production
Peternela Onuegbe	Quality Management
Rutger Hofmeyr	Quality Management
Sanjoy Quadeer	Quality Management
Dung Pesch	Quality Management
Arie Staelin	Research
Hilary Kambil	Research
Przemyslawa Kaelbling	Sales
Hauke Zhang	Sales;

























-- ||||||||||||||||||||||||||||||||||||
     -- used in class

-- creating DB bayes_827
show databases;

use bayes_827;

show tables;


CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

show tables;

-- output show tables
roles
users;

describe roles;
-- output describe roles
id	int(10) unsigned	NO	PRI	NULL	auto_increment
name	varchar(100)	NO		NULL	;

SELECT * FROM users
limit 5;
-- output 
1	bob	bob@example.com	1
2	joe	joe@example.com	2
3	sally	sally@example.com	3
4	adam	adam@example.com	3
5	jane	jane@example.com	NULL;

SELECT * FROM roles
limit 5;
-- output
1	admin
2	author
3	reviewer
4	commenter;

-- INNER JOIN
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

-- LEFT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- output LEFT JOIN
bob	admin
joe	author
sally	reviewer
adam	reviewer
jane	NULL
mike	NULL;

-- RIGHT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
-- output RIGHT JOIN
bob	admin
joe	author
sally	reviewer
adam	reviewer
NULL	commenter;

-- RIGHT REWRITE AS LEFT
SELECT users.name as user_name, roles.name as role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;
-- REWRITE OUTPUT
bob	admin
joe	author
sally	reviewer
adam	reviewer
NULL	commenter;

-- Associative OR Junction Tables and Joins
USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

-- output
Georgi Facello	Development;

-- FOR EXAMPLES
use bayes_827;

