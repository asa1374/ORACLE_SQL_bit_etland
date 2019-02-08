SELECT * FROM customers;
ALTER TABLE EMPLOYEES RENAME COLUMN LAST_NAME TO MANAGER;

create sequence emp_seq
    start with 1000
    increment by 1;
    
select * from user_sequences;

insert into employees(EMPLOYEE_ID,MANAGER,NAME,BIRTHDATE,PHOTO,NOTES)
VALUES(EMP_SEQ.NEXTVAL,'1000','이창준','930605-1','kim.jpg','매니저');

delete from employees where name like '%';

select * from employees;

drop sequence emp_seq;

delete from employees where manager like '김경민';
select emp_seq.nextval from dual;

SELECT * 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID LIKE 1000 and name like '김경민';

drop table customers;

select * from customers;

desc customers;
alter table customers drop CONSTRAINT password;

insert into customers(customer_id,customer_name,contact_name,address,city,postal_code,country)
values('asa1374','이창준','자바신','경기도','파주시','1234','미국');

alter table customers rename column country to ssn;


select * from customers;
select * from employees;
select * from shippers;
select * from orders;
select * from suppliers;
select * from categories;
select * from products;
select * from Oder_Details;

drop table customers;
drop table employees;
drop table shippers;
drop table orders;
drop table suppliers;
drop table categories;
drop table products;
drop table Oder_Details;