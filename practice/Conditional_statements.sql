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

-- if else
delimiter //
create procedure quality(in a int)
begin
	if a>75
		then
			select 'good quality';
	else
		select 'bad quality';
end if;
end //
delimiter ;
call quality(76);