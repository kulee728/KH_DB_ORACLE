create table CAFEMENU(
    menu_id number(10,0) primary key,
    menu_name varchar2(100),
    menu_desc varchar2(255),
    menu_price number(10,2)
)

INSERT INTO CAFEMENU (MENU_ID,MENU_NAME,MENU_DESC,MENU_PRICE)
SELECT 1,'아메리카노','신선한 원두로 만든 아메리카노',3000 FROM DUAL
UNION ALL
SELECT 2,'카페라떼','부드러운 우유가 들어간 라떼  ',3500 FROM DUAL
UNION ALL
SELECT 3,'카푸치노','진한 커피와 거품이 어우러진 카푸치노',3500 FROM DUAL
UNION ALL
SELECT 4,'카라멜 마키아토','달콤한 카라멜 시럽이 들어간 마키아토',4000 FROM DUAL
UNION ALL
SELECT 5,'에스프레소','강한 맛과 향의 에스프레소',2500 FROM DUAL;

/*
INSERT INTO table(column1, column2, ...)
SELECT value1, value2, ... FROM DUAL
UNION ALL
SELECT value1, value2, ... FROM DUAL
UNION ALL
...
SELECT value1, value2, ... FROM DUAL;
이걸로 한번 다중 insert 해보자
*/

--메뉴이름 앞에 카
SELECT * FROM CAFEMENU WHERE MENU_ID='1';

--가격 3500인메뉴들
SELECT * FROM CAFEMENU WHERE MENU_PRICE='3500';

--키오스크 1번 메뉴들
SELECT * FROM CAFEMENU WHERE MENU_ID='1';

--특정 단어 포함된 메뉴 설명 조회 카라멜
SELECT * FROM CAFEMENU WHERE MENU_DESC LIKE '%카라멜%';

--가격이 낮은 메뉴 순
SELECT * FROM CAFEMENU ORDER BY MENU_PRICE