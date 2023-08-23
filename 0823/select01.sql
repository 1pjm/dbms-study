### select ###

-- select
-- : 구축이 완료된 테이블에서 데이터를 추출하는 기능

-- 1. 기본 조회하기: select ~ from
-- select문 사용 시 테이블 명 지정 방법
-- : 원래 테이블의 전체 이름은 `데이터베이스명.테이블명` 형식으로 지정
-- ex) market_db.members
-- : 데이터베이스명을 생략할 경우 use문 또는 마우스 더블클릭으로 선택한 데이터베이스가 자동으로 선택
use market_db;
select * from members; -- select * from market_db.members;
select * from buy;

-- 필요한 열만을 조회하는 경우
-- 여러 개의 열을 조회할 경우 콤마로 구분지어 작성
select mem_name, addr, debut_date from members;

-- 열 이름에 별칭(alias) 사용
-- 열 이름 다음에(띄어쓰기 한 칸) 지정하고 싶은 별칭 입력
-- 별칭에 공백이 있는 경우에는 따옴표로 묶어서 작성
select mem_name '멤버 이름', addr 주소, debut_date from members;

-- 2. select문의 기본 형식
-- select 열_이름 (전체 테이블 조회 시 * 사용)
-- 	 from 테이블_이름
-- 	 where 조건식
-- 	 group by 열_이름
-- 	 having 조건식
-- 	 order by 열_이름
-- 	 limit 숫자

-- 3. 특정한 조건만 조회하기: select ~ from ~ where
-- : where은 필요한 특정 데이터만을 골라서 결과를 조회
-- ex) select * from 쿠팡_회원_테이블; -> 너무 많은 데이터 조회되므로 조건조회

-- 3-1. 기본적인 where 절
-- select 열_이름
-- 	 from 테이블_이름
-- 	 where 조건식;

select *
	from members
    where mem_name = '에스파';

select *
	from members
    where mem_number = 4;
    
-- 3-2. 관계 연산자, 논리 연산자 사용

-- 관계 연산자(부등호)
-- >, <, >=, <=
select mem_id, mem_name
	from members
    where height >= 165;
    
-- 논리 연산자
-- and, or

-- and: 나열되는 여러 조건식이 모두 만족해야함
select mem_name, height, mem_number
	from members
    where height >= 165 and mem_number < 5;

-- or: 나열되는 여러 조건식 중에 하나만 만족해도 가능
select mem_name, height, mem_number
	from members
    where height >= 165 or mem_number < 5;
    
-- 3-3. between ~ and
-- 평균 키가 163 이상 165 이하인 회원의 이름과 평균 키 조회

select mem_name, height
	from members
    where height >= 163 and height <= 165;
    
-- 범위에 있는 값을 구하는 경우 between ~ and 사용
select mem_name, height
	from members
    where height between 163 and 165;

-- 3-2. in()
-- 경기, 전남, 경남 중 한 곳에 사는 회원을 검색

select mem_name, addr
	from members
    where addr = '경기' or addr = '서울' or addr = '경남';

-- in(): 조건식에서 여러 문자 중 하나에 포함되는지를 비교할 때 사용
select mem_name, addr
	from members
    where addr in('경기', '서울', '경남');

-- 3-5. like
-- : 문자열의 일부 글자를 검색
-- : 시작 글자 검색 시 ('에%')
-- : 끝 글자 검색 시 ('%파')
-- ex) 이름(mem_name)의 첫글자가 '에'로 시작하는 회원 검색
select *
	from members
    where mem_name like '에%';

select *
	from members
    where mem_name like '%파';

select *
	from members
    where mem_name like '%스%';

-- 한 글자와 매치하기 위해서는 언더바(_)를 사용
-- ex) 이름(mem_name)의 앞 두 글자는 상관없고 뒤는 '핑크'인 회원을 검색

select *
	from members
    where mem_name like '__핑크';
