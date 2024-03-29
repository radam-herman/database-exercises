-- 3.8.2_join_exercises.sql

-- Use the employees database.
;
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
  -- de [name] = Department Name | current mgr = Department Manager
  
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

describe dept_emp;
emp_no	int(11)	NO	PRI	NULL	
dept_no	char(4)	NO	PRI	NULL	
from_date	date	NO		NULL	
to_date	date	NO		NULL	;

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name 
FROM employees AS e
JOIN dept_manager AS dmgr
  ON dmgr.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dmgr.dept_no
WHERE dmgr.to_date = '9999-01-01'
order by d.dept_name ASC;
  
  -- output 2 
Customer Service	Yuchang Weedman
Development	Leon DasSarma
Finance	Isamu Legleitner
Human Resources	Karsten Sigstam
Marketing	Vishwani Minakawa
Production	Oscar Ghazalie
Quality Management	Dung Pesch
Research	Hilary Kambil
Sales	Hauke Zhang;

-- 3 Find the name of all departments currently managed by women.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name 
FROM employees AS e
JOIN dept_manager AS dmgr
  ON dmgr.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dmgr.dept_no
WHERE dmgr.to_date = '9999-01-01' and e.gender = 'F'
order by d.dept_name;

-- 3 output
Development	Leon DasSarma
Finance	Isamu Legleitner
Human Resources	Karsten Sigstam
Research	Hilary Kambil;

-- 4 Find the current titles of employees currently working in the Customer Service department.
-- example to match
-- Title              | Count
-- -------------------+------
-- Assistant Engineer |    68
-- Engineer           |   627
-- Manager            |     1
-- Senior Engineer    |  1790;

describe titles;
emp_no	int(11)	NO	PRI	NULL	
title	varchar(50)	NO	PRI	NULL	
from_date	date	NO	PRI	NULL	
to_date	date	YES		NULL	;

select *
from departments
limit 5;

d009	Customer Service
d005	Development
d002	Finance
d003	Human Resources
d001	Marketing;

describe employees;
emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	;

SELECT t.title, count(*) 
FROM departments AS d
JOIN dept_emp AS de
  ON de.dept_no = d.dept_no
JOIN titles AS t
  ON t.emp_no = de.emp_no
WHERE t.to_date = '9999-01-01' and de.to_date = '9999-01-01' and d.dept_name = 'Customer Service'
Group by t.title
order by t.title ASC;

-- 4 output
Assistant Engineer	68
Engineer	627
Manager	1
Senior Engineer	1790
Senior Staff	11268
Staff	3574
Technique Leader	241;

-- 5 Find the current salary of all current managers.
-- match 
-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS Name, s.salary
FROM employees AS e
JOIN dept_manager AS dmgr
  ON dmgr.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dmgr.dept_no
Join salaries As s
on s.emp_no  = e.emp_no
WHERE dmgr.to_date = '9999-01-01' and s.to_date = '9999-01-01'
order by d.dept_name;

describe salaries;
emp_no	int(11)	NO	PRI	NULL	
salary	int(11)	NO		NULL	
from_date	date	NO	PRI	NULL	
to_date	date	NO		NULL	;


-- 5 output
Customer Service	Yuchang Weedman	58745
Development	Leon DasSarma	74510
Finance	Isamu Legleitner	83457
Human Resources	Karsten Sigstam	65400
Marketing	Vishwani Minakawa	106491
Production	Oscar Ghazalie	56654
Quality Management	Dung Pesch	72876
Research	Hilary Kambil	79393
Sales	Hauke Zhang	101987;

-- 6 Find the number of employees in each department.
-- example  to mathch
-- +---------+--------------------+---------------+
-- | dept_no | dept_name          | num_employees |
-- +---------+--------------------+---------------+
-- | d001    | Marketing          | 14842         |
-- | d002    | Finance            | 12437         |
-- | d003    | Human Resources    | 12898         |

describe employees;
emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	;

describe dept_emp;
emp_no	int(11)	NO	PRI	NULL	
dept_no	char(4)	NO	PRI	NULL	
from_date	date	NO		NULL	
to_date	date	NO		NULL	;

describe departments;
dept_no	char(4)	NO	PRI	NULL	
dept_name	varchar(40)	NO	UNI	NULL	;

select d.dept_no, d.dept_name, count(e.emp_no) as nbr_empls
from departments as d
join dept_emp as de
  on de.dept_no = d.dept_no
join employees as e
  on e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01' -- and s.to_date = '9999-01-01'
group by d.dept_no;

--- order dave used
fm dept
dept emp
employees


-- 6 output
d001	Marketing	14842
d002	Finance	12437
d003	Human Resources	12898
d004	Production	53304
d005	Development	61386
d006	Quality Management	14546
d007	Sales	37701
d008	Research	15441
d009	Customer Service	17569;


use `employees`;
-- 7 Which department has the highest average salary?
-- 7 order dave used

describe salaries;
emp_no	int(11)	NO	PRI	NULL	
salary	int(11)	NO		NULL	
from_date	date	NO	PRI	NULL	
to_date	date	NO		NULL	;

           -- tables dept_emp, departments, employees, salaries
-- example
+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+;

sel d.dept name avg (s.sal) as average_salary
fm dept
dept emp on dept no
emp on emp no
salaries on  emp no;

order by average_salary;-- avg(s.salary) as average_salary
-- ++++++++++++
;
select d.dept_name, avg(s.salary) as average_salary
from departments as d
join dept_emp as de
    on de.dept_no = d.dept_no
join employees as e
   on e.emp_no = de.emp_no
join salaries as s
   on s.emp_no = e.emp_no
Where de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by d.dept_name
order by average_salary DESC;

whr de to_date s to_date d dept_name = mark
order sal
limit 10;


-- 8 Who is the highest paid employee in the Marketing department?
fm dept
j dept emp  on d.dept
j emp on de.emp;

-- 8 example
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE employees.birth_date > '1960-01-01'
)
LIMIT 10;

SELECT e.first_name,e.last_name
FROM departments as d
JOIN dept_emp AS de ON (d.dept_no=de.dept_no)
JOIN employees AS e ON (de.emp_no=e.emp_no)
JOIN salaries AS s ON (e.emp_no=s.emp_no)
WHERE de.to_date='9999-01-01' AND s.to_date='9999-01-01' AND d.dept_name='Marketing'
ORDER BY s.salary DESC
LIMIT 1;



    ---- STILL NEED TO ORK THESE
-- 9 Who is the highest paid employee in the Marketing department?

-- 9 example
+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+

SELECT e.first_name,e.last_name,s.salary,d.dept_name 
FROM departments as d
JOIN dept_manager as dm ON (dm.dept_no=d.dept_no)
JOIN employees AS e ON (dm.emp_no=e.emp_no)
JOIN salaries AS s ON(e.emp_no=s.emp_no)
WHERE dm.to_date='9999-01-01' AND s.to_date='9999-01-01'
ORDER BY s.salary DESC
LIMIT 1;


-- 10. Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT(e.first_name,' ',e.last_name) AS 'Employee Name',d.dept_name AS 'Department Name',a.manager_name
FROM  employees AS e
LEFT JOIN dept_emp AS de ON (e.emp_no=de.emp_no)
LEFT JOIN departments as d ON (d.dept_no=de.dept_no)
LEFT JOIN
(SELECT CONCAT(e.first_name,' ',e.last_name) AS manager_name,dm.dept_no
FROM dept_manager AS dm
JOIN employees AS e ON(dm.emp_no=e.emp_no)
WHERE dm.to_date='9999-01-01') AS a ON (a.dept_no=d.dept_no)
WHERE de.to_date='9999-01-01'
ORDER BY d.dept_name ASC,e.last_name,e.first_name;






-- 11 Bonus Find the highest paid employee in each department.

SELECT 
 e.first_name,
 e.last_name,
 d.dept_name,
 max_sal.max_salary
FROM employees AS e
JOIN dept_emp AS de ON (e.emp_no=de.emp_no)
JOIN departments AS d ON(d.dept_no=de.dept_no)
JOIN salaries AS s ON (s.emp_no=e.emp_no) AND s.to_date='9999-01-01'
JOIN
(SELECT d.dept_name,MAX(s.salary) as max_salary
FROM departments as d
JOIN dept_emp AS de ON (d.dept_no=de.dept_no)
JOIN employees AS e ON (de.emp_no=e.emp_no)
JOIN salaries AS s ON (e.emp_no=s.emp_no)
WHERE de.to_date='9999-01-01' AND s.to_date='9999-01-01'
GROUP BY d.dept_name)AS max_sal ON (max_sal.dept_name=d.dept_name AND max_sal.max_salary=s.salary)
WHERE de.to_date='9999-01-01' AND s.to_date='9999-01-01'


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

