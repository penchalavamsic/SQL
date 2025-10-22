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
