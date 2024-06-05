-- TCL : Transaction Control Language
-- 변경 할 사항을 묶어서 하나의 트랜잭션에 처리한다.
/*
트랜잭션
- 데이터를 변경 쿼리 DML
INSERT UPDATE DELETE SELECT(DQL)
INSERT INTO 값 추가 --트랜잭션에 추가 -- COMMIT -- > DB 반영 (COMMIT을 반드시 해야 한다.)
INSERT INTO ~~ 

트랜잭션은 ACID 속성을 갖는다
Atomicity : all or nothing
Consistency : 일관된 상태 (규약) 유지해야한다, 
Isolation : 다른 트랜잭션에 관여 할 수 없다.
Durability : 트랜잭션의 수행은 영구적으로 반영된다. 

- COMMIT : 메모리에 임시 저장된 데이터를 DB에 영구반영
- ROLLBACK : 메모리에 임시 저장된 데이터를 삭제
- SAVEPOINT : ROLLBACK 할 포인트를 지정한다
*/

-- COMMIT 예제
CREATE TABLE DEPARTMENT3 AS SELECT * FROM DEPARTMENT;
SELECT * FROM DEPARTMENT3;
INSERT INTO DEPARTMENT3 VALUES ('D0','경리부','L2');

UPDATE DEPARTMENT3 SET DEPT_TITLE = '전략기획팀',
LOCATION_ID='L3' WHERE DEPT_ID = 'D9';
COMMIT;
ROLLBACK;
-- ROLLBACK 예제
DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D0';

DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D8';

ROLLBACK;

-- SAVEPOINT 예제
--DEPT_ID 가 0인 행을 삭제
DELETE FROM DEPARTMENT3
WHERE DEPT_ID = 'D0';
SAVEPOINT "SP1";

DELETE FROM DEPARTMENT3 WHERE DEPT_ID = 'D9';
SAVEPOINT "AAA";

DELETE FROM DEPARTMENT3;
SELECT * FROM DEPARTMENT3;
ROLLBACK TO "AAA";
ROLLBACK TO "SP1";
ROLLBACK
;
