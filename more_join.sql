select customerNumber, customerName, salesRepEmployeeNumber, employeeNumber, lastName
from customers
left join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
where customers.salesRepEmployeeNumber is NULL;

select customerNumber, customerName, salesRepEmployeeNumber, employeeNumber, lastName
from customers
right join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
where customers.salesRepEmployeeNumber is NULL;