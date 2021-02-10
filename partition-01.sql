CREATE TABLE first_database.doviz_part
(
    dt string,
    c1 double,
    c2 double,
    c3 double,
    c4 double
) PARTITIONED BY (year INT);
-- LOAD DATA LOCAL INPATH tab1’/clientdata/2009/file2’OVERWRITE INTO TABLE studentTab PARTITION (year =’2009′);
-- LOAD DATA LOCAL INPATH tab1’/clientdata/2010/file3’OVERWRITE INTO TABLE studentTab PARTITION (year =’2010′);
set hive.exec.dynamic.partition.mode=nonstrict;
insert into first_database.doviz_part partition (year)
select c1_date,
       c1,
       c2,
       c3,
       c4,
       substring(c1_date, 7, 4)
from first_database.doviz_load;

select * from first_database.doviz_part;

