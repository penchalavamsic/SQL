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
        
        
		