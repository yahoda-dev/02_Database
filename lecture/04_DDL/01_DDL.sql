CREATE TABLE IF NOT EXISTS tb1
(
    pk   int,
    fk   int,
    col1 varchar(255),
    check (col1 in ('Y', 'N') ) -- check: 제약 조건
);

INSERT INTO tb1
VALUES (1, 10, 'Y');
DELETE
FROM tb1
WHERE fk = 1;
SELECT *
FROM tb1;

describe tb2;

CREATE TABLE IF NOT EXISTS tb2
(
    pk   int AUTO_INCREMENT PRIMARY KEY,
    fk   int,
    col1 varchar(255),
    check (col1 in ('Y', 'N') ) -- check: 제약 조건
);

insert into tb2(fk, col1)
values (10, 'Y'),
       (10, 'N');
select *
from tb2;

-- alter

alter table tb2
    add column col2 int not null default 0;

alter table tb2
    drop column col2;

alter table tb2
    change column fk change_fk BIGINT NOT NULL;

alter table tb2
    modify column change_fk INT;

alter table tb2
    rename column change_fk to fk;



CREATE TABLE IF NOT EXISTS tb3
(
    pk   int AUTO_INCREMENT PRIMARY KEY,
    fk   int,
    col1 varchar(255),
    check (col1 in ('Y', 'N') ) -- check: 제약 조건
)
comment '삭제 테스트용 DB3';


describe tb3;
select * from tb3;
insert into tb3 values (1, 2, 'Y'),
                       (2, 3, 'N');


truncate tb3;
drop table if exists tb3;