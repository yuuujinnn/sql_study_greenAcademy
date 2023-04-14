-- 조인과 서브쿼리

select * from customer;
select * from book;
select * from orders;


-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
select cus.custid, cus.name, ord.salprice, ord.orderdate 
    from customer cus, orders ord
    where cus.custid = ord.custid
    -- and cus.name ='박지성'; -- 김연아 고객의 주문내역
   -- and salprice >= 20000;  -- 판매가격이 20000원 이상인 주문내역
   and orderdate = '2018-7-8'; -- 주문일이 2018-7-8인 주문 내역
   
-- 고객 이름별로 주문한 모든 도서의 총 판매액을 구하시오
select cus.name, sum(salprice)판매금액,
    rank() over(order by sum(salprice)desc)순위
    from customer cus, orders ord
    where cus.custid = ord.custid
    group by cus.name;
    
-- 고객의 이름과 고객이 주문한 도서의 이름을 검색하시오
select cus.custid, cus.name, ord.salprice, ord.orderdate 
    from customer cus, orders ord, book boo
    where cus.custid = ord.custid
    and boo.bookid = ord.bookid
    order by cus.name; -- 정렬을 하면 그룹화도 가능

-- 가장 비싼 도서의 이름을 검색하시오
select max(sal) from book; -- 35000

select bookname from book -- 골프 바이블
where sal = 35000;

-- 중첩쿼리
select bookname, price
from book
where price = (select max(price) from book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
-- 1. 주문 테이블에서 고객아이디 검색
select custid from orders;
-- 2. 고객 아이디가 있는 고객 이름 검색
select name from customer
WHERE custid IN(1, 2, 3, 4);

WHERE custid in(select custid from orders);

-- 도서를 구매한 적이 없는 고객의 이름을 검색하시오
select name from customer
where custid not in(select custid from orders);

-- '김연아' 고객의 주문내역을 검색하시오
--1. 김연아 고객의 아이디 검색
--2. 김연아 고객의 아이디로 주문테이블에서 검색
SELECT custid
FROM customer
WHERE name = '김연아';

SELECT *
FROM orders
where custid=(select custid from customer where name = '김연아');


-- 인라인 뷰 : FROM 부속질의
-- 고객번호가 2이하인 고객의 판매액을 검색하시오.
SELECT cus.name, SUM(ord.saleprice)
FROM (SELECT custid, name FROM customer WHERE custid <= 2) cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- 뷰(View) 생성
-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
-- CREATE VIEW 뷰이름
-- AS SELECT 문

CREATE VIEW vw_Customer
AS SELECT * FROM customer
WHERE address LIKE '%대한민국%';
-- 뷰 검색
SELECT * FROM vw_Customer;
-- 뷰 삭제
DROP VIEW vw_Customer;

-- 뷰 만들기 : 고객의 이름과 주문한 도서의 이름과 가격을 검색하시오
CREATE VIEW vw_Orders
AS SELECT cus.name, bo.bookname, ord.saleprice
FROM customer cus, orders ord, book bo
WHERE cus.custid = ord.custid
AND bo.bookid = ord.bookid;

-- 뷰로 검색
SELECT * FROM vw_Orders;



-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
select cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- STANDARD JOIN (FROM 절에 INNER JOIN ~ ON : 동등조인)
select cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- OUTER JOIN : 외부 조인
-- JOIN 조건에 충족하는 데이터가 아니어도 출력될 수 있는 방식
-- LEFT OUTER JOIN, RIGHT OUTER JOIN
-- 주문이 없는 고객을 포함하여 고객의 주문에 관한 데이터를 모두 검색하시오.
select cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;


