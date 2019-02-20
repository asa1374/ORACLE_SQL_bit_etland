SELECT * FROM customers;
ALTER TABLE EMPLOYEES RENAME COLUMN LAST_NAME TO MANAGER;
select * from employees;
select * from user_sequences;
drop sequence emp_seq;
SELECT * 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID LIKE 1000 and name like '김경민';

select customer_name, phone
from customers
;

select * from customers;
select * from employees;
select * from shippers;
select * from orders;
select * from suppliers;
select * from categories;
select * from products;
select * from Oder_Details;
select * from image;

select * from customers;
delete from customers where customer_id like '%';
desc customers;
alter table customers modify(city varchar2(60));

update customers
set password = ?, phone = ?,address = ?,city = ?,postal_code = ?
where customer_id  like ?;

select * from image;

select rownum rnum,c.*
from customers c;

select max(img_seq) maximage
from image;

SELECT * FROM TAB;
SELECT * FROM EMPLOYEES;
SELECT * FROM CUSTOMERS;
select * from image;

delete from image where IMGEXTENTION like 'png';

insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('asa1374','이창준','1','경기도 파주시 파주읍','파주4리 497-16','10835','930605-1','010-5899-1374');
insert into image(IMG_SEQ,IMGNAME,IMGEXTENTION,OWNER)
values(IMG_SEQ.NEXTVAL,'default_img','png','default');

