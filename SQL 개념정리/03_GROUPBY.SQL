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

/*
HAVING
> GROUP BY 절의 조건문을 담당한다.
*/

--부서별 급여 합계 500 이상인 부서만
select DEPT_CODE , sum(SALARY) as "급여 합계" from employee
GROUP BY DEPT_CODE HAVING SUM(SALARY) >= 5000000
ORDER BY "급여 합계";
-- 이때, WHERE 절 에서는 집계함수(SUM, COUNT, AVG, MAX 등) 을 사용할 수 없다는 걸 알아두자.
-- 반대로, ALIAS도 having 절에서 사용이 불가능하다.

--각 부서별 최대 급여
select dept_code, max(salary) as "최대 급여" from employee
group by dept_code
order by "최대 급여" desc;
-- 각 부서별 최소 급여
select dept_code, min(salary) as "최소 급여" from employee
group by dept_code
order by "최대 급여" desc;

--각 부서별 보너스율 합계
select dept_code, sum(bonus) "부서별 보너스율 합" from employee
group by dept_code;

select dept_code,bonus from employee;

--직급 별 사원 수 
select job_code "직급", count(*) as "사원수" from employee
group by job_code order by count(*) desc;

select sal_level "급여 등급", avg(bonus) "평균보너스" from employee
group by sal_level order by "평균보너스" desc;

select dept_code "부서명", min(hire_date) 가장오래된사원입사일 from employee
group by dept_code order by min(hire_date);

select dept_code "부서 명", count(*) "급여 300 이상 사원 수" from employee
where salary >= 300
group by dept_code;

--부서별 보너스 0.1 이상 사원수 조회
select dept_code 부서명, count(*) "보너스0.1이상사원수"  from employee
where bonus >= 0.1 and dept_code is not null
group by dept_code;

-- 급여가 400 이하인 사원들의 직급별 사원 수
select job_code "직급", count(*) "사원 수" from employee
where salary<=4000000
group by job_code order by "사원 수" desc;

-- 급여 500 이상 사원 부서별 평균 급여 내림차순
select dept_code "부서 명", avg(salary) "500사원평균급여" from employee
where salary >=5000000 group by dept_code order by avg(salary) desc;

select dept_code "부서 명" 

--누군가의 매니저인 사원을 출력하시오

