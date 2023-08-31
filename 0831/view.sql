### VIEW 활용 ###

-- 1. 뷰의 정보 확인
-- : 기존에 생성되어 있는 뷰에 대한 정보를 조회

use market_db;

-- 기존의 view가 존재하는 경우 삭제
-- drop view if exists v_viewtest2;
-- create view v_viewtest2 ~~;

create or replace view v_viewtest2 # 뷰를 생성하거나 교체
# 기존에 뷰가 있어도 덮어쓰기 효과를 나타내기 때문에 오류 발생 X

as
	select mem_id, mem_name, addr from members;

-- describe문으로 기존 뷰의 정보를 확인 가능
-- describe는 줄여서 desc
describe v_viewtest2;
desc v_viewtest2;

-- 뷰에서 사용하는 desc문은 PK키에 대해서는 확인 불가
describe members;

-- 2. 뷰의 소스 코드 확인
-- : show create view문으로 확인 가능
-- Form Editor 창에서 확인 가능
show create view v_viewtest2;

-- 3. 뷰를 이용한 데이터의 수정/삭제

-- 수정
update v_members set addr = '부산' where mem_id = 'BLK';

-- 입력
insert into v_members (mem_id, mem_name, addr)
values ('EXO', '엑소', '경기');
# Error: mem_number는 not null, mem_number가 view에 존재하지 않음
# : 기존 테이블(members)에서 기본값을 지정하거나, null 허용이 되어 있어야함

-- 지정한 범위로 뷰를 생성
-- : 평균 키가 167이상인 뷰를 생성
create view v_height167
as
	select * from members where height >= 167;

select * from v_height167;

-- 삭제
-- : v_height167 뷰에서 키가 167 미만인 데이터를 삭제
delete from v_height167 where height < 167;
# v_height167에는 키 167 미만의 데이터가 없기 때문에 삭제될 데이터가 없음

-- 뷰를 통한 데이터 입력
-- v_height167 뷰에 키가 167 미만인 데이터를 입력
insert into v_height167
values('TAR', '티아라', 4, '서울', null, null, 160, '2009-07-29');

select * from v_height167;

-- with check option문을 사용하여
-- 뷰에 설정된 값의 범위가 벗어나는 값은 입력되지 않도록 지정 가능
alter view v_height167
as
	select * from members where height > 167
		with check option;

insert into v_height167
values('STC', '스테이씨', 6, '경남', null, null, 159, '2020-11-12');
# Error

-- 뷰가 참조하는 테이블의 삭제
-- 여러 뷰와 연관된 테이블이라도 삭제 가능
drop table if exists buy, members;

select * from v_height167;
# Error: 참조하는 테이블이 없기 때문에 조회 불가

-- 뷰가 조회되지 않을 경우 check table문으로 뷰의 상태 확인 가능
check table v_height167;
