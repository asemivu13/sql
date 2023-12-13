use songs;
# id = identity uniquly each record on the table
# create table
create table kpop(
	id int not null primary key,
    song varchar(50) not null,
    singerId int not null
);
create table singer(
	id int not null primary key,
    name varchar(50) not null,
    band varchar(50)
);

create table person(
	id smallint unsigned,
    fname varchar(20),
    lname varchar(20),
    birth_date date,
    constraint pk_person primary key (id)
);

alter table person modify id smallint unsigned auto_increment;
desc person;

# add constraint and give it a name
# we need a forgien key constaint to kpop table to map singerId to singer table
alter table kpop add constraint singerId_fk
foreign key (singerId) references singer(id);