select * from customers;

--1. rownum�� ����ؼ� 
select rownum ����, c.*
from customers c;

--2. rownum�� �������� 
select rownum ����, c.*
from customers c
order by ���� desc;

--3. ������������(5) ��ŭ�� ����Ѵ�.
select c.* 
from (select rownum ����, c.*
        from customers c
        order by ���� desc) c
where c."����" between 26 and 30;

select count(*) count from customers;