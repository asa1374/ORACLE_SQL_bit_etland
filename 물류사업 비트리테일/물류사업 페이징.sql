select * from customers;

--1. rownum�� ����ؼ� 
select rownum ����, c.*
from customers c;

--2. rownum�� �������� 
select rownum ����, c.*
from customers c
order by ���� desc;

--3. ������������(5) ��ŭ�� ����Ѵ�.
select rownum rnum, t.* 
from (select rownum ����, c.*
        from customers c
        order by ���� desc) t;

select * 
from (select rownum rrnum, t.* 
    from (select rownum rnum, c.*
        from customers c
        order by rnum desc) t)
where rrnum between 1 and 5;