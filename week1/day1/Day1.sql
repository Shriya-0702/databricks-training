CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO Department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employee VALUES
(101, 'John Doe', 28, 50000, '2020-01-15', 2),
(102, 'Jane Smith', 32, 65000, '2018-03-20', 1),
(103, 'Robert Brown', 45, 80000, '2015-07-10', 3),
(104, 'Emily Davis', 26, 48000, '2021-11-05', 2),
(105, 'Michael Wilson', 39, 72000, '2017-06-18', 4),
(106, 'Sophia Taylor', 30, 55000, '2019-09-25', 1),
(107, 'Daniel Thomas', 41, 90000, '2014-12-12', 3),
(108, 'Olivia Martin', 29, 60000, '2022-02-14', 2);

INSERT INTO Project VALUES
(201, 'Payroll System', 1),
(202, 'Website Development', 2),
(203, 'Banking Software', 3),
(204, 'Ad Campaign', 4),
(205, 'Cloud Migration', 2);



-- 1
SELECT * FROM Employee;

-- 2
SELECT name, salary FROM Employee;

-- 3
SELECT * FROM Employee
WHERE age > 30;

-- 4
SELECT name FROM Department;

-- 5
SELECT e.*
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE d.name = 'IT';

-- 6
SELECT * FROM Employee
WHERE name LIKE 'J%';

-- 7
SELECT * FROM Employee
WHERE name LIKE '%e';

-- 8
SELECT * FROM Employee
WHERE name LIKE '%a%';

-- 9
SELECT * FROM Employee
WHERE LENGTH(name) = 9;

-- 10
SELECT * FROM Employee
WHERE name LIKE '_o%';

-- 11
SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 12
SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

-- 13
SELECT * FROM Employee
WHERE hire_date < '2019-01-01';

-- 14
SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

-- 15
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 16
SELECT SUM(salary) AS total_salary
FROM Employee;

-- 17
SELECT AVG(salary) AS average_salary
FROM Employee;

-- 18
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- 19
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- 20
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

-- 21
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- 22
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

-- 23
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employees_hired
FROM Employee
GROUP BY YEAR(hire_date);

-- 24
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- 25
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- 26
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- 29
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- 30
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- 31
SELECT * FROM Employee
ORDER BY salary ASC;

-- 32
SELECT * FROM Employee
ORDER BY age DESC;

-- 33
SELECT * FROM Employee
ORDER BY hire_date ASC;

-- 34
SELECT * FROM Employee
ORDER BY department_id ASC, salary ASC;

-- 35
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;

-- 36
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id;

-- 37
SELECT p.name AS project_name, d.name AS department_name
FROM Project p
JOIN Department d ON p.department_id = d.department_id;

-- 38
SELECT e.name AS employee_name, p.name AS project_name
FROM Employee e
JOIN Project p ON e.department_id = p.department_id;

-- 39
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d ON e.department_id = d.department_id;

-- 40
SELECT d.name AS department_name, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id;

-- 41
SELECT e.name
FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

-- 42
SELECT e.name, COUNT(p.project_id) AS project_count
FROM Employee e
JOIN Project p ON e.department_id = p.department_id
GROUP BY e.name;

-- 43
SELECT d.name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44
SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
);

-- 45
SELECT d.name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
GROUP BY d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;

-- 46
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary) FROM Employee
);

-- 47
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary) FROM Employee
);

-- 48
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary) FROM Employee
);

-- 49
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

-- 50
SELECT *
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 51
SELECT DISTINCT salary
FROM Employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT salary)
    FROM Employee e2
    WHERE e2.salary >= e1.salary
);

-- 52
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = (
        SELECT department_id
        FROM Department
        WHERE name = 'HR'
    )
);

-- 53
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 54
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(*) >= 2
);

-- 55
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);

-- 56
SELECT SUM(salary) AS total_salary_2020
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 57
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC;

-- 58
SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1 AND AVG(salary) > 55000;

-- 59
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date DESC;

-- 60
SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 61
SELECT name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 62
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM Employee
);

-- 63
SELECT d.name AS department_name, COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY total_projects DESC;

-- 64
SELECT d.name AS department_name, e.name AS employee_name, e.salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE (e.department_id, e.salary) IN (
    SELECT department_id, MAX(salary)
    FROM Employee
    GROUP BY department_id
);

-- 65
SELECT name, salary, age, department_id
FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);

