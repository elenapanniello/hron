
-- vediamo i primi 5 dipendenti mettendo un limite
SELECT first_name, last_name, hired
from employee
limit 5; 

-- vediamo quanto tempo è passato dalla data di assunzione ad oggi
-- il modo per farlo sarà fare current_date MENO hired e visualizzarlo come "giorni"
SELECT first_name, last_name, hired, current_date-hired as "giorni"
from employee
limit 5; 

-- aggiungo 10 giorni 
SELECT first_name, last_name, hired, current_date-hired+10 as "giorni"
from employee
limit 5; 

-- quant è la commissione dei vari dipendenti oppure
-- visualizza "no value". Cominciamo col visualizzare solo la commissione ed i loro nomi
SELECT first_name, last_name, commission
from employee
limit 10; 

-- chiamiamo la funzione coalesce per vedere i null
-- vogliamo fare un cast tra un intero (la commissione) ed una stringa ('No value')
-- lo facciamo con doppi doppi punti(::) e varchar
SELECT first_name, last_name, coalesce (commission::varchar,'No value')
from employee
limit 10; 

select *
-- car_id e service_id in questa tabella sono le due foreign key
from car_service;

select c.name as "Car name", s.name as "Service name", cs.checkin, cs.checkout
-- il focus è su queste due tabelle, inseriamo in using() car_id che è in comune ad entrambe
from car c join car_service cs using(car_id)
-- facciamo 2 join per una many to many
    join service s using(service_id);

