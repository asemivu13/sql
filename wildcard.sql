use classicmodels;

select * from customers;

-- this will match C[one character]r[...multiple characters]
select * from customers where contactFirstName like 'C_r%';
-- no result
select * from customers where contactFirstName like 'C%e';

-- regular expressons
select * from customers where contactFirstName regexp '^[C|A].*'