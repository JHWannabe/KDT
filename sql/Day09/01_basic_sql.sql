/*
# DataBase(데이터베이스)
* Data: 자료
* DataBase: 자료를 통합하여 관리하는 집합체, 저장소
* DBMS(DataBase Management System, 데이터베이스 관리시스템)  
    ㄴ 데이터베이스를 관리해주는 소프트웨어

## DBMS를 사용하는 이유
- 중복된 데이터를 제거 또는 관리
- 효율적인 데이터를 처리
- 자료를 구조화시킬 수 있음
- 다양한 프로그램을 사용하는 사용자들과 데이터 공유

## DBMS 랭킹
https://db-engines.com/en/ranking

## DBMS 종류
1. Oracle
- 유료 DBMS(코어 수에 따라)
- 거대용량 사용

2. MySQL
- 무료 DBMS

3. MongoDB
- Document 형식
- 주식 프로그램에 사용

4. Elasticsearch
- 검색 엔진 프로그램에 사용

## 관계형 데이터베이스(RDBMS): Relational Database
- DataBase를 Table로 다룸(엑셀과 비슷)
- 행을 row 또는 레코드(record)라고 함
- 열을 column 또는 필드(field)라고 함
- SQL 언어 사용

## SQL(Structured Query Language)
- 데이터베이스에서 데이터를 정의, 조작, 제어하기 위해 사용하는 언어
- 대소문자를 구별하지 않음
- 문자열을 저장할 때 ''(싱글 쿼트)만 사용

주석문 
한 줄 주석문: # 또는 --
 */
 
# 데이터베이스 확인하기
show databases;
 
# 데이터베이스 생성하기
# create database 데이터베이스명;
create database kdt;

# 데이터베이스 삭제하기
# drop database 데이터베이스명;
drop database kdt;

/*
테이블(Table)
데이터를 행과 열로 스키마에 따라 저장할 수 있는 구조

✔스키마
데이터베이스의 구조와 제약조건에 관한 명세를 기술한 집합의 의미

create table 테이블명 (
	필드명1 데이터타입 제약조건,
    필드명2 데이터타입 제약조건,
    필드명3 데이터타입 제약조건,
    ...
    필드명n 데이터타입 제약조건
)

데이터 타입(Data Type)
1. 숫자형 타입
	tinyint: 정수형 데이터 타입(1byte), -128 ~ 127 표현
    smallint: 정수형 데이터 타입(2byte), -32768 ~ 32767 표현
    mediumint: 정수형 데이터 타입(3byte), -8388608 ~ 8388607 표현
    int: 정수형 데이터 타입(4byte), 대략 -21억 ~ 21억 표현
    bigint: 정수형 데이터 타입(8byte), 무제한 표현
    float: 부동 소수형 데이터 타입(4byte)
    decimal(길이, 소수): 고정 소수형 데이터 타입(길이 + 1byte)
    double: 부동 소수형 데이터 타입(8byte)
    
2. 문자형 타입
	char: 고정 길이 데이터 타입(최대 255byte). 지정된 길이보다 짧은 데이터를 입력할 때 나머지 공간을 공백으로 채움
    varchar: 가변 길이 데이터 타입(최대 65535byte). 지정된 길이보다 짧은 데이터를 입력할 때 나머지 공간은 채우지 않음
    text: 문자열 데이터 타입(최대 65535byte)
    longtext: 무제한 문자열 데이터 타입

3. 이진 데이터 타입
	binary 또는 byte: char 형태의 이진 데이터 타입(최대 255byte)
    varbinary: varchar 형태의 이진 데이터 타입(최대 65535byte)
    
4. 날짜형
	date: 날짜(년도, 월, 일) 형태의 데이터 타입(3byte)
    time: 시간(시, 분, 초) 형태의 데이터 타입(3byte)
    datetime: 날짜와 시간 형태의 데이터 타입(8byte)
    timestamp: 1970년 1월 1일 0시 0분 0초부터 시작한 ms 타입의 시간이 저장(4byte)

제약 조건(constraint)
데이터의 무결성을 지키기 위해 데이터를 입력 받을 때 실행되는 검사 규칙을 의미

not null
- null 허용 x
- 중복값 허용

unique
- 중복값 허용 x
- null값 허용

primary key(PK)
- null값 허용 x
- 중복값 허용 x
- table에 단 하나만 지정
- table의 대표

foriegn key(FK)
- PK를 가진 테이블과 연결하는 역할

default
- null값을 삽입할 때 기본이 되는 값을 저장할 수 있게 함

enum
- 원하는 범위를 설정하고 해당 범위의 값만 저장 # 권장하지 않음
*/

# 데이터베이스 선택
# use 데이터베이스명
use kdt;

# 테이블 만들기
create table member(
	userid varchar(20) primary key,
    userpw varchar(200) not null,
    username varchar(20) not null,
    hp varchar(20),
    email varchar(50) not null,
    gender varchar(10) not null,
    ssn1 varchar(6) not null, # 주민번호 앞자리
    ssn2 varchar(7), # 주민번호 뒷자리
    zipcode varchar(5),
    address1 varchar(100),
    address2 varchar(100),
    address3 varchar(100),
    regdate datetime default now(), # 등록 날짜
    point int default 0
);

# 테이블 확인하기
# desc 테이블명
desc member;

# 테이블 삭제하기
# drop table 테이블명
drop table member;

# 테이블 필드 추가하기
# alter table 테이블명 add 컬럼명 데이터타입 제약조건
alter table member add mbti varchar(10);

# 테이블 필드 수정하기
# alter table 테이블명 modify column 컬럼명 데이터타입 제약조건
alter table member modify column mbti varchar(20);

# 테이블 필드 삭제하기
# alter table 테이블명 drop 컬럼명
alter table member drop mbti;

# 데이터 삽입하기
# insert into 테이블명 values (값1, 값2, ..)
# insert into 테이블명 (필드명1, 필드명2, 필드명3, ..) values (값1, 값2, 값3, ..)

create table word(
	eng varchar(50) primary key,
    kor varchar(50) not null,
    lev int
);

select * from word;

insert into word values ('apple','사과',1); # 항상 필드의 개수가 맞아야 함
insert into word values ('banana','바나나'); # Error Code: 1136. Column count doesn't match value count at row 1
insert into word values ('banana','바나나',null);
insert into word values ('orange',null,null); # Error Code: 1048. Column 'kor' cannot be null

insert into word (eng, kor, lev) values ('melon','메론',2);
insert into word (eng, kor) values ('orange','오렌지');
insert into word (eng) values ('cherry'); # Error Code: 1364. Field 'kor' doesn't have a default value

insert into member (userid, username, userpw, gender, email, ssn1) value ('apple', '김사과', '1234', '남자','apple@apple.com', '000101');
insert into member (userid, username, userpw, gender, email, ssn1) value ('banana', '반하나', '2345', '여자','banana@banana.com', '001001');
insert into member (userid, username, userpw, gender, email, ssn1) value ('orange', '오랜지', '3456', '남자','orange@orange.com', '001205');
insert into member (userid, username, userpw, gender, email, ssn1) value ('melon', '이메론', '4567', '남자','melon@melon.com', '011111');
insert into member (userid, username, userpw, gender, email, ssn1) value ('cherry', '채애리', '5678', '여자','cherry@cherry.com', '990101');
select * from member;

# 데이터 삭제하기
# delete from 테이블명;
# delete from 테이블명 where 조건절;
delete from member where userid = 'apple'; # userid가 'apple'인 사용자를 삭제 (apple 전체행 삭제)
delete from member where gender = '남자';

delete from member; # Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
# To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
# safe모드 풀기

# 데이터 수정하기
# update 테이블명 set 필드명1= 값1, 필드명2=값2... # 결과 전체 필드 값이 바뀜
# update 테이블명 set 필드명1= 값1, 필드명2=값2... where 조건절; # 조건만 바꿈
update member set point = 100; #전체 포인트 100점 추가
update member set point = point+300 where gender='여자';  #inplace연산(point = 300은 300으로 바뀌니까)

# 문제 banana 회원의 이메일을 banana@naver.com 변경
update member set email='banana@naver.com' where userid='banana'; 

# 문제 orange 회원의 우편번호를 '12345', 주소1은 '서울시 서초구', 주소2는 '양재동', 주소3은 '아파트 101동 101호'로 변경
update member set zipcode = '12345', address1 = '서울시 서초구', address2 = '양재동', address3='아파트 101동 101호' where userid = 'orange';