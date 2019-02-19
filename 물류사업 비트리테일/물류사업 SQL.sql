SELECT * FROM customers;
ALTER TABLE EMPLOYEES RENAME COLUMN LAST_NAME TO MANAGER;
select * from employees;
select * from user_sequences;
drop sequence emp_seq;
SELECT * 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID LIKE 1000 and name like '±è°æ¹Î';

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

select * from customers;
delete from customers where customer_id like '%';
desc customers;
alter table customers modify(city varchar2(60));

update customers
set password = ?, phone = ?,address = ?,city = ?,postal_code = ?
where customer_id  like ?;

select * from image;
