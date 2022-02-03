-------------
-- EXPORTS --
-------------
-- Banks and credit unions
select 
	*
from 
	pts_fdic_ncua;
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
select * from pts_fdic_below_95;
	-- exported as `sql/data/processed/pts_fdic_below_95.csv`

-- Credit unions below 95 geocodio accuracy score
select * from pts_fdic_ncua_below_95;
	-- exported as `sql/data/processed/pts_ncua_below_95.csv`

-- 30 min drive ua isochrones
select st_astext(i.geometry) as iso, i.center
from iso_30_min_drive_pts_fdic_ncua_in_ua i;
	-- exported as `sql/data/processed/iso_30_min_drive_pts_fdic_ncua_in_ua.csv`

