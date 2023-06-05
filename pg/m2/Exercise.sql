-- vogliamo il nome dei dipendenti ed il loro job title
select first_name, last_name, title
-- facciamo l'alias di tabella così possiamo usarli nell "on"
from employee e join job j
-- in employee devi guardare il job_id che deve essere uguale 
-- al job_id della tabella job
on e.job_id = j.job_id;

--nome dei dipendenti basati in UK
select e.first_name, e.last_name, city, country_id
from employee e JOIN department using(department_id)
join location using(location_id)
where country_id = 'UK';

-- voglio il nome del team e il nome e cognome del dipendente
select first_name, last_name, name
from employee e JOIN team_employee te
    ON e.employee_id = te.employee_id
-- facciamo la join successiva
-- otterremo i nomi di tutti e dei team a cui appartengono 
    JOIN team t ON t.team_id = te.team_id
    -- vogliamo vedere solo chi appartiene al team Green
    WHERE name = 'Green'
    -- e vogliamo ordinarli per nome
    order by first_name;