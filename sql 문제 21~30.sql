-- Employees ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]
--[ job_id = ������ ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ���]

--  Jobs ���̺�
-- job_id �����ڵ�
-- job_title ����Ÿ��Ʋ
-- min_salary  �����޿�
-- max_salary �ְ�޿�
select * from tab;
-- *******************
-- [����021]
-- IT Programmer �Ǵ� Sales Man�� 
-- ������ �̸�, �Ի���, ������ ǥ��.
-- ******************* 
select e.first_name �̸�, e.hire_date �Ի���, j.job_title ������
from employees e
    inner join jobs j
    on e.JOB_ID like j.JOB_ID
where j.JOB_TITLE in ('Programmer','Sales Manager')
order by e.FIRST_NAME;

-- *******************
-- [����022]
-- �μ��� �� �������̸� ǥ��
-- (��, �÷����� ������ [����] �̸� �� �ǵ��� ...)
-- DEPARTMENTS ���� MANAGER_ID �� ������ �ڵ�
-- *******************  
select * from employees;
select * from departments;

select d.DEPARTMENT_NAME �μ���, e.FIRST_NAME "�Ŵ��� �̸�"
from Employees e
    join departments d
        on d.MANAGER_ID = e.EMPLOYEE_ID;

select * from departments
where manager_id is not null;

-- *******************
-- [����023]
-- ������(Marketing) �μ����� �ٹ��ϴ� ����� 
-- ���, ��å, �̸�, �ټӱⰣ
-- (��, �ټӱⰣ�� JOB_HISTORY ���� END_DATE-START_DATE�� ���� ��)
-- EMPLOYEE_ID ���, JOB_TITLE ��å��
-- *******************

select h.EMPLOYEE_ID ���, j.JOB_TITLE ��å, e.fname �̸�,
    trunc(h.END_DATE-h.START_DATE) �ټӱⰣ
from his h
    join job j
        on h.JOB_ID = j.JOB_ID
    join emp e
        on h.EID = e.EID
where e.DID like (select d.did
                    from dep d
                    where d.DNAME like 'Marketing'
                    );

-- *******************
-- [����024]
-- �� �μ��� ��ġ�� IT ������ �̸� ��� 
-- DEPARTMENT_NAME �μ���, �̸�(FIRST_NAME + [����] + LAST_NAME)���� ���
-- �̸��� �ߺ��Ǿ ��µ�. �� �Ѹ��� �����μ����� ������ ������
-- ******************* 
SELECT 
    DNAME �μ���, FNAME || ' ' || LNAME �̸�
FROM EMP E 
    JOIN JOB J
        ON E.JID LIKE J.JID
    JOIN DEP D
        ON E.DID LIKE D.DID
WHERE J.JID LIKE (SELECT JID 
                  FROM JOB 
                  WHERE TITLE LIKE 'Programmer');
-- *******************
-- [����025]
-- �μ���, ������ �̸�, �μ���ġ ���� ǥ��
-- �μ��� ��������
-- *******************
select 
    d.dname �μ���,
    e.fname ||' '|| e.lname "������ �̸�",
    city "�μ���ġ ����"
from dep d
    join emp e
        on d.MID like e.EID
    join loc l
        using(LID)
    order by dname;

-- *******************
-- [����026]
-- �μ��� ��� �޿��� ���Ͻÿ�
-- *******************    
select 
    d.DNAME �μ���,
    round(avg(e.SAL),2) "�μ��� ��� �޿�"
from emp e
    join dep d
        on d.DID like e.DID
    group by e.DID, d.DNAME;
    
-- *******************
-- [����027]
-- �μ��� ��� �޿��� 10000 �� �Ѵ�
--  �μ���, "�μ��� ��� �޿�" �� ����Ͻÿ�
-- *******************  
select 
    d.DNAME �μ���,
    round(avg(e.SAL),2) "�μ��� ��� �޿�"
from emp e
    join dep d
        on d.DID like e.DID
    group by e.DID, d.DNAME
    having round(avg(e.SAL),2) >= 10000;

-- *******************
-- [����028]
-- ���� �������� 10% �λ�� �޾��� ���� ��������
-- å���Ǿ����ϴ�. ���� ������� ����޿���
-- ����ϼ���.
-- ��, ���� = �޿� * 12 �Դϴ�
-- *********************
select e.EID ���, e.FNAME �̸�, e.SAL ���ر޿�, ((e.SAL*12)*1.1)/12 ����޿� 
from emp e;

-- *******************
-- [����029]
-- �μ����� ����ϴ� �����ڿ� ������ 
-- �ѹ����� ����Ͻÿ� (20��)
-- *********************
select * from departments;
select * from employees;
select * from jobs;
select d.department_name �μ�, e.first_name ������,job_title ����
from employees e
    join departments d
    on d.MANAGER_ID like e.EMPLOYEE_ID
    join jobs j
    on j.JOB_ID = e.JOB_ID
order by d.department_name;

-- *******************
-- [����030]
-- �̹� �б⿡ IT�μ�(�μ���: IT)������ �ű� ���α׷��� �����ϰ� 
-- �����Ͽ� ȸ�翡 �����Ͽ���. 
-- �̿� �ش� �μ��� ��� �޿��� 12.3% �λ��Ͽ� �����մϴ�.
-- ������(�ݿø�) ǥ���Ͽ� ������ �ۼ��Ͻÿ�. 
-- ������ �����ȣ, ���� �̸�(Name ���� ��Ī), 
-- �޿�, �λ�� �޿�(Increased Salary �� ��Ī)������ ����Ͻÿ�
-- �޾��� õ��������
-- *********************
select * from jobs;
select e.EMPLOYEE_ID ���,
        e.FIRST_NAME ||' '|| e.LAST_NAME �̸�,
         To_char ( e.SALARY*1.123 , 'L999,999,999,990' ) "�λ�� �޿�"
from employees e
where e.DEPARTMENT_ID like(
    select d.DID
    from dep d
    where d.DNAME like 'IT'
);