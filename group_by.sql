# order of operations:
# FROM + JOIN ---> WHERE ---> GROUP BY ---> HAVING ---> SELECT ---> ORDER BY ---> LIMIT

use classicmodels;

select sum(quantityInStock) from products; # total quantity in stock
select min(quantityInStock) from products;
select max(quantityInStock) from products;

select * from products;

select productLine, sum(quantityInStock), sum(buyPrice), avg(buyPrice)
from products;

select productLine, sum(quantityInStock), sum(buyPrice), avg(buyPrice)
from products # 1
group by productLine; # 2


# grouping by multiple columns
-- example to see this more
select * from products where productVendor LIKE 'Carousel%' and productLine = 'Classic Cars';
select sum(quantityInStock) from products where productVendor LIKE 'Carousel%' and productLine = 'Classic Cars';
select productLine, productVendor, sum(quantityInStock)
from products
group by productLine, productVendor;

# you can group first by productVendor and then by the productLine which you will get the same result in this case
select sum(quantityInStock) from products where productVendor LIKE 'Carousel%' and productLine = 'Classic Cars';
select productLine, productVendor, sum(quantityInStock)
from products
group by productVendor, productLine;

select count(*) from products;
-- for performance reasons better not to use *
select count(productCode) from products;

# group by and aggreation
select productLine, productVendor, sum(quantityInStock) as TotalQuantityInStock, count(productCode) as "Total Product"
from products
group by productVendor, productLine;

# filter the group
select productLine, productVendor, sum(quantityInStock) as TotalQuantityInStock, count(productCode) as "Total Product"
from products
group by productVendor, productLine # group -> filter
having productVendor="Unimax Art Galleries";

select productLine, productVendor, sum(quantityInStock) as TotalQuantityInStock, count(productCode) as "Total Product"
from products
where productVendor="Unimax Art Galleries" # filter -> group
group by productVendor, productLine;

# where vs having
select productLine, productVendor, sum(quantityInStock) as TotalQuantityInStock, count(productCode) as "Total Product"
from products
where productVendor="Unimax Art Galleries" and sum(quantityInStock) > 4000 # error = can't use aggreation in where because the group happen after where - use having
group by productVendor, productLine;

select productLine, productVendor, sum(quantityInStock) as TotalQuantityInStock, count(productCode) as "Total Product"
from products
group by productVendor, productLine
having productVendor="Unimax Art Galleries" and sum(quantityInStock) > 4000;

# error = from customers -> where -> group -> select
select sum(creditLimit), count(*)
from customers
where count(*) > 3
group by country;

# good = from customers -> group -> having -> select
select sum(creditLimit), count(*)
from customers
group by country
having count(*) > 3;


# error = from customers -> where -> group -> select
select sum(creditLimit), count(*)
from customers
where sum(creditLimit) > 500000
group by country;

# good = from customers -> group -> having -> select
select sum(creditLimit), count(*)
from customers
group by country
having sum(creditLimit) > 500000;
