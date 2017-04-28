-- 문제 1
select count(*)
from employees e , salaries s
where e.emp_no = s.emp_no
and s.salary > (select avg(salary) 
				from salaries);
                
-- 문제 2
select e.emp_no, concat(e.first_name,' ',e.last_name) as '이름', max(s.salary) as '연봉'
from employees e, dept_emp d, salaries s , (select e.emp_no,e.first_name,e.last_name,max(s.salary)
				from employees e, dept_emp d, salaries s
                where e.emp_no = d.emp_no
				and d.emp_no = s.emp_no
                group by d.dept_no) ms
where e.emp_no = d.emp_no
and d.emp_no = s.emp_no
and e.emp_no = ms.emp_no
group by d.dept_no
order by s.salary desc;

-- 문제 3
select e.emp_no, concat(e.first_name,' ',e.last_name) as '이름',max(s.salary) as '연봉'
from employees e, salaries s, dept_emp d
where e.emp_no = s.emp_no
and s.emp_no = d.emp_no
and s.salary > any(select avg(s.salary)
				from employees e, salaries s, dept_emp d
				where e.emp_no = s.emp_no
				and s.emp_no = d.emp_no
                group by d.dept_no)
group by d.dept_no;

-- 문제 4
select e.emp_no, concat(e.first_name,' ',e.last_name) as '이름', concat(dm.first_name,' ',dm.last_name) as '매니저 이름', dp.dept_name as '부서명'
from employees e, departments dp , dept_emp d ,
	(select e.first_name,e.last_name,e.emp_no,dm.dept_no
	from employees e, dept_manager dm 
	where e.emp_no = dm.emp_no) dm
where e.emp_no = d.emp_no
and dm.dept_no = dp.dept_no
and d.dept_no = dp.dept_no;

-- 문제 5
select e.emp_no, concat(e.first_name,' ',e.last_name) as '이름', t.title as '직책' , s.salary as '연봉'
from employees e, titles t, salaries s , dept_emp d, departments dp ,
						(select d.dept_no, avg(s.salary)
						from employees e, titles t, salaries s , dept_emp d
						where e.emp_no = t.emp_no
						and t.emp_no = s.emp_no
						and e.emp_no = d.emp_no
						group by d.dept_no
						order by avg(s.salary) desc
                        limit 1) ms
where e.emp_no = t.emp_no
and t.emp_no = s.emp_no
and e.emp_no = d.emp_no
and d.dept_no = ms.dept_no
and t.to_date = '9999-1-1'
and s.to_date = '9999-1-1'
;
                        
-- 문제 6
select dp.dept_name, avg(s.salary)
from  employees e, salaries s, dept_emp d, departments dp
where e.emp_no = s.emp_no
and s.emp_no = d.emp_no
group by d.dept_no
order by avg(s.salary) desc
limit 0,1;

-- 문제 7
select t.title, avg(s.salary)
from  employees e, salaries s,titles t
where e.emp_no = s.emp_no
and s.emp_no = t.emp_no
group by t.title
order by avg(s.salary) desc
limit 0,1;

-- 문제 8
select dp.dept_name, concat(e.first_name,' ',e.last_name) as '이름', s.salary as '연봉' ,concat(dm.first_name,' ',dm.last_name) as '매니저 이름', dm.salary as '매니저 연봉'
from employees e, departments dp , dept_emp d , salaries s,
	(select e.first_name,e.last_name,e.emp_no,dm.dept_no, s.salary
	from employees e, dept_manager dm , salaries s
	where e.emp_no = dm.emp_no
    and dm.emp_no = s.emp_no
    ) dm
where e.emp_no = d.emp_no
and dm.dept_no = dp.dept_no
and d.dept_no = dp.dept_no
and s.emp_no = e.emp_no
and s.salary > dm.salary;
                