/*
	MySQL 사용자
    1. 사용자 추가하기
    - MySQL 8.0 Command Line Client 'root' 계정으로 로그인
    - 로컬에서 접속 가능한 사용자 추가하기(계정만 생성)
		ㄴ create user '사용자명'@'localhost' identified by '사용자 비밀번호';
        ㄴ create user 'apple'@'localhost' identified by '1111';
	- DB 권한 부여하기
		ㄴ grant all privileges on *.* to '사용자'@'localhost'; # 모든 DB에 접근 가능
        ㄴ grant all privileges on 'DB명' to '사용자'@'localhost';
        ㄴ flush privileges; # 새로운 세팅을 적용함
	
    ✔ 할당 권한 상세 옵션
    create, drop, alter: 테이블에 대한 생성, 삭제, 변경 권한
    select, insert, update, delete: 테이블의 데이터를 조회, 삽입, 변경, 삭제 권한
	all: 모든 권한
    usage: 권한을 부여하지 않고 계정만 생성(default)
    ex) grant select on DB명.테이블명 to '사용자'@'localhost';
    
    ✔ IP 권한 상세 옵션
    %: 모든 IP에서 접근이 가능
    127.0.0.1: localhost에서 접근이 가능
    ex) grant select on DB명.테이블명 to '사용자'@'%';
    ex) grant select on DB명.테이블명 to '사용자'@'특정 IP 주소';

*/
# apple 데이터베이스에 kdt.member 테이블을 복사하고 해당 테이블의 select 권한만 가능한 orange 계정을 만들어보자.
use apple;
create table apple.member(select * from kdt.member);
create user 'orange'@'localhost' identified by '2222';
grant select on apple.member to 'orange'@'localhost';
flush privileges;

# orange로 로그인 후 테스트
use apple;
select * from member;
update member set point = 500 where userid='berry'; # Error Code : 1142. UPDATE command denied to user 'orange'@'localhost' for 'member'

# 사용자 목록 조회
use mysql;
select user, host from user;

# 사용자 제거
# drop user '계정명'@'localhost'; # 추천!
# delete from user where user = 계정명;

# 사용자 권한 조회하기
# show grants for '계정명'@'localhost';
show grants for 'apple'@'localhost';
show grants for 'orange'@'localhost';
show grants for 'melon'@'localhost';

# 사용자 권한 제거하기
# revoke 권한명 on 데이터베이스명.테이블명 from '계정명'@'localhost';
# revoke all privileges on 데이터베이스명.* from '계정명'@'localhost';
revoke select on apple.member from 'orange'@'localhost';

/*
	뷰(view)
    - 가상의 테이블 생성
	- 실제 테이블처럼 행과 열을 가지고 있지만, 데이터를 직접 저장하고 있지는 않음
    
    뷰를 만드는 이유
    - SQL 코드를 간결하게 만들기 위함
    - 삽입, 삭제, 수정 작업에 제한 사항을 가짐
    - 내부 데이터를 전체 공개하고 싶지 않을 때
*/
# create view 뷰이름 as 쿼리 ...
use kdt;
select * from member;
create view vw_member as select userid, username, email, gender from member;
select * from vw_member;

select * from profile;

# 문제
# member의 userid, username, email과 profile의 mbti를 출력하는 view를 만들고
# select만 할 수 있는 melon 계정 생성
create view vw_memberprofile as
(select m.userid, username, email, mbti from member m, profile p
where m.userid = p.userid);
select * from vw_memberprofile;
create user 'melon'@'localhost' identified by '3333';
grant select on kdt.vw_memberprofile to 'melon'@'localhost';
flush privileges;

# melon으로 접속 후 테스트
use kdt;
select * from member; # Error Code: 1142. SELECT command denied to user 'orange'@'localhost' for table 'member'
select * from vw_memberprofile;

/*
	뷰 수정하기
    alter view 뷰이름 as 쿼리 ...
    
    뷰 대체 -- 추천!(계속해서 실행 가능)
    create or replace view 뷰이름 as  쿼리 ...
*/
create or replace view vw_memberprofile as
(select m.userid, username, email, mbti from member m, profile p
where m.userid = p.userid);

# 뷰 삭제하기
# drop view 뷰이름;
drop view vw_member;

create view vw_member as select userid, username, email, gender from member;
select * from vw_member;

update vw_member set email='berry1@berry1.com' where userid = 'berry';
select * from vw_member; # 뷰 이메일 데이터 변경됨
select * from member; 

insert into vw_member values ('avocade', '안가도', 'avocado@avocado.com', '남자'); # Error. 테이블 NOT NULL 제약조건으로 데이터 삽입 안됨