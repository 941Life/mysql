-- 문제 1.
select max(salary) as '최고임금', min(salary) as '최저임금',(max(salary)-min(salary)) as '최고임금 - 최저임금'  
from salaries;

-- 문제 2.
select date_format(max(hire_date),"%Y년 %m월 %d일")
 from employees;
 
-- 문제 3.
select date_format(min(hire_date),"%Y년 %m월 %d일") as '입사일' from employees e join salaries s on e.emp_no = s.emp_no
where period_diff(date_format(s.to_date,"%Y%m"),date_format(e.hire_date,"%Y%m")) =
(SELECT max(period_diff(date_format(s.to_date,"%Y%m"),date_format(e.hire_date,"%Y%m"))) FROM employees e join salaries s on e.emp_no = s.emp_no) ;

-- 문제 4.
select avg(salary) 
from salaries 
where to_date = '9999-1-1';

-- 문제 5.
select max(salary) as '최고연봉', min(salary) as '최저연봉' 
from salaries 
where to_date = '9999-1-1';

-- 문제 6.
select floor(period_diff(date_format((now()),"%Y%m"), date_format(max(birth_date),"%Y%m"))/12) as '최연소자',
	floor(period_diff(date_format((now()),"%Y%m"), date_format(min(birth_date),"%Y%m"))/12) as '최고연장자'
 from employees;