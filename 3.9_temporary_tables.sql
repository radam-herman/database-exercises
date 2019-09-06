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
