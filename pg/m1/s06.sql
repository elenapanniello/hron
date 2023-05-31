-- examples on null

-- check null
-- guardiamo tutti gli employee la cui commissione è null
select employee_id, first_name, last_name, commission 
from employee
where commission is null
	and last_name = 'King';

select employee_id, first_name, last_name, commission
from employee
where commission is not null 
	and last_name = 'King';

-- !!! WRONG !!! check null
-- questa è assolutamente sbagliata perchè non si può scrivere 
-- nè "= null, nè != null"
select employee_id, first_name, last_name, commission
from employee
where commission = null
	and last_name = 'King';

-- !!! WRONG !!!
select employee_id, first_name, last_name, commission
from employee
where commission != null
	and last_name = 'King';

-- null in operations
select first_name, last_name, salary, commission,
	salary * commission as "quota"
from employee
where last_name = 'King';

-- coalesce: if commission is null use 0 instead
-- se ho 2 e la commission potrebbe essere null, uso come argomento
-- quello 
select first_name, last_name, salary, commission,
    salary * coalesce(commission, 1) as "quota"
from employee
where last_name = 'King';
