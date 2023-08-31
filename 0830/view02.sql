### 뷰의 실제 작동 ###

-- 뷰의 실제 생성, 수정, 삭제

use market_db;

-- 1. 뷰 생성
-- : create view  구문 사용

create view v_viewtest1
as
	select b.mem_id 'Member ID', m.mem_name as 'Member Name',
		b.prod_name "Product Name",
        concat(m.phone1, m.phone2) as 'Office Phone'
	from buy b
		inner join members as m
        on b.mem_id = m.mem_id;

-- 뷰를 조회하는 경우 열 이름에 공백이 있을 때 백틱으로 묶어줘야함
select distinct `Member ID`, `Member Name` from v_viewtest1;

-- 2. 뷰 수정
-- : alter view 구문 사용

alter view v_viewtest1
as
	select b.mem_id '회원 아이디', m.mem_name as '회원 이름',
		b.prod_name "제품 이름",
        concat(m.phone1, m.phone2) as '연락처'
	from buy b
		inner join members as m
        on b.mem_id = m.mem_id;

select distinct `회원 아이디`, `회원 이름` from v_viewtest1;

-- 3. 뷰 삭제
-- : drop view 구문 사용

drop view v_viewtest1;

-- 데이터베이스 개체는 서로 완전히 다른 기능을 하지만
-- 생성/수정/삭제하는 문법은 거의 동일
-- >>> 데이터베이스 개체: 데이터베이스 내에서 만들어지는 영역
-- 				   ex) 테이블, 뷰, 스토어드 프로시저, 트리거 등
