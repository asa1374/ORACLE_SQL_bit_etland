-- Employees ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]
--[ job_id = �����ڵ� ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ��ڵ�]
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
SELECT email
FROM Employees
WHERE (email LIKE '%GG%') OR (email LIKE '%KK%');
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