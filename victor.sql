-- 부서테이블 (detp)
CREATE TABLE dept(
    deptno VARCHAR2(4) PRIMARY key,
    deptname VARCHAR2(20) not null,
    office VARCHAR2(10)
);

drop table dept;
desc dept;

INSERT INTO dept VALUES ('1000','인사팀','서울');
INSERT INTO dept VALUES ('1001','전산팀','수원');
INSERT INTO dept VALUES ('1002','전산팀','인천');
INSERT INTO dept(deptno, deptname) VALUES ('1003','영업팀');

select * from dept order by deptno desc;

select deptno as 부서코드 from dept; 

commit;

delete from dept where deptno='1003';

rollback;

