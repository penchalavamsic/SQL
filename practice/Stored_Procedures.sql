create database storedProcedures;
use storedProcedures;

-- schema code
CREATE TABLE employees (
emp_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
salary DECIMAL(10,2),
department VARCHAR(30)
);
CREATE TABLE departments (
dept_id INT AUTO_INCREMENT PRIMARY KEY,
dept_name VARCHAR(30),
location VARCHAR(30)
);
INSERT INTO employees (name, salary, department)
VALUES ('Alice', 50000, 'HR'),
('Bob', 60000, 'IT'),
('Charlie', 70000, 'Finance');
INSERT INTO departments (dept_name, location)
VALUES ('HR', 'Hyderabad'),
('IT', 'Bangalore'),
('Finance', 'Delhi');

-- deleting procedure
DROP PROCEDURE IF EXISTS resetSal;
-- operations
-- Create a procedure to reset all employee salaries to 50000
delimiter $$
create procedure resetSal()
begin
	SET SQL_SAFE_UPDATES = 0; -- disabling safe updates
 update employees set salary=50000;
 select name , salary from employees;
 end $$
delimiter ;
call resetSal();



-- 2. Create a procedure to delete all employees in the HR department.
delimiter $$
create procedure deleHR()
begin 
	set sql_safe_updates=0;
	delete employees from employees where department='HR';
    select * from employees;
end $$
delimiter ;
call deleHR();

-- 3.Create a procedure to increase all employee salaries by 5%
delimiter $$
create procedure inc_sal()
begin
set sql_safe_updates=0;
update employees set salary=salary*1.05;
select * from employees;
end $$
delimiter ;
call inc_sal();

-- 4. Create a procedure to insert a new employee (IN parameters)
delimiter $$
create procedure new_emp(
	in emp_n varchar(20),
    in emp_sal int,
    in emp_dep varchar(20))
begin
	set sql_safe_updates=0;
	insert into employees(name, salary, department)
    values(emp_n, emp_sal, emp_dep);
    select * from employees;
end $$
delimiter ;
call new_emp('Hari', 30000, 'IT');

-- 5.Create a procedure to insert a new department (IN parameters)
delimiter $$
create procedure new_dep(
in depart varchar(10))
begin
	set sql_safe_updates=0;
	 insert into employees(department) values(depart);
	select * from employees;
end $$
delimiter ;

call new_dep('Sales');

-- 6. Create a procedure to delete an employee by name (IN parameter)
delimiter $$
create procedure del_emp(in ename varchar(20))
begin 
	set sql_safe_updates=0;
 delete employees from employees where name=ename;
	select * from employees;
end $$
delimiter ;
call del_emp('Bob');

-- 7. Create a procedure to change an employee’s department (IN parameters).
delimiter $$
create procedure emp_dep(in dep varchar(20))
begin
 set sql_safe_updates=0;
 update employees set department='IT' where department=dep;
 select *from employees;
 end $$
 delimiter ;
 call emp_dep('Sales');
 
 -- 8. Create a procedure to get the highest salary (OUT parameter).
 delimiter //
 create procedure highest(out a int)
 begin
	select max(salary) into a from employees;
end //
delimiter ;
call highest(@a);
select @a as highest_salary;

-- 9.Create a procedure to get average salary (OUT parameter). 
delimiter //
create procedure avg_sal(out a decimal(15,2))
begin
	select avg(salary) into a from employees;
end //
delimiter ;
call avg_sal(@a);
select @a as avg_salary;

-- 10.Create a procedure to get department count (OUT parameter).
 delimiter //
 create procedure dep_count(out a int)
 begin 
	select count(*)department into a from employees;
end //
delimiter ;
call dep_count(@a);
select @a as depart_count;

-- 11. Create a procedure to get an employee’s name by ID (IN and OUT parameter).
delimiter //
create procedure emp_name(in i int, out n varchar(20))
begin
	select name  into n from employees where emp_id=i;
end //
delimiter ;
call emp_name(3, @n);
select @n as Name_emp;

-- 12. Create a procedure to increase salary of an employee by a given percentage (IN
-- parameters).

delimiter //
create procedure sal_inc(in n varchar(20), in per decimal(10,2))
begin
	set sql_safe_updates=0;
 update employees set salary=(salary*per) where name=n;
 select * from employees;
 end //
 delimiter ;
 call sal_inc('charlie', 2.05);
 
 -- 13. Create a procedure to add a bonus to an employee and return updated salary
-- (INOUT parameter).
delimiter //
create procedure bonus(inout a int, inout n varchar(20))
begin
 set sql_safe_updates=0;
 update employees set salary=salary+a where name=n;
 select * from employees;
 end //
 delimiter ;
 set @a=1000;
 set @n='charlie';
 call bonus(@a, @n);
 select @a, @n;
 select * from employees;
 
 
 



