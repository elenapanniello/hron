-- left/right outer join - from "many" perspective

-- Kimberely is an employee
select employee_id, first_name, last_name, department_id 
from employee
-- Kimberly non ha il department_id associato
where last_name like 'Gr%';

-- the inner join skips Kimberely
-- il result set ottenuto avrà queste colonne
select e.employee_id, first_name, last_name, d.name as "department name"
-- facciamo una join tra le tabelle employee e department
from employee e join department d
    on e.department_id = d.department_id
where last_name like 'Gr%';

-- left outer join
-- outer join in cui dico a Postgres di tenere i dati della tabella di sinistra 
-- si mantengono i dati della tabella di sx perchè c'è "left" (employee)
-- tieni nel result set anche Kimberly che sta a sx, anche se non c'è una relazione, mettilo lo stesso
select e.first_name, e.last_name, d.name as "department name"
from employee e left outer join department d
    using (department_id)
where e.last_name like 'Gr%';

-- rewritten as right outer join
-- qui giro invece e vedo la tabella di dx
select e.first_name, e.last_name, d.name as "department name"
from department d right outer join employee e
    using (department_id)
where e.last_name like 'Gr%';

-- "left" / "right" imply "outer"
select e.first_name, e.last_name, d.name as "department name"
from employee e left join department d
    using (department_id)
where e.last_name = 'Grant';
