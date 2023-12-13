select
	orderNumber,
    sum(quantityOrdered) as itemsCount,
    sum(priceEach * quantityOrdered) as total
from orderdetails
group by orderNumber with rollup;

SELECT productLine, sum(quantityInStock), sum(buyPrice) FROM classicmodels.products
group by productLine with rollup;

SELECT productLine, productVendor, count(productCode) FROM classicmodels.products
group by productLine, productVendor with rollup;