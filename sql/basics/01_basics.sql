-- ============================================
-- SQL BASICS REFERENCE - Kavi
-- ============================================

-- SELECT & FROM
SELECT * FROM employees;
SELECT name, salary, department FROM employees;

-- WHERE & filters
SELECT * FROM employees WHERE salary > 50000;
SELECT * FROM employees WHERE department = 'HR' AND salary > 40000;
SELECT * FROM employees WHERE salary BETWEEN 30000 AND 60000;
SELECT * FROM employees WHERE name LIKE 'A%';
SELECT * FROM employees WHERE department IN ('HR', 'IT', 'Finance');

-- ORDER BY & DISTINCT
SELECT DISTINCT department FROM employees;
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY department ASC, salary DESC;

-- AGGREGATE FUNCTIONS
SELECT COUNT(*) FROM employees;
SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary) FROM employees;

-- GROUP BY & HAVING
SELECT department, COUNT(*) AS total, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- JOINS
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;

SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id;

-- SUBQUERIES
SELECT name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- INSERT / UPDATE / DELETE
INSERT INTO employees (name, salary, department) VALUES ('Kavi', 60000, 'IT');
UPDATE employees SET salary = 65000 WHERE name = 'Kavi';
DELETE FROM employees WHERE name = 'Kavi';
