-- example 1:
use classicmodels;

delimiter $$
create function CustomerLevel(
	credit decimal(10, 2)
)
returns varchar(20)
deterministic
begin
	declare customerLevel varchar(20);
    IF credit > 50000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit >= 50000 AND 
			credit <= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	
    return (customerLevel);
end$$

delimiter ;

show function status;

select customerName, CustomerLevel(creditLimit) from customers order by customerName;