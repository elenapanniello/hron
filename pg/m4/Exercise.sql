-- devo inserire il salario massimo, minimo, la somma e la media rispetto
-- al salario dei dipendenti, i gruppi sono fatti in base ai job id (group by job_id)
SELECT max(salary) as min_salary, min(salary), round(avg(salary)) as avg_salary, sum(salary), job_id
from employee
GROUP BY job_id;

-- quanti dipendenti per job_id (quanti sono i programmatori)
SELECT count(job_id), j.title
from employee e join job j 
-- questa è la foreign key utilizzata per fare la join tra le due tabelle
using(job_id)
-- raggruppale per j.title
group by j.title
having j.title = 'Programmer';

-- voglio contare tutti i manager che fanno parte della tabella employee
select count(manager_id)
from employee;

-- adesso voglio vedere tutti i nomi dei dipendenti che non sono manager
SELECT e.first_name, e.last_name
from employee e
where e.employee_id != manager_id;

--qui visualizzo la differenza tra il salario minimo e massimo 
SELECT max(salary) - min(salary) as "The difference between salary"
FROM employee;

SELECT max(salary) - min(salary) as Delta, job_id
from employee
group BY job_id
-- qui usiamo "having" così filtriamo ulteriormente, ma lavorando sul gruppo già formato
HAVING max(salary) != min(salary)
order by Delta desc;

-- qui vogliamo vedere il salario massimo dei programmatori
SELECT max(salary)
from employee e join job j
using(job_id)
where title = 'Programmer';

-- qui vediamo il nome del Programmer che prende il max salary
select first_name, last_name
from employee e join job j
using(job_id)
where title = 'Programmer' and salary = (
    SELECT max(salary)
    from employee e join job j
    using(job_id)
    where title = 'Programmer'
);

-- selezioniamo il salario minimo raggruppandolo in base ai manager
select min(salary) as "Min salary", manager_id
from employee;

-- voglio vedere il salario minimo con i dipendenti raggruppati per manager
-- non considerando chi non ha manager, nè i gruppi con salario minimo >6000
select min(salary) as "Min salary", manager_id
from employee
where manager_id is not NULL
group BY manager_id
HAVING min(salary) >= 6000
ORDER BY manager_id;

-- voglio vedere chi ha un salario =9000 e ha il manager_id = 102
SELECT employee_id, first_name, last_name
from employee
where salary = 9000 and manager_id = 102;