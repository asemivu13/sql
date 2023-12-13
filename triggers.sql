/*
- trigger: stored program invoked automatically in response to an event
such as `insert`, `update`, `delete` that occurs in the associated table
- for example: you can trigger something to happens when a new row is inserted
- 2 type of triggers (sql standard):
1) row level trigger = activated for each row
2) statement level trigger = executed once for each tranaction

- mysql only supports row level triggers
- advantages:
1) provide another way to check the integrity of the data
2) handle errors from the database layer
3) alternative way to run scheduled tasks
- disadvantages:
1) may increase the overhead of mysql server
*/

create table trigger_example (
	id int auto_increment primary key,
    employeeNumber int not null,
    lastname varchar(50) not null,
    changedat datetime default null,
    action varchar(50) default null
);
create table another_trigger_example (
	id int auto_increment primary key,
    name varchar(50) not null
);

create trigger trigger_name_v2
before insert
on trigger_example for each row
insert into another_trigger_example(name) values ("aran");

insert into trigger_example(employeeNumber, lastName, action) 
values (2, "abc", "add");

select * from trigger_example;
select * from another_trigger_example;

/*
create trigger trigger_name
{before|after} {insert|update|delete)
on table_name for each row
[do something = trigger body]
*/

drop trigger if exists trigger_name_v2;

show triggers;