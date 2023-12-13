use `classicmodels`;

/*
- when you create a table with a primary key or unique key
mysql automatically creates a special index named `PRIMARY` -> this is called `clustered index`
- clustered index = the index itself is stored together with the data in the same table
- clustered index = enforce the order of rows in the table
- other indexes other than `PRIMARY` index are called seconday indexes or non-clustered indexes
where the data is stored in one place and the index is in another place

*/

select * from customers where contactFirstName="Julie" and contactLastName="Young";
show indexes from customers;

create index contactFirstName on customers(contactFirstName);
create index contactFirstLastName on customers(contactFirstName, contactLastName);
drop index contactFirstName on customers;

/*
unique index = enforce uniqueness of key values in the index
*/

create table if not exists index_test(
	id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    phone varchar(15) not null,
    email varchar(100) not null
);

create unique index email_index on index_test(email);
insert into index_test(first_name, last_name, phone, email) values ("asem", "asem", "12345", "asem@example.com");

insert into index_test(first_name, last_name, phone, email)
values ("aran", "asem", "12345", "aran@example.com"); # error: unique on email

create unique index first_name on index_test(first_name); # duplicate exists so this will not work if we already have data

select * from index_test;

insert into index_test(first_name, last_name, phone, email)
values ("man", "asem", "12345", "sio@example.com");

show indexes from index_test;

create unique index last_name on index_test(last_name); # duplicate exists so this will not work if we already have data - error

# example 2
create table if not exists index_test_v2(
	id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    phone varchar(15) not null,
    email varchar(100) not null,
    unique key unique_email (email)
);
insert into index_test_v2(first_name, last_name, phone, email)
values ("man", "asem", "12345", "sio@example.com");

insert into index_test_v2(first_name, last_name, phone, email)
values ("man", "asem", "12345", "sio@example.com"); # error == duplicate email

alter table index_test_v2
add constraint unique_first_name unique key(first_name);

insert into index_test_v2(first_name, last_name, phone, email)
values ("man", "asem", "12345", "siov2@example.com"); # error == duplicate first name

select * from index_test_v2;

insert into index_test_v2(first_name, last_name, phone, email)
values ("manv2", "asem", "12345", "siov2@example.com");

select * from index_test_v2; # we have 2 with the same last_name

alter table index_test_v2
add constraint unique_last_name unique key(last_name); # error = duplicate exists

show indexes from index_test_v2; # unique constraint = unique index




