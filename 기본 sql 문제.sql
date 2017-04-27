-- 문제 1.
select concat(first_Name, ' ' , last_name) as name 
from employees 
where emp_no = 10944;

-- 문제 2.
select concat(first_Name, ' ' , last_name) as name,gender as '성별', hire_date as '입사일' 
from employees 
order by hire_date asc 
limit 0, 20000;

-- 문제 3.
select count(case when gender='M' then 1 else null end) as '남성', count(case when gender ='F' then 1 else null end) as '여성' 
from employees;

-- 문제 4.
select count(*) 
from salaries
 where to_date = '9999-1-1';

-- 문제 5.
select count(*) 
from departments;

-- 문제 6.
select count(*) 
from dept_manager 
where to_date = '9999-1-1';

-- 문제 7.
select dept_name 
from departments 
order by length(dept_name) desc;

-- 문제 8. 
select count(*)
from salaries
where salary >= 120000;

-- 문제 9.
select distinct title 
from titles;

-- 문제 10.
select count(*) 
from titles 
where title='Engineer';

-- 문제 11.
select * from titles 
where emp_no = '13250' 
order by from_date asc;