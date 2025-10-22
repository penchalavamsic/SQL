show databases;
use assg2;
-- conditional statements 
-- if 

delimiter //
create procedure age(in a int)
begin
 if a>=18
	then 
		select 'Eligible to vote';
end if;
end //
delimiter ;
call age(23);