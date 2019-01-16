-- Employees 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 입사일 ]
--[ job_id = 업무코드 ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사아이디]
--[ department_id = 부서코드]
-- *******
-- 문제011. 
-- 커미션을 받지 못하는 직원의 이름,업무코드,급여,커미션비율을 조회
-- *******
SELECT first_name,job_id,salary,commission_pct
FROM Employees
WHERE commission_pct IS NULL;
-- *******
-- 문제012. 
-- 사번이 110,120,130인 사원의 사번, 성, 이름 조회
-- *******
SELECT employee_id,last_name,first_name
FROM Employees
WHERE (employee_id LIKE '110') OR (employee_id LIKE '120') OR (employee_id LIKE'130');
-- *******
-- 문제013. 
-- 부서코드는 오름차순, 급여는 내림차순으로 
-- 부서코드, 급여, 사번, 이름, 성 정렬
-- 오름차순 0,1,2 ... 내림차순 9,8,7...
-- ******
SELECT department_id,salary,employee_id,first_name,last_name
FROM Employees
ORDER BY department_id ASC, salary DESC;
-- *******
-- 문제014. 
-- 이름에 am 이란 글자가 포함된 직원의 사번,이름, 성
-- *******
SELECT employee_id,first_name,last_name
FROM Employees
WHERE first_name LIKE '%am%';
-- *******
-- 문제015. 
-- 이메일에 'GG' 와 'KK'두단어 중 하나만 포함되어도 조회
-- 단, 대소문자 구분함
-- *******
SELECT email
FROM Employees
WHERE (email LIKE '%GG%') OR (email LIKE '%KK%');
-- *******
-- 문제016. 
-- 이메일주소가 A 로 시작하지 않는 이메일 갯수
-- *******
SELECT COUNT(email)
FROM Employees
WHERE NOT email LIKE 'A%';
-- *******
-- 문제017.
-- 성의 두번째,세번째 글자가 동시에 e 인 직원의 이름, 성
-- *******
SELECT first_name,last_name
FROM Employees
WHERE last_name LIKE '_ee%';