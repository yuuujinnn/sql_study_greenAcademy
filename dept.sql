-- 부서 테이블(dept)
CREATE TABLE dept(
    -- 칼럼이름 자료형
    deptno  VARCHAR2(4) PRIMARY KEY,
    deptname    VARCHAR2(20)NOT NULL,
    office  VARCHAR2(10)
);

-- 이상 현상 해결
-- 부서코드 : 식별자(Identifier) - 기본키(PRIMARY KEY) 속성 추가
-- 부서명 : 필수 입력 사항 (NOT NULL 속성 추가)

DESC dept;

-- 부서 추가
INSERT INTO dept(deptno, deptname, office) VALUES ('1000', '인사팀', '서울');
INSERT INTO dept(deptno, deptname, office) VALUES ('1001', '전산팀', '수원');
INSERT INTO dept(deptno, deptname, office) VALUES ('1002', '전산팀', '수원');
INSERT INTO dept(deptno, deptname) VALUES ('1003', '영업팀');

-- 실행 완료 : 트랜잭션의 한부분
COMMIT;

-- 부서 자료 검색 (as 별칭 - alias)
SELECT * FROM dept;
SELECT deptno as 부서코드, deptname as 부서명 FROM dept;

SELECT * FROM dept WHERE deptno = '1002';

/* 부서 테이블 삭제 */
DROP TABLE dept;