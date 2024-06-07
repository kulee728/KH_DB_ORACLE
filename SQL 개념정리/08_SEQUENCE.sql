/* SEQUENCE 자동으로 인덱스 매기기 */
/*
-- PK 가 지정도니 컬럼에 삽입될 값을 생성할 때 SEQUENCE 를 이용하면 좋다.
-- EX) 몇 번째 회원인지?

CREATE SEQUENCE [SEQUENCE_NAME]
[START WITH 숫자] -- 처음 발생 시킬 시작 값, DEFAULT 1
[INCREMENT BY 숫자] -- 증가 값, DEFAULT 1
[MAXVALUE 숫자 | NOMAXVALUE ] --발생시킬 최대값 지정 >> 최대 1000명만 기록하겠다
[MINVALUE 숫자 | NOMINVALUE] -- 최소 값 지정
[CACHE 바이트크기 | NOCACHE] - 캐시 메모리 지정. 기본 20BYTE (최소 2BYTE)
>>> 시퀀스의 캐시 메모리는 할당 단위의 배수 만큼 메모리를 생성, 저장한다.
.>>> 시퀀스 호출 시 미리 저장된 값들을 가져와 반환하므로 속도가 향상된다.

사용은
[SEQUENCE_NAME]
        .NEXTVAL : 다음 시퀀스 번호를 가져온다
        .CURRVAL : 현재 시퀀스 번호를 가져온다.
                * 이때 시퀀스가 생성되는 시기에 호출하면 오류가 발생한다.                                                                
                * 마지막으로 호출된 NEXTVAL 과 값이 같을 것 이다. 
*/

CREATE TABLE TB_TEST(
TEST_NO NUMBER PRIMARY KEY,
TEST_NAME VARCHAR2(30) NOT NULL);
DROP SEQUENCE TEST_SEQ;
CREATE SEQUENCE TEST_SEQ
    START WITH 100
    INCREMENT BY 5
    MINVALUE 100
    MAXVALUE 1000
    NOCACHE
    NOCYCLE;

SELECT TEST_SEQ FROM DUAL;
    
INSERT INTO TB_TEST VALUES
(TEST_SEQ.NEXTVAL,'TEST102');

SELECT * FROM TB_TEST;
    
SELECT TEST_SEQ.CURRVAL FROM DUAL;
    
    