--teachers ordered by surname in each school
SELECT first_name, last_name, school
FROM teachers
ORDER BY school ASC, last_name ASC;

--teacher with name starting with S who earns more that $40 000
SELECT first_name, last_name, salary, school
FROM teachers
WHERE first_name LIKE 'S%'
AND (salary > 40000);

--teachers hired since 2010 highest to lowest paid
SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE hire_date > '2010-01-01'
ORDER BY salary DESC;