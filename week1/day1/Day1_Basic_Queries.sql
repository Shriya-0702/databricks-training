#1 Select all columns of Employee Table 

select * from Employee;

#2 select name and salary clo from Employee Table

select name, salary from Employee;

#3  Employee older than 30

select name from Employee where age > 30;

#4 select names of all Departments

select name from Department;

#5 Employee working in IT dept

select e.name as Name_Emp
from Employee e
join Department d
on e.department_id = d.department_id
where d.name = 'IT';