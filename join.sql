use classicmodels;
# inner join: matching rows only = non matching rows eliminated
SELECT customerNumber, customerName, salesRepEmployeeNumber FROM classicmodels.customers;
SELECT employeeNumber, lastName FROM classicmodels.employees;

select customerNumber, customerName, salesRepEmployeeNumber, employeeNumber, lastName
from customers
join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber;

select customerNumber, customerName, salesRepEmployeeNumber, employeeNumber, lastName
from customers
inner join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber;

# left outer join = left join = matching rows + non matching rows from the left table
select customerNumber, customerName, salesRepEmployeeNumber, employeeNumber, lastName
from customers
left join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber;

# right outer join = right join = matching rows + non matching rows from the right table
select customerNumber, customerName, salesRepEmployeeNumber, employeeNumber, lastName
from customers
right join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber;

# no full join in mysql you can do trick about it using union, left join and right join
# https://stackoverflow.com/questions/4796872/how-can-i-do-a-full-outer-join-in-mysql

# cross join
# cartesian product between 2 tables (no on clause)
select customerNumber, customerName, salesRepEmployeeNumber, employeeNumber, lastName
from customers
cross join employees
