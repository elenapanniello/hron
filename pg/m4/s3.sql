-- examples on group by

-- grouping employees by department and then by job id
select department_id, job_id
from employee
group by department_id, job_id
order by department_id;

-- compare group by to select distinct
select distinct department_id, job_id, first_name, last_name 
from employee
order by department_id;

-- average salary for all the employees
select round(avg(salary), 2) as avg_sal
from employee;

-- average salary for each department
-- senza "round" ci metterebbe tanti decimali dopo il punto, se aggiungo il 2
-- significa arrotondamento con 2 decimali
select department_id, round(avg(salary),2) as avg_sal
from employee
-- raggruppo i dipendenti per dipartimento
group by department_id
order by avg_sal DESC
-- limit 3;

-- max salary for employees by department, from top downward
select department_id, max(salary) as sum_salary
from employee
group by department_id
order by sum_salary desc;

-- same, but showing department name in result set
select d.name, max(e.salary) as sum_salary
from employee e join department d
	using (department_id)
group by d.name
order by sum_salary desc;

-- average salary for each department, excluding the employees not assigned to a department
select department_id, round(avg(salary)) as avg_sal
from employee
where department_id is not null and last_name != 'King'
group by department_id
order by avg_sal desc;

-- average salary for employees hired from 2020 on, grouped by department
select d.name, round(avg(e.salary)) as avg_sal
from employee e join department d
	using (department_id)
	-- restrizione: solo chi è stato assunto dopo il 1° gennaio del 2020
where hired >= '2020-01-01'
group by d.name;

-- voglio sapere il salario medio dei dipendenti
select department_id,round (avg(salary))
from employee
-- voglio vedere chi è stato assunto dopo il 2020
where hired >= '2020-01-01'
-- li raggruppo a seconda del dipartimento a cui appartengono 
	group by department_id;

