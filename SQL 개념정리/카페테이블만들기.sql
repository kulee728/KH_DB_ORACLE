create table CAFEMENU(
    menu_id number(10,0) primary key,
    menu_name varchar2(100),
    menu_desc varchar2(255),
    menu_price number(10,2)
)

INSERT INTO CAFEMENU (MENU_ID,MENU_NAME,MENU_DESC,MENU_PRICE)
VALUES (1,'아메리카노','신선한 원두로 만든 아메리카노',3000);
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