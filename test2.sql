select * from tab;
select count(*) from tab;

select e.LAST_NAME �̸�,d.DEPARTMENT_NAME �μ���
from employees e
inner join departments d
on d.DEPARTMENT_ID like e.DEPARTMENT_ID;



select department_name "���� �μ�"
from departments
where department_id like 
    (select department_id
    from employees
    where last_name like 'Fay');