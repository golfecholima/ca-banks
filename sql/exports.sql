-------------
-- EXPORTS --
-------------
-- Banks and credit unions
select 
	p.id,
	st_astext(p.geog_point) as pts
from 
	pts_fdic_ncua p;
	-- exported as `sql/data/processed/pts_fdic_ncua.csv`

-- Banks and credit unions in urban areas
select 
	p.id,
	p.ua,
	p.ua_id,
	st_astext(p.pt) as pts
from 
	pts_fdic_ncua_in_ua p;
	-- exported as `sql/data/processed/pts_fdic_ncua_in_ua.csv`

-- Banks and credit unions not in urban areas
create materialized view pts_fdic_ncua_in_rural as 
	select 
		p.id,
		st_astext(p.geog_point) as pts
	from 
		pts_fdic_ncua p
	where
		p.id not in (
			select id from pts_fdic_ncua_in_ua);
	-- exported as `sql/data/processed/pts_fdic_ncua_in_rural.csv`

-- Banks below 95 geocodio accuracy score
create view pts_fdic_below_95 as select p.* from pts_fdic p, pts_fdic_ncua_below_95 b where b.id = p.uninumbr;

-- Credit unions below 95 geocodio accuracy score
create view pts_ncua_below_95 as select p.* from pts_ncua_w_uid p, pts_fdic_ncua_below_95 b where b.id = p.id;

-- 30 min drive ua isochrones
select st_astext(i.geometry) as iso, i.center
from iso_30_min_drive_pts_fdic_ncua_in_ua i;
	-- exported as `sql/data/processed/iso_30_min_drive_pts_fdic_ncua_in_ua.csv`

