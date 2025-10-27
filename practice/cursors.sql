-- cursors
use assg2;
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Mouse', 25.50),
('Keyboard', 45.00),
('Monitor', 300.00),
('Headphones', 75.00);

-- simple cursor 
delimiter //
create procedure p_data()
begin
 declare product varchar(20);
 declare done int default 0;
 declare order_of cursor for select name from products;
 
 declare continue handler for not found set done=1;
open order_of;
read_loop:loop
	fetch order_of into product;
    if done=1 then
    leave read_loop;
    end if;
    select product;
end loop;
close order_of;
end //
delimiter ;
call p_data();


--  Fetch all product names from the products table using a cursor and display them.
drop procedure if exists name_p;
drop table n;
delimiter //
create temporary table n(result varchar(20));
create procedure name_p()

begin
	declare p_names varchar(20);
    declare done int default false;
    declare cursor_n cursor for select name from products;
    declare continue handler for not found set done =true;
    open cursor_n;
    read_loop:loop
		fetch cursor_n into p_names;
		insert into n values(p_names);
        if done then
			leave read_loop;
		end if;
	end loop;
    close cursor_n;
    end //
delimiter ;

call name_p();
select * from n;

    

 
