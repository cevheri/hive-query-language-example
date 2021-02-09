-- We can control the creation and deletion of the data.
-- The location of the external data is specified at the table creation time
CREATE EXTERNAL TABLE first_database.doviz_external
(
    dt string,
    c1 double,
    c2 double,
    c3 double,
    c4 double
) LOCATION '/user/cevher/input';
----
LOAD DATA INPATH '/user/cevher/input/doviz.txt' INTO TABLE first_database.doviz_external;
-- when we drop an external table, Hive will leave the data untouched and only delete the metadata.