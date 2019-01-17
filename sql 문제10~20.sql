-- Employees ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]
--[ job_id = �����ڵ� ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ��ڵ�]

--  Jobs ���̺�
-- job_id �����ڵ�
-- job_title ����Ÿ��Ʋ
-- min_salary  �����޿�
-- max_salary �ְ�޿�

-- *******
-- ����011. 
-- Ŀ�̼��� ���� ���ϴ� ������ �̸�,�����ڵ�,�޿�,Ŀ�̼Ǻ����� ��ȸ
-- *******
SELECT first_name,job_id,salary,commission_pct
FROM Employees
WHERE commission_pct IS NULL;
-- *******
-- ����012. 
-- ����� 110,120,130�� ����� ���, ��, �̸� ��ȸ
-- *******
SELECT employee_id,last_name,first_name
FROM Employees
WHERE (employee_id LIKE '110') OR (employee_id LIKE '120') OR (employee_id LIKE'130');
-- *******
-- ����013. 
-- �μ��ڵ�� ��������, �޿��� ������������ 
-- �μ��ڵ�, �޿�, ���, �̸�, �� ����
-- �������� 0,1,2 ... �������� 9,8,7...
-- ASC�� ����Ʈ�� ��������
-- DESC ��������
-- ******
SELECT department_id,salary,employee_id,first_name,last_name
FROM Employees
ORDER BY department_id ASC, salary DESC;
-- *******
-- ����014. 
-- �̸��� am �̶� ���ڰ� ���Ե� ������ ���,�̸�, ��
-- *******
SELECT employee_id,first_name,last_name
FROM Employees
WHERE first_name LIKE '%am%';
-- *******
-- ����015. 
-- �̸��Ͽ� 'GG' �� 'KK'�δܾ� �� �ϳ��� ���ԵǾ ��ȸ
-- ��, ��ҹ��� ������
-- *******
SELECT EMAIL
FROM Employees
WHERE email LIKE '%GG%' 
    OR email LIKE '%KK%';
-- *******
-- ����016. 
-- �̸����ּҰ� A �� �������� �ʴ� �̸��� ����
-- *******
SELECT COUNT(email)
FROM Employees
WHERE NOT email LIKE 'A%';
-- *******
-- ����017.
-- ���� �ι�°,����° ���ڰ� ���ÿ� e �� ������ �̸�, ��
-- *******
SELECT first_name,last_name
FROM Employees
WHERE last_name LIKE '_ee%';
-- *******
-- ����018
 -- �����ӱ��� 10000�� �̻��� ���� �� �� ������ ǥ���Ѵ�
-- *******


select job_id,job_title,min_salary,max_salary
from Jobs
where min_salary > 10000;

-- *******************
-- [����19]
-- 2002����� 2005����� 
-- ������ ������ �̸��� ���� ���ڸ� ǥ���Ѵ�.
-- *******************
select first_name,hire_date
from employees
where hire_date >= '2002/01/01' and hire_date < '2005/12/31' 
order by hire_date asc;

-- *******************
-- [����020]
-- IT Programmer �Ǵ� Sales Man�� 
-- ������ �̸�, �Ի���, �����ڵ� ǥ��.
-- ******************* 
select first_name �̸�, hire_date �Ի���, job_id �����ڵ�
from Employees
where (job_id like 'IT_PROG') or (job_id like 'SA_MAN');
