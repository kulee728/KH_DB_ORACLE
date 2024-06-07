/* 
view > 논리적 가상 테이블.
실제로 값을 저장하고 있지는 않지만 데이터를 보여줄 수 있는 가상의 테이블
SELECT 실행 결과 (RESULT SET) 을 저장한다.

VIEW 는 
- 복잡한 SELECT를 쉽게 재사용 하기 위해
- 테이블의 진짜 모습을 감추어 보안상의 이점
- 수정할 수 없음 (ALTER 불가능)
- VIEW 를 이용한 DML (INSERT, UPDATE, DELETE) 에는 여러 제약이 존재


작성법
CREATE [OR REPLACE] [FORCE|NOFORCE] VIEW 뷰이름 [칼럼 별칭]
AS 서브쿼리 (SELECT 문)
[WITH CHECK OPTION]
[WITH READ ONLY]

-------------
OR REPALCE : 기존 동일한 이름의 VIEW가 있다면 이름 변경해서 생성, 없다면 새로 생성 옵션
FORCE | NOFORCE : 서브 쿼리에 사용된 테이블이 
                            존재하지 않아도 뷰 생성(FORCE), 반대로 존재해야만 생성은 NOFORCE
WITH CHECK OPTION : 옵션 지정 칼럼 값을 수정 불가능으로
WITH READ ONLY : SELECT 만 가능하도록
*/
CREATE OR REPLACE VIEW ALL_COMPANIES AS SELECT * FROM COMPANY;
SELECT * FROM ALL_COMPANIES;
/*
뷰는 테이블을 복제하거나 조합, 테스트용 테이블을 만들어 SELECT 하는 용도로 많이 사용한다.
*/

CREATE VIEW ONEFIVE_SNACKS AS SELECT * FROM SNACKS WHERE PRICE >= 1500;
SELECT * FROM ONEFIVE_SNACKS;

CREATE VIEW COMPANY_IN_GANGNAM AS SELECT * FROM COMPANY WHERE company_address = '서울시 강남구';

