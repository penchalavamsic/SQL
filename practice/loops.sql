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

drop procedure if exists t_sal;
drop table sal_val;
-- Calculate total salary of all employees using LOOP
delimiter //
create procedure t_sal()
begin 
	declare sal_t decimal(10,2);
    declare c int default 0;
    declare i int default 0;
    create temporary table sal_val(val decimal(20,2));
    select count(*) into c from employees;
    salaries:loop
        select sum(salary) into sal_t from employees limit i,1;
        insert into sal_val  values(sal_t);
	end loop;
end //
delimiter ;
call t_sal();
select * from sal_val;


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

-- while
-- Display employees having salary greater than ₹30,000
drop procedure if exists g_sal;
drop table details;
delimiter //
create procedure g_sal()
begin
	 declare i int default 0;
     declare c int default 0;
     declare emp_name varchar(20);
     declare emp_sal decimal(20,2);
	create temporary table details(d varchar(30), d_sal decimal(20,2));
	select count(*) into c from employees;
    emp_det: while
    i<=c do
    select name , salary into emp_name, emp_sal from employees limit i, 1;
    if emp_sal>30000 then
		insert into details values(emp_name, emp_sal);
	end if;
    set i=i+1;
end while;
select * from details;
end //
delimiter ;
call g_sal();

-- 
    
    
     
    
 



