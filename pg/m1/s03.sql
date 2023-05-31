-- Minimal SQL

-- select all
select *
from service;
select *
from region;

-- insert a new row
insert into service (name) values ('Scratchaway');

-- update a row
update service
set location_id = 1400
where service_id = 4;

-- delete a row
delete from service
--where name = 'Scratchaway';
where service_id = 4;
