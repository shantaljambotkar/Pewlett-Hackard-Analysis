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
select first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')