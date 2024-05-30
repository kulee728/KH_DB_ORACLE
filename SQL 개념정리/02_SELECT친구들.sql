



select emp_name,dept_code,salary from employee where dept_code IN ('D5','D6','D7') ;
select emp_name,dept_code d,salary from employee where d ='D5' or d='d6' or d='d7';

select emp_name,dept_code, salary from employee where dept_code not in('D5','D6','D7');



select emp_name as 이름,salary as 급여,dept_code as 부서코드, job_code as 직무코드, email as 이메일, phone as 전화번호,
emp_id as 사원ID, hire_date as 입사일
from employee;

select emp_name as 이름, dept_code as 부서, salary as 급여 from employee;

select distinct dept_code from employee where dept_code is not null;
select distinct job_code from employee;
select sal_level from employee;

select emp_name,salary from employee where dept_code='D5' or salary >=2000000;

select emp_name,hire_date from employee where ent_yn='N' or HIRE_DATE >='2000/01/01';
select emp_name,sal_level,bonus from employee where sal_level='S5' or bonus='0.2' ORDER by sal_level DESC;
