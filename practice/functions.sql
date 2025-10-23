use assg2;
delimiter //
create function addition(a int, b int)
returns int deterministic
begin 
	return a+b;
end //
delimiter ;
select addition(5,8);

