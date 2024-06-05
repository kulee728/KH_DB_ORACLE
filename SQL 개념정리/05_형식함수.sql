/* 
TO CHAR
EXTRACT
CEIL ROUND FLOOR TRUNC ABS MOD
IF CASE
CREATE
ALTER
 */
 
 -- 형변환 ( PARSING ) 함수
 
 -- 문자열 CHAR, VARCHAR2 <> 숫자 (NUMBER
 -- 문자열 <> 날짜 (DATE)
 -- 숫자 <> 날짜(DATE)
 
 -- TO_CHAR(날짜 혹은 숫자, [FORMAT]) : 특정 포맷을 가진 문자열로 변환
 -- 숫자 > 문자열
 -- 날짜 > 문자열
 
 SELECT 1234, TO_CHAR(1234) FROM DUAL; -- 데이터 타입 문자열로 변경
 
 SELECT 1234, TO_CHAR(1234,'99999999') FROM DUAL; -- 1234 앞에 공백 4칸 (총 8칸)
 SELECT 1234, TO_CHAR (1234,'00000000') FROM DUAL; --앞에 0 생성
 SELECT 1234, TO_CHAR(1234,'000') FROM DUAL; -- 자리수 안맞아서 제대로 출력 안됨!
 
 SELECT
    TO_CHAR(123456789,'L999999999'), --L,9 아홉개
    TO_CHAR(123456789, '$999999999'),
    TO_CHAR(123456789,'$999,999,999')
    FROM DUAL; --L은 내 국가 화폐. 

SELECT emp_id 사번,EMP_NAME 이름, TO_CHAR(SALARY*12,'L9,999,999,999') 연봉
FROM EMPLOYEE;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD : HH24:MI:SS')
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD DAY PM HH:MI:SS ') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD (DY) PM HH:MI:SS ') FROM DUAL;
 SELECT TO_CHAR(SYSDATE,'YYYY"년"MM"월"-DD"일" DAY PM HH"시" MI"분" SS"초" ') FROM DUAL;
 
 --RR과 YY의 차이
  /*
  'YY'는 2000년대를 나타내고 'RR'은 1900년대를 포함한다고 보시면 될 것 같습니다.
'RR'은 50년을 기준으로 50 이상이면 1900년대, 50 미만이면 2000년대를 나타냅니다.
 */

 -- 1) 50년대 미만
 SELECT TO_DATE('49-12-01','YY-MM-DD') AS YY, --2049년
  TO_DATE('49-12-01','RR-MM-DD') AS RR --2049년
 FROM DUAL;
 -- 2) 50년대 이상 확인
 SELECT TO_DATE('50-12-01','YY-MM-DD') AS YY, --2050년
  TO_DATE('50-12-01','RR-MM-DD') AS RR -- 1950년
 FROM DUAL;
 
 
 /*
 TO_DATE(문자열 혹은 숫자, [FORMAT])
DUAL 가장 테이블 문자열이 날짜를 표현하는 형식이면 바로 형식 지정 없기 변경 가능하다.
 */
 SELECT TO_DATE('2024-05-05')
 FROM DUAL;
 
 SELECT TO_DATE('06-05-2024','DD-MM-YYYY') FROM DUAL;
 
