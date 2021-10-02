-- Retirement eligibility
select count(*) from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')

-- select all employees between birth year 1952
select count(*) from employees
where birth_date between '1952-01-01' and '1952-12-31'

-- select all employees between birth year 1953
select count(*) from employees
where birth_date between '1953-01-01' and '1953-12-31'

-- select all employees between birth year 1954
select count(*) from employees
where birth_date between '1954-01-01' and '1954-12-31'

-- select all employees between birth year 1955
select count(*) from employees
where birth_date between '1955-01-01' and '1955-12-31'

-- create a new table for retirement info
select *
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')

--drop table retirement_info

--joining the departments and dept_manager table
select d.dept_name,
dm.emp_no,
dm.from_date,
dm.to_date
from departments d
inner join dept_manager dm
on d.dept_no = dm.dept_no

-- Joining retirement_info and dept_emp tables getting the current employees information
select r.emp_no, r.first_name, r.last_name, de.to_date
INTO current_emp
from retirement_info r
left join dept_emp de
on r.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'




-- Joining employees and dept_emp tables
select count(ce.emp_no), de.dept_no
INTO dept_emp_count
from current_emp ce
left join dept_emp de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no

select * from salaries
order by to_date desc


-- create a new table for emp info with salary
select ee.emp_no, ee.first_name, ee.last_name, ee.gender, 
ss.salary,de.to_date
into emp_info
from employees as ee
inner join salaries as ss
on (ee.emp_no = ss.emp_no)
inner join dept_emp as de
on (ee.emp_no = de.emp_no)
where (ee.birth_date between '1952-01-01' AND '1955-12-31')
and (ee.hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01')

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);


SELECT  ce.emp_no,
		ce.first_name,
		ce.last_name,
		d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

select * from departments

Select ri.emp_no, ri.first_name, ri.last_name, de.dept_no
from retirement_info ri
inner join dept_emp de
on ri.emp_no = de.emp_no
inner join departments ds
on de.dept_no = ds.dept_no
where ds.dept_name = 'Sales'
or ds.dept_name ='Development'