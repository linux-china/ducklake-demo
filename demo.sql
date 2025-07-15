create table city
(
    id      int,
    name    varchar(100),
    country varchar(100)
);

INSERT INTO city (id, name, country)
VALUES (1, 'Hangzhou', 'CN'),
       (2, 'San Francisco', 'US'),
       (3, 'Davao', 'PH');


-- attach file to table
create table family
(
    id   bigint,
    name varchar(100),
    age  bigint,
);

CALL ducklake_add_data_files('lake3', 'family', 's3://lake3/main/family/family.parquet');
