-- 3.8.3_subqueries_exercises.sql

-- 1 Find all the employees with the same hire date as employee 101010 using a sub-query.69 Rows



-- 2 Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles



-- 3 How many people in the employees table are no longer working for the company?




-- 4 Find all the current department managers that are female.
  -- 4 example to match
  +------------+------------+
| first_name | last_name  |
+------------+------------+
| Isamu      | Legleitner |
| Karsten    | Sigstam    |
| Leon       | DasSarma   |
| Hilary     | Kambil     |
+------------+------------+;


-- 5 Find all the employees that currently have a higher than average salary. 154543 rows in total. Here is what the first 5 rows will look like:

-- 5 example to match
+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Georgi     | Facello   | 88958  |
| Bezalel    | Simmel    | 72527  |
| Chirstian  | Koblick   | 74057  |;

-- 6 How many current salaries are within 1 standard deviation of the highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

78 salaries;

