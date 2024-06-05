 /*선택함수 SQL
 여러 경우에 따라  앎자은 결과 선택하기
 - DECODE(칼럼명 혹은 계산식, 조건1,결과1, 조건2,결과2,..,DEFAULT값) 
 */
 SELECT EMP_NAME, EMP_NO, DECODE(
    SUBSTR(EMP_NO,8,1), -- 주민번호 뒷자리 첫째 자리
    '1','남자',
    '2','여자',
    '기타') 
    "남여기타" FROM EMPLOYEE;

/* DECODE 실습 */
    
    -- 주어진 학생의 성별 기준으로 성별 출력
    SELECT STUDENT_NAME "학생 명", STUDENT_SSN "주민등록번호", DECODE(SUBSTR(STUDENT_SSN,8,1),'1','남자','2','여자','기타') 
    "성별" FROM TB_STUDENT;

    --
    SELECT EMP_NAME, DEPT_CODE, DECODE(DEPT_CODE,'D1','인사관리부',
    'D2','회계관리부',
    'D3','마케팅부',
    'D4','국내영업부', '기타')
    "부서 명"FROM EMPLOYEE;
    
        --
    SELECT EMP_NAME, JOB_CODE, DECODE(JOB_CODE,
    'J1','대표',
    'J2','부사장',
    'J3','부장',
    'J4','차장', 
    'J5','과장',
    'J6','대리',
    'J7','사원',
    '기타')
    "직급"FROM EMPLOYEE;
    
    --CASE WHEN
    -- 사용법 CASE WHEN 조건 THEN 실행
    --              WHEN 조건2 THEN 실행2
--                  ELSE (실행DEFAULT)
--      END
    -- 예제 1 사번 이름 급여 구분 조회
    SELECT EMP_ID, EMP_NAME, SALARY,
    CASE WHEN SALARY >=5000000 THEN '고급'
            WHEN SALARY >= 3000000 THEN '중급'
            ELSE '초급'
            END "구분"
    FROM EMPLOYEE;
    
/*
CASE WHEN THEN ELSE END 실습
1) 급여에 따라 등급 설정
600만 이상 S1 500만 이상 S2
*/
SELECT EMP_NAME, SALARY, 
CASE WHEN SALARY>=6000000 THEN 'S1'
    WHEN SALARY> 5000000 THEN 'S2'
    WHEN SALARY>=4000000 THEN 'S3'
    ELSE 'S4'
    END "급여등급"
FROM EMPLOYEE;

SELECT EMP_NAME, HIRE_DATE, CASE 
WHEN FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))/12 >= 20 THEN '20년차이상'
WHEN FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))/12 >= 10 THEN '10년차이상'
ELSE '10년차 미만'
END "근속기간"
FROM EMPLOYEE;