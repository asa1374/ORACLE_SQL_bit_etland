-- EMPLOYEE ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = ������ ]
--[ job_id = �����ڵ� ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ��ڵ�]
-- *******
-- ����001. 
-- HR ��Ű�� ���̺��� ��� ���?
-- *******
SELECT * FROM TAB;
-- *******
-- ����002. 
-- HR ��Ű�� ���̺� ���� �?
-- *******
SELECT COUNT(*) FROM TAB;
-- *******
-- ����003. 
-- ���, ��, �̸����?
-- *******
SELECT employee_id,last_name,first_name FROM EMPLOYEES;
-- *******
-- ����004. 
-- �̸��� s�� ������ ������ �̸� ���?
-- *******
SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE '%s';
-- *******
-- ����005. 
-- �̸��� s�� �����ϴ� ������ �̸� ���?
-- *******
SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE 'S%';
-- *******
-- ����006. 
-- �޿��� ���� ������ �̸�,�μ��ڵ�,�޿� ��ȸ 
-- *******
SELECT first_name,department_id,salary
FROM EMPLOYEES
ORDER BY salary DESC;
-- *******
-- ����007.
-- �޿��� 12000 �̻��� ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- *******
SELECT employee_id,first_name,department_id,salary
FROM EMPLOYEES
WHERE salary >= 12000;
-- *******
-- ����008.
-- �޿��� 1500�̻� 2500���ϸ� �޴� ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- ( AND ��� )
-- *******
SELECT employee_id,first_name,department_id,salary
FROM EMPLOYEES
WHERE salary >= 1500 AND salary <= 2500;
-- *******
-- ����009.
-- �޿��� 1500�̻� 2500���ϸ� �޴� 
-- ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ (BETWEEN ���) 
-- *******
SELECT employee_id,first_name,department_id,salary
FROM EMPLOYEES
WHERE salary BETWEEN 1500 AND 2500;
-- *******
-- ����010.
-- 2005�⵵�� �Ի��� ������ �̸��� �μ��ڵ�, 
-- �Ի����ڸ� ��ȸ
-- *******
SELECT first_name,department_id,hire_date
FROM EMPLOYEES
WHERE hire_date LIKE '05%';