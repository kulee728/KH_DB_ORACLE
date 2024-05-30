/*
SELECT (조회) : 
지정된 테이블에서 원하는 데이터를 조회하는 SQL
조회된 결과는 RESULT SET이라 칭한다.
RESULT SET은 0행 이상이 포함될 수 있다.



*/

SELECT emp_id from (SELECT emp_id from employee where hire_date>='2000/01/01') a;

/* 
SYSDATE, SYSTIMESTAMP > 현재 시각
SYSDATE :연월일분초
SYSTIMESTAMP : sysdate + ms까지
*/

/* 컬럼 명 다르게 적기 (별칭)
1) 칼럼명 as "별칭"
컬럼명 "별칭"
컬럼명 별칭 : 문자O, 숫자X 띄어쓰기 및 특수문자 X
칼럼명 as 별칭 : 문자O

*/

select distinct dept_code "a$%3"  from employee where dept_code is not null;

select emp_name,email as "이메일@포함"
from employee;
/*
distinct : 중복 제거하기
select distinct 로 사용
*/
select distinct job_code from employee;

SELECT EMP_NAME,SALARY,DEPT_CODE FROM EMPLOYEE E1 WHERE E1.SALARY >= 3000000 AND E1.DEPT_CODE = 'D9';



/* 
(columnName) BETWEEN A AND B
컬럼의 갑이 A이상 B이하면 TRUE
혹은 NOT BETWWEN 도 사용 가능
*/

select emp_name, salary
from employee
where salary not between 3000000 and 5000000;

-- in 을 사용해볼까?
/*
칼럼명 IN (val1,val2,...)
val 중에 칼럼값이이 있다면 true
NOT IN 도 가능하다.
*/

select emp_name, salary from employee where salary not between 3000000 and 5000000 and
salary IN(2000000,2500000);


/*
LIKE > 특정한 패턴을 만족시키는지 확인한다.
WHERE 칼럼명 LIKE '패턴'
패턴은 다음 문법을 따른다
%A : A로 끝나는 문자열 아무거나 %리 
A% : A로 시작하는 문자열
%A% : 문자열 시작과 끝은 관계없이 중간에 들어가면 됩니다.
A_ : A뒤 1글자만 있는 문자열
_A : A로 끝나는 두글자
나__ : 나로 시작하는 세글자 단어
*/
-- 성이 전씨인 사원

select emp_id,emp_name from employee where emp_name Like '전%';
select emp_id,emp_name from employee where emp_name like '%수';
select emp_id,emp_name from employee where emp_name like '%하%';
select emp_id,emp_name from employee where emp_name like '전%돈';
select emp_name, email from employee where email like '_____@%';
select emp_name, email from employee where email like '___%@%';
--ESCAPE 옵션 (예약 기호를 문자열로 적용시키기. 특히 언더바(_)에 쓸일이 많을것
select emp_name,email from employee where email like '___#_%' ESCAPE '#';

--LIKE '_#@%'ESCAPE '#'

/*

DUAL(DUmmy tAbLe)
Dummy : 실제로 쓰이지 않는 데이터.더미테이블을 생성해서
테이블을 조회하거나 확인할 때 사용할 수 있다.
(테이블 만들지 않고 테스트/사용 하고 싶을 때)

예)
*/
select sysdate, systimestamp from dual;
