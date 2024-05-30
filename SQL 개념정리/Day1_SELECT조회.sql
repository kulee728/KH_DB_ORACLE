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

select distinct job_code from employee;

SELECT EMP_NAME,SALARY,DEPT_CODE FROM EMPLOYEE E1 WHERE E1.SALARY >= 3000000 AND E1.DEPT_CODE = 'D9';

/*
distinct : 중복 제거하기
select distinct 로 사용
*/