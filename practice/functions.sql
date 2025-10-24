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

CREATE DATABASE bookstore;
USE bookstore;
CREATE TABLE authors ( author_id INT AUTO_INCREMENT PRIMARY KEY,
author_name VARCHAR(50), country VARCHAR(30) );
CREATE TABLE books ( book_id INT AUTO_INCREMENT PRIMARY KEY, title
VARCHAR(100), author_id INT, price DECIMAL(10,2), stock INT, published_year INT,
FOREIGN KEY (author_id) REFERENCES authors(author_id) );
INSERT INTO authors (author_name, country) VALUES ('Chetan Bhagat', 'India'), ('J.K.
Rowling', 'UK'), ('George R.R. Martin', 'USA'), ('R.K. Narayan', 'India'), ('Agatha
Christie', 'UK');
INSERT INTO books (title, author_id, price, stock, published_year) VALUES ('Five
Point Someone', 1, 250, 10, 2004), ('2 States', 1, 300, 5, 2009), ('Harry Potter', 2, 800, 15,
1997), ('Game of Thrones', 3, 1200, 8, 1996), ('Malgudi Days', 4, 200, 12, 1943), ('Murder
on the Orient Express', 5, 500, 6, 1934);

-- Write a function to return the total number of books in stock.

delimiter //
create function total_b()
returns int deterministic
begin
 declare t_books int;
 select sum(stock) into t_books from books;
 return t_books;
 end //
 delimiter ;
 select total_b();
 
 drop function price;
 
 -- Write a function to return the price of a given book title.
 delimiter //
 create function price(b_name varchar(20))
 returns decimal(10,2) deterministic
 begin 
	declare b_price decimal(10,2);
    select b.price into b_price  from books as b  where b.title=b_name;
    return b_price;
end //
delimiter ;
select price('Harry Potter');

-- Write a function to find how many books an author has written.
delimiter //
create function a_books(a_id int)
returns int deterministic
begin 
	declare n_book int;
    select count(*) into n_book from books where author_id=a_id;
    return n_book;
end //
delimiter ;
select a_books(1) as No_Of_books;

-- 
    
	
	
	


    