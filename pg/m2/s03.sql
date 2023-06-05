-- examples on inner join: using / on / natural

-- join-using, handier
select r.name as "region name", c.name as "country name" 
from region r join country c
	using (region_id)
    -- vogliamo vedere solo i paesi Europei
where r.name = 'Europe'
order by c.name;

-- join-on, more flexible
select r.name as "region name", c.name as "country name"
from region r join country c
    on r.region_id = c.region_id
where r.name = 'Americas'
order by c.name;

-- natural join
-- qui dico a SQL di prendere lui e capire come fare la join
select e.first_name, e.last_name, j.title -- il lavoro che stanno facendo lo prendo da job
from employee e natural join job j
where first_name like 'A%';

-- here a natural join does NOT work!
-- qui non funziona, non torna nulla perchè i name hanno lo stesso nome, e non 
-- permettono la natural join
select r.name, c.name
from region r natural join country c;
