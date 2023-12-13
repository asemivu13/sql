use classicmodels;

# advantage
# 1. reduce network traffic
# 2. more secure

# disadvantage
# 1. resource usage
# 2. maintance

# delimiter: you can use `;` to separate 2 statements,
# you can change it also using DELIMITER <d>

# create PROCEDURE
DELIMITER //
create procedure spGetCustomers()
begin
	select * from customers;
end //
DELIMITER ;
call spGetCustomers();

# DROP PROCEDURE
drop procedure spGetCustomers;

# Stored Procedure Parameters - `IN` parameter
DELIMITER //

CREATE PROCEDURE GetOfficeByCountry(
	IN countryName VARCHAR(255)
)
BEGIN
	SELECT * 
 	FROM offices
	WHERE country = countryName;
END //

DELIMITER ;

call GetOfficeByCountry("USA")

# Stored Procedure Parameters `OUT` parameter
DELIMITER $$

CREATE PROCEDURE GetOrderCountByStatus (
	IN  orderStatus VARCHAR(25),
	OUT total INT
)
BEGIN
	SELECT COUNT(orderNumber)
    INTO total
	FROM orders
	WHERE status = orderStatus;
END$$

DELIMITER ;

CALL GetOrderCountByStatus('Shipped', @total);
SELECT @total;

CALL GetOrderCountByStatus('in process',@total);
SELECT @total AS  total_in_process;


# Stored Procedure Parameters `INOUT` parameter

# Alter stored procedure