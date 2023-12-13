# unique key constraint
create table lesson7(
	id int not null auto_increment,
    email varchar(255) not null,
    age int,
    primary key (id),
    unique (email)
);

insert into lesson7 (email, age) values ("asem@example.com", 10);

# duplicate entry `asem@example.com` for key `email`
insert into lesson7 (email, age) values ("asem@example.com", 10);

# name a constraint
create table lesson7_b(
	id int not null auto_increment,
    name varchar(255) not null,
    email varchar(255) not null,
    age int,
    primary key (id),
    constraint uc_name_email unique (name, email)
);
insert into lesson7_b (name, email, age) values ("asem", "asem@example.com", 10);
insert into lesson7_b (name, email, age) values ("aran", "asem@example.com", 10);
# duplciate entry for key `uc_name_email`
insert into lesson7_b (name, email, age) values ("aran", "asem@example.com", 10);


# alter a table to add a unique constraint
create table lesson7_c(
	id int not null auto_increment,
    name varchar(255) not null,
    email varchar(255) not null,
    age int,
    primary key (id)
);

alter table lesson7_c
add constraint uc_lesson7_c unique (name, email);

insert into lesson7_c (name, email, age) values ("asem", "asem@example.com", 10);
insert into lesson7_c (name, email, age) values ("aran", "asem@example.com", 10);
# duplciate entry for key `uc_name_email`
insert into lesson7_c (name, email, age) values ("aran", "asem@example.com", 10);

# drop unique constraint
alter table lesson7_c
drop index uc_lesson7_c;

insert into lesson7_c (name, email, age) values ("aran", "asem@example.com", 10);