# 02_Operator.sql
- 연산자
    - 산술 연산자: +, -, *, /, mod(나머지 연산), div(몫)
    - 비교 연산자: =(같다, 조건절), <, >, <=, >=, <>(다르다)
    - 대입 연산자: =
    - 논리 연산자: and, or, not, xor
    - 기타 연산자: is, between A and B, in, like
- 별명 (select 필드명 as 별명 from 테이블명;)
- 조건절 (select 필드명1, 필드명2 .. from 테이블명 where 조건절;)
- 정렬 (select 필드명1, 필드명2, .. from 테이블명 order by 1순위 정렬할 필드명 [asc, desc], 2순위 정렬할 필드명 [asc, desc];)
- limit
    * select 필드명1, 필드명2, .. from 테이블명 limit 가져올 행의 갯수;
    * select 필드명1, 필드명2, .. from 테이블명 limit 시작행, 가져올 행의 갯수;
- 집계 함수
    * count: 행의 갯수를 세는 함수
    * sum: 행의 값을 더함
    * avg: 행 값의 평균을 구함
    * min: 행의 최소값을 구함
    * max: 행의 최대값을 구함
- 그룹 (select 그룹을 맺은 컬럼 또는 집계함수 from 테이블명 group by 그룹을 맺을 필드명;)