/*
[JOIN]
- 하나 이상의 테이블에서 데이터를 조회하기 위해 사용
- 수행 결과는 하나의 RESULT SET 으로 나옴
- RDBMS 에서 SQL을 이용해 테이블 간 관계를 맺는 방법.
- 관계형 데이터 베이스는, 최소한의 데이터를 테이블에 담고 있어
- 원하는 정보를 테이블에서 조회하려면 한 개 이상의 테이블에서 데이터를 읽어 와야 하는 경우가 빈번함.
이때, 테이블 간 관계를 맺기 위한 연결고리 역할이 필요한데 두 테이블에서 같은 데이터를 저장하는
칼럼이 연결 고리로 작용한다.
*/

/*
등가 조인 : INNER JOIN / JOIN USING, ON, NATURAL JOIN
포괄 조인 : 왼쪽 조인 LEFT OUTER JOIN / 오른쪽 외부 조인 RIGHT OUTER JOIN / 전체 외부 조인 FULL OUTER JOIN
자체 조인 : JOIN ON
교차 조인 : CROSS JOIN

*/

-- 서로 다른 테이블 데이터를 조회하는 경우
-- 직원 번호, 직원 명, 부서코드, 부서명을 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE ;

-- 부서 코드에 따라 부서명 조회
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

--JOIN 을 이용, 두 테이블을 같이 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

--다른 테이블 한 컬럼과 같은 행을 찾아 기준 테이블 옆에 붙여 나가는 것
/*
-- 1 . 내부 조인 INNER JOIN
> 연결되는 컬럼의 값이 일치하는 행들만 조인 됨
일치하는 값이 없는 행은 조인에서 제외된다.
작성 방법 ANSI  ///// ORACLE 
1) ANSI 표준 구문 방식 : 
구문 기준을 정할 때, 표준 ASCII 코드를 따른다

2)ORACLE :
FROM 절에 쉼표(,)로 구분하여 합칠 테이블 명을 기술.
WHERE 절에 합칠 기준 컬럼 명을 명시
* 연결에 사용할 두 컬럼 명이 다른 경우 >> JOIN / ON 을 사용
* ORACLE 에서는 JOIN, ON을 사용하지 않고 WHERE 절에만 적어두면 된다.
*/
SELECT EMP_ID, EMP_NAME, DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;
-- 이 내용을
SELECT EMP_ID, EMP_NAME, DEPT_CODE,DEPT_ID,DEPT_TITLE
FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE = DEPT_ID;
-- 이렇게 바꿀 수 있다.

SELECT EMP_ID,EMP_NAME,DEPT_CODE||'-'||LOCAL_CODE "부서-지역",DEPT_TITLE,LOCAL_NAME
FROM EMPLOYEE,DEPARTMENT,LOCATION
WHERE DEPT_CODE = DEPT_ID AND LOCATION_ID = LOCAL_CODE;

SELECT EMP_ID,EMP_NAME,DEPT_CODE||'-'||LOCAL_CODE "부서-지역",DEPT_TITLE,LOCAL_NAME
FROM EMPLOYEE JOIN DEPARTMENT 
ON DEPT_CODE = DEPT_ID JOIN LOCATION ON LOCATION_ID = LOCAL_CODE
ORDER BY DEPT_CODE;

/*
    연결에 사용할 두 칼럼 명이 다른 경우 JOIN ON
   FROM TABLE1 JOIN TABLE2 ON (TABLE1.XX = TABLE2.YY) 
    
    연결에 사용할 두 칼럼 명이 같은 경우 JOIN USING
- FROM TABLE 1 JOIN TABLE2 USING COLUMNNAME
*/

--사번 이름 직급 코드, 직급 명 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE JOIN JOB USING (JOB_CODE);

-- D5 부서 직원 이름 직급명
SELECT DEPT_CODE, EMP_NAME, JOB_NAME
FROM EMPLOYEE, JOB WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE AND DEPT_CODE ='D5';

-- 각 부서 명 해당 부서 직원 평균 급여
SELECT D.DEPT_ID,D.DEPT_TITLE, FLOOR(AVG(E.SALARY))
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE, D.DEPT_ID;

-- 급여 등급 S4 이상 직원 이름 급여 급여등급
SELECT E.EMP_NAME,E.SALARY,S.SAL_LEVEL
FROM EMPLOYEE E JOIN SAL_GRADE S ON e.sal_level = s.sal_level
WHERE S.SAL_LEVEL >= 'S4';



















/*
NATURAL JOIN : 
동일한 타입과 이름을 가진 칼럼이 있는 테이블 간 조인을 간단히 표현.
반드시 반드시 &&&& 두 테이블 간 동일한 컬럼, 타입을 가진 컬럼이 필요. 없다면 교차조인이 되버린다.
칼럼 명이 일치 해야한다!!!
*/
 
--JOIN에 별칭 설정 후 테이블 표현하기..이때 ALIAS 는 SELECT 쪽에도 적용시켜줘야 한다.
