select * from customers;

--1. rownum을 사용해서 
select rownum 순위, c.*
from customers c;

--2. rownum을 역순으로 
select rownum 순위, c.*
from customers c
order by 순위 desc;

--3. 페이지사이즈(5) 만큼만 출력한다.
select c.* 
from (select rownum 순위, c.*
        from customers c
        order by 순위 desc) c
where c."순위" between 26 and 30;

select count(*) count from customers;