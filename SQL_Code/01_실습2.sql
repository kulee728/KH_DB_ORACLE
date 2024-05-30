--26. `DEPT_CODE`가 'D5'가 아닌 사원의 이름과 부서 코드
select emp_name,dept_code from employee where dept_code != 'D5';

--27. `SALARY`가 3000000보다 크지 않은 사원의 이름과 급여
select emp_name,salary from employee where salary <=3000000;

--28. `JOB_CODE`가 'J3'가 아닌 사원의 이름과 직무 코드
select emp_name, job_code from employee where job_code != 'J3';

--29. `BONUS`가 0.1이 아닌 사원의 이름과 보너스
select emp_name,bonus from employee where bonus !=0.1;

--30. `MANAGER_ID`가 200이 아닌 사원의 이름과 매니저 ID
select emp_name,manager_id from employee where manager_id != 200;

--31. `EMAIL`이 없는 사원의 이름과 이메일
select emp_name,email from employee where email is null;

--32. `PHONE`이 없는 사원의 이름과 전화번호
select emp_name,phone from employee where phone is null;

--33. `BONUS`가 없는 사원의 이름과 보너스
select emp_name, bonus where bonus is null;

--34. `MANAGER_ID`가 없는 사원의 이름과 매니저 ID
select emp_name,manager_id from employee where manager_id is null;

--35. `ENT_DATE`가 없는 사원의 이름과 종료일
select emp_name,ent_date from employee where ent_date is null;

--36. `EMAIL`이 있는 사원의 이름과 이메일
select emp_name,email from emplyoee where email is not null;
--37. `PHONE`이 있는 사원의 이름과 전화번호
select emp_name,phone from emplyoee where phone is not null;
--38. `BONUS`가 있는 사원의 이름과 보너스
select emp_name,bonus from emplyoee where bonus is not null;
--39. `MANAGER_ID`가 있는 사원의 이름과 매니저 ID
select emp_name,manager_id from emplyoee where manager_id is not null;
--40. `ENT_DATE`가 있는 사원의 이름과 종료일
select emp_name,ent_date from emplyoee where ent_date is not null;

--41. `SALARY`가 2000000에서 3000000 사이인 사원의 이름과 급여
select emp_name,salary from employee where salary between 2000000 and 3000000;

--42. `HIRE_DATE`가 2000년 1월 1일부터 2010년 12월 31일 사이인 사원의 이름과 입사일
select emp_name,hire_date from employee where hire_date between '2000/01/01' and '2010/12/31';

--43. `EMP_ID`가 210에서 220 사이인 사원의 이름과 ID
select emp_name, emp_id from employee where emp_id between '210' and '220';

--44. `BONUS`가 0.1에서 0.3 사이인 사원의 이름과 보너스
select emp_name, bonus from employee where bonus between '0.1' and '0.3';
--45. `SAL_LEVEL`이 'S3'에서 'S5' 사이인 사원의 이름과 급여 수준
select emp_name, sal_level from employee where sal_level between 'S3' and 'S5';

--46. `SALARY`가 2000000에서 3000000 사이가 아닌 사원의 이름과 급여
select emp_name, salary from employee where salary between 2000000 and 3000000;

--47. `HIRE_DATE`가 2000년 1월 1일부터 2010년 12월 31일 사이가 아닌 사원의 이름과 입사일
select emp_name,hire_date from employee where hire_date not between '2000/01/01' and '2010/12/31';

--48. `EMP_ID`가 210에서 220 사이가 아닌 사원의 이름과 ID
select emp_name,emp_id from employee where emp_id not between '210' and '220';

--49. `BONUS`가 0.1에서 0.3 사이가 아닌 사원의 이름과 보너스
select emp_name, bonus from employee where bonus not between '0.1' and '0.3';

--50. `SAL_LEVEL`이 'S3'에서 'S5' 사이가 아닌 사원의 이름과 급여 수준
select emp_name, sal_level from employee where sal_level not between 'S3' and 'S5';

