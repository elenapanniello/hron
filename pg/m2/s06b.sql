-- examples on left/right outer join - from "many" perspective

-- Treasury is a department
-- ricordiamo che lavoriamo su una one to many, quella che comanda è la many che ha la FK
select name
from department
where department_id in (11, 12);

-- the inner join skips Treasury
select e.first_name, e.last_name, d.name as "Department Name"
from employee e inner join department d
    using(department_id)
    -- non c'è nessuno di Treasury
where d.department_id in (11, 12);

-- right outer join
-- qui dico che non voglio buttare via Treasury, tenendolo comunque e mostrandolo
-- il risultato sarà che in Treasury ci sarà un null
select e.first_name, e.last_name, d.name as "Department Name"
from employee e right outer join department d
    using(department_id)
where department_id in (11, 12);

-- as above, rewritten as left outer join
-- qui è lo stesso, semplicemente girato!
select e.first_name, e.last_name, d.name as "Department Name"
from department d left outer join employee e
    on d.department_id = e.department_id 
where d.department_id in (11, 12);
