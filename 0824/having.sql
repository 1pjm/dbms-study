### select문 ###

-- 5. having절

-- sum() 집계 함수로 회원(mem_id)별 총 구매액 산정
select mem_id "회원 아이디", sum(price * amount) "총 구매 금액"
	from buy
    group by mem_id;

-- 결과 중 총 구매액이 1000 이상인 회원에게만 사은품 증정
select mem_id "회원 아이디", sum(price * amount) "총 구매 금액"
	from buy
    where sum(price * amount) >= 1000
    group by mem_id;
    # Error: Invalid use of group function
    # : 집계 함수는 where절에서 사용 불가

-- having절을 사용하여 집계 함수 조건을 사용
-- : having절은 where절과 유사(조건을 제한한다는 점에서)하지만
-- : 집계 함수에 대해서 조건을 제한하는 것
-- : group by와 관련된 조건절은 having을 사용해야 함

select mem_id "회원 아이디", sum(price * amount) "총 구매 금액"
	from buy
    group by mem_id
    having sum(price * amount) >= 1000
    order by sum(price * amount) desc;
