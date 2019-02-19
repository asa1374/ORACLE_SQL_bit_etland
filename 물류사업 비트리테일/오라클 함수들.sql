select * from emp;
-- empno 사원
-- ename 사원명
-- job 업무
-- mgr 메니저
-- hiredate 입사일
-- sal 월급
-- comm 커미션
-- deptno 부서코드

select * from dept;
-- deptno
-- dname
-- loc

-- emp test 01
-- case 표현

select ename,
    case when sal > 2000
        then sal
        else 2000
    end revised_salary
from emp;

--문법
--case when 조건식
--  then 참일경우
--  else 거짓일 경우
--end 컬러명으로 처리

--emp test 02
--부서정보에서 부서위치를 미국의 동부,중부,서부로 구분하라
--뉴욕  east,보스턴 -east, 시카고 - center, 달라스 -center
--컬럼명 -area

select loc,
    case when loc in('NEW YORK','BOSTON') then '동부'
         when loc in('CHICAGO','DALLAS') then '중부'
    end area
from dept;

-- EMP_TEST_03
-- 급여가 3000 이상이면 HIGH, 1000 이상이면 MID, 미만이면 LOW 

select sal,case when sal >= 1000 and sal < 3000 then 'mid'
            when sal >= 3000 then 'higt' 
            when sal < 1000 then 'low'
        end sal_detail
from emp;

-- EMP_TEST_04
-- 급여가 2000 이상이면 보너스 1000, 
-- 1000 이상이면 500,
-- 1000 미만이면 0으로 계산하시오
-- 컬럼명은 BONUS

select sal,case when sal >= 2000 then 1000
            when sal < 2000 and sal >= 1000 then 500
            when sal < 1000 then 0
        end bonus
from emp;

-- EMP_TEST_05
-- 매니저가 "BLAKE" 이면 NULL 표시, 같지 않으면 MGR 표시

select ename, empno,mgr,
    case when mgr like (select empno
                        from emp
                        where ename like 'BLAKE')
        then null
    else mgr
    end mgr
from emp;

--emp test 06
--개별 입사정보에서 월별 데이터를 추출하기
--extract()

select ename,deptno, extract(month from hiredate)입사월, sal
from emp;

--emp test 07
--추출된 month 데이터를 12개의 월별 칼럼으로 구분하기

select ename,deptno,
    case 입사월 when 1 then sal end "1월",
    case 입사월 when 2 then sal end "2월",
    case 입사월 when 3 then sal end "3월",
    case 입사월 when 4 then sal end "4월",
    case 입사월 when 5 then sal end "5월",
    case 입사월 when 6 then sal end "6월",
    case 입사월 when 7 then sal end "7월",
    case 입사월 when 8 then sal end "8월",
    case 입사월 when 9 then sal end "9월",
    case 입사월 when 10 then sal end "10월",
    case 입사월 when 11 then sal end "11월",
    case 입사월 when 12 then sal end "12월"
from (select ename,deptno, 
    extract(month from hiredate)입사월, sal
    from emp);
--아래 함수사용보다는 case를 사용하는게 좋다! 
select ename,
    deptno,
    decode(month,1,sal) "1월"
from (select ename,deptno, 
    extract(month from hiredate)month, sal
    from emp);

--emp test 08
--추출된 month 데이터를 12개의 월별 칼럼으로 구분한 후
--부서별로 추출하기

select
    (select dname
    from dept d
    where d.deptno like e.deptno)
    deptno,
    avg(case 입사월 when 1 then sal end) "1월",
    avg(case 입사월 when 2 then sal end) "2월",
    avg(case 입사월 when 3 then sal end) "3월",
    avg(case 입사월 when 4 then sal end) "4월",
    avg(case 입사월 when 5 then sal end) "5월",
    avg(case 입사월 when 6 then sal end) "6월",
    avg(case 입사월 when 7 then sal end) "7월",
    avg(case 입사월 when 8 then sal end) "8월",
    avg(case 입사월 when 9 then sal end) "9월",
    avg(case 입사월 when 10 then sal end) "10월",
    avg(case 입사월 when 11 then sal end) "11월",
    avg(case 입사월 when 12 then sal end) "12월"
from (select deptno, 
    extract(month from hiredate)입사월, sal
    from emp) e
group by deptno;


--emp test 09
--계층형 쿼리
--리프(leaf) 데이터까지 1씩 증가한다.
--connect_by_isleaf 전개 과정에서 해당 데이터가 리프데이터이면
--1,그렇지 않으면 0이다.

select level,
        lpad(' ',4 * (level-1)) || empno 사원,
        mgr 관리자,
        connect_by_isleaf isleaf
from emp
start with mgr is null
connect by prior empno like mgr;

-- emp test 10
--셀프조인

select e1.empno 사번, e1.mgr 관리자, e2.mgr "상위 관리자"
from emp e1
    join emp e2
        on e1.mgr like e2.empno
order by e2.mgr desc,2,1;

--셀프 조인을 할때는 이너 조인말고 아우터 조인을 사용하면 된다.

--EMP TEST 11
--GROUP FUNCTION 그룹함수
--일반적인 GRROUP BY 함수
select e1.empno 사번, e1.mgr 관리자, e2.mgr "상위 관리자"
from emp e1
    left join emp e2
        on e1.mgr like e2.empno
order by 3 desc,2,1;

select dname 부서명,
    job 업무,
    count(*) "전체 사원",
    sum(sal) "전체 급여"
from emp e,dept d
where e.deptno = d.deptno
group by rollup(dname,job);

--ANSI 에서 정의한 함수 세가지
--AGGREGATE FUNCTION 집계함수 SUM(),MIN()...
--GROUP FUNCTION 그룹함수
--특정항목에 대한 소계를 하는 함수
--ROLLUP : 소그룹간의 소계를 계산하는 함수
--CUBE : 다차원적인 소계를 계산하는 함수
--WINDOW FUNCTION 윈도우 함수

select dname 부서명,
    job 업무,
    count(*) "전체 사원",
    sum(sal) "전체 급여"
from emp e,dept d
where e.deptno = d.deptno
group by rollup(dname,job);

select case grouping(dname)
                when 1 then 'ALL DEPTS'
                else dname 
        end as "부서명",
        case grouping(dname)
                when 1 then 'ALL JOB'
                else job 
        end as "업무명",
        count(*) "전체 사원",
        sum(sal) "전체 급여"
from emp e,dept d
where e.deptno = d.deptno
group by cube(dname,job);