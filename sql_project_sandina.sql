SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT first_name, last_name, employee_id, salary
FROM employees
WHERE manager_id = (SELECT employee_id FROM employees WHERE last_name = 'Payam');

SELECT e.department_id, e.first_name, e.last_name, e.job_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT *
FROM employees
WHERE salary >= (SELECT MIN(salary) FROM employees) AND salary <= 2500;

SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IN (40, 80);

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN employees c ON e.department_id = c.department_id
WHERE c.first_name = 'Clara' AND e.employee_id != c.employee_id;


SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees)
AND d.department_id IN (SELECT department_id FROM employees WHERE first_name LIKE '%J%');


SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%z%';


SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;


SELECT e.employee_id, e.first_name, e.last_name, e.job_title
FROM employees e
WHERE e.salary < (SELECT MIN(salary) FROM employees WHERE job_title = 'MK_MAN');


SELECT e.employee_id, e.first_name, e.last_name, e.job_title
FROM employees e
WHERE e.salary > (SELECT MAX(salary) FROM employees WHERE job_title = 'PU_MAN')
AND e.job_title != 'PU_MAN';


SELECT e.employee_id, e.first_name, e.last_name, e.job_title
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);


SELECT first_name, last_name, salary
FROM employees
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 182);


SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;


SELECT d.department_name, l.city, l.state_province
FROM departments d
JOIN locations l ON d.location_id = l.location_id;


SELECT e.*
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees) AND d.department_name LIKE 'IT%';


SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;


SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
WHERE m.manager_id IS NULL;


SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 163);


SELECT e.first_name, e.last_name, e.salary, e.department_id, e.job_id
FROM employees e
WHERE e.job_id = (SELECT job_id FROM employees WHERE employee_id = 169);


SELECT e.first_name, e.last_name, e.department_id
FROM employees e
JOIN employees t ON e.department_id = t.department_id
WHERE t.last_name = 'Taylor';


SELECT d.department_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id;


SELECT employee_id, start_date, end_date, job_id, department_id
FROM job_history
WHERE salary >= 12000;


SELECT e.first_name, e.last_name, e.salary, e.department_id
FROM employees e
WHERE e.salary = (SELECT MIN(salary) FROM employees);


SELECT *
FROM employees
WHERE salary = 3000 AND manager_id = 121;


SELECT e.first_name, e.last_name, e.employee_id, e.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';


SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Russell');

SELECT first_name, last_name
FROM employees
WHERE manager_id IS NULL;


SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


SELECT e.last_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT job_title, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_title;


SELECT e.first_name, e.last_name, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT first_name, last_name
FROM employees
WHERE department_id IS NULL;

SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 10000;


SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 7000;


SELECT first_name, last_name
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');


SELECT e.first_name, e.last_name
FROM employees e
WHERE e.salary > 0.5 * (SELECT SUM(salary) FROM employees WHERE department_id = e.department_id);


SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IN (SELECT manager_id FROM employees);


SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 40);

SELECT d.department_name, d.department_id
FROM departments d
JOIN locations l ON d.location_id = l.location_id
WHERE l.location_id = (SELECT location_id FROM departments WHERE department_id = 30);

SELECT d.department_id, d.department_name, e.first_name, e.last_name
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
WHERE e.first_name = 'Susan';


SELECT d.department_name, l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_id = 'US';


SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE 'S%';

SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 2
ORDER BY COUNT(e.employee_id) DESC;



















