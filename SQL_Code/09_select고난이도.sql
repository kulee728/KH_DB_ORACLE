-- 1. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 ‘전’씨인 직원들의
-- 사원명, 주민번호, 부서명, 직급명을 조회하시오.

-- 2. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 직급명을 조회하시오.

-- 3. 해외영업 1부, 2부에 근무하는 사원의
-- 사원명, 직급명, 부서코드, 부서명을 조회하시오.

--4. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.

--5. 부서가 있는 사원의 사원명, 직급명, 부서명, 지역명 조회

-- 6. 급여등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
--사원명, 직급명, 급여, 연봉(보너스포함)을 조회하시오.
--연봉에 보너스포인트를 적용하시오.

-- 7.한국(KO)과 일본(JP)에 근무하는 직원들의
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.

-- 8. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- SELF JOIN 사용

-- 9. 보너스포인트가 없는 직원들 중에서 직급코드가 J4 와 J7 인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, JOIN, IN 사용할 것

--SUBQUERY

-- 1. 전지연 사원이 속해있는 부서원들을 조회하시오 (단, 전지연은 제외)
-- 사번, 사원명, 전화번호, 고용일, 부서명
SELECT E.EMP_ID, E.EMP_NAME, E.PHONE, E.HIRE_DATE, D.DEPT_TITLE
FROM EMPLOYEE E JOIN DEPARTMENT D ON E.DEPT_CODE =D.DEPT_ID
WHERE E.DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
AND E.EMP_NAME != '전지연';
-- 2. 고용일이 2000년도 이후인 사원들 중 급여가 가장 높은 사원의
-- 사번, 사원명, 전화번호, 급여, 직급명을 조회하시오.
SELECT E.EMP_ID, E.EMP_NAME, E.PHONE, E.SALARY, J.JOB_NAME
FROM employee E JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
AND SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE E2  WHERE E2.HIRE_DATE >='2000/01/01') ; 
-- 3. 노옹철 사원과 같은 부서, 같은 직급인 사원을 조회하시오. (단, 노옹철 사원은 제외)
-- 사번, 이름, 부서코드, 직급코드, 부서명, 직급명

-- 4. 2000년도에 입사한 사원과 부서와 직급이 같은 사원을 조회하시오
-- 사번, 이름, 부서코드, 직급코드, 고용일
SELECT E2.EMP_ID, E2.EMP_NAME, E2.DEPT_CODE, E2.JOB_CODE, E2.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 
    ON E1.DEPT_CODE = E2.DEPT_CODE AND E1.JOB_CODE = E2.JOB_CODE
WHERE TO_CHAR(E1.HIRE_DATE,'YYYY') = '2000';
--AND E2.HIRE_DATE IS NOT NULL;

-- 5. 77년생 여자 사원과 동일한 부서이면서 동일한 사수를 가지고 있는 사원을 조회하시오
-- 사번, 이름, 부서코드, 사수번호, 주민번호, 고용일

SELECT E2.EMP_ID, E2.EMP_NAME, E2.DEPT_CODE, E2.MANAGER_ID, E2.EMP_NO,E2.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 
    ON E1.DEPT_CODE = E2.DEPT_CODE AND E1.MANAGER_ID= E2.MANAGER_ID
WHERE SUBSTR(E1.EMP_NO,1,2) = '77' AND SUBSTR(E1.EMP_NO,8,1)='2';


-- 6. 부서별 입사일이 가장 빠른 사원의
-- 사번, 이름, 부서명(NULL이면 '소속없음'), 직급명, 입사일을 조회하고
-- 입사일이 빠른 순으로 조회하시오
-- 단, 퇴사한 직원은 제외하고 조회..
SELECT E.EMP_ID, E.EMP_NAME, NVL2(E.DEPT_CODE,D.DEPT_TITLE,'소속없음'), J.JOB_CODE,E.HIRE_DATE
FROM EMPLOYEE E JOIN JOB ON E.JOB_CODE = J.JOB_CODE, 




SELECT DISTINCT EMP_ID, EMP_NAME, NVL2(E2.DEPT_CODE,(SELECT DEPT_TITLE  FROM DEPARTMENT WHERE  E2.DEPT_CODE = DEPT_ID)
,'소속없음') "부서명" ,E.HIRE_DATE "입사일", JOB_NAME "직급명"
FROM EMPLOYEE E , (
SELECT DEPT_CODE,MIN(HIRE_DATE)AS HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN='N'
GROUP BY DEPT_CODE
) E2, DEPARTMENT D, JOB J
WHERE e.hire_date = E2.hire_date
AND E.JOB_CODE = J.JOB_CODE
ORDER BY E.HIRE_DATE;


SELECT EMP_NAME, EMP_NAME, NVL(DEPT_TITLE,'소속없음'),JOB_NAME, HIRE_DATE
FROM EMPLOYEE MAIN
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE)
                   FROM EMPLOYEE SUB
                   WHERE SUB.DEPT_CODE = MAIN.DEPT_CODE
                   AND ENT_YN = 'N'
                   )
ORDER BY HIRE_DATE;


-- 7. 직급별 나이가 가장 어린 직원의
-- 사번, 이름, 직급명, 나이, 보너스 포함 연봉을 조회하고
-- 나이순으로 내림차순 정렬하세요
-- 단 연봉은 \124,800,000 으로 출력되게 하세요. (\ : 원 단위 기호)
SELECT EMP_ID, EMP_NAME, JOB_NAME, 2024 - TO_NUMBER('19'||SUBSTR(E.EMP_NO,1,2)) "나이",  TO_CHAR(SALARY*(1+NVL(BONUS,0))*12,'L999,999,999') "보너스 포함 연봉"
FROM EMPLOYEE E,JOB J,
(SELECT JOB_CODE, MAX(EMP_NO) EMP_NO FROM EMPLOYEE GROUP BY JOB_CODE) J2
WHERE E.JOB_CODE = J.JOB_CODE AND E.JOB_CODE = J2.JOB_CODE
AND E.EMP_NO =J2.EMP_NO
ORDER BY 나이 DESC;



















