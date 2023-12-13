# Add default constaint
select * from kpop;
select * from singer;

insert into singer (id, name) values (1, 'IU');
insert into singer (id, name, band) values (2, 'aran', 'FiftyFifty');

insert into kpop (id, song, singerId) values (1, "Thurogh the night", 1);
insert into kpop (id, song, singerId) values (1, "Cupid", 2);
insert into kpop (id, song) values (2, "Higher");

alter table kpop
alter singerId set default 2;
insert into kpop (id, song) values (3, "Higher");

alter table kpop
alter singerId drop default