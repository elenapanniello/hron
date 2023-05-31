-- examples on select

-- select all
select *
from region;

-- a common select, filtered on rows and columns
select name
from region
where region_id = 1;

-- select a full single column
select * --manager_id
from employee;

-- select only distinct values in a column
--select distinct manager_id
SELECT manager_id
from employee;

-- using column name alias
--ci sono più colonne qui, select title, il min_salary, qui rinomino semplicemente i nomi delle colonne
select title, min_salary as "min salary", max_salary as max
-- SELECT * => ammi vedere tutte le colonne e tutte le righe
from job;

-- a result set with changed data (and column names)
-- qui voglio vedere il job title, voglio visualizzare il salario minimo,
-- voglio vedere come option 1 il salario minimo aumentato di 200euro,
-- mentre in option2 voglio vedere il salario minimo aumentato del 5%
select title,
    min_salary,
    min_salary + 200 as "option 1",
    trunc (min_salary + (min_salary * 0.05) ) as "option 2"
-- aggiungendo "trunc()" togli i centesimi, i decimali 
from job;

-- no table involved in this select
select current_date,
-- qui leggiamo la data odierna
    sqrt(25) as "squared root",
    5 / 2 as "integer division";

-- concatenation by operator ||
-- anche in SQL c'è la possibilità di concatenare, è comune usare l'operatore OR ||
-- concatenerà valori diversi, generando un unico valore presente in una sola cella
select region_id || ': ' || country_id as "the countries"
from country;

-- concatenation by concat()
-- anche la funzione concat () serve a concatenare, assieme all'operatore || 
select concat(region_id, ': ', country_id) as "the countries"
from country;

-- limit to get result set with a specified size
select first_name, last_name
from employee
-- mettendo il limit impongo un limite di max 10 nomi
limit 10;

-- second page
select first_name, last_name
from employee
-- offset significa scartane 10 dopo i primi 10 
offset 10 limit 10;

-- eleventh page
select first_name, last_name
from employee
-- dopo il 100 ce ne sono 7, per cui ci mostra quello!
-- qui dico : ti dò un limite di 10 nomi, scartandone 100;
limit 10 offset 100;
