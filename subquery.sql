# sub-query

use classicmodels;
# find the officeCode in USA
select officeCode from offices where country="USA";

# example 1:
# select ..... IN (.. , .. , ..)
select lastName, firstName from employees where officeCode in (select officeCode from offices where country="USA");

# example 2:
select max(amount) from payments;
select officeCode from offices where country="USA";
select customerNumber from payments where amount = (select max(amount) from payments)