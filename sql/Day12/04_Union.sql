# 유니온(union)
# 합집합을 나타내는 연산자로, 중복된 값을 제거함
# 서로 같은 종류의 테이블(컬럼이 같아야 함)에서만 적용이 가능
# select 컬럼명1, 컬렴명2, .. from 테이블1 union select 컬럼명1, 컬럼명2, .. from 테이블2

create table product(
	code varchar(6) not null,
    name varchar(50) not null,
    detail varchar(1000),
    price int default 0,
    regdate datetime default now()
);

insert into product values('100000', '아이폰14', '예뻐요', 1500000, now());
insert into product values('100001', '갤럭시23', '좋아요', 1300000, now());
insert into product values('100002', '맥북에어', '가벼워요', 2500000, now());
insert into product values('100003', 'z플립4', '잘접혀요', 1800000, now());
insert into product values('100004', 'LG공기청정기', '성능좋아요', 600000, now());

# numCount: 카멜 표기법
# product_new: 스네이크 표기법

create table product_new(
	code varchar(6) not null,
    name varchar(50) not null,
    detail varchar(1000),
    price int default 0,
    regdate datetime default now()
);

insert into product_new values('200000', '엘지그램', '가벼워요', 1500000, now());
insert into product_new values('200001', '삼성모니터', '잘보여요', 500000, now());
insert into product_new values('100001', '갤럭시23', '좋아요', 1300000, now());

select * from product;
select * from product_new;

select code, name, price from product
union
select code, name, price from product_new;

# 날짜는 중복되지 않아 출력이 됨
select code, name, price, regdate from product
union
select code, name, price, regdate from product_new;

# union all
# 합집합을 나타내는 연산자로, 중복된 값을 제거하지 않음
select code, name, price from product
union all
select code, name, price from product_new;