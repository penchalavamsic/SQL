use assg2;
delimiter //
create function addition(a int, b int)
returns int deterministic
begin 
	return a+b;
end //
delimiter ;
select addition(5,8);

-- square of number
delimiter //
create function sq(n int)
returns int deterministic
begin
	return n*n;
end //
delimiter ;
select sq(10);
    
    