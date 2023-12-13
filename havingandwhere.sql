# having and where

select
	orderNumber,
    sum(quantityOrdered) as itemsCount,
    sum(priceEach * quantityOrdered) as total
from orderdetails
group by orderNumber
having orderNumber = 10100;

select
	orderNumber,
    quantityOrdered
from orderdetails
having orderNumber = 10100;

select
	orderNumber,
    sum(quantityOrdered) as itemsCount,
    sum(priceEach * quantityOrdered) as total
from orderdetails
where orderNumber = 10100
group by orderNumber;