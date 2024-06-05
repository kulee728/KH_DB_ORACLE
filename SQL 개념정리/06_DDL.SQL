/*
Data Definition Language : 데이터 정의 언어

CREATE 제작
ALTER 수정
DROP 삭제


ORACLE에서 정의 할 수 있는 객체(OBJECT) 종류
TABLE
VIEW
SEQUENCE
INDEX
PACKAGE
TRIGGER
PROCEDURE
FUNCTION
SYNONYM
USER
*/

--CREATE 
-- 테이블이나 인덱스, 뷰 등 여러 DB 객체를 생성한다
-- 테이블로 생성한 객체는 DROP을 통해 제거한다.

--테이블 : ROW - COLUMN 으로 구성된 데이터베이스 객체. DB의 모든 데이터는 테이블을 통해 저장된다.
CREATE TABLE 테이블명 (
                    --COLUMNNAME1 자료형(크기)
                    COLUMNNAME2 VARCHAR2(20)
                    --...
                    );
                    

--실습하자
CREATE TABLE USER_MEMBER(
    USER_ID VARCHAR2(20),
    USER_PW VARCHAR2(20),
    USER_NAME VARCHAR2(15), --한글 최대 5글자
    USER_SSN CHAR(14), --14글자 고정
    ENROLL_DATE DATE
    );
    ALTER TABLE USER_MEMBER MODIFY ENROLL_DATE DATE DEFAULT  SYSDATE;

-- 칼럼에 주석으로 설명 추가하기
-- COMMENT ON COLUMN 테이블명, 컬럼명 IS '주석내용'
COMMENT ON COLUMN USER_MEMBER.USER_ID IS '회원아이디';


