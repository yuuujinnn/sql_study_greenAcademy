-- book ���̺�(������ȣ, �����̸�, ���ǻ�, ��������)
CREATE TABLE book(
    bookid  NUMBER PRIMARY KEY,
    bookname  VARCHAR2(50) NOT NULL,
    publisher VARCHAR2(50) NOT NULL,
    price  NUMBER NOT NULL
);

-- �̸� ����
-- ALTER TABLE book RENAME COLUMN price TO saleprice;
-- �ڷ��� ����
-- ALTER TABLE book MODIFY bookname VARCHAR2(60);


DESC book;


-- book �ڷ� �Է�
INSERT INTO book VALUES (1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book VALUES (2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book VALUES (3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book VALUES (4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book VALUES (5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book VALUES (6, '����� ����', '�½�����', 6000);
INSERT INTO book VALUES (7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO book VALUES (8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO book VALUES (9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Person', 13000);


-- �ڷ� �˻�
SELECT * FROM book;

-- ��� ������ �̸��� ������ �˻��Ͻÿ�
SELECT bookname, price 
FROM book;

-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�(�ߺ� ����)
SELECT DISTINCT publisher
FROM book;

-- Ư���� ����(WHERE ��)
-- ������ 20000�� �̸��� ������ �˻��Ͻÿ�
SELECT *
FROM book
WHERE price < 20000;

-- ������ 10000�� �̻� 20000�� ������ ������ �˻��Ͻÿ�(BETWEEN ~ AND)
SELECT *
FROM book
WHERE price
BETWEEN 10000 AND 20000;

SELECT *
FROM book
WHERE price >= 10000 
AND price <= 20000;


-- OR ����, IN('a', 'b')
-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�
SELECT *
FROM book
WHERE publisher IN ('�½�����', '���ѹ̵��');

SELECT *
FROM book
WHERE publisher = '�½�����' OR publisher = '���ѹ̵��';

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�
SELECT publisher
FROM book
WHERE bookname LIKE '�౸�� ����';

-- ���� �̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�
SELECT *
FROM book
WHERE bookname LIKE '%�౸%';

-- �౸�� ���� ���� �� ������ 20000�� �̻��� ������ ã���ÿ�
SELECT *
FROM book
WHERE bookname LIKE '%�౸%' 
AND price >= 20000;

-- ������ �Ѱ����� ���Ͻÿ�
SELECT COUNT(*) �����Ѽ�
FROM book;

-- ���� ������ ���� ������ �� ������ ������ �˻��Ͻÿ�
SELECT MAX(price)
FROM book;

-- ���� ����(��ø����, sub query)
SELECT bookname, price
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- ���� ������ ���� ������ �����Ͻÿ�
-- ������ ������ ���ǻ縦 �������� �����ϱ�
SELECT *
FROM book
ORDER BY price DESC, publisher ASC;




