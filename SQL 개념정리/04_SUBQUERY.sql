/*
SUBQUERY  해보자
: SQL 포함된 또 다른 SQL 문. 메인쿼리 위해 보조 역할을 하는 쿼리문
- SELECT , FROM, WHERE, HAVING 절에서 사용 가능
* SQL 에서 작성하는 모든 구문은 쿼리
*/

-- 서브쿼리
-- 예 1)
-- 부서코드가 노옹철 사원과 같은 소속 지원의 이름, 부서코드
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철';

SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철');


--예2) 전 직원 평균 급여보다 많은 급여 받는 직원의 사번 이름 직급코드 급여
SELECT EMP_ID, EMP_NAME, JOB_CODE,SALARY FROM EMPLOYEE WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE)
