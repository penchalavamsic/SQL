show databases;
use assg2;
drop procedure if exists simple_loop
-- loop statement
delimiter //
create procedure simple_loop()
begin
	declare n int;
    set n=0;
	s_loop:loop
		set n=n+1;
        
		if n=5 then
        leave s_loop;
        end if;
	end loop s_loop;
    select n;
    end //
    delimiter ;
    call simple_loop();
   drop procedure if exists even;  
-- printing even numbers
create table temp (nums int);
delimiter //
create procedure even()
begin
	declare n int;
    set n=0;
    loops:loop
		set n=n+2;
        insert into temp values(n);
        if n=10 then
			leave loops;
        end if;
	end loop loops;
	
    end //
    delimiter ;
call even();
select * from temp;
drop procedure if exists numbers;
-- while statements
-- printing 10 numbers
create table sample (nums int);
delimiter //
create procedure numbers()
begin
	declare n int;
    set n=0;
 nos:while
 n<=10 do
	insert into sample values (n);
    set n=n+1;
    end while nos;
end //
delimiter ;
call numbers();
select * from sample;
		