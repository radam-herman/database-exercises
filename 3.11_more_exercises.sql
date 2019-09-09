-- 3.11_more_exercises.sql t

use Employees; Database
;
show databases;

use employees;

-- 1 How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

describe departments;
dept_no	char(4)	NO	PRI	NULL	
dept_name	varchar(40)	NO	UNI	NULL;	

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

describe salaries;
emp_no	int(11)	NO	PRI	NULL	
salary	int(11)	NO		NULL	
from_date	date	NO	PRI	NULL	
to_date	date	NO		NULL	;

select emp_no, to_date
from dept_manager;
-- 9999-01-01

--- relative to avg salary 
;
select avg(salary) as avg_sal
from salaries;

select *
from dept_emp
limit 5;

10001	d005	1986-06-26	9999-01-01
10002	d007	1996-08-03	9999-01-01
10003	d004	1995-12-03	9999-01-01
10004	d004	1986-12-01	9999-01-01
10005	d003	1989-09-12	9999-01-01;

select *
from dept_manager
limit 5;

     -- fm 3.8. FINDING AVG DEPT SALARY
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

      -- FM 3.8 - 2. GETTING DEPT & mgr
      SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name 
FROM employees AS e
JOIN dept_manager AS dmgr
  ON dmgr.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dmgr.dept_no
WHERE dmgr.to_date = '9999-01-01'
order by d.dept_name ASC;



create temporary table dept_sal_avg AS;


select d.dept_name, concat(e.first_name, ' ', e.last_name) as full_name, (s.salary - average_salary) as dif_salary

;
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary, (s.salary - average_salary) as dif_salary
FROM employees AS e
JOIN dept_manager AS dmgr
  ON dmgr.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dmgr.dept_no
Join salaries As s
on s.emp_no  = e.emp_no
WHERE dmgr.to_date = '9999-01-01' and s.to_date = '9999-01-01'
    select departments.dept_name, avg(salalries.salary) as average_salary
    from employees.departments as d
        join employees.dept_emp as de
          on de.dept_no = d.dept_no
        join employees.employees as e
          on e.emp_no = de.emp_no
        join employees.salaries as s
          on s.emp_no = e.emp_no
     Where de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
order by d.dept_name;



select d.dept_name, avg(s.salary) as average_salary
from employees.departments as d
join employees.dept_emp as de
    on de.dept_no = d.dept_no
join employees.employees as e
   on e.emp_no = de.emp_no
join employees.salaries as s
   on s.emp_no = e.emp_no
Where de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by d.dept_name
order by average_salary DESC;

-- |||||||||||||||||||||| use World Database

;
use world;

describe city;
ID	int(11)	NO	PRI	NULL	auto_increment
Name	char(35)	NO			
CountryCode	char(3)	NO	MUL		
District	char(20)	NO			
Population	int(11)	NO		0	;


describe country;
Code	char(3)	NO	PRI		
Name	char(52)	NO			
Continent	enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America')	NO		Asia	
Region	char(26)	NO			
SurfaceArea	float(10,2)	NO		0.00	
IndepYear	smallint(6)	YES		NULL	
Population	int(11)	NO		0	
LifeExpectancy	float(3,1)	YES		NULL	
GNP	float(10,2)	YES		NULL	
GNPOld	float(10,2)	YES		NULL	
LocalName	char(45)	NO			
GovernmentForm	char(45)	NO			
HeadOfState	char(60)	YES		NULL	
Capital	int(11)	YES		NULL	
Code2	char(2)	NO			;


describe countrylanguage;
CountryCode	char(3)	NO	PRI		
Language	char(30)	NO	PRI		
IsOfficial	enum('T','F')	NO		F	
Percentage	float(4,1)	NO		0.0	;

select cl.language, cl.percentage
from city as c
   join countrylanguage as cl
       on cl.countrycode = c.countrycode
where c.name = 'Santa Monica'
order by cl.percentage ASC;

;       
select *
from city
limit 15;

select *
from country
limit 5;

select sum(population)
from country;
where region = 'Caribbean';
limit 5;

-- 1 What languages are spoken in Santa Monica?
--  ex 1 +------------+------------+
| Language   | Percentage |
+------------+------------+
| Portuguese |        0.2 |
| Vietnamese |        0.2 |
| Japanese   |        0.2 |
| Korean     |        0.3 |
| Polish     |        0.3 |;

select cl.language, cl.percentage
from city as c
   join countrylanguage as cl
       on cl.countrycode = c.countrycode
where c.name = 'Santa Monica'
order by cl.percentage ASC;

-- 2 How many different countries are in each region?

select *
from country
limit 2;

select region, count(*) as num_countries
from country
group by region
order by num_countries;

+---------------------------+---------------+
| Region                    | num_countries |
+---------------------------+---------------+
| Micronesia/Caribbean      |             1 |
| British Islands           |             2 |
| Baltic Countries          |             3 |
| Antarctica                |             5 |;


-- 3 What is the population for each region?
select region, count(*)
from country;


group by region;

select *
from country
limit 20;


select region, sum(population) as population
from country
group by region
order by population desc;

+---------------------------+------------+
| Region                    | population |
+---------------------------+------------+
| Eastern Asia              | 1507328000 |
| Southern and Central Asia | 1490776000 |
| Southeast Asia            |  518541000 |;


-- 4 What is the population for each continent?

select continent, sum(population) as population
from country
group by continent
order by population desc;

+---------------+------------+
| Continent     | population |
+---------------+------------+
| Asia          | 3705025700 |
| Africa        |  784475000 |
| Europe        |  730074600 |;


-- 5 What is the average life expectancy globally?


+---------------------+
| avg(LifeExpectancy) |
+---------------------+
|            66.48604 |
+---------------------+;

select avg(LifeExpectancy)
from country;

-- 6 What is the average life expectancy for each region, each continent? Sort the results from shortest to longest


+---------------+-----------------+
| Continent     | life_expectancy |
+---------------+-----------------+
| Antarctica    |            NULL |
| Africa        |        52.57193 |
| Asia          |        67.44118 |;

+---------------------------+-----------------+
| Region                    | life_expectancy |
+---------------------------+-----------------+
| Antarctica                |            NULL |
| Micronesia/Caribbean      |            NULL |
| Southern Africa           |        44.82000 |
| Central Africa            |        50.31111 |
| Eastern Africa            |        50.81053 |;

select continent, avg(LifeExpectancy) as life_expt
from country
group by continent
order by life_expt;

select region, avg(LifeExpectancy) as life_expt
from country
group by region
order by life_expt;

-- |||||||||||||||| -- BONUS -- |||||||||||||||||||||||

-- Find all the countries whose local name is different from the official name

select *
from country
limit 20;

select name, localname
from country
where localname <> name;

-- How many countries have a life expectancy less than x?

select continent, region, NAME, LifeExpectancy
from country
where LifeExpectancy < 50
order by LifeExpectancy desc, continent, region, name;

-- What state is city x located in?
select *
from city
limit 15;
select *
from country
limit 20;

    --- this gets the important info, next one gets specific only
select cit.name, cit.countrycode, ct.code, ct.name, ct.region
from city as cit
    join country as ct
    on cit.countrycode = ct.code
where cit.name = 'kabul';

select ct.name
from city as cit
    join country as ct
    on cit.countrycode = ct.code
where cit.name = 'kabul';

-- What region of the world is city x located in?
  -- see above

-- What country (use the human readable name) city x located in?
    -- state seems to be country in this DB, see above
    
    
-- What is the life expectancy in city x?
; 
select cit.name, cit.countrycode, ct.code, ct.name, ct.region, ct.LifeExpectancy
from city as cit
    join country as ct
    on cit.countrycode = ct.code
where cit.name = 'kabul';



-- SAKILA SECTION

-- 1 What is the average replacement cost of a film? Does this change depending on the rating of the film?


+-----------------------+
| AVG(replacement_cost) |
+-----------------------+
|             19.984000 |
+-----------------------+
1 row in set (2.39 sec)

+--------+-----------------------+
| rating | AVG(replacement_cost) |
+--------+-----------------------+
| G      |             20.124831 |
| PG     |             18.959072 |
| PG-13  |             20.402556 |;

--2 How many different films of each genre are in the database?


+-------------+-------+
| name        | count |
+-------------+-------+
| Action      |    64 |
| Animation   |    66 |
| Children    |    60 |
| Classics    |    57 |
| Comedy      |    58 |;


-- 3 What are the 5 frequently rented films?


+---------------------+-------+
| title               | total |
+---------------------+-------+
| BUCKET BROTHERHOOD  |    34 |
| ROCKETEER MOTHER    |    33 |
| GRIT CLOCKWORK      |    32 |;


