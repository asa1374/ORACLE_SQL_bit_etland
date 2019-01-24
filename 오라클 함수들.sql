select * from emp;
-- empno ���
-- ename �����
-- job ����
-- mgr �޴���
-- hiredate �Ի���
-- sal ����
-- comm Ŀ�̼�
-- deptno �μ��ڵ�

select * from dept;
-- deptno
-- dname
-- loc

-- emp test 01
-- case ǥ��

select ename,
    case when sal > 2000
        then sal
        else 2000
    end revised_salary
from emp;

--����
--case when ���ǽ�
--  then ���ϰ��
--  else ������ ���
--end �÷������� ó��

--emp test 02
--�μ��������� �μ���ġ�� �̱��� ����,�ߺ�,���η� �����϶�
--����  east,������ -east, ��ī�� - center, �޶� -center
--�÷��� -area

select loc,
    case when loc in('NEW YORK','BOSTON') then '����'
         when loc in('CHICAGO','DALLAS') then '�ߺ�'
    end area
from dept;

-- EMP_TEST_03
-- �޿��� 3000 �̻��̸� HIGH, 1000 �̻��̸� MID, �̸��̸� LOW 

select sal,case when sal >= 1000 and sal < 3000 then 'mid'
            when sal >= 3000 then 'higt' 
            when sal < 1000 then 'low'
        end sal_detail
from emp;

-- EMP_TEST_04
-- �޿��� 2000 �̻��̸� ���ʽ� 1000, 
-- 1000 �̻��̸� 500,
-- 1000 �̸��̸� 0���� ����Ͻÿ�
-- �÷����� BONUS

select sal,case when sal >= 2000 then 1000
            when sal < 2000 and sal >= 1000 then 500
            when sal < 1000 then 0
        end bonus
from emp;

-- EMP_TEST_05
-- �Ŵ����� "BLAKE" �̸� NULL ǥ��, ���� ������ MGR ǥ��

select ename, empno,mgr,
    case when mgr like (select empno
                        from emp
                        where ename like 'BLAKE')
        then null
    else mgr
    end mgr
from emp;

--emp test 06
--���� �Ի��������� ���� �����͸� �����ϱ�
--extract()

select ename,deptno, extract(month from hiredate)�Ի��, sal
from emp;

--emp test 07
--����� month �����͸� 12���� ���� Į������ �����ϱ�

select ename,deptno,
    case �Ի�� when 1 then sal end "1��",
    case �Ի�� when 2 then sal end "2��",
    case �Ի�� when 3 then sal end "3��",
    case �Ի�� when 4 then sal end "4��",
    case �Ի�� when 5 then sal end "5��",
    case �Ի�� when 6 then sal end "6��",
    case �Ի�� when 7 then sal end "7��",
    case �Ի�� when 8 then sal end "8��",
    case �Ի�� when 9 then sal end "9��",
    case �Ի�� when 10 then sal end "10��",
    case �Ի�� when 11 then sal end "11��",
    case �Ի�� when 12 then sal end "12��"
from (select ename,deptno, 
    extract(month from hiredate)�Ի��, sal
    from emp);
--�Ʒ� �Լ���뺸�ٴ� case�� ����ϴ°� ����! 
select ename,
    deptno,
    decode(month,1,sal) "1��"
from (select ename,deptno, 
    extract(month from hiredate)month, sal
    from emp);

--emp test 08
--����� month �����͸� 12���� ���� Į������ ������ ��
--�μ����� �����ϱ�

select
    (select dname
    from dept d
    where d.deptno like e.deptno)
    deptno,
    avg(case �Ի�� when 1 then sal end) "1��",
    avg(case �Ի�� when 2 then sal end) "2��",
    avg(case �Ի�� when 3 then sal end) "3��",
    avg(case �Ի�� when 4 then sal end) "4��",
    avg(case �Ի�� when 5 then sal end) "5��",
    avg(case �Ի�� when 6 then sal end) "6��",
    avg(case �Ի�� when 7 then sal end) "7��",
    avg(case �Ի�� when 8 then sal end) "8��",
    avg(case �Ի�� when 9 then sal end) "9��",
    avg(case �Ի�� when 10 then sal end) "10��",
    avg(case �Ի�� when 11 then sal end) "11��",
    avg(case �Ի�� when 12 then sal end) "12��"
from (select deptno, 
    extract(month from hiredate)�Ի��, sal
    from emp) e
group by deptno;


--emp test 09
--������ ����
--����(leaf) �����ͱ��� 1�� �����Ѵ�.
--connect_by_isleaf ���� �������� �ش� �����Ͱ� �����������̸�
--1,�׷��� ������ 0�̴�.

select level,
        lpad(' ',4 * (level-1)) || empno ���,
        mgr ������,
        connect_by_isleaf isleaf
from emp
start with mgr is null
connect by prior empno like mgr;

-- emp test 10
--��������

select e1.empno ���, e1.mgr ������, e2.mgr "���� ������"
from emp e1
    join emp e2
        on e1.mgr like e2.empno
order by e2.mgr desc,2,1;

--���� ������ �Ҷ��� �̳� ���θ��� �ƿ��� ������ ����ϸ� �ȴ�.

--EMP TEST 11
--GROUP FUNCTION �׷��Լ�
--�Ϲ����� GRROUP BY �Լ�
select e1.empno ���, e1.mgr ������, e2.mgr "���� ������"
from emp e1
    left join emp e2
        on e1.mgr like e2.empno
order by 3 desc,2,1;

select dname �μ���,
    job ����,
    count(*) "��ü ���",
    sum(sal) "��ü �޿�"
from emp e,dept d
where e.deptno = d.deptno
group by rollup(dname,job);

--ANSI ���� ������ �Լ� ������
--AGGREGATE FUNCTION �����Լ� SUM(),MIN()...
--GROUP FUNCTION �׷��Լ�
--Ư���׸� ���� �Ұ踦 �ϴ� �Լ�
--ROLLUP : �ұ׷찣�� �Ұ踦 ����ϴ� �Լ�
--CUBE : ���������� �Ұ踦 ����ϴ� �Լ�
--WINDOW FUNCTION ������ �Լ�

select dname �μ���,
    job ����,
    count(*) "��ü ���",
    sum(sal) "��ü �޿�"
from emp e,dept d
where e.deptno = d.deptno
group by rollup(dname,job);

select case grouping(dname)
                when 1 then 'ALL DEPTS'
                else dname 
        end as "�μ���",
        case grouping(dname)
                when 1 then 'ALL JOB'
                else job 
        end as "������",
        count(*) "��ü ���",
        sum(sal) "��ü �޿�"
from emp e,dept d
where e.deptno = d.deptno
group by cube(dname,job);