-- example 1:

drop procedure if exists HelloWorld$$
delimiter $$
create procedure HelloWorld()
begin
	select 'Hello World';
end$$
delimiter ;
call HelloWorld();


-- declare example
drop procedure if exists variable_demo
delimiter $$
create procedure variable_demo()
begin
    declare my_int int;
    declare my_big_int bigint;
    declare my_currency numeric(8, 2);
    declare my_pi float default 3.14;
    declare my_varchar varchar(30) default 'hello world';
    
    set my_int = 20;
    set my_big_int = power(my_int, 3);
end$$
delimiter ;


-- with parameter example
drop procedure if exists my_sqrt
delimiter $$
create procedure my_sqrt(inp_num int)
begin
	declare l_sqrt float;
    set l_sqrt = sqrt(inp_num);
    select l_sqrt;
end$$
delimiter ;

call my_sqrt(100)

-- out parameter example
drop procedure if exists my_sqrt
delimiter $$
create procedure my_sqrt(inp_number int, out out_number float)
begin
	set out_number = sqrt(inp_number);
end$$
delimiter ;

set @x = 0;
call my_sqrt(100, @x);
select @x;

call my_sqrt(100, @out_value);
select @out_value;

-- conditional execution example
drop procedure if exists discounted_price;
delimiter $$
create procedure discounted_price(
	in normal_price numeric(8, 2),
    out discount_price numeric(8, 2)
)
begin
	if (normal_price > 500) then
		set discount_price = normal_price * 0.8;
	elseif (normal_price > 100) then
		set discount_price = normal_price * 0.9;
	else
		set discount_price = normal_price;
	end if;
end$$
delimiter ;

call discounted_price(10, @x);
select @x;

-- simple loop
drop procedure if exists simple_loop
delimiter $$
create procedure simple_loop()
begin
	declare counter int default 0;
    
    my_simple_loop_label: loop
		set counter=counter + 1;
        if counter = 10 then
			leave my_simple_loop_label;
		end if;
    end loop my_simple_loop_label;
	select 'I can count to 10';
    select counter;
end$$
delimiter ;

call simple_loop();

-- select into
drop procedure if exists select_into;
delimiter $$
create procedure select_into()
begin
	declare total numeric(8, 2);
    
    select count(*) into total from trans;
	select total;
end$$
delimiter ;

call select_into();

-- cursor
drop procedure if exists cursor_example
delimiter $$
create procedure cursor_example()
	reads sql data
begin
	declare a int;
    declare b varchar(255);
	declare done int default 0;
	declare cursor1 cursor for select * from trans;
    declare continue handler for not found set done=1;
    open cursor1;
    loop_label: loop
		fetch cursor1 into a, b;
        if done = 1 then
			leave loop_label;
		end if;
    end loop;
    close cursor1;
    select a, b;
end$$
delimiter ;

call cursor_example();

-- set example
set @a = 10, @c = 100, @d = 1000;
select @a, @c, @d;

-- leave to exit a labeled block
delimiter $$
create procedure nested_block()
outer_block: begin
	declare l_status int;
    set l_status = 1;
    inner_block: begin
		if (l_status = 1) then
			leave inner_block;
        end if;
        select 'This will never be executed';
    end inner_block;
    select 'End of program';
end outer_block$$

call nested_block();

-- select into
drop procedure if exists get_customer_details;
delimiter $$
create procedure get_customer_details()
begin
	declare p_id int;
    declare p_username varchar(30);
    
    select id, username into p_id, p_username from trans where id=1;
    select p_id, p_username;
end$$
delimiter ;

call get_customer_details();


