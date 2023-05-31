
-- lavoriamo sulla tabella employee
-- ci interessa: first_name, last_name, phone, hired

-- tabella con i dipendenti ordinati per cognome e nome
SELECT last_name, first_name, phone, hired
from employee
ORDER BY last_name, first_name;

-- tabella con dipendenti con first_name David o Peter
SELECT last_name, first_name, phone, hired
from employee
where first_name = 'Peter' OR first_name = 'David';

-- tabella con i dipendenti che appartengono al dipartimento 6
SELECT last_name, first_name, department_id
from employee
where department_id in (6);

-- adesso chi appartiene o al dipartimento 3 o 5
SELECT last_name, first_name, department_id
from employee
where department_id in (3,5);

-- adesso chi ha il salario maggiore di 10000
SELECT last_name, first_name, salary
from employee
WHERE salary >10000;

-- adesso chi ha il salario minore di 4000 o maggiore di 15000
SELECT last_name, first_name, salary
from employee
WHERE salary <4000 AND salary >15000;

-- chi ha il salary <4000 o >15000, ma solo per i dipartimenti 5 e 8
SELECT last_name, first_name, salary, hired, phone, department_id
from employee
-- ci deve essere solo una clausola "where"
where (salary <4000 or salary >15000) AND department_id in (5,8);

