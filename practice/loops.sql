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

drop procedure if exists inc_sal;
drop table t;

-- Increase salary of first 3 employees by 10%.

delimiter //
create procedure inc_sal()
begin
declare i int default 0;
declare emp_id int;
declare emp_name varchar(20);
declare emp_sal decimal(10,2);
declare done int default 0;
declare counter int default 0;
declare continue handler for not found set done=1;
create temporary table t(result varchar(100));
loop_sal:loop
	if counter >=3 or done =1 then
		leave loop_sal;
	end if;
		select id, name, salary into emp_id, emp_name, emp_sal from employees order by id limit counter, 1;
        set emp_sal=emp_sal*1.1;
        update employees set salary =emp_sal where id=emp_id;
        insert into t values(concat('Employee ', emp_name,'Salary ',emp_sal));
        set counter=counter+1;
	end loop loop_sal;
    select * from t;
end //
    delimiter ;
call inc_sal();



-- Display all employee names using LOOP
drop procedure if exists all_emp;
drop table na;
delimiter $$
create procedure all_emp()
begin 
 declare n varchar(20);
 declare total int;
 declare c int default 0;
 create temporary table na(result varchar(20));
 select count(*) into total from employees;
 n_loop:loop
	if c>=total then
		leave n_loop;
	end if;
	select name into n from employees order by name limit c, 1;
    insert into na values(n);
    set c=c+1;
end loop n_loop;
select * from na;
end $$
delimiter ;
call all_emp();
 



