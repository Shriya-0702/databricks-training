# 📅 Week 1 - Day 1 | SQL Practice

## 📌 Overview
Today I practiced basic SQL queries including column selection, filtering, and joins.

---

## 💻 SQL Queries

```sql
-- 1. 1. Select all employees
SELECT * FROM Employee;


-- 2. Select name and salary from Employee
SELECT name, salary 
FROM Employee;

-- 3. Employees older than 30
SELECT name 
FROM Employee 
WHERE age > 30;

-- 4. Select all department names
SELECT name 
FROM Department;

-- 5. Employees working in IT department
SELECT e.name AS Name_Emp
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'IT';

### 1. Select all employees
```sql
SELECT * FROM Employee; sql

