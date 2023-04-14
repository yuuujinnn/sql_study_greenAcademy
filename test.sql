-- 연습문제
select * from customer;
select name, address, phone from customer;
select * from customer where address like '%영국%';
select * from customer where name in ('김연아', '안산');
select * from customer where address not like '%대한민국%';
select * from customer where phone is null;
select * from customer order by name;
select count(*) 총인원수 from customer;

commit;