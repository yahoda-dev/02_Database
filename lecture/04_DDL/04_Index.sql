DROP TABLE IF EXISTS phone;

CREATE TABLE phone
(
    phone_code  INT,
    phone_name  VARCHAR(100) NOT NULL,
    phone_price DECIMAL(10, 2) NOT NULL,
    company     VARCHAR(30) NOT NULL,
    CONSTRAINT pk_phone PRIMARY KEY (phone_code)
);


INSERT INTO phone (phone_code, phone_name, phone_price, company)
VALUES
    (1, 'GalaxyS26',          1250000, 'Samsung'),
    (2, 'iPhone17',           1580000, 'Apple'),
    (3, 'GalaxyFold8',        2300000, 'Samsung'),
    (4, 'GalaxyS26Ultra',     1850000, 'Samsung'),
    (5, 'iPhone17Ultra',      1980000, 'Apple'),
    (6, 'GalaxyZFold8Ultra',  1800000, 'Samsung'),
    (7, 'Pixel11',            1350000, 'Google'),
    (8, 'Pixel11Pro',         1650000, 'Google');



select * from phone;

show index from phone;


explain
select * from phone
where phone_name = 'GalaxyS26';


create index idx_phone_name on phone (phone_name);

show index from phone;