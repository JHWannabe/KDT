/*
	트랜잭션(TRANSACTION)
    - 분할이 불가능한 업무처리의 단위
    - 한꺼번에 수행되어야 할 연산 모음
    
    commit: 모든 작업들을 정상 처리하겠다고 확정하는 명령어로서, 해당 처리 과정을 DB에 영구적으로 저장
    rollback: 작업 중 문제가 발생되어 트랜잭션의 처리 과정에서 발생한 변경하상을 모두 취소하는 명령어
    
    start transaction
		블록 안의 명령어들은 하나의 명령어처럼 처리됨
        ...
        성공하던지, 실패하던지 둘 중 하나의 결과가 됨
        문제가 발생하면 rollback;
	정상적인 처리가 완료되면 commit;
    
    트랜잭션의 특징
    - 원자성: 트랜잭션이 데이터베이스에 모두 반영되던가, 아니면 전혀 반영되지 않아야 함.
    - 일관성: 트랜잭션의 작업 처리 결과가 항상 일관성이 있어야 함
    - 독립성: 어떤 하나의 트랜잭션이라도, 다른 트랜잭션의 연산에 끼어들 수 없음
    - 영구성(지속성): 결과는 영구적으로 반영되어야 함
*/
# 자동 커밋 확인
show variables like '%commit%';
# autocommit: ON -> 자동으로 commit 해줌
# set autocommit=0 (off). set autocommit=1 (on)
set autocommit=0;

select * from product;
start transaction; # 트랜잭션의 시작, commit 또는 rollback으로 끝내야 함
insert into product values ('100005', '고철', '팔아요', 100, now());
select * from product; # '고철' 삽입되어 있음
commit; # 트랜잭션을 DB에 적용

start transaction; # 트랜잭션의 시작, commit 또는 rollback으로 끝내야 함
insert into product values ('100006', '공병', '팔아요', 50, now());
select * from product; # '공병' 삽입되어 있음
rollback; # 트랜잭션을 취소하고 start transaction 실행 전 상태로 롤백함
select * from product; # '공병' 삭제되어 있음

# 트랜잭션의 예외
# DDL문(create, drop, alter, rename, truncate)에 대해 예외를 적용 -> rollback 대상이 아님

# truncate
# 개별적으로 행을 삭제할 수 없으며, 테이블 내부의 모든 행(데이터)를 삭제
# rollback이 불가능
# 트랜잭션 로그에 한 번만 기록하므로 delete 구문보다 성능 면에서 빠름
# truncate table 테이블명 = delete from 테이블명
select * from product_new;
start transaction;
delete from product_new;
select * from product_new;
rollback; # delete 이전으로 돌아옴

start transaction;
truncate table product_new;
select * from product_new;
rollback; # truncate 이전으로 돌아오지 않음

set autocommit = 1;
show variables like '%commit%';