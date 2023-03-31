create database hw;
use hw;

create table Student(
	학번 int primary key,
    이름 varchar(50) not null,
    연락처 varchar(20),
    이메일 varchar(100),
	주소 varchar(50),
    등록날짜 timestamp default now()
);

create table Grade(
	학번 int unique,
    자바 int,
    파이썬 int,
    C언어 int,
    총점 int,
    평균 float,
    등록날짜 timestamp default now(),
    FOREIGN KEY (학번) REFERENCES Student(학번)
);

create view vw_student as select s.학번, s.이름, s.연락처, s.이메일, s.주소, g.평균 from Student s left outer join Grade g on s.학번=g.학번;
create view vw_grade as select 학번, 자바, 파이썬, C언어, 총점, 평균 from Grade;
select * from vw_student order by 평균 desc;
select * from vw_grade;