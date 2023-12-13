# current date
select curdate(), current_date(), current_date;
select now();
select date(now());

# current time
select current_time(), current_time, current_time+0;

# day name
select dayname('2023-10-18');
select dayname('2000-11-19');
select year('2000-11-19');

# month name
select monthname('2000-11-19');

# utc time
select utc_timestamp(), utc_date(), utc_time();

# add, sub, diff
SELECT DATE_ADD('1999-12-31 23:59:59', INTERVAL 1 SECOND);
SELECT DATE_ADD('1999-12-31 23:59:59', INTERVAL 1 DAY);
SELECT DATE_SUB('2017-07-04', INTERVAL 1 DAY) result;

# more utils
SELECT DAYNAME('2012-12-01'), DAYOFWEEK('2012-12-01');

# extract from date
SELECT EXTRACT(DAY FROM '2017-07-14 09:04:44') DAY;
SELECT EXTRACT(DAY_HOUR FROM '2017-07-14 09:04:44') DAYHOUR;

# diff
SELECT TIMEDIFF('12:00:00','10:00:00') diff;

# convert
SELECT STR_TO_DATE('21,5,2013','%d,%m,%Y');
SELECT STR_TO_DATE('21,5,2013 extra characters','%d,%m,%Y');

