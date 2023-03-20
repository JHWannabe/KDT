use kdt;
select * from member;

# DB가 방대해지면 table을 불러올 때 성능이 느려질 가능성이 높음

desc member;

# profile 테이블 생성 (foreign key)
create table profile(
	userid varchar(20) not null,
	height double,
    weight double,
    blood varchar(10),
    mbti varchar(10),
    foreign key(userid) references member(userid) # foreign key(내 컬럼) references 연결할 테이블(연결할 컬럼)    
);

select * from profile;

# 로우 삽입
insert into profile values('jhjun', 170, 65, 'O', 'ISFJ');
# foreign key에 해당하지 않는 id는 삽입 불가
# Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`kdt`.`profile`, CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`))
insert into profile values('apple', 170, 65.3, 'O', 'ISFJ');
insert into profile values('banana', 165, 50.5, 'A', 'INTP');
insert into profile values('cherry', 160, 52.1, 'AB', 'ENTJ');
insert into profile values('melon', 172, 70.8, 'O', 'ESFP');
insert into profile values('orange', 180, 78.6, 'B', 'ESFJ');

# 조인
# select 필드명1, 필드명2, .. from 테이블1 [inner, left, right] join 테이블2 on 테이블1.연결할필드 = 테이블2.연결할필드;

# inner join
# 조인하는 테이블의 on 절의 조건이 일치하는 결과만 출력
# join, inner join, cross join 모두 같은 의미로 사용됨

select userid, username, email, height, weight, mbti from member m inner join profile p on m.userid=p.userid;
# userid가 어떤 것인지 모름
# Error Code: 1052. Column 'userid' in field list is ambiguous
select m.userid, username, email, height, weight, mbti from member m inner join profile p on m.userid=p.userid;

# left/right outer join
# 두 테이블이 조인될 때 왼쪽/오른쪽을 기준으로 했느냐에 따라 기준 테이블의 것을 모두 출력함
# outer join은 조인하는 테이블의 on 절의 조건 중 한쪽의 데이터를 모두 가져옴
# left outer join, right outer join, full outer join 존재
# full outer join은 거의 사용하지 않음
# 데이터가 없으면 null로 표시
select m.userid, username, email, height, weight, mbti from member m left outer join profile p on m.userid=p.userid;
select m.userid, username, email, height, weight, mbti from member m right outer join profile p on m.userid=p.userid;

/*
데이터 정규화
- 데이터베이스를 설계할 때 중복을 최소화하는 것
- 크고 조직화되어 있지 않은 테이블과 관계들ㅇ르 조직화된 테이블과 관계들로 나누는 것

데이터 정규화가 필요한 경우
- 데이터를 갱신, 삽입, 삭제 등 테이블을 수정할 때 원하지 않게 데이턱 삭제되거나 가공되는 일이 발생하는데 이를 '이상 현상'이라고 함
- 이상 현상이 발생하는 경우 데이터 정규화가 반드시 필요

정규화의 종류
1. 1NF(제 1정규화)
- 테이블 안에 모든 값들은 단일 값이어야 함

2. 2NF(제 2정규화)
- 1NF를 만족하면서, 완전 함수 종속성을 가진 관계들로만 테이블을 생성하는 것
- 종속성들 중 종속 관계에 있는 열들끼리 테이블을 구분해주는 것

✔ 함수 종속성
x값에 따라서 y값이 결정되는 경우

3. 3NF(제 3정규화)
- 2NF를 만족하면서, 기본키에 대해 잏애적 함수 종속이 되지 않는 것을 의미

4. 비정규화
- 정규형에 일치하게 되어 있는 테이블을 정규형을 지키지 않는 테이블로 만드는 것
- 테이블을 조회하는 용도로 사용하거나, 너무 데이터가 많이 나뉘어 성능이 저하되는 경우에 사용
- 어떤 작업을 수행하는지, 어떤 데이터를 사용하는지에 따라 적절한 정규화를 하는 것이 좋음

*/
# auto_increment (필드의 identity한 숫자를 자동으로 부여)
create table tel(
	idx int auto_increment,
    name varchar(20) not null,
    hp varchar(20) not null,
    job varchar(20),
    regdate datetime default now()
);
# Error Code: 1075. Incorrect table definition; there can be only one auto column and it must be defined as a key
# MySQL에서는 auto_increment를 사용할 시 반드시 primary key를 적어야 함
create table tel(
	idx int auto_increment primary key,
    name varchar(20) not null,
    hp varchar(20) not null,
    job varchar(20),
    regdate datetime default now()
);

select * from tel;
# idx는 자동 생성이므로 insert에 넣지 않아도 됨
insert into tel (name, hp, job) values ('김사과','010-1111-1111','학생');
insert into tel (idx, name, hp, job) values (2,'반하나','010-2222-2222','학생');
insert into tel (idx, name, hp, job) values (10,'오랜지','010-3333-3333','군인');
insert into tel (idx, name, hp, job) values (2,'이메론','010-4444-4444','공무원'); # Error Code: 1062. Duplicate entry '2' for key 'tel.PRIMARY'
insert into tel (name, hp, job) values ('이메론','010-4444-4444','공무원'); # idx는 11