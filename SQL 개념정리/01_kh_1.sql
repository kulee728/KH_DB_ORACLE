select emp_id,emp_name,salary,dept_code from employee where dept_code is not null;

select emp_id, emp_name, salary from employee where salary*12 <=50000000;

select emp_name, dept_code, phone from employee where dept_code != 'D9';

select emp_name, dept_code, salary from employee where dept_code = 'D6' AND salary >='3000000';

select * from employee where
dept_code = 'D6' and job_code = 'J3';

/*employee 테이블에서
입사일 2000년인 사원의 이름, 입사일*/
select emp_name,hire_date as "입사일" from employee where
hire_date BETWEEN TO_DATE('2000-01-01','YYYY-MM-DD') AND TO_DATE('2000-12-31','YYYY-MM-DD');

select emp_name,hire_date as "입사일" from employee where
hire_date >='2000/01/01' and hire_date <='2000/12/31'



