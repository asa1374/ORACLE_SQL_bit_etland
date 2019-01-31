SELECT * FROM EMPLOYEES;
ALTER TABLE EMPLOYEES RENAME COLUMN LAST_NAME TO MANAGER;

create sequence emp_seq
    start with 1000
    increment by 1;
    
select * from user_sequences;

insert into employees(EMPLOYEE_ID,MANAGER,NAME,BIRTHDATE,PHOTO,NOTES)
VALUES(EMP_SEQ.NEXTVAL,'manager','����','960101','kim.jpg','�Ŵ���');

select * from employees order by employee_id;

drop sequence emp_seq;
delete from employees where manager like '����';
select emp_seq.nextval from dual;
