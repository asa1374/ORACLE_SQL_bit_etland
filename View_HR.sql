create view emp as 
select employee_id eid,
first_name fname,
last_name lname,
email email,
phone_number phone,
hire_date hdate,
job_id jid,
salary sal,
commission_pct comm,
manager_id mid,
department_id did 
from employees;

select count(*) from tab;
select * from tab;
select * from emp;
select * from employees;
drop view job;
desc jobs;
create view job as
select
    JOB_ID jid,
    JOB_TITLE title,
    MIN_SALARY minsal,
    MAX_SALARY maxsal
from jobs;

desc departments;
create view dep as
select
DEPARTMENT_ID did,
DEPARTMENT_NAME dname,
MANAGER_ID mid,
LOCATION_ID lid
from departments;

desc locations;
create view loc as
select
LOCATION_ID lid,
STREET_ADDRESS addr,
POSTAL_CODE pos,
CITY,
STATE_PROVINCE prov,
COUNTRY_ID cid
from locations;

desc job_history;
create view his as
select
EMPLOYEE_ID eid,
START_DATE sdate,
END_DATE edate,
JOB_ID jid,
DEPARTMENT_ID did
from job_history;