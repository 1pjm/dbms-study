### SQL 프로그래밍 ###

-- 스토어드 프로시저
-- : MySQL에서 프로그래밍 기능이 필요할 때 사용하는 데이터베이스 개체
-- : SQL 프로그래밍은 기본적으로 스토어드 프로시저 안에 작성 되어야함

delimiter $$ # 기호 2개를 연속해서 사용하는 것이 일반적 (관례적으로 $$ 사용)
create procedure sqlProgramming()
begin
	# 이 부분에 SQL 프로그래밍 코딩
end $$ # 스토어드 프로시저 종료
-- 스토어드 프로시저의 코딩 부분
delimiter ;

call sqlProgramming(); # 스토어드 프로시저 실행
