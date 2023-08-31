### 트리거 복습문제 ###

-- after update, after delete 트리거 사용

-- 1. employees 직원 테이블 생성
-- employee_id 숫자(정수) 기본 키 설정
-- first_name varchar(50)
-- last_name varchar(50)
-- salary 숫자(정수)
drop table if exists employees;
create table employees (
	employee_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    salary int
);

-- 2. audit_log 테이블
-- log_id 숫자(정수) 자동 증가 기본 키 설정
-- employee_id 숫자(정수)
-- action varchar(50)
-- timestamp timestamp(타입) default current_timestamp
drop table if exists audit_log;
create table audit_log (
	log_id int auto_increment primary key,
    employee_id int,
    action varchar(50),
    timestamp TIMESTAMP default current_timestamp
    # TIMESTAMP: 데이터 타입
    # : 날짜와 시간을 저장 하는데 사용 (기본값 지정하지 않으면 현재 날짜와 시간)
);

-- 트리거 설정
-- after update
-- : 직원 테이블이 수정될 경우
-- : audit_log 테이블에 직원 아이디와 활동을 저장
-- : 직원 아이디는 new.employee_id
-- : 활동은 'Updated Salary'
drop trigger if exists empUpdateTrg;
delimiter $$
create trigger empUpdateTrg
	after update
    on employees
    for each row
begin
	insert into audit_log (employee_id, action)
    values (new.employee_id, 'Updated Salary'); # new: 새로 받아와 저장하기 때문
end $$
delimiter ;

-- after delete
-- : 직원 테이블이 삭제될 경우
-- : audit_log 테이블에 직원 아이디와 활동을 저장
-- : 해당 old 테이블에서 직원 아이디 불러오기
-- : 활동은 'Deleted Employee'
drop trigger if exists empDelTrg;
delimiter $$
create trigger empDelTrg
	after delete
    on employees
    for each row
begin
	insert into audit_log (employee_id, action)
    values (old.employee_id, 'Deleted Employee'); # old: 이미 있는 값을 불러오기 때문
end $$
delimiter ;

insert into employees
values
(1, 'Do il', 'Nam', 50000),
(2, 'Jun Gook', 'Lee', 55000),
(3, 'Gyeong Su', 'Do', 60000);

update employees set salary = 65000 where employee_id = 1;

select * from audit_log;

insert employees values (4, 'Hello', 'Kim', 45000);

delete from employees where employee_id = 4;

select * from audit_log;
