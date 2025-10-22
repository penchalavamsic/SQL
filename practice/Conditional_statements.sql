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

-- if elseif else 
delimiter //
create procedure grade(in a int)
begin
	if a>75
		then select 'First class';
	elseif a>65
		then select 'second class';
	else
		select 'third class';
end if;
end //
delimiter ;
call grade(88);



-- case 
delimiter //
create procedure traffic(in a varchar(20))
begin 
	declare color varchar(20);
	case a
		when 'Red' then
			set color='Stop';
		when 'Yellow' then
			set color='Wait';
		when 'Green' then
			set color='Go';
	else 
		set color='Invalid input';
	end case;
select color as output;
end //
delimiter ;
call traffic('Green');
call traffic('Blue');
	