
/*
내림 FLOOR
올림 CEIL
반올림 ROUND
버림 TRUNC

FLOOR > 주어진 숫자보다 작지만 가장 큰 정수를 반환. 소수 부분은 버림
*/
SELECT FLOOR(5.7) FROM DUAL;
SELECT FLOOR(-6.6) FROM DUAL;

SELECT TRUNC(-6.623,2) FROM DUAL; --TRUNC 는 그냥 물리적으로 버려버린다.
SELECT TRUNC(5.7)FROM DUAL;