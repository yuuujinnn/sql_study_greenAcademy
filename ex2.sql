-- 날짜 자료형
create table ex2(
    col_date date,
    col_timestamp TIMESTAMP
);
-- hire_date varchar2(20);
-- insert into ex2 values ('2023-01-25');

-- 자료 삽입
insert into ex2 values (sysdate, systimestamp);
insert into ex2 values (sysdate, systimestamp);

-- 자료 검색
select * from ex2;
