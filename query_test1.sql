-- ��������

-- 1.
select name, address from customer;

-- 2. 
select name, address, phone from customer;

-- 3.
SELECT *
FROM customer
WHERE address not like '%����%';

-- 4.
SELECT *
FROM customer
WHERE name in ('�迬��', '�Ȼ�');

-- 5.
SELECT *
FROM customer
WHERE address not like '���ѹα�%';

-- 6.
SELECT *
FROM customer
WHERE phone IS NULL;

-- 7.
SELECT * FROM customer ORDER BY name;

-- 8.
SELECT COUNT(*) ���ο��� FROM customer;
