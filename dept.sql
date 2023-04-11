-- �μ� ���̺�(dept)
CREATE TABLE dept(
    -- Į���̸� �ڷ���
    deptno  VARCHAR2(4) PRIMARY KEY,  -- �ߺ��˻� ����
    deptname    VARCHAR2(20) NOT NULL,
    office  VARCHAR2(10)
);

-- �̻� ���� �ذ�
-- �μ��ڵ� : �ĺ���(Identifier) - �⺻Ű(PRIMARY KEY) �Ӽ� �߰�
-- �μ��� : �ʼ� �Է� ���� (NOT NULL �Ӽ� �߰�)

DESC dept;

-- �μ� �߰�
INSERT INTO dept(deptno, deptname, office) VALUES ('1000', '�λ���', '����');
INSERT INTO dept(deptno, deptname, office) VALUES ('1001', '������', '����');
INSERT INTO dept(deptno, deptname, office) VALUES ('1002', '������', '����');
INSERT INTO dept(deptno, deptname) VALUES ('1003', '������');

-- ���� �Ϸ� : Ʈ������� �Ѻκ�
COMMIT;

-- �μ� �ڷ� �˻� (as ��Ī - alias)
SELECT * FROM dept;
SELECT deptno as �μ��ڵ�, deptname as �μ��� FROM dept;

-- Ư���� �ڷ� �˻� : WHERE �� ����
SELECT * FROM dept
WHERE deptno = '1002';

-- �ڷ� ���� : ORDER BY Į���� (ASC/DESC)
SELECT * FROM dept
ORDER BY deptno DESC;

-- �μ���ȣ�� 1002�� �μ��� 'ȸ����'���� �����Ͻÿ�
UPDATE dept
SET deptname = 'ȸ����'
WHERE deptno = 1002;

-- �˻�
SELECT * FROM dept;


/* �μ� ���̺� ���� */

DELETE FROM dept
WHERE deptno = '1003';

DROP TABLE dept;