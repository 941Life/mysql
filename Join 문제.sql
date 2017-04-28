-- 문제 1
select e.emp_no as '사번', concat(e.first_name,' ',e.last_name) as '이름' ,s.salary as '연봉'
from employees e, salaries s
where e.emp_no = s.emp_no
order by s.salary desc;

-- 문제 2
select e.emp_no as '사번', concat(e.first_name,' ',e.last_name) as '이름' , t.title as '현재 직책'
from employees e, titles t
where e.emp_no = t.emp_no
and t.to_date = '9999-1-1';

-- 문제 3
select e.emp_no as '사번', concat(e.last_name,',',e.first_name) as '이름' , dp.dept_name as '현재 부서'
from employees e, dept_emp d, departments dp
where e.emp_no = d.emp_no
and d.dept_no = dp.dept_no
and d.to_date = '9999-1-1'
order by e.last_name;

-- 문제 4
select e.emp_no as '사번', concat(e.last_name,',',e.first_name) as '이름' ,s.salary as '연봉', t.title as '직책' , dp.dept_name as '부서'
from employees e, dept_emp d, departments dp,  titles t,  salaries s
where e.emp_no = d.emp_no
and d.dept_no = dp.dept_no
and e.emp_no = s.emp_no
and  e.emp_no = t.emp_no
order by e.last_name;

-- 문제 5
select e.emp_no as '사번', concat(e.first_name,' ',e.last_name) as '이름'
from employees e, titles t
where e.emp_no = t.emp_no
and t.title = 'Technique Leader'
and t.to_date != '9999-1-1';

-- 문제 6
select concat(e.first_name,' ',e.last_name) as '이름',dp.dept_name as '부서', t.title as '직책'
from employees e, dept_emp d, departments dp , titles t
where e.emp_no = d.emp_no
and d.dept_no = dp.dept_no
and e.emp_no = t.emp_no
and e.last_name like 'S%';

-- 문제 7
select *
from employees e, salaries s, titles t
where e.emp_no = s.emp_no
and  e.emp_no = t.emp_no
and t.title = 'Engineer'
and s.salary >= 40000
order by s.salary;

-- 문제 8
select t.title , s.salary
from employees e, salaries s, titles t
where e.emp_no = s.emp_no
and  e.emp_no = t.emp_no
and s.salary >= 50000
group by t.title
order by s.salary;

-- 문제 9
select d.dept_no as '부서 번호'  , avg(s.salary) as '평균연봉'
from employees e, salaries s, dept_emp d
where e.emp_no = s.emp_no
and s.emp_no = d.emp_no
group by d.dept_no
order by avg(s.salary) desc
;
-- 문제 10
select t.title as '직책', avg(s.salary) as '평균 연봉'
from employees e, salaries s, titles t
where e.emp_no = s.emp_no
and  e.emp_no = t.emp_no
group by t.title
order by avg(s.salary) desc;