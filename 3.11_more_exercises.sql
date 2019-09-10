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
use sakila;
Sakila Database
;
show tables;
actor
actor_info
address
category
city
country
customer
customer_list
film
film_actor
film_category
film_list
film_text
inventory
language
nicer_but_slower_film_list
payment
rental
sales_by_film_category
sales_by_store
staff
staff_list
store


1 Display the first and last names in all lowercase of all the actors.;

describe actor;

select lower (
            concat(
                    first_name, ' ', last_name
                  ) as full_name
             )
from actor
limit 20;

use sakila;
select concat(lower(first_name), ' ', lower(last_name)) as full_name
from actor
limit 20;
   --- cant seem to use only one LOWER 

use employees;
select
    lower(
        concat (
            substr(first_name, 1, 1),
            substr(last_name, 1, 4),
            "_",
            substr(birth_date, -5, 2),
            substr(birth_date, 3, 2)
              )
     ) as username, first_name, last_name, birth_date
from `employees`
limit 5;

2 You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?

ID fn LN of `actor`

;
describe actor;

select actor_id, first_name, `last_name`
from actor
where first_name = 'Joe';


3 Find all actors whose last name contain the letters "gen":
;

select *
from actor;
select actor_id, first_name, last_name
from actor
where last_name like '%gen%';


4 Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
;
select actor_id, first_name, last_name
from actor
where last_name like '%li%'
order by last_name, first_name;

5 Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
;
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh','China');

6 List the last names of all the actors, as well as how many actors have that last name.
;
select last_name, count(*)
from actor
group by last_name
order by count(*) desc;

7 List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
;
select last_name, count(*)
from actor
group by last_name
having count(*) > 1
order by count(*) desc;


8 You cannot locate the schema of the address table. Which query would you use to re-create it?
;
   -- create  table - but how would you know the specifics???

9 Use JOIN to display the first and last names, as well as the address, of each staff member.
;
describe staff;
select *
from staff;
limit 15;
     address_id ;
describe address;
select *
from address
limit 15;
     address;
     
     
 select s.address_id, s.first_name, s.last_name, a.address
 from staff as s
     join address as a
     on s.address_id = a.address_id;
    
 
select *
from staff_list;

use sakila;

10 Use JOIN to display the total amount rung up by each staff member in August of 2005.
;
select sl.name, p.amount
from staff_list as sl
     join payment as p
     on sl.id = p.staff_id;
  -- 10 solution   
select sl.name, count(p.amount)
from payment as p
     join staff_list as sl
     on p.staff_id = sl.id
where p.payment_date like '2005-08-%'
group by sl.name
order by count(p.amount);


describe sales_by_store;
select * 
from sales_by_store;

select *
from rental;

select *
from payment
limit 5;
describe payment;

payment_id	smallint(5) unsigned	NO	PRI	NULL	auto_increment
customer_id	smallint(5) unsigned	NO	MUL	NULL	
staff_id	tinyint(3) unsigned	NO	MUL	NULL	
rental_id	int(11)	YES	MUL	NULL	
amount	decimal(5,2)	NO		NULL	
payment_date	datetime	NO		NULL	
last_update	timestamp	NO		CURRENT_TIMESTAMP	on update CURRENT_TIMESTAMP;
1	1	1	76	2.99	2005-05-25 11:30:37	2006-02-15 22:12:30
2	1	1	573	0.99	2005-05-28 10:35:23	2006-02-15 22:12:30
3	1	1	1185	5.99	2005-06-15 00:54:12	2006-02-15 22:12:30
4	1	2	1422	0.99	2005-06-15 18:02:53	2006-02-15 22:12:30
5	1	2	1476	9.99	2005-06-15 21:08:46	2006-02-15 22:12:30;




11 List each film and the number of actors who are listed for that film.
;
select *
from film_actor;  -- actor_id, film_id, last_update
;
select *
from film;   -- film_id, title
;
select *
from actor;   -- actor_id
;
select f.title, count(fa.actor_id) as actor_count
from film as f
    join film_actor as fa
    on f.film_id = fa.film_id
group by f.title
order by actor_count desc;


12 How many copies of the film Hunchback Impossible exist in the inventory system?
;
select count(film_id)
from inventory
where film_id in (
          select film_id
          from film
          where title like 'Hunchback Impossible'
    );
        
;
select count(film_id)
from inventory
where film_id = '439';
  -- inventory_id, film_id,
;
select *
from film
where title like 'Hunchback Impossible';  -- fil_id

13 The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
;
select *
from film;

select *
from language;

select title
from film 
where language_id in(
    select language_id
    from language
    where language_id = '1'
    )
group by title
having title like 'K%' or title like 'Q%';

use sakila;

14 Use subqueries to display all actors who appear in the film Alone Trip.
;
select *
from film_actor;

select *
from actor;

select *
from film;


select actor.first_name, actor.last_name
from actor;

where actor_id in (
      select actor_id
      from film_actor
      where film_id (
             select 
          
      )

)
;

select f.title, count(fa.actor_id) as actor_count
from film as f
    join film_actor as fa
    on f.film_id = fa.film_id
    where 
group by f.title;


15 You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
16 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
17 Write a query to display how much business, in dollars, each store brought in.
18 Write a query to display for each store its store ID, city, and country.
19 List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)




-- ||||||||||||||||||||||||

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


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  -- select
select *
from actor;
select last_name
from actor;
???;
  -- distinct ||||||||||||||||||||||

select distinct last_name
from actor;
  describe address;
select distinct postal_code
from address;
  describe film;
select distinct rating
from film;
  -- where ||||||||||||||||||||||
select title, description, rating, length
from film
where length > 180;
    describe payment;
    select *
    from payment
    limit 3;
select payment_id, amount, payment_date
from payment
where payment_date >= '2005-05-27%';
select payment_id, amount, payment_date
from payment
where payment_date like '2005-05-27%';
select *
from customer
where last_name like 'S%' and first_name like '%N';
select *
from customer
where last_name like 'M%' or active = '0';
  -- f
;
  -- in. ||||||||||||||||||||||||||||||||||
select phone, district
from address
where district in ('California', 'England', 'Taipei', 'West Java');
  -- b
;
-- between ||||||||||||||||||||||
select *
from payment
where payment_date between '2005-05-25 00:00:01' and '2005-05-26 23:59:59';
-- b
;

-- like |||||||||||||||||||||||||
;
select *
from film
where description like 'A Thoughtful%';
-- b
;

-- limit ||||||||||||||
;
select *
from payment
limit 20;
-- b
-- c
;
select *
from customer
limit 100, 100;

-- order by
;




