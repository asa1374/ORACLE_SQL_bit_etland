select * from tab;
select count(*) from tab;

select e.LAST_NAME 이름,d.DEPARTMENT_NAME 부서명
from employees e
inner join departments d
on d.DEPARTMENT_ID like e.DEPARTMENT_ID;



select department_name "페이 부서"
from departments
where department_id like 
    (select department_id
    from employees
    where last_name like 'Fay');