### 서브 쿼리 ###

-- 서브 쿼리
-- : select문 안에 또 다른 select문(서브 쿼리, 하위 쿼리)을 사용

-- ex) 이름(mem_name)이 '에스파'인 회원의
-- 		평균 키(height)보다 큰 회원을 검색하고 싶은 경우

-- 1. 에스파의 평균 키 검색
select height
	from members
    where mem_name = '에스파';

-- 2. 평균 키가 167을 초과하는 회원을 조회
select mem_name, height
	from members
    where height > 167;

-- 서브 쿼리를 사용하여 하나의 SQL문으로 작성
select mem_name, height
	from members
    where height > (select height from members where mem_name = '에스파');
