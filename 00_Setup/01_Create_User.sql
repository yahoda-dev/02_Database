-- SQL 쿼리 작성 파일입니다.

-- show databases;
-- use mysql;

/*
해당 스크립트에서 진행할 것: 계정 생성
계정 생성은 mysql DB에서 할 수 있다.
*/


-- create user '사용자이름'@'접속가능한 위치' identified by '비밀번호';

-- Database(Scheme) 생성
create database menudb;

show databases;

-- grant all privileges on (권한을 부여할 DB).(권한을 부여할 테이블) to '(권한을 부여할 계정)'@'범위'

grant all privileges on menudb.* to 'kjw'@'%';



