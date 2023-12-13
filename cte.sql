use classicmodels;
# CTE

# the customer name and where they live
select customerName, state from customers where country='USA';

with customers_in_usa AS (select customerName, state from customers where country='USA')
select customerName from customers_in_usa where state = 'CA' order by customerName;

# example 2::

select * from orders;
select * from orderdetails;
select * from customers;

select salesRepEmployeeNumber, sum(quantityOrdered * priceEach) from orders
inner join orderdetails using (orderNumber)
inner join customers using (customerNumber)
where year(shippedDate) = 2003 and status = 'Shipped'
group by salesRepEmployeeNumber
order by creditLimit desc;
