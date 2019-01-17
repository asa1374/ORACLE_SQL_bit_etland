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

select * from employees;
select jh.EMPLOYEE_ID ���, j.JOB_TITLE ��å,
    trunc(jh.END_DATE-jh.START_DATE) �ټӱⰣ
from job_history jh
    inner join jobs j
        on jh.JOB_ID=j.JOB_ID
where jh.EMPLOYEE_ID like '201';

-- *******************
-- [����024]
-- �� �μ��� ��ġ�� IT ������ �̸� ��� 
-- DEPARTMENT_NAME �μ���, �̸�(FIRST_NAME + [����] + LAST_NAME)���� ���
-- �̸��� �ߺ��Ǿ ��µ�. �� �Ѹ��� �����μ����� ������ ������
-- ******************* 

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
-- [����025]
-- �μ��� ��� �޿��� ���Ͻÿ�
-- *******************    
select 
    d.DNAME �μ���,
    round(avg(e.SAL),2) "�μ��� ��� �޿�"
from emp e
    join dep d
        on d.DID like e.DID
    group by e.DID, d.DNAME
    having round(avg(e.SAL),2) >= 10000
    ;