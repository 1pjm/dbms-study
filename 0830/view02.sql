### 뷰의 실제 작동 ###

-- 뷰의 실제 생성, 수정, 삭제

use market_db;

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

-- 뷰 수정
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
