/*
관리자 계정 : 
    데이터베이스 생성과 관리를 책임
    sys(최고관리자), system(일부 권한 제한 관리자)

사용자 계정 : 
    업무에 필요한 최소한의 권한을 갖는 계정
*/

/*
최고관리자 로그인 sqlplus sys as sysdba;

grant 로 권한 줄 수 있다

grant 권한 to 유저명;

connect : db 접속 관련 권한 허용 (session, cluster, link, sequence, synonym, table, view)
resource : 객체 생성을 위한 권한 (cluster, procedure, sequence, table, trigger
DBA : 최고설정

*/
-- 사용자 계정 생성하기 CREATE USER 사용자명 IDENTIFIED BY 비밀번호

CREATE TABLE COMPANY(
COMPANY_ID NUMBER PRIMARY KEY,
COMPANY_NAME VARCHAR(100) NOT NULL,
COMPANY_ADDRESS VARCHAR2(55),
COMPANY_PHONE VARCHAR2(20)
);

ALTER TABLE COMPANY RENAME TO COMPONY;
ALTER TABLE COMPONY RENAME TO COMPANY;


CREATE SEQUENCE COMPANY_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    INSERT INTO COMPANY VALUES (
    COMPANY_SEQ.NEXTVAL,
    '햍에제과',
    '서울시 강남구',
    '02-1234-5678'
    );
    INSERT INTO COMPANY VALUES (
    COMPANY_SEQ.NEXTVAL,
    '롯에제과',
    '서울시 중구',
    '02-2345-6789'
    );
    INSERT INTO COMPANY VALUES (
    COMPANY_SEQ.NEXTVAL,
    '올이온',
    '서울시 용산구',
    '02-3456-7890'
    );
    
CREATE TABLE SNACKS(
    SNACK_ID NUMBER(10,0),
    SNACK_NAME VARCHAR2(100),
    PRICE NUMBER(10,2),
    COMPANY_ID, CONSTRAINT CID_FK FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY(COMPANY_ID) ON DELETE CASCADE
    );
    
    
    SELECT * FROM COMPANY;
    SELECT * FROM SNACKS;
    CREATE SEQUENCE SNACKS_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    INSERT INTO SNACKS VALUES(
    SNACKS_SEQ.NEXTVAL
    ,'오에스', '1500', '1'
    );INSERT INTO SNACKS VALUES(
    SNACKS_SEQ.NEXTVAL
    ,'칸조', '1220', '1'
    );
    INSERT INTO SNACKS VALUES(
    SNACKS_SEQ.NEXTVAL
    ,'배배로', '1100', '1'
    );
    INSERT INTO SNACKS VALUES(
    SNACKS_SEQ.NEXTVAL
    ,'조고파이', '2000', '1'
    );
    SELECT * FROM SNACKS;
    UPDATE SNACKS SET company_id = '2'
    WHERE snack_id>=3;
    
  SELECT * FROM SNACKS
  WHERE price>=1500;
  SELECT * FROM COMPANY WHERE company_address LIKE '%강남구%'
;
SELECT * FROM SNACKS
WHERE COMPANY_ID = '1';

SELECT COMPANY_NAME,S.* FROM SNACKS S, COMPANY C
WHERE C.company_id = S.company_id AND C.COMPANY_ID = 1;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    