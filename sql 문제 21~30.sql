-- Employees 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 입사일 ]
--[ job_id = 업무명 ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사아이디]
--[ department_id = 부서명]

--  Jobs 테이블
-- job_id 업무코드
-- job_title 업무타이틀
-- min_salary  최저급여
-- max_salary 최고급여
select * from tab;
-- *******************
-- [문제021]
-- IT Programmer 또는 Sales Man인 
-- 직원의 이름, 입사일, 업무명 표시.
-- ******************* 
select e.first_name 이름, e.hire_date 입사일, j.job_title 업무명
from employees e
    inner join jobs j
    on e.JOB_ID like j.JOB_ID
where j.JOB_TITLE in ('Programmer','Sales Manager')
order by e.FIRST_NAME;

-- *******************
-- [문제022]
-- 부서명 및 관리자이름 표시
-- (단, 컬럼명은 관리자 [공백] 이름 이 되도록 ...)
-- DEPARTMENTS 에서 MANAGER_ID 가 관리자 코드
-- *******************  
select * from employees;
select * from departments;

select d.DEPARTMENT_NAME 부서명, e.FIRST_NAME "매니저 이름"
from Employees e
    join departments d
        on d.MANAGER_ID = e.EMPLOYEE_ID;

select * from departments
where manager_id is not null;

-- *******************
-- [문제023]
-- 마케팅(Marketing) 부서에서 근무하는 사원의 
-- 사번, 직책, 이름, 근속기간
-- (단, 근속기간은 JOB_HISTORY 에서 END_DATE-START_DATE로 구할 것)
-- EMPLOYEE_ID 사번, JOB_TITLE 직책임
-- *******************

select * from employees;
select jh.EMPLOYEE_ID 사번, j.JOB_TITLE 직책,
    trunc(jh.END_DATE-jh.START_DATE) 근속기간
from job_history jh
    inner join jobs j
        on jh.JOB_ID=j.JOB_ID
where jh.EMPLOYEE_ID like '201';

-- *******************
-- [문제024]
-- 각 부서에 배치된 IT 개발자 이름 출력 
-- DEPARTMENT_NAME 부서명, 이름(FIRST_NAME + [공백] + LAST_NAME)까지 출력
-- 이름은 중복되어서 출력됨. 즉 한명이 여러부서에서 업무를 수행함
-- ******************* 

-- *******************
-- [문제025]
-- 부서명, 관리자 이름, 부서위치 도시 표시
-- 부서명 오름차순
-- *******************
select 
    d.dname 부서명,
    e.fname ||' '|| e.lname "관리자 이름",
    city "부서위치 도시"
from dep d
    join emp e
        on d.MID like e.EID
    join loc l
        using(LID)
    order by dname;

-- *******************
-- [문제025]
-- 부서별 평균 급여를 구하시오
-- *******************    
select 
    d.DNAME 부서명,
    round(avg(e.SAL),2) "부서별 평균 급여"
from emp e
    join dep d
        on d.DID like e.DID
    group by e.DID, d.DNAME
    having round(avg(e.SAL),2) >= 10000
    ;