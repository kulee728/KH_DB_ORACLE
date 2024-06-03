select * from member;


CREATE TABLE DEPARTMENT2 AS SELECT * FROM department;
SELECT * FROM department2;


INSERT INTO department2
VALUES ('D0', '개발운영부', 'L1');

ROLLBACK;

create table EMPLOYEE2 as select * from EMPLOYEE;
select * from employee2;

ROLLBACK;
INSERT INTO EMPLOYEE2 VALUES(       800,     '동그라미', '870814-2123456',    'KIM@KH.KR'         , '01076996190',            'D1',      'J7',         'S3',            4300000 , 0.2,        200,             SYSDATE, NULL, 'N'); 
select * from employee2;
rollback;
commit;

select * from department2
where dept_id = 'D9';

UPDATE department2
set DEPT_TITLE='전략기획실'
where dept_id = 'D9';

rollback;
