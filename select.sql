use classicmodels;
select * from customers;
select customerNumber from customers;

-- select distinct rows (applied on multiple key)
-- meaining when we do distinct city, country we are applying it on 2
select country from customers; # before apply distinct
select distinct country from customers; # after apply distinct to the country

-- where
select * from customers where city="london";
select * from customers where city <> "london";
select * from customers where city != "london";

select * from customers where customerNumber = 103 or customerNumber = 112;
select * from customers where customerNumber in (103, 112);
select * from customers where city in ('london', 'paris');
select * from customers where city not in ('london', 'paris');
select * from customers where customerNumber between 100 and 150; -- upper and lower limit are inclusive (values are included in the range limit)
select * from orders where orderDate between '2004-06-11' and '2005-06-20'
select * from customers where city like 'l%';
select * from customers where city='london' or city='lile';

-- sorting
select * from customers order by customerName;
select * from customers order by customerName desc;
select * from customers order by customerName desc, city asc;
select customerNumber, customerName from customers order by city asc;
select customerNumber, customerName from customers order by 2; -- will order based on customerName (which is the second column)

-- select top of
select * from customers limit 10;

-- limit
select * from customers limit 10;
select * from customers limit 0, 0;
select * from customers limit 0, 1;
select * from customers limit 0, 2;
select * from customers limit 1, 2;

select customerName, creditLimit from customers order by creditLimit desc limit 1;

-- customize the select with literal expression, built-in function
select
	upper(customerName) CUSTOMER_NAME,
	'aran' row_not_existed,
    creditLimit * -1 the_value
from customers limit 10;

-- select with a built in function
select version(), user(), database();