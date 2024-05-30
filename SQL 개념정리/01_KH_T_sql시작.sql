INSERT INTO kh_cafe (C_ID,c_name,c_address ,c_phone,c_time) values(2,'빠나쁘례쏘','서울시 강남구 력삼동','02-5555-5555','영업시간 12:00 ~ 14:00');

INSERT INTO kh_cafe (C_ID,c_name,c_address ,c_phone,c_time) values(2,'검포즈커피','경기도 화남시 화남구','031-3232-3333','영업시간 평일 15:00 ~ 18:00');

INSERT INTO kh_cafe (C_ID,c_name,c_address ,c_phone,c_time) values(2,'활리스커피','인천시 남동구 남동동','032-8888-8888','영업시간 평일 10:00 ~ 17:00');
INSERT INTO kh_cafe (C_ID,c_name,c_address ,c_time) values(2,'거피빈','서울특별시 역삼동','영업시간 평일 10:00 ~ 17:00');

select c_id,c_name,c_address from kh_cafe order by C_NAME;
select m_name as 멤버이름, m_phone as 멤버번호 from member; 
-- as는 alias . 이름 
select c_name as 카페이름,c_phone as 카페번호 from kh_cafe;


/*
정보를 가져올 때 사용한다.
*/