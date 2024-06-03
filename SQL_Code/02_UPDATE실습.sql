--1. 직원 사원 번호 '200'의 이메일을 'sun_di_updated@or.kr'로, 전화번호를 '01012345678'로 변경
select *from employee2;
update employee2 set 
EMAIL = 'sun_di_dupated@or.kr',
PHONE = '01012345678'
where emp_id='200';

SELECT * FROM EMPLOYEE2
WHERE DEPT_CODE = 'D1';

--2. 부서 코드 'D1'에 속한 모든 직원의 급여를 10% 인상하고, 보너스율을 0.05 증가시키기

UPDATE EMPLOYEE2 SET BONUS = 0
WHERE BONUS IS NULL;

UPDATE EMPLOYEE2 SET SALARY = SALARY*1.1,
BONUS = BONUS +0.05
WHERE DEPT_CODE = 'D1';
ROLLBACK;



SELECT JOB_CODE,DEPT_CODE FROM EMPLOYEE2 WHERE JOB_code = 'J5';
3. 직무 코드 'J2'를 가진 모든 직원의 직무 코드를 'J5'로, 부서 코드를 'D3'로 변경
UPDATE EMPLOYEE2 SET JOB_CODE='J5',
DEPT_CODE = 'D3'
WHERE JOB_CODE ='J2';
rollback


4. 입사일이 2000-01-01 이후인 모든 직원의 급여를 5% 인상하고, 보너스율을 0.02 증가시키기

5. 매니저 ID가 '200'인 모든 직원의 매니저 ID를 '210'으로, 부서 코드를 'D5'로 변경

6. 모든 직원의 이메일 도메인을 'or.kr'에서 'company.com'으로 변경하고, 전화번호 형식을 '010-xxxx-xxxx'로 변경

UPDATE EMPLOYEE2 SET EMAIL=SUBSTR(EMAIL,1,INSTR(EMAIL,'or.kr')-1)||'company.com',
PHONE = SUBSTR(PHONE,1,3)||'-'||SUBSTR(PHONE,4,4)||'-'||SUBSTR(PHONE,8,4)
WHERE PHONE IS NOT NULL;

UPDATE EMPLOYEE2 SET EMAIL=SUBSTR(EMAIL,1,INSTR(EMAIL,'@')) || 'company.com',
PHONE = SUBSTR(PHONE,1,3)|| '-' || SUBSTR(PHONE,4,4) || '-' || SUBSTR(PHONE,8,4);
WHERE PHONE IS NOT NULL;
ROLLBACK;

DROP TABLE EMPLOYEE2;
CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE2;

ALTER TABLE EMPLOYEE2
MODIFY PHONE VARCHAR2(16);
010-XXXX-XXXX
13개

SELECT EMP_NAME, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') ) AS "이메일 아이디"
FROM EMPLOYEE;

-- 7. 급여 수준이 'S3'인 모든 직원의 급여를 4000000으로, 직무 코드를 'J4'로 수정
UPDATE EMPLOYEE2 SET SALARY = '4000000', JOB_CODE = 'J4' WHERE SAL_LEVEL = 'S3';
SELECT SALARY,JOB_CODE FROM EMPLOYEE2 WHERE SAL_LEVEL = 'S3';
ROLLBACK;

8. 입사일이 '1997-09-12'인 직원의 퇴사일을 '2024-09-12'로, 퇴사 여부를 'Y'로 변경



9. 이름이 '김영수'인 직원의 이름을 '김영호'로, 이메일을 'kim_yh@or.kr'로 변경

10. 전화번호가 '01045686656'인 직원의 전화번호를 '01198765432'로, 이메일을 'song_jk_updated@or.kr'로 변경

11. 보너스율이 0.1인 모든 직원의 보너스율을 0.2로, 급여를 3200000으로 변경

12. 주민등록번호가 '861015-1356452'인 직원의 급여를 3800000으로, 부서 코드를 'D7'으로 수정

13. 모든 직원의 부서 코드를 'D9'로, 직무 코드를 'J1'로 변경

14. 부서 코드 'D5'에 속한 모든 직원의 보너스율을 0.05 증가시키고, 전화번호를 '01011112222'로 변경

15. 직무 코드 'J3'를 가진 모든 직원의 이메일을 'updated@or.kr'로, 급여 수준을 'S5'로 변경

16. 모든 직원의 입사 연도를 '2023'로, 퇴사 여부를 'N'으로 변경
17. 보너스율이 0.15인 모든 직원의 보너스율을 0.25로, 급여를 4000000으로 변경

18. 부서 코드 'D8'과 직무 코드 'J2'를 가진 모든 직원의 급여를 4500000으로, 전화번호를 '01022223333'으로 변경

19. 모든 직원의 이메일 도메인을 'example.com'으로, 부서 코드를 'D10'으로 변경

20. 이름이 '박민수'인 직원의 이름을 '박준수'로, 급여를 3500000으로 변경

21. 부서 코드 'D3'에 속한 모든 직원의 급여를 3800000으로, 보너스율을 0.2로 수정

22. 입사일이 2000-01-01 이후인 모든 직원의 급여를 5% 인상하고, 보너스율을 0.02 증가시키기

23. 매니저 ID가 '201'인 모든 직원의 매니저 ID를 '211'으로, 부서 코드를 'D6'로 변경

24. 모든 직원의 이메일 도메인을 'newcompany.com'으로, 전화번호 형식을 '011-xxxx-xxxx'로 변경
select email,phone from employee2;
update EMPLOYEE2 set EMAIL= SUBSTR(EMAIL,1,INSTR(EMAIL,'@')) || 'newcompany.com',
PHONE = SUBSTR(PHONE,1,3) || '-' || SUBSTR(PHONE,4,4) || '-' || SUBSTR(PHONE,8,4);
rollback;

UPDATE EMPLOYEE2 SET EMAIL=SUBSTR(EMAIL,1,INSTR(EMAIL,'@')) || 'company.com',
PHONE = SUBSTR(PHONE,1,3)|| '-' || SUBSTR(PHONE,4,4) || '-' || SUBSTR(PHONE,8,4);

25. 부서 코드 'D4'에 속한 모든 직원의 보너스율을 0.1 증가시키고, 전화번호를 '01033334444'로 변경
