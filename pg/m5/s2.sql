-- examples on insert

-- the current table status
select *
from service;

-- plain insert
-- scrivo tutto ciò che voglio mettere ed eseguo
insert into service (service_id, name, location_id) values
    (20, 'Mirdor Shifty Solutions', 1100);

-- multiline insert, qui creo più righe contemporaneamente,
-- separando ogni nuova riga che si creerà con una virgola
insert into service (service_id, name, location_id) values
	(22, 'Old Gondor Messingup', 1200),
	(23, 'Rohan Leather Finitures', 1300);

-- column with default value (nullable or other) could be skipped
-- qui non ho specificato la location_id e lui ci mette dentro un null
insert into service (service_id, name) values
    (32, 'Kerr & Reetch Associates');

-- auto-incremented value for pk
-- anche qui null perchè non è specificato
insert into service (name) values ('Multiple Oz');

-- using default values for each column
insert into service (name) values (DEFAULT);

-- insert relying on column definition on table
-- qui non specifico il nome delle colonne ma lui le inserisce lo stesso
-- andando a vedere la definizione standard! Rischioso!
insert into service values
    (33, 'Rainydays Carwash', null);
