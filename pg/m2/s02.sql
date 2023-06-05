-- Examples on inner join

-- without join, we get four different result set, plus one to build them up
-- UNION could merge the results set in one
select region_id, name
from region;

-- 1|Europe
-- 2|Americas
-- 3|Asia
-- 4|Middle East and Africa

select region_id as r_id, 'Europe' as region, country_id, name
from country
where region_id = 1;

select region_id as r_id, 'Americas' as region, country_id, name
from country
where region_id = 2;

select region_id as r_id, 'Asia' as region, country_id, name
from country
where region_id = 3;

select region_id as r_id, 'Middle East and Africa' as region, country_id, name
from country
where region_id = 4
order by name;

-- join the two tables and see the full result in a single shot
-- qui abbiamo prima tutte le region 1 e poi i vari country
select region.region_id as r_id, region.name as "region name", country.country_id, country.name
from region, country
where region.region_id = country.region_id
order by r_id, country.name;

-- table alias
select r.region_id as r_id, r.name as region, c.country_id, c.name
-- r. => alias di tabella
from region r, country c
where r.region_id = c.region_id
order by r_id, c.name;
