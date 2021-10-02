-- List of employee titles for retirement
select  ee.emp_no, 
		ee.first_name, 
		ee.last_name, 
		ti.title,
		ti.from_date,
		ti.to_date
into retirement_titles
from employees as ee
inner join titles as ti
	on (ee.emp_no = ti.emp_no)
where (ee.birth_date between '1952-01-01' AND '1955-12-31')
order by ee.emp_no asc


-- Use Dictinct with Orderby to remove duplicate rows
select distinct on (emp_no) emp_no,
		first_name, 
		last_name, 
		title
into unique_titles		
from retirement_titles 
order by emp_no asc, to_date desc

--retrieve the number of employees by their most recent job title who are about to retire
select  count(emp_no),
		title
into retiring_titles
from unique_titles 
group by title
order by count(emp_no) desc


--the current employees who were born between January 1, 1965 and December 31, 1965.
select  distinct on (ee.emp_no) ee.emp_no, 
		ee.first_name, 
		ee.last_name,
		ee.birth_date,
		de.from_date,
		de.to_date,
		ti.title
into mentorship_eligibilty
from employees as ee
inner join dept_emp de
	on (ee.emp_no = de.emp_no)
inner join titles as ti
	on (ee.emp_no = ti.emp_no)
where de.to_date = '9999-01-01'
and (ee.birth_date between '1965-01-01' AND '1965-12-31')
order by ee.emp_no


