/*
[SELECT 문 정리]
5 SELECT COLUMN1, COLUMN2 AS "별칭2"
1 FROM 테이블명
2 WHERE 컬럼조건
3 GROUP BY 
4 HAVING 그룹 함수식 비교연산자 비교값
6 ORDER BY  정렬방식

SELECT WHERE 까지만 존재하는경우

*/

--GROUP BY 절
/*
같은 값들이 여러개 기록된 열을 갖고 같은 값들을 하나의 그룹으로 묶는다.
여러개의 값을 묶어 하나로 처리할 목적으로 사용
그룹으로 묶은 값에 대해 SELECT 절에서 그룹함수 사용한다. SUM, COUNT, AVG, 
>> 그룹함수의 결과 값이 여러개인 경우 오류 발생
>> 여러개의 결과 값을 산출하기 위해 그룹함수가 적용된 기준은을 ORDER BY 절에서 사용
*/

SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE
HAVING SUM(SALARY) >=10000000;

/*
EMPLOYEE 테이블에서 부서별 보너스 받는 사원 수 조회
*/
SELECT DEPT_CODE, COUNT(*) "보너스 받는 사원" FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY "보너스 받는 사원" DESC;

-- D5,D6 부서의 부서별 평균 급여
SELECT DEPT_CODE 부서코드, FLOOR(AVG(SALARY)) 부서별평균 FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6')
GROUP BY DEPT_CODE;

