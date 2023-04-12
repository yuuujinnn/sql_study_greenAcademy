-- order ���̺�(�ֹ���ȣ, ����ȣ, ������ȣ, �ǸŰ���, �ֹ���)
CREATE TABLE orders (
    orderid NUMBER PRIMARY KEY,
    custid  NUMBER NOT NULL,
    bookid  NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    -- �ܷ�Ű ����
    CONSTRAINT cus_fk FOREIGN KEY(custid)
    REFERENCES customer(custid),
    CONSTRAINT book_fk FOREIGN KEY(bookid)
    REFERENCES book(bookid)
);

-- orders �ڷ� ����
INSERT INTO orders VALUES (1, 1, 1, 6000, TO_DATE('2018-07-01', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (2, 1, 3, 21000, TO_DATE('2018-07-03', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (3, 2, 5, 8000, TO_DATE('2018-07-03', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (4, 3, 6, 6000, TO_DATE('2018-07-04', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (5, 4, 7, 20000, TO_DATE('2018-07-05', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (6, 1, 2, 12000, TO_DATE('2018-07-07', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (7, 4, 8, 13000, TO_DATE('2018-07-07', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (8, 3, 10, 12000, TO_DATE('2018-07-08', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (9, 2, 10, 7000, TO_DATE('2018-07-09', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (10, 3, 8, 13000, TO_DATE('2018-07-10', 'YYYY-MM-DD'));
-- INSERT INTO orders VALUES (11, 5, 11, 13000, TO_DATE('2018-07-10', 'YYYY-MM-DD'));


SELECT * FROM orders;

-- ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(saleprice) ���Ǹž�, AVG(saleprice) ��ձݾ�
FROM orders;

-- ������ ���� �Ǹ� �Ǽ��� ���Ͻÿ�
SELECT COUNT(*) ���ǸŰǼ�
FROM orders;

-- 2�� ���� �ֹ����� �˻��ϱ�
SELECT *
FROM orders
WHERE custid = 2;

-- 2�� ��(�迬��)�� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(saleprice) �Ѹ���
FROM orders
WHERE custid = 2;

-- ������ 8000�� �̻��� ������ ������ ���� �ֹ������� �� ������ ���Ͻÿ�
-- ��, 2�� �̻� ������ ���� ã���ÿ�
SELECT custid, COUNT(*) �Ѽ��� 
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2;


-- ����(1�� ���̺� �̻� �����ϴ� ���)
SELECT cus.name, cus.phone, ord.saleprice, ord.orderdate
FROM orders ord, customer cus
WHERE ord.custid = cus.custid
AND cus.name = '�迬��';

-- �� �̸����� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
-- ���踦 ���Ҷ��� GROUPBY �� ���
-- HAVING ���� GROUP BY�� ���� ��� ��Ÿ���� �׷��� �����ϴ� ����
SELECT cus.name, SUM(ord.saleprice)
FROM orders ord, customer cus
WHERE ord.custid = cus.custid
GROUP BY cus.name
HAVING cus.name = '������';

COMMIT;












