-- examples on aggregate functions

-- count, count distinct
select count(*) as "All employees", count(manager_id) as "Having a manager", 
	count(distinct manager_id) as "How many managers"
from employee;

-- ritorna il conteggio di tutte le righe
select count(*) as "All employees"
from employee;

--invece dell'* mettiamo la colonna manager_id
-- con distinct voglio visualizzare i manager una sola volta
-- ed eliminare null e duplicati 
select count(distinct manager_id)
from employee;

-- compariranno i duplicati ed i null
select count( manager_id)
from employee;

-- qui ci dirà quanti dipendenti(righe che hanno all'interno della riga commission) 
--hanno una commissione' 
select count(commission) as "Employees with commission",
	count(distinct commission) as "How many different commissions"
from employee;

-- max, min
-- max/min (qual è il salario massimo/minimo), average salary è il salario medio
-- per arrotondare il salario medio mettiamo il "round"
select max(salary) as "Max salary", min(salary) as "Min salary",
	round(avg(salary), -2) as "Average salary"
from employee;

select max(hired) "Most recent hire" , min(hired) "Earliest hire"
from employee;

-- spoiler: subquery to get extra info
-- voglio fare una query all'interno di un'altra query
select first_name, last_name, salary 
from employee
-- trovami chi ha il salario minimo, e lo metto tra parentesi
where salary = (
	select min(salary)
	from employee
);

-- min, max on strings
select min(first_name), max(last_name)
from employee;

-- sum
select sum(salary)
from employee;

-- voglio sapere i salari solo del dipartimento 5
select sum(salary)
from employee
where department_id = 5;

-- average
select round(avg(salary), 2) as average, round(avg(distinct salary), 2) as "average no duplicates"
from employee
where department_id = 5;
