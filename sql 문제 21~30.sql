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

select h.EMPLOYEE_ID 사번, j.JOB_TITLE 직책, e.fname 이름,
    trunc(h.END_DATE-h.START_DATE) 근속기간
from his h
    join job j
        on h.JOB_ID = j.JOB_ID
    join emp e
        on h.EID = e.EID
where e.DID like (select d.did
                    from dep d
                    where d.DNAME like 'Marketing'
                    );

-- *******************
-- [문제024]
-- 각 부서에 배치된 IT 개발자 이름 출력 
-- DEPARTMENT_NAME 부서명, 이름(FIRST_NAME + [공백] + LAST_NAME)까지 출력
-- 이름은 중복되어서 출력됨. 즉 한명이 여러부서에서 업무를 수행함
-- ******************* 
SELECT 
    DNAME 부서명, FNAME || ' ' || LNAME 이름
FROM EMP E 
    JOIN JOB J
        ON E.JID LIKE J.JID
    JOIN DEP D
        ON E.DID LIKE D.DID
WHERE J.JID LIKE (SELECT JID 
                  FROM JOB 
                  WHERE TITLE LIKE 'Programmer');
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
-- [문제026]
-- 부서별 평균 급여를 구하시오
-- *******************    
select 
    d.DNAME 부서명,
    round(avg(e.SAL),2) "부서별 평균 급여"
from emp e
    join dep d
        on d.DID like e.DID
    group by e.DID, d.DNAME;
    
-- *******************
-- [문제027]
-- 부서별 평균 급여가 10000 이 넘는
--  부서명, "부서별 평균 급여" 를 출력하시오
-- *******************  
select 
    d.DNAME 부서명,
    round(avg(e.SAL),2) "부서별 평균 급여"
from emp e
    join dep d
        on d.DID like e.DID
    group by e.DID, d.DNAME
    having round(avg(e.SAL),2) >= 10000;

-- *******************
-- [문제028]
-- 올해 연봉에서 10% 인상된 급액이 내년 연봉으로
-- 책정되었습니다. 내년 전사원의 내년급여를
-- 출력하세요.
-- 단, 연봉 = 급여 * 12 입니다
-- *********************
select e.EID 사번, e.FNAME 이름, e.SAL 올해급여, ((e.SAL*12)*1.1)/12 내년급여 
from emp e;

-- *******************
-- [문제029]
-- 부서별로 담당하는 관리자와 업무를 
-- 한번씩만 출력하시오 (20행)
-- *********************
select * from departments;
select * from employees;
select * from jobs;
select d.department_name 부서, e.first_name 관리자,job_title 업무
from employees e
    join departments d
    on d.MANAGER_ID like e.EMPLOYEE_ID
    join jobs j
    on j.JOB_ID = e.JOB_ID
order by d.department_name;

-- *******************
-- [문제030]
-- 이번 분기에 IT부서(부서명: IT)에서는 신규 프로그램을 개발하고 
-- 보급하여 회사에 공헌하였다. 
-- 이에 해당 부서의 사원 급여를 12.3% 인상하여 지급합니다.
-- 정수만(반올림) 표시하여 보고서를 작성하시오. 
-- 보고서는 사원번호, 성과 이름(Name 으로 별칭), 
-- 급여, 인상된 급여(Increased Salary 로 별칭)순으로 출력하시오
-- 급액은 천원단위임
-- *********************
select * from jobs;
select e.EMPLOYEE_ID 사번,
        e.FIRST_NAME ||' '|| e.LAST_NAME 이름,
         To_char ( e.SALARY*1.123 , 'L999,999,999,990' ) "인상된 급여"
from employees e
where e.DEPARTMENT_ID like(
    select d.DID
    from dep d
    where d.DNAME like 'IT'
);