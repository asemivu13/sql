DELIMITER $$

create table trans(
	id int primary key auto_increment,
    username varchar(200) not null
);

CREATE PROCEDURE testtransaction ()
BEGIN
	begin transaction
	insert into trans(username) values("a");
    insert into trans(usernamez) values("x");
    insert into trans(username) values("b");
	commit
END$$

DELIMITER ;

CALL testtransaction();

select * from trans;