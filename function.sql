-- 숫자 타입 함수
-- 제공된 테이블 : dual
select ABS(-10) from dual;

-- 반올림 : round (수, 자릿수)
select round(3.875 ,2) from dual;

-- sal을 30일로 나눈후 소수 자리수에 따라 반올림한 값 출력
select sal 급여,
    sal/30 일급, 
    round(sal/30, 1) 결과1,
    round(sal/30, 0) 결과2,
    round(sal/30, -1) 결과3
from employee;

-- sal을 30일로 나눈후 소수 자리수에 따라 절삭(버림) 값 출력
select sal 급여,
    sal/30 일급, 
    trunc(sal/30, 1) 결과1,
    trunc(sal/30, 0) 결과2,
    trunc(sal/30, -1) 결과3
from employee;

-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
select custid 고객번호, round(avg(salprice), -2) 평균주문금액
    from orders
    group by custid;
    
select custid 고객번호, count(*) 주문횟수, sum(salprice) 총액
    from orders
    group by custid;    
    
select custid 고객번호, round(sum(salprice)/count(*),-2) 총액
    from orders
    group by custid;  
    
select * from customer;


-- 문자 타입 함수
select lower('ABCD') from dual;

-- substr(문자, 인덱스, 글자수)
select substr('ABC',1,2) result from dual;

-- replace(문자, 이전문자, 새로운문자)
select replace('ABC','A','E') result from dual;

-- concat(문자1, 문자2) - 문자 연결
select concat('A','B') result from dual;

-- 연결연산사 - '||'
select '안녕' || '하세요' result from dual;

-- lpad 는(문자,문자수,기호) - 기호를 왼쪽부터 채움
select lpad('cloud',10,'*') result from dual;
select rpad('cloud',10,'*') result from dual;

-- 부서이름에서 처음부터 시작해서 2개의 문자 출력
select substr(deptname, 1,2)부서명
from dept;

-- 도서 제목에 '야구'가 포함된 도서를 '농구'로 변경하여 검색
select bookid, 
    replace(bookname, '야구','농구') bookname
from book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 검색
select bookname,
    length(bookname)문자수,
    lengthb(bookname)바이트수
    from book
    where publisher = '굿스포츠';
    
-- 날짜 함수
-- 20일 전의 날짜 출력
select sysdate -20 from dual;

-- 3개월 후의 날짜 출력
select add_months(sysdate,3)결과
from dual;

-- 3개월 전의 날짜 출력
select add_months(sysdate,-3)결과
from dual;

-- 3개월 전의 날짜 출력
select add_months('2023-4-1',-3)결과
from dual;

-- 날짜와 시간
select systimestamp from dual;

-- 주문 번호가 6애서 10사이인 도서의 주문일에 3개월을 더한값을 구하시오.
-- 1. 주문번호가 6~10인 도서 검색

select * from orders;

select orderid 주문번호 
    from orders
    where orderid >= 6 and orderid <= 10;
-- 2. 주문일에 3개월 더하기  
select orderid 주문번호, 
    add_months(orderdate, -3) 더한결과
    from orders
    where orderid >= 6 and orderid <= 10;    
    
-- 주문 번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수를 구하시오.
-- months_between()
select orderid 주문번호, orderdate 주문일,
    trunc(months_between(sysdate, orderdate),0)총개월수
    from orders
    where orderid = 10;
    
-- 서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오
select orderid 주문번호, orderdate 주문일, orderdate+10 확정일
    from orders;

-- 자동 타입 변환
select 1+'2' from dual;

-- 수동 타입 변환
-- 문자를 숫자 형식으로 변환
select to_number('120') from dual;

-- 날짜 형식 
select to_date('2022-6-30', 'yy-mm-dd') from dual;

-- 날짜 형식 변환
select to_char(sysdate, 'yy-mm-dd')날짜,
    to_char(sysdate, 'yyyy') 연도,
    to_char(sysdate, 'mm') 월,
    to_char(sysdate, 'dd') 일
    from dual;

-- 시간 형식 변환
select to_char(sysdate, 'hh:mi:ss am') 시간형식,
    to_char(sysdate, 'yyyy-mm-dd hh:mi:ss pm') 날짜와시간
from dual;

-- 고객 이름에서 같은 성을 가진 사람의 인원수를 구하시오
-- 흰트, group by절 , substr()
select substr(name,1,1 )성, count(*)인원
    from customer 
    group by substr(name,1,1);
    
    
    
    