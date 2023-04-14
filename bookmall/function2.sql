-- function
-- null 값 처리하기
create table k1(
    id varchar2(3),
    cnt number(2)
);

select * from customer
where phone is not null;

-- nal (칼럼이름, 값) : 칼럼이름 null인 경우는 특정 값으로 출력
select custid, name, address, nvl(phone, '010-1234-5678') 전화번호
from customer;

insert into k1 values ('가',5);
insert into k1 values ('나',null);
insert into k1 values ('다',5);
insert into k1 values ('라',null);
insert into k1 values ('마',10);

select * from k1;

commit;

-- 전체 갯수, 합계, 평균, 최소값
select count(cnt)from k1; -- 3개
-- null을 0으로 바꿈
select count(nvl(cnt,0)) count from k1; -- 5개

select sum(nvl(cnt,0))/4 sum from k1; -- 5개

select avg(nvl(cnt,0))avg from k1; -- 4개
-- null을 5로 변경
select min(nvl(cnt,5)) min from k1; -- 5개

-- rank() 함수
select ename,
        sal,
        rank() over(order by sal desc) 급여_rank,
        dense_rank() over(order by sal desc) 급여_desnse_rank
from employee;





