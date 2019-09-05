-- 3.8.2_join_exercises.sql

-- creating DB bayes_827
show databases;

use bayes_827;


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

