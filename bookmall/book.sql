create table book(
    bookid NUMBER(10) PRIMARY key,
    bookname VARCHAR2(50) not null,
    publisher VARCHAR2(50) not null,
    price number not null
);

insert into book values(1,'축구의역사','굿스포츠','7000');
insert into book values(2,'축구아는 여자','나무수','13000');
insert into book values(3,'축구의 이해','대한미디어','22000');
insert into book values(4,'골프 바이블','대한미디어','35000');
insert into book values(5,'피겨 교본','굿스포츠','8000');
insert into book values(6,'양궁의 실체','굿스포츠','6000');
insert into book values(7,'야구의 추억','나무수','20000');
insert into book values(8,'야구를 부탁해','대한미디어','13000');
insert into book values(9,'올림픽 이야기','삼성당','7500');
insert into book values(10,'olympic champions','person','13000');

select * from book;

-- 모든 도서의 이름과 가격을 검색하시오
select bookname, price from book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오 (중복제거)
select distinct publisher as 출판사 from book;

-- 특정한 조건 (where 절)
-- 가격이 20000원 미만인 도서를 검색하시오
select * from book where price < 20000;

-- 가격이 10000이상 20000원 이하인 도서를 검색하시오
select * from book where price between 10000 and 20000;
select * from book where price >= 10000 and price <= 20000;

-- or 조건, IN('a', 'b')
-- 출판사가 '굿스포츠' 또는 '대한미디어인' 도서를 검색하시오
select * from book where publisher in ( '굿스포츠' , '대한미디어');
select * from book where publisher = '굿스포츠' or publisher = '대한미디어';

-- '축구의 이해'를 출간한 출판사를 검색하시오
select publisher from book where bookname like '축구의 이해';

-- 도서 이름에 '축구' 가 포함된 출판사를 검색하시오
select * from book where bookname like '축%';

-- 축구에 관한 도서 중 가격이 20000원 이상인 도서를 찾으시오
select * from book where bookname like '%축구%' and price >= 20000 ;

-- 도서의 총 갯수를 구하시오
select count(*) 도서총수 from book;

-- 도서중 가장 가격이 높은 도서를 구하시오
select max(price) 도서가격 from book;
-- 서브쿼리()
select bookname from book where price = (select max(price) 도서가격 from book);

-- 이름변경
-- alter table book rename column price to sal;
-- 자료형 변경
-- alter table book modify bookname VARCHAR2(60);

-- 도서 가격이 높은 순으로 정렬하시오
select sal from book order by sal desc;
-- 가격이 같으면 출판사를 오름차순 정렬하기
select * from book order by sal desc, publisher asc;
