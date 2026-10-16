drop table if exists user_notnull;


CREATE TABLE user_notnull
(
    user_no   INT          NOT NULL,
    user_id   VARCHAR(255) NOT NULL,
    user_pwd  VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender    VARCHAR(3),
    phone     VARCHAR(255) NOT NULL,
    email     VARCHAR(255)
);


INSERT INTO user_notnull
    (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
       (2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');


CREATE TABLE user_notnull
(
    user_no   INT          NOT NULL UNIQUE,
    user_id   VARCHAR(255) NOT NULL,
    user_pwd  VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender    VARCHAR(3),
    phone     VARCHAR(255) NOT NULL,
    email     VARCHAR(255),
    constraint UNIQUE (phone)
);

INSERT INTO user_notnull
    (user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES (4, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com');



CREATE TABLE user_fk
(
    user_no    int,
    user_id    varchar(50) not null,
    user_name  varchar(50) not null,
    grade_code int,
    constraint PRIMARY KEY (user_no),
    constraint FOREIGN KEY (grade_code) references user_grade (grade_code)
);

create table user_grade
(
    grade_code int primary key,
    grade_name varchar(50) not null
);

insert into user_grade
values (10, '일반회원'),
       (20, '우수회원'),
       (30, '특별회원');

insert into user_fk
values (1, 'user01', '홍길동', 10),
       (2, 'user02', '유관순', 20);

select *
from user_fk;
select *
from user_grade;


create table user_fk_table
(
    user_no    int primary key,
    user_id    varchar(50) not null,
    user_name  varchar(50) not null,
    grade_code int,
    constraint foreign key (grade_code) references user_grade (grade_code)
        on update set null -- 부모가 수정되면 외래키를 NULL 변경
        on delete set null -- 부모가 삭제되면 외래키를 NULL 변경
);

create table user_grade
(
    grade_code int primary key,
    grade_name varchar(50) not null
);


create table user_fk_table
(
    user_no    int primary key,
    user_id    varchar(50) not null,
    user_name  varchar(50) not null,
    grade_code int         null,
    constraint foreign key (grade_code)
        references user_grade (grade_code)
        on update set null -- 부모가 수정되면 외래키를 NULL 변경
        on delete set null -- 부모가 삭제되면 외래키를 NULL 변경
);

create table user_grade2
(
    grade_code int primary key,
    grade_name varchar(50) not null
);

create table user_fk_table2
(
    user_no    int primary key,
    user_id    varchar(50) not null,
    user_name  varchar(50) not null,
    grade_code int         null,
    constraint foreign key (grade_code)
        references user_grade2 (grade_code)
        on update cascade -- 부모가 수정되면 외래키를 변경
        on delete cascade -- 부모행이 삭제되면 자식행도 삭제
);

insert into user_grade2
values (10, '일반회원'),
       (20, '우수회원'),
       (30, '특별회원');

insert into user_fk_table2
values (1, 'user01', '홍길동', 10),
       (2, 'user02', '유관순', 20);

select *
from user_fk_table2
join user_grade2;



create table user_check
(
    user_no int primary key ,
    user_name varchar(50) not null,
    gender  varchar(3),
    age int,
    constraint ck check (gender in ('남', '여')),
    constraint ck2 check ( age >= 10 )
)