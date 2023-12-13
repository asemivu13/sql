delimiter $$
create procedure p1()
begin
	select 'hello world';
end$$
delimiter ;
call p1();

delimiter $$
create function f1()
returns varchar(20)
deterministic
begin
	return ("hello world");
end$$
delimiter ;

select f1();

-- the difference between stored procedure and function
insert into trans(username) values("hello world");
select * from trans where username = f1();
select * from trans where username = p1();
select * from trans where username = call p1();

show engines;
