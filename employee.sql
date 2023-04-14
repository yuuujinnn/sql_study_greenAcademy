-- 사원 테이블(부서와 관계를 맺은)
CREATE TABLE employee(
    empno   NUMBER(3) PRIMARY KEY,     -- 사원번호
    ename   VARCHAR2(20) NOT NULL,     -- 사원이름
    sal     NUMBER(10),                -- 급여
    createdate   DATE DEFAULT SYSDATE,  -- 등록일
    gender  VARCHAR2(10),
    deptno  VARCHAR2(4),
    -- 외래키(FOREIGN KEY) 제약조건
    CONSTRAINT emp_fk FOREIGN KEY(deptno)
    REFERENCES dept(deptno)
    -- ON DELETE CASCADE(부서를 삭제하면 참조하고 있는 사원도 삭제)
);    

-- 참조 무결성 제약 위배
-- 1. 사원이 소속된 부서를 삭제할때 '자식 레코드가 있다'는 오류발생
-- 2. 부서번호가 없는 사원 자료를 추가할 때 '부모키가 없다'는 오류발생

INSERT INTO employee VALUES (100, '이강', 2500000, SYSDATE, '남자', '1000');
INSERT INTO employee VALUES (101, '이산', 2000000, SYSDATE, '여자', '1001');
INSERT INTO employee VALUES (102, '박달', 1500000, SYSDATE, '남자', '1002');
INSERT INTO employee VALUES (103, '강하늘', 3500000, SYSDATE, '', '1003');
INSERT INTO employee VALUES (104, '양우주', 4500000, SYSDATE, '여자', '1000');
INSERT INTO employee VALUES (105, '강남', 2600000, SYSDATE, '여자', '1000');
INSERT INTO employee VALUES (106, '이해', 2500000, SYSDATE, '여자', '1000');
commit;

-- 사원 자료 검색
SELECT * FROM employee;

-- 성별이 남자이면서 급여가 250만원 이상인 사원을 검색하시오
SELECT * FROM employee 
WHERE gender = '남자'
AND sal >= 2500000;

-- 급여가 200만원 이상 300만원 이하인 사원을 검색하시오
SELECT * FROM employee 
WHERE sal >= 2000000 
AND sal <= 3000000;

-- BETWEEN ~ AND
SELECT * 
FROM employee 
WHERE sal BETWEEN 2000000 
AND 3000000;

-- 문자열 검색 : 일부 문자 포함 LIKE %문자%
-- 성이 '이'인 사원을 검색하시오
SELECT * 
FROM employee
WHERE ename LIKE '이%';

-- 사원 총 인원수를 구하시오
SELECT COUNT(*) as 사원수
FROM employee;

-- 중복없이 부서번호를 검색하시오 (DISTINCT 키워드)
SELECT DISTINCT deptno 부서번호
FROM employee;

-- GROUP BY 절(소속등 그룹화), HAVING 사용
-- 부서별 급여 총액을 구하시오
SELECT deptno 부서, SUM(sal) 급여총액, AVG(sal) 급여평균
FROM employee               --FROM절 1번
GROUP BY deptno            
HAVING AVG(sal) >= 3000000
ORDER BY AVG(sal) DESC;     -- 정렬이 5번(ORDER BY)



