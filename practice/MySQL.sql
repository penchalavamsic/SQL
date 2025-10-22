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

-- out parameter, session variable @
delimiter $$
create procedure multiple(in a int, out result int)
begin 
set result=a*a;
end $$
delimiter ;
call multiple(5, @out);
select @out;

-- inout parameter
delimiter $$
create procedure doubleval(inout a int)
begin
 set a=a*2;
end $$
delimiter ;
set @a=10;
call doubleval(@a);
select @a;
 



