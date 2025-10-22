show databases;
use assg2;

-- stored procedures
delimiter $$
create procedure hi()
begin
	select 'Hi, How are you';
end $$
delimiter ;
call hi();
-- IN parameter
delimiter $$
create procedure Greeting(in name varchar(10))
begin 
	select concat('Hi',name ,'!') as GreetingMsg;
end $$
delimiter ;
call Greeting('Vamsi');
-- sum of two numbers
delimiter $$
create procedure sumOf(in a int, in b int)
begin 
	select a+b;
end $$
delimiter ;
call sumOf(5,10);

-- out parameter


