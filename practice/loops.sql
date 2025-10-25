CREATE DATABASE loop_lab_db;
USE loop_lab_db;
CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(30),
salary DECIMAL(10,2)
);
INSERT INTO employees (name, department, salary) VALUES
('Anita', 'HR', 25000),
('Bhavesh', 'IT', 32000),
('Chitra', 'Finance', 28000),
('Deepak', 'IT', 40000),
('Esha', 'HR', 35000),
('Farhan', 'Finance', 30000);

-- Increase salary of first 3 employees by 10%.
delimiter //
create procedure inc_sal()
begin
declare emp_sal decimal(10,2);
 sal:loop
	select salary into emp_sal from employees limit 3;
    set emp_sal=emp_sal*0.9;
    select emp_sal;
    end loop;
end //
delimiter ;
call inc_sal();

