use classicmodels;

select * from customers;
select * from customers where addressLine2 is null;
select * from customers where addressLine2 = null; -- no results
select * from customers where addressLine2 is not null;

-- how to handle null with aggregation
create table number_tbl(val smallint);
insert into number_tbl values(1);
insert into number_tbl values(3);
insert into number_tbl values(5);

select count(*) num_rows, count(val) num_vals, sum(val) total, max(val) max_val, avg(val) avg_val from number_tbl;
insert into number_tbl values(null);
select count(*) num_rows, count(val) num_vals, sum(val) total, max(val) max_val, avg(val) avg_val from number_tbl;
