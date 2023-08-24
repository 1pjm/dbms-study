### 0824 정리 ###

-- 1. order by
-- : 결과가 출력되는 순서를 조절(정렬)
-- : 오름차순(asc - 생략 가능), 내림차순(desc) 선택 가능

-- 2. limit
-- : 출력하는 개수를 제한
-- : order by와 주로 함께 사용

-- 3. distinct
-- : 조회된 결과에서 중복된 것은 1개만 남기는 기능
-- : 열 이름 앞에 붙여서 사용

-- 4. group by
-- : 데이터를 그룹으로 묶어주는 기능

-- 5. having
-- : 집계 함수와 관련된 조건을 제한
-- : group by 다음에 작성

### 복습 문제 ###

-- 1. group by를 사용하여 각 회원이 구매한 물품의 총 개수를 작성
select mem_id, count(prod_name) as total_products_purchased
	from buy
    group by mem_id;

-- 2. group by와 having을 사용하여
-- 3개 이상의 물품을 구매한 회원의 id와 해당 물품의 총 개수를 작성

select mem_id, count(prod_name) total_products_purchased
	from buy
    group by mem_id
    having total_products_purchased >= 3;

-- 3. distinct를 사용하여 buy 테이블에서 구매된 물품의 이름 나타내기

select distinct prod_name
	from buy;

-- 4. order by를 사용해 members 테이블의
-- 		회원들을 데뷔 날짜에 따라 오름차순 나열

select mem_id, mem_name, debut_date
	from members
    order by debut_date asc;

-- 5. limit를 사용해 buy 테이블에서 단가가 가장 높은 5개 물품 나타내기

select distinct prod_name, price
	from buy
    order by price desc
    limit 5;

-- 6. group by와 order by를 사용해 각 분류별로 팔린 물품의 평균 가격 나타내기
-- 		결과는 평균 가격이 높은 순 나열

select group_name, avg(price) as average_price
	from buy
    group by group_name
    order by average_price desc;


-- 7. group by, having 및 limit를 사용해
-- 		평균 가격이 10 이상인 분류 중 상위 3개의 분류 나타내기

select group_name, avg(price) average_price
	from buy
    group by group_name
    having average_price >= 10
    order by average_price desc
    limit 0, 3;
