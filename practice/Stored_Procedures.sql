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

