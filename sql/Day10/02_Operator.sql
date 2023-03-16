/*
SQL 연산자
1. 산술 연산자
	+, -, *, /, mod(나머지 연산), div(몫)
    
2. 비교 연산자
	=(같다, 조건절), <, >, <=, >=, <>(다르다)

3. 대입 연산자
	=

4. 논리 연산자
	and, or, not, xor

5. 기타 연산자
	is: 양쪽이 모두 같으면 true 아니면 false
	between A and B: 값이 A보다는 크거나 같고, B보다는 작거나 같으면 true 아니면 false
	in: 매개변수로 전달된 리스트에 값이 존재하면 true 아니면 false
    like: 패턴으로 문자열을 검색하여 값이 존재하면 true 아니면 false
*/

# 데이터 검색
# select 필드명1, 필드명2, .. from 테이블명;
select 100;
select 100 + 50;

use kdt;
select userid, username, gender from member;
select username, userid, gender from member;

# 별명
# select 필드명 as 별명 from 테이블명;
select 100 + 50 as 덧셈;
select 100 + 50 as '덧셈'; -- ''를 사용하는 이유는 띄어스기 았을 수 있기 때문
select 100 + 50 as '덧셈 연산';
select 100 + 50 덧셈;

select userid as 아이디, username as 이름, email as 이메일 from member;

# 모든 컬럼 가져오기(추천하지 않음 - 용량이 많아서 성능이 느려짐)
select * from member;

# null과 ''
select null; # 데이터 없음, insert가 되지 않은 것
select ''; # '' 데이터가 insert 된 것

select 100 + null; # null
select 100 + ''; # 100

# 조건절
# select 필드명1, 필드명2 .. from 테이블명 where 조건절;
select userid, username, gender, email from member where userid='apple';
select userid, username from member where gender='남자';
select userid, username, point from member where point >= 300;

# 로그인
select userid, username, gender, email from member where userid = 'apple' and userpw = 1234;
select userid, username, gender, email from member where userid = 'apple' and userpw = 1111;

# is
select userid, username, email from member where address1 = 'null'; -- X
select userid, username, email from member where address1 = null; -- X
select userid, username, email from member where address1 is null; -- O
select userid, username, email from member where address1 is not null; -- O

update member set point = 300 where userid='cherry';
select * from member;

# between A and B
select userid, username, point from member where point between 300 and 600;
select userid, username, point from member where point >= 300 and point <= 600;

# like
select userid, username from member where userid like 'a%'; -- a로 시작하는 문자열
select userid, username from member where userid like '%a'; -- a로 끝나는 문자열
select userid, username from member where userid like '%a%'; -- a가 들어가는 문자열
select userid, username from member where userid like '%app%'; -- app이 들어가는 문자열
select userid, username from member where userid like 'app__'; -- app으로 시작하는 5글자인 문자열

# 정렬
# select 필드명1, 필드명2, .. from 테이블명 order by 1순위 정렬할 필드명 [asc, desc], 2순위 정렬할 필드명 [asc, desc];
select userid, username, point from member order by userid; # 기본값: 오름차순
select userid, username, point from member order by userid asc; # 아이디로 오름차순
select userid, username, point from member order by userid desc; # 아이디로 내름차순
# 1순위(포인트로 내림차순)하고 같은 포인트인 경우 2순위(아이디로 내림차순)
select userid, username, point from member order by point desc, userid desc;

# 조건절 + 정렬
# select 필드명1, 필드명2, .. from 테이블명 where 조건절 order by 정렬할 필드명 [asc, desc];
# 성별이 여성인 회원을 point가 많은순으로 정렬(단, 포인트가 같을 경우 머저 가입한 순으로 정렬)
select userid, username, point, regdate from member where gender='여자' order by point desc, regdate;

# limit
# select 필드명1, 필드명2, .. from 테이블명 limit 가져올 행의 갯수;
# select 필드명1, 필드명2, .. from 테이블명 limit 시작행, 가져올 행의 갯수;
select * from member;
select userid, username, gender from member limit 3;
select userid, username, gender from member limit 3, 2; # 인덱스 3행부터 2개의 행을 가져옴

# 정렬 + limit
# select 필드명1, 필드명2, .. from 테이블명 order by 정렬할 필드명 [asc, desc] limit 가져올 행의 갯수;
select userid, username, point from member order by point desc limit 3;

# 집계 함수
# count: 행의 갯수를 세는 함수
# 전체인원을 알고 싶다!: primary key가 적용되어 null이 포함될 수 없음
select count(userid) as 전체인원 from member; # 5
# 주소를 입력한 인원을 알고 싶다!: null이 있으면 주소를 입력하지 않았음
select count(zipcode) as 우편번호 from member; # 1, null을 제외하고 갯수를 셈

# sum: 행 값을 더함
select sum(point) as 포인트합 from member; # 1000
select userid, sum(point) as 포인트합 from member; # Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'kdt.member.userid'; this is incompatible with sql_mode=only_full_group_by

# avg: 행 값의 평균을 구함
select avg(point) as 평균 from member;

# min: 행의 최소값을 구함
select min(point) as 최소값 from member;

# max: 행의 최대값을 구함
select max(point) as 최대값 from member;

# 그룹
# select 그룹을 맺은 컬럼 또는 집계함수 from 테이블명 group by 그룹을 맺을 필드명;
select gender from member group by gender;
select gender, sum(point) as 합계 from member group by gender;
select gender, avg(point) as 평균 from member group by gender;
select gender, count(userid) as 인원수 from member group by gender;

# 그룹 + 조건
# select 그룹을 맺은 컬럼 또는 집계함수 from 테이블명 group by 그룹을 맺을 필드명 having 조건절;
select gender from member group by gender having gender = '여자';

# 로우 추가
insert into member (userid, username, userpw, gender, email, ssn1) value ('berry', '배애리', '6789', '여자','berry@berry.com', '900101');

# 조건절 + 그룹 + 그룹조건 + 정렬
# select 그룹을 맺은 컬럼 또는 집계함수 from 테이블명 where 조건절 group by 그룹을 맺을 필드명 having 조건절 order by 정렬할 필드명 [asc, desc];
# 문제1
# 포인트가 0이 아닌 회원 중에서 남, 여로 그룹을 나눠 포인트의 평균을 구하고
# 평균 포인트가 100 이상인 성별을 검색하여 포인트로 내림차순 정렬
select gender, avg(point) as avg from member where point > 0 group by gender having avg >= 100 order by avg desc;