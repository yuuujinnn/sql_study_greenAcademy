-- customer 테이블(고객번호, 이름, 주소, 전화번호)
create table customer(
    custid number primary key,
    name VARCHAR2(40)not null,
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

insert into customer values(1, '박지성' ,'영국 맨체스터', '000-5000-0001');
insert into customer values(2, '김연아' ,'대한민국 서울', '000-6000-0001');
insert into customer values(3, '안산' ,'대한민국 광주광역시', '000-7000-0001');
insert into customer values(4, '류현진' ,'미국 토론토', null);
insert into customer values(5, '손흥민' ,'영국 토트넘', '000-8000-0001');
insert into customer values(6, '김하늘' ,'대한민국 성남시', '000-9000-0001');
insert into customer values(7, '박대양' ,'대한민국 용인시', '000-9000-0002');
insert into customer values(6, '김하늘' ,'대한민국 성남시', '000-9000-0001');
insert into customer values(7, '박대양' ,'대한민국 용인시', '000-9000-0002');

select * from customer;

-- 전화번호가 없는 고객을 찾으시오
select * from customer where phone is null;

-- 주소가 대한민국 인 고객을 찾으시오
select * from customer where address like '%대한민국%';

commit;

