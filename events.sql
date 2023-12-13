/*
- mysql events = tasks that executes according to a
`specific schedule` = scheduled events
1) event that optimize all tables in the database that runs at 1:00 am every sunday
- events = cronjob
*/

show processlist;

create table test_event(
	id int primary key auto_increment,
    message varchar(200) not null
);

create event if not exists test_event_01
on schedule at current_timestamp
do
	insert into test_event(message) values ("test 1"); # will not work if event_schedular is off

set global event_scheduler = off;

create event if not exists test_event_02
on schedule at current_timestamp + interval 1 minute
do
	insert into test_event(message) values ("test 2"); # will not work if event_schedular is off
