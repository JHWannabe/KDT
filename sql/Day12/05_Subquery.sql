/*
	서브쿼리(Sub Query)
    - 다른 쿼리 내부에 포함되어 잇는 select 문을 의미
    - 서브쿼리를 포함하고 있는 쿼리를 외부쿼리라고 부르고, 서브쿼리는 내부쿼리라고도 부름
    - 서브쿼리는 괄호()로 감싸져서 표현
    - 서브쿼리는 메인쿼리 컬럼 사용이 가능하며, 메인쿼리는 서브쿼리 컬럼을 사용하지 못함
    - select, where, from, having 절 등에서 사용할 수 있음
*/
select price from product where code = '100001';

# 100001의 가격보다 크거나 같은 price를 가지고 있는 상품의 모든 정보
select * from product where price >= (select price from product where code = '100001');

# select 절
# 코드, 이름, 가격, 전체 데이터의 가격 중 가장 큰 값을 출력하는 쿼리
# 서브쿼리를 사용
select code, name, price, (select max(price) from product) as 'max price' from product;

create table orders(
	no int not null,
    userid varchar(20) not null,
    product varchar(100) not null,
    cnt int default 1,
    regdate datetime default now(),
    foreign key(userid) references member(userid)
);

insert into orders (no, userid, product, cnt) values (1, 'apple', '사과', 3);
insert into orders (no, userid, product, cnt) values (2, 'apple', '꿀사과', 2);
insert into orders (no, userid, product, cnt) values (3, 'banana', '바나나', 5);
insert into orders (no, userid, product, cnt) values (4, 'banana', '딸바', 1);
insert into orders (no, userid, product, cnt) values (5, 'orange', '오렌지', 2);
insert into orders (no, userid, product, cnt) values (6, 'berry', '블루베리', 3);
insert into orders (no, userid, product, cnt) values (7, 'cherry', '체리', 2);
insert into orders (no, userid, product, cnt) values (8, 'cherry', '체리마루', 4);

select * from orders;
select * from member;


# 문제1
# 상품을 최소 2개이상 구입 횟수의 회원의 아이디, 이름, 성별을 출력
select userid, username, gender from member where userid in
(select userid from orders group by userid having count(no) >= 2);


# MySQL 문자열 함수

# concat: 복수의 문자열을 연결해주는 함수
select concat('안녕', '하세요') as concat;
select concat(address1,' ', address2,' ', address3) as address from member where userid = 'orange';

# left, right: 왼쪽/오른쪽에서 길이만큼 문자열을 가져옴
select left('ABCDEFGHIJKLMNO', 5); -- ABCDE
select right('ABCDEFGHIJKLMNO', 5); -- KLMNO

select userid, left(email, 5) as email from member where userid='apple';

# substring: 문자열의 일부를 가져옴
# substring(문자열, 시작위치, 길이)
select substring('ABCDEFGHIJKLMNO', 3, 2); -- CD
select substring(address1, 1, 3) as 주소 from member where userid='orange'; -- 서울시

# char_length: 문자열의 길이를 반환
select char_length('ABCDEFGHIJKLMNO'); -- 15
select char_length(email) as len from member;

# lpad, rpad: 왼쪽/오른쪽의 해당 길이만큼 늘리고 빈 공간을 채울 문자열을 반환
select lpad('ABCDEFG', 10, '0'); -- 000ABCDEFG
select lpad(point, 5, 0) as lpad from member;

# ltrim, rtrim, trim: 왼쪽/오른쪽/양쪽 공백 제거
select ltrim('     ABCDEFG     ') as ltrim;
select rtrim('     ABCDEFG     ') as rtrim;
select trim('     ABCDEFG     ') as trim;

# replace: 문자열에서 특정 문자열을 변경
# replace(문자열, 대상, 바꿀 문자열)
select replace('ABCDEFG', 'CD', '✔') as repl;

# 문제2
# 상품을 2번 이상 구입한 회원의 아이디, 상품 구입 횟수, 시도 이름를 출력
select userid, left(address1, 3) as address from member;
select count(no) as cnt from orders group by userid having cnt >= 2;

# join을 사용한 쿼리
select m.userid, count(no) as cnt, left(address1, 3) as address from member as m
right outer join orders as o on m.userid = o.userid
group by m.userid having cnt >= 2;

# from 절
select m.userid, t.ocnt, left(address1, 3) as address from member as m
right outer join
(select userid, count(no) as ocnt from orders group by userid having count(no) >= 2) as t
on m.userid = t.userid;


# orders와 동일한 형태의 테이블을 생성
create table orders2(
	no int not null,
    userid varchar(20) not null,
    product varchar(100) not null,
    cnt int default 1,
    regdate datetime default now(),
    foreign key(userid) references member(userid)
);

select * from orders2;
# orders와 동일한 테이블 orders2를 만들고 orders에 존재하는 데이터를 모두 복사하여 orders2에 저장
insert into orders2(select * from orders);
create table orders3(select * from orders);
select * from orders3;