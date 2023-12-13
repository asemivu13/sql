alter table singer
add constraint check_singer_age check (age >= 1 and age <= 150);

INSERT INTO `songs`.`singer` (`id`, `name`, `band`, `age`) VALUES ('3', 'sio', 'FiftyFifty', '-20')
# CONSTRAINT `check_singer_age` failed for `songs`.`singer`