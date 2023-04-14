-- order 테이블
create table orders(
    orderid number primary key,
    custid number not null,
    bookid number not null,
    salprice number,
    orderdate date,
    CONSTRAINT cus_fk foreign key(custid)
    REFERENCES customer(custid),
    CONSTRAINT book_fk FOREIGN key(bookid)
    REFERENCES book(bookid)
);

select * from orders;

-- orders 자료 삽입
insert into orders values(1,1,1,6000,to_date('2018-07-01', 'yyyy-mm-dd'));
insert into orders values(2,1,3,21000,to_date('2018-07-03', 'yyyy-mm-dd'));
insert into orders values(3,2,5,8000,to_date('2018-07-03', 'yyyy-mm-dd'));
insert into orders values(4,3,6,6000,to_date('2018-07-04', 'yyyy-mm-dd'));
insert into orders values(5,4,7,20000,to_date('2018-07-05', 'yyyy-mm-dd'));
insert into orders values(6,1,2,12000,to_date('2018-07-07', 'yyyy-mm-dd'));
insert into orders values(7,1,8,13000,to_date('2018-07-07', 'yyyy-mm-dd'));
insert into orders values(8,2,10,12000,to_date('2018-07-08', 'yyyy-mm-dd'));
insert into orders values(9,2,10,6000,to_date('2018-07-09', 'yyyy-mm-dd'));
insert into orders values(10,3,8,20000,to_date('2018-07-10', 'yyyy-mm-dd'));

commit;

-- 고객이 주문한 도서의 총 판매액을 구하시오
select sum(salprice) 총판매액, avg(salprice) 평균금액 from orders;

-- 서점의 도서 판매 건수를 구하시오
select count(*)총판매건수 from orders;
-- 2번 고객의 주문 내역

-- 2번 고객(김연아)이 주문한 도서의총 판매액을 구하시오
select * from orders where custid = 2;

select sum(salprice) 총매출 from orders where custid = 2;

-- 조인 (1개 테이블 이상 연결하는 법)
select cus.name, ord.salprice, ord.orderdate
from orders ord, customer cus
where ord.custid = cus.custid
and cus.name = '김연아';

-- 고객별로 주문한 도서의 총 판매액을 구하시오
select cus.name, sum(ord.salprice)
from orders ord, customer cus
where ord.custid = cus.custid
and cus.name = '김연아'
group by cus.name;

-- 집계를 구할때는 GROUP BY 절 사용, 조건은 HAVING절 사용
select cus.name as 이름, sum(ord.salprice) 총구매액
from orders ord, customer cus
where ord.custid = cus.custid
group by cus.name
having cus.name = '박지성';

-- 가격이 8000원 이상인 도서를 구매한 고객별 주문도서의 총 수량을 구하시오
select count(*)
from orders
where salprice >= 8000
group by custid;
-- 단 2권 이상 구매한 고객만 찾으시오.
select count(*)
from orders
where salprice >=8000
group by custid
having count(*) >=2;
