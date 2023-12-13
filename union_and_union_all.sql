# union and union all

select * from employees
union
select * from employees
order by employeeNumber;

# allow duplicates
select * from employees
union all
select * from employees
order by employeeNumber;

select firstName from employees
union all
select customerName from customers;