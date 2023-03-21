/*
	인덱스(index)
	- 테이블의 동작속도(조회)를 높여주는 자료구조
    - 데이터의 위치를 빠르게 찾아주는 역할
    - MYI(MySQL Index)파일에 저장
    - 인덱스를 설정하지 않으면 Table Full Scan이 일어나 성능이 저하되거나 장애가 발생할 수 있음
    - 조회속도는 빨라지지만 update, insert, delete의 속도는 저하될 수 있음
    - MySQL에서는 primary key, unique 제약조건을 사용하면 해당 컬럼에 index가 적용됨
    - 인덱스는 하나 또는 여러 개의 컬럼에 설정할 수 있음
    - where절을 사용하지 않고 인덱스가 걸린 컬럼을 조회하면 성능에 아무런 효과가 없음
    - 가급적 update가 안되는 값을 설정하는 것이 좋음
    
    order by와 group by와 index(효과 없는 상황)
    - order by 인덱스컬럼, 일반컬럼: 복수의 키에 대해 order by를 사용한 경우
    - where 일반컬럼1='값' order by 인덱스컬럼: 연속하지 않은 컬럼에 대해 order by를 실행한 경우
    - order by 인덱스컬럼1 desc, 인덱스컬럼2 asc: desc와 asc를 혼합해서 사용한 경우
    - group by 일반컬럼1 order by 인덱스컬럼: group by와 order by의 컬럼이 다른 경우
    - order by 함수(인덱스컬럼): order by 절에 컬럼이 아닌 다른 표현을 사용한 경우
    
    인덱스 문법
    create index 인덱스명 on 테이블명(필드명);
    create index 인덱스명 on 테이블명(필드명1, 필드명2, ...)
    
    인덱스 조회
    show index from 테이블명;
    
    인덱스 삭제
    alter table 테이블명 drop index 인덱스명;
    
    
*/
show index from member;

create index idx_email on member(email);
alter table member drop index idx_email;