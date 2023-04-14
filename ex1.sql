-- 문자 자료형 비교
create table ex1(
    column1 CHAR(10),
    column2 VARCHAR2(10)
);

-- 자료추가
INSERT into ex1(column1, column2) VALUES ('abc', 'abx');
insert into ex1 values ('강남', '강남');
-- 자료 조회
select column1, length(column1) len1, column2, length(column2) len2
from ex1;

commit;
