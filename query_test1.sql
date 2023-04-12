-- 연습문제

-- 1.
select name, address from customer;

-- 2. 
select name, address, phone from customer;

-- 3.
SELECT *
FROM customer
WHERE address not like '%영국%';

-- 4.
SELECT *
FROM customer
WHERE name in ('김연아', '안산');

-- 5.
SELECT *
FROM customer
WHERE address not like '대한민국%';

-- 6.
SELECT *
FROM customer
WHERE phone IS NULL;

-- 7.
SELECT * FROM customer ORDER BY name;

-- 8.
SELECT COUNT(*) 총인원수 FROM customer;
