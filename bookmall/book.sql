-- book 테이블(도서번호, 도서이름, 출판사, 도서가격)
CREATE TABLE book(
    bookid  NUMBER PRIMARY KEY,
    bookname  VARCHAR2(50) NOT NULL,
    publisher VARCHAR2(50) NOT NULL,
    price  NUMBER NOT NULL
);

-- book 자료 입력
INSERT INTO book VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO book VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES (6, '양궁의 실제', '굿스포츠', 6000);
INSERT INTO book VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Person', 13000);


-- 자료 검색
SELECT * FROM book;

-- 모든 도서의 이름과 가격을 검색하시오
SELECT bookname, price 
FROM book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오(중복 제거)
SELECT DISTINCT publisher
FROM book;


