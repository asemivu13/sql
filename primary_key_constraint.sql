create table test1(
	id int not null auto_increment,
    name varchar(50),
    primary key (id)
);
create table test2(
	id int not null auto_increment,
    name varchar(50),
    primary key (id)
);

insert into test1 (name) values('x');