--------------------------------
-- CENSUS DEMOGRAPHICS TABLES --
--------------------------------
-- STATE DEMOGRAPHICS --
create table demographcis_ca (
	id varchar,
	geographic_area_name varchar,
	total integer,
	hispanic_or_latino integer,
	not_hispanic_or_latino integer,
	one_race integer,
	wt integer,
	blkafam integer,
	natcon integer,
	asian integer,
	natisl integer,
	othr integer,
	two_or_more_races integer,
	two_races integer,
	wt_blkafam integer,
	wt_natcon integer,
	wt_asian integer,
	wt_natisl integer,
	wt_othr integer,
	blkafam_natcon integer,
	blkafam_asian integer,
	blkafam_natisl integer,
	blkafam_othr integer,
	natcon_asian integer,
	natcon_natisl integer,
	natcon_othr integer,
	asian_natisl integer,
	asian_othr integer,
	natisl_othr integer,
	three_races integer,
	wt_blkafam_natcon integer,
	wt_blkafam_asian integer,
	wt_blkafam_natisl integer,
	wt_blkafam_othr integer,
	wt_natcon_asian integer,
	wt_natcon_natisl integer,
	wt_natcon_othr integer,
	wt_asian_natisl integer,
	wt_asian_othr integer,
	wt_natisl_othr integer,
	blkafam_natcon_asian integer,
	blkafam_natcon_natisl integer,
	blkafam_natcon_othr integer,
	blkafam_asian_natisl integer,
	blkafam_asian_othr integer,
	blkafam_natisl_othr integer,
	natcon_asian_natisl integer,
	natcon_asian_othr integer,
	natcon_natisl_othr integer,
	asian_natisl_othr integer,
	four_races integer,
	wt_blkafam_natcon_asian integer,
	wt_blkafam_natcon_natisl integer,
	wt_blkafam_natcon_othr integer,
	wt_blkafam_asian_natisl integer,
	wt_blkafam_asian_othr integer,
	wt_blkafam_natisl_othr integer,
	wt_natcon_asian_natisl integer,
	wt_natcon_asian_othr integer,
	wt_natcon_natisl_othr integer,
	wt_asian_natisl_othr integer,
	blkafam_natcon_asian_natisl integer,
	blkafam_natcon_asian_othr integer,
	blkafam_natcon_natisl_othr integer,
	blkafam_asian_natisl_othr integer,
	natcon_asian_natisl_othr integer,
	five_races integer,
	wt_blkafam_natcon_asian_natisl integer,
	wt_blkafam_natcon_asian_othr integer,
	wt_blkafam_natcon_natisl_othr integer,
	wt_blkafam_asian_natisl_othr integer,
	wt_natcon_asian_natisl_othr integer,
	blkafam_natcon_asian_natisl_othr integer,
	six_races integer,
	wt_blkafam_natcon_asian_natisl_othr integer
);

copy state
from '/Users/glevines/Documents/projects/ca-banks/sql/data/processed/california-demographics.csv' with (format csv, header);

-- P2 LOOKUP and STATEWIDE PCTS --
create table p2_lookup_w_state_pct (
	id char(7),
	name_short varchar,
	name_normalized varchar,
	id_orig char(7),
	name_orig varchar,
	name_lower varchar,
	value integer,
	pct numeric(5,2)
);

copy p2_lookup_w_state_pct
from '/Users/glevines/Documents/projects/ca-banks/sql/data/processed/p2-lookup-w-pct.csv' with (format csv, header);

-- BLOCK DEMOGRAPHICS --
create table demographics_ca_blocks (
	id char(24),
	geographic_area_name varchar,
	total integer,
	hispanic_or_latino integer,
	not_hispanic_or_latino integer,
	one_race integer,
	wt integer,
	blkafam integer,
	natcon integer,
	asian integer,
	natisl integer,
	othr integer,
	two_or_more_races integer,
	two_races integer,
	wt_blkafam integer,
	wt_natcon integer,
	wt_asian integer,
	wt_natisl integer,
	wt_othr integer,
	blkafam_natcon integer,
	blkafam_asian integer,
	blkafam_natisl integer,
	blkafam_othr integer,
	natcon_asian integer,
	natcon_natisl integer,
	natcon_othr integer,
	asian_natisl integer,
	asian_othr integer,
	natisl_othr integer,
	three_races integer,
	wt_blkafam_natcon integer,
	wt_blkafam_asian integer,
	wt_blkafam_natisl integer,
	wt_blkafam_othr integer,
	wt_natcon_asian integer,
	wt_natcon_natisl integer,
	wt_natcon_othr integer,
	wt_asian_natisl integer,
	wt_asian_othr integer,
	wt_natisl_othr integer,
	blkafam_natcon_asian integer,
	blkafam_natcon_natisl integer,
	blkafam_natcon_othr integer,
	blkafam_asian_natisl integer,
	blkafam_asian_othr integer,
	blkafam_natisl_othr integer,
	natcon_asian_natisl integer,
	natcon_asian_othr integer,
	natcon_natisl_othr integer,
	asian_natisl_othr integer,
	four_races integer,
	wt_blkafam_natcon_asian integer,
	wt_blkafam_natcon_natisl integer,
	wt_blkafam_natcon_othr integer,
	wt_blkafam_asian_natisl integer,
	wt_blkafam_asian_othr integer,
	wt_blkafam_natisl_othr integer,
	wt_natcon_asian_natisl integer,
	wt_natcon_asian_othr integer,
	wt_natcon_natisl_othr integer,
	wt_asian_natisl_othr integer,
	blkafam_natcon_asian_natisl integer,
	blkafam_natcon_asian_othr integer,
	blkafam_natcon_natisl_othr integer,
	blkafam_asian_natisl_othr integer,
	natcon_asian_natisl_othr integer,
	five_races integer,
	wt_blkafam_natcon_asian_natisl integer,
	wt_blkafam_natcon_asian_othr integer,
	wt_blkafam_natcon_natisl_othr integer,
	wt_blkafam_asian_natisl_othr integer,
	wt_natcon_asian_natisl_othr integer,
	blkafam_natcon_asian_natisl_othr integer,
	six_races integer,
	wt_blkafam_natcon_asian_natisl_othr integer
);

copy demographics_ca_blocks
from '/Users/glevines/Documents/projects/ca-banks/sql/data/processed/blocks-demographics.csv' with (format csv, header);

-------------------------------
-- CENSUS SHAPE/TIGER TABLES --
-------------------------------
-- BLOCK SHAPES --
-- $ shp2pgsql -I -s 4269 -W Latin1 ~/Documents/projects/ca-banks/sql/data/source/blocks/tl_2021_06_tabblock20/tl_2021_06_tabblock20.shp shp_ca_blocks | psql -d ca-banks -U postgres

-- COUNTY SHAPES --
-- $ shp2pgsql -I -s 4269 -W Latin1 /Users/glevines/Documents/projects/ca-banks/sql/data/source/tl_2021_us_county/tl_2021_us_county.shp shp_us_counties | psql -d ca-banks -U postgres

create table shp_ca_counties as (
SELECT shp_us_counties.gid,
	shp_us_counties.statefp,
	shp_us_counties.countyfp,
	shp_us_counties.countyns,
	shp_us_counties.geoid,
	shp_us_counties.name,
	shp_us_counties.namelsad,
	shp_us_counties.lsad,
	shp_us_counties.classfp,
	shp_us_counties.mtfcc,
	shp_us_counties.csafp,
	shp_us_counties.cbsafp,
	shp_us_counties.metdivfp,
	shp_us_counties.funcstat,
	shp_us_counties.aland,
	shp_us_counties.awater,
	shp_us_counties.intptlat,
	shp_us_counties.intptlon,
	shp_us_counties.geom
FROM shp_us_counties
WHERE shp_us_counties.statefp::text = '06'::text);

-- URBAN AREA SHAPES --
-- $ shp2pgsql -I -s 4269 -W Latin1 /Users/glevines/Documents/projects/ca-banks/sql/data/source/tl_2021_us_uac10/tl_2021_us_uac10.shp shp_us_urban_areas | psql -d ca-banks -U postgres

create table shp_ca_urban_areas as (
SELECT shp_us_urban_areas.gid,
	shp_us_urban_areas.uace10,
	shp_us_urban_areas.geoid10,
	shp_us_urban_areas.name10,
	shp_us_urban_areas.namelsad10,
	shp_us_urban_areas.lsad10,
	shp_us_urban_areas.mtfcc10,
	shp_us_urban_areas.uatyp10,
	shp_us_urban_areas.funcstat10,
	shp_us_urban_areas.aland10,
	shp_us_urban_areas.awater10,
	shp_us_urban_areas.intptlat10,
	shp_us_urban_areas.intptlon10,
	shp_us_urban_areas.geom
FROM shp_us_urban_areas
WHERE shp_us_urban_areas.name10::text ~~ '%, CA'::text);

------------------------------
-- BANK/CREDIT UNION TABLES --
------------------------------
-- BANKS --
create table fdic (
	year integer,
	cert varchar(5),
	brnum varchar(5),
	uninumbr varchar(6) primary key,
	namefull varchar(65),
	addresbr varchar(70),
	citybr varchar(22),
	cntynamb varchar(15),
	stalpbr varchar(2),
	zipbr varchar(5),
	brcenm varchar(3),
	consold varchar(4),
	brsertyp varchar(2),
	depsumbr bigint,
	bkmo varchar(1),
	cbsa_div_namb varchar(40),
	city2br varchar(22),
	cntrynab varchar(13),
	cntynumb varchar(3),
	csabr varchar(3),
	csanambr varchar(39),
	divisionb varchar(5),
	msabr varchar(5),
	msanamb varchar(36),
	metrobr varchar(1),
	microbr varchar(1),
	namebr varchar(65),
	nectabr varchar(1),
	necnamb varchar,
	placenum varchar(1),
	sims_acquired_date date,
	sims_established_date date,
	sims_latitude numeric(11, 8),
	sims_longitude numeric(11, 8),
	sims_description varchar(16),
	sims_projection varchar(17),
	stcntybr varchar(5),
	stnamebr varchar(10),
	stnumbr varchar(2),
	hctmult varchar(4),
	rssdhcr varchar(7),
	namehcr varchar(67),
	cityhcr varchar(20),
	stalphcr varchar(2),
	rssdid varchar(7),
	unit varchar(1),
	address varchar(60),
	city__0 varchar(20),
	stalp varchar(2),
	zip__0 varchar(5),
	asset bigint,
	bkclass varchar(2),
	call varchar(4),
	charter varchar(5),
	chrtagnn varchar(27),
	chrtagnt varchar(5),
	clcode varchar(2),
	cntryna varchar(19),
	denovo varchar(1),
	depdom bigint,
	depsum varchar(11),
	docket varchar(5),
	escrow varchar,
	fdicdbs varchar(2),
	fdicname varchar(13),
	fed varchar(2),
	fedname varchar(13),
	insagnt1 varchar(3),
	insured varchar(2),
	insbrdd varchar,
	insbrts varchar,
	occdist varchar(1),
	occname varchar(19),
	regagnt varchar(4),
	specgrp varchar(5),
	specdesc varchar(22),
	stcnty varchar(5),
	stname varchar(20),
	usa varchar(1),
	latitude numeric(11, 8),
	longitude numeric(11, 8),
	accuracy_score numeric(4, 2),
	accuracy_type varchar(21),
	number varchar(6),
	street varchar(30),
	unit_type varchar(5),
	unit_number varchar(5),
	city__1 varchar(22),
	state varchar(2),
	county varchar(22),
	zip__1 varchar(5),
	country varchar(2),
	source varchar(53)
);

copy fdic
from '/Users/glevines/Documents/projects/ca-banks/sql/data/processed/fdic-deposits-ca-az-nv-or-11-12-geocodio.csv' with (format csv, header);

create table pts_fdic as (select * from fdic);

alter table pts_fdic
	add column geog_point geography(point, 4269),
	add column wkt text;
	
create index fdic_pts_idx on pts_fdic using gist (geog_point);

create or replace function update_pts_fdic()
	returns trigger as
	$$
	begin
		raise info 'Triggered!';
		update pts_fdic p
			set latitude = (select f.latitude from fdic f where p.uninumbr = f.uninumbr),
			longitude = (select f.longitude from fdic f where p.uninumbr = f.uninumbr);
		update pts_fdic
			set geog_point = st_setsrid(st_makepoint(longitude, latitude), 4269)::geography;
		update pts_fdic
			set wkt = st_astext(geog_point);
		return new;
	end;
	$$ language plpgsql;
	
create trigger fdic_statement
	after update
		on fdic
	for each statement
	execute procedure update_pts_fdic();

-- Update lat, lng w/ low accuracy score w/ Google Geocoded --
create table fdic_g (
	year integer,
	cert varchar(5),
	brnum varchar(5),
	uninumbr varchar(6) primary key,
	namefull varchar(65),
	addresbr varchar(70),
	citybr varchar(22),
	cntynamb varchar(15),
	stalpbr varchar(2),
	zipbr varchar(5),
	brcenm varchar(3),
	consold varchar(4),
	brsertyp varchar(2),
	depsumbr bigint,
	bkmo varchar(1),
	cbsa_div_namb varchar(40),
	city2br varchar(22),
	cntrynab varchar(13),
	cntynumb varchar(3),
	csabr varchar(3),
	csanambr varchar(39),
	divisionb varchar(5),
	msabr varchar(5),
	msanamb varchar(36),
	metrobr varchar(1),
	microbr varchar(1),
	namebr varchar(65),
	nectabr varchar(1),
	necnamb varchar,
	placenum varchar(1),
	sims_acquired_date date,
	sims_established_date date,
	sims_latitude numeric(11, 8),
	sims_longitude numeric(11, 8),
	sims_description varchar(16),
	sims_projection varchar(17),
	stcntybr varchar(5),
	stnamebr varchar(10),
	stnumbr varchar(2),
	hctmult varchar(4),
	rssdhcr varchar(7),
	namehcr varchar(67),
	cityhcr varchar(20),
	stalphcr varchar(2),
	rssdid varchar(7),
	unit varchar(1),
	address varchar(60),
	city__0 varchar(20),
	stalp varchar(2),
	zip__0 varchar(5),
	asset bigint,
	bkclass varchar(2),
	call varchar(4),
	charter varchar(5),
	chrtagnn varchar(27),
	chrtagnt varchar(5),
	clcode varchar(2),
	cntryna varchar(19),
	denovo varchar(1),
	depdom bigint,
	depsum varchar(11),
	docket varchar(5),
	escrow varchar,
	fdicdbs varchar(2),
	fdicname varchar(13),
	fed varchar(2),
	fedname varchar(13),
	insagnt1 varchar(3),
	insured varchar(2),
	insbrdd varchar,
	insbrts varchar,
	occdist varchar(1),
	occname varchar(19),
	regagnt varchar(4),
	specgrp varchar(5),
	specdesc varchar(22),
	stcnty varchar(5),
	stname varchar(20),
	usa varchar(1),
	latitude numeric(11, 8),
	longitude numeric(11, 8),
	accuracy_score numeric(4, 2),
	accuracy_type varchar(21),
	number varchar(6),
	street varchar(30),
	unit_type varchar(5),
	unit_number varchar(5),
	city__1 varchar(22),
	state varchar(2),
	county varchar(22),
	zip__1 varchar(5),
	country varchar(2),
	source varchar(53),
	geog_point text,
	geom text,
	g_lat numeric(11,8),
	g_lng numeric(11,8)
);

copy fdic_g
from '/Users/glevines/Documents/projects/ca-banks/sd-banks-py/data/processed/fdic_google_geocode.csv' 
with (format csv, header);

update fdic f
	set latitude = (select g.g_lat from fdic_g g where f.uninumbr = g.uninumbr),
	longitude = (select g.g_lng from fdic_g g where f.uninumbr = g.uninumbr)
where uninumbr in (select g.uninumbr from fdic_g g);

	
-- CREDIT UNIONS --
create table ncua (
	cu_number varchar(5),
	cycle_date varchar(9),
	join_number varchar(5),
	siteid varchar(5),
	cu_name varchar(35),
	sitename varchar(61),
	sitetypename varchar(16),
	mainoffice varchar(3),
	physicaladdressline1 varchar(52),
	physicaladdressline2 varchar(41),
	physicaladdresscity varchar(21),
	physicaladdressstatecode varchar(2),
	physicaladdresspostalcode varchar(10),
	physicaladdresscountyname varchar(15),
	physicaladdresscountry varchar(13),
	mailingaddressline1 varchar(52),
	mailingaddressline2 varchar(33),
	mailingaddresscity varchar(21),
	mailingaddressstatecode varchar(2),
	mailingaddressstatename varchar(10),
	mailingaddresspostalcode varchar(10),
	phonenumber varchar(11),
	hoursofoperation varchar(233),
	memberservices varchar(1),
	atm varchar(1),
	drivethru varchar(1),
	latitude__0 numeric(11, 8),
	longitude__0 numeric(11, 8),
	latitude__1 numeric(11, 8),
	longitude__1 numeric(11, 8),
	accuracy_score numeric(4, 2),
	accuracy_type varchar(21),
	number varchar(5),
	street varchar(30),
	unit_type varchar(5),
	unit_number varchar(5),
	city varchar(21),
	state varchar(2),
	county varchar(22),
	zip varchar(5),
	country varchar(2),
	source varchar(53)
);

copy ncua
from '/Users/glevines/Documents/projects/ca-banks/sql/data/processed/ncua-ca-az-nv-or-member-services-geocodio.csv' with (format csv, header);

alter table ncua
	add column id varchar(10);

update ncua
	set id = join_number || siteid;

create table pts_ncua as (select * from ncua);

alter table pts_ncua
	add column geog_point geography(point, 4269),
	add column wkt text;

create index ncua_pts_idx on pts_ncua using gist (geog_point);

create or replace function update_pts_ncua()
	returns trigger as
	$$
	begin
		raise info 'Triggered!';
		update pts_ncua p
			set latitude__1 = (select n.latitude__1 from ncua n where p.id = n.id),
			longitude__1 = (select n.longitude__1 from ncua n where p.id = n.id);
		update pts_ncua p
			set geog_point = st_setsrid(st_makepoint(longitude__1, latitude__1), 4269)::geography;
		update pts_ncua p
			set wkt = st_astext(geog_point);
		return new;
	end;
	$$ language plpgsql;
	
create trigger ncua_statement
	after update
		on ncua
	for each statement
	execute procedure update_pts_ncua();

-- Update lat, lng w/ low accuracy score w/ Google Geocoded --
create table ncua_g (
	id varchar(10),
	cu_number varchar(5),
	cycle_date varchar(9),
	join_number varchar(5),
	siteid varchar(5),
	cu_name varchar(35),
	sitename varchar(61),
	sitetypename varchar(16),
	mainoffice varchar(3),
	physicaladdressline1 varchar(52),
	physicaladdressline2 varchar(41),
	physicaladdresscity varchar(21),
	physicaladdressstatecode varchar(2),
	physicaladdresspostalcode varchar(10),
	physicaladdresscountyname varchar(15),
	physicaladdresscountry varchar(13),
	mailingaddressline1 varchar(52),
	mailingaddressline2 varchar(33),
	mailingaddresscity varchar(21),
	mailingaddressstatecode varchar(2),
	mailingaddressstatename varchar(10),
	mailingaddresspostalcode varchar(10),
	phonenumber varchar(11),
	hoursofoperation varchar(233),
	memberservices varchar(1),
	atm varchar(1),
	drivethru varchar(1),
	latitude__0 numeric(11, 8),
	longitude__0 numeric(11, 8),
	latitude__1 numeric(11, 8),
	longitude__1 numeric(11, 8),
	accuracy_score numeric(4, 2),
	accuracy_type varchar(21),
	number varchar(5),
	street varchar(30),
	unit_type varchar(5),
	unit_number varchar(5),
	city varchar(21),
	state varchar(2),
	county varchar(22),
	zip varchar(5),
	country varchar(2),
	source varchar(53),
	geog_point text,
	wkt text,
	g_lat numeric(11,8),
	g_lng numeric(11,8)
);

copy ncua_g
from '/Users/glevines/Documents/projects/ca-banks/sd-banks-py/data/processed/ncua_google_geocode.csv' 
with (format csv, header);

update ncua n
	set latitude__1 = (select g.g_lat from ncua_g g where n.id = g.id),
	longitude__1 = (select g.g_lng from ncua_g g where n.id = g.id)
where id in (select g.id from ncua_g g);


---------------------------------
-- DERIVATIVE TABLES and VIEWS --
---------------------------------

create table pts_fdic_ncua as (
SELECT f.uninumbr AS id,
	f.geog_point,
	st_astext(f.geog_point) AS wkt,
	f.accuracy_score
FROM pts_fdic f
UNION
SELECT n.id,
	n.geog_point,
	st_astext(n.geog_point) AS wkt,
	n.accuracy_score
FROM pts_ncua n);

create table shp_blocks_in_uas as (
SELECT b.geoid20 AS block_id,
	u.name10 AS ua,
	u.geoid10 AS ua_id,
	b.geom AS block_geom,
	u.geom AS ua_geom,
	d.geographic_area_name,
	d.geoid,
	d.total,
	d.ct_hispanic_or_latino,
	d.pct_hispanic_or_latino,
	d.ct_not_hispanic_or_latino,
	d.pct_not_hispanic_or_latino,
	d.ct_wt,
	d.pct_wt,
	d.ct_blkafam,
	d.pct_blkafam,
	d.ct_natcon,
	d.pct_natcon,
	d.ct_asian,
	d.pct_asian,
	d.ct_natisl,
	d.pct_natisl,
	d.ct_othr,
	d.pct_othr,
	d.one_race,
	d.pct_one_race,
	d.two_or_more_races,
	d.pct_two_or_more_races,
	d.two_races,
	d.pct_two_races,
	d.three_races,
	d.pct_three_races,
	d.four_races,
	d.pct_four_races,
	d.five_races,
	d.pct_five_races,
	d.six_races,
	d.pct_six_races
FROM shp_ca_urban_areas u
	JOIN shp_ca_blocks b ON st_contains(u.geom, b.geom),
	demographics_ca_blocks_summary_pct_geoid d
WHERE d.geoid = b.geoid20::text);

create table shp_uas_demographic_summary as (
SELECT shp_blocks_in_uas.ua,
	shp_blocks_in_uas.ua_id,
	shp_blocks_in_uas.ua_geom,
	sum(shp_blocks_in_uas.total) AS ct_total,
	round(
		sum(shp_blocks_in_uas.total)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_total,
	sum(shp_blocks_in_uas.ct_hispanic_or_latino) AS ct_hispanic_or_latino,
	round(
		sum(shp_blocks_in_uas.ct_hispanic_or_latino)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_hispanic_or_latino,
	sum(shp_blocks_in_uas.ct_not_hispanic_or_latino) AS ct_not_hispanic_or_latino,
	round(
		sum(shp_blocks_in_uas.ct_not_hispanic_or_latino)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_not_hispanic_or_latino,
	sum(shp_blocks_in_uas.ct_wt) AS ct_wt,
	round(
		sum(shp_blocks_in_uas.ct_wt)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_wt,
	sum(shp_blocks_in_uas.ct_blkafam) AS ct_blkafam,
	round(
		sum(shp_blocks_in_uas.ct_blkafam)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_blkafam,
	sum(shp_blocks_in_uas.ct_natcon) AS ct_natcon,
	round(
		sum(shp_blocks_in_uas.ct_natcon)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_natcon,
	sum(shp_blocks_in_uas.ct_asian) AS ct_asian,
	round(
		sum(shp_blocks_in_uas.ct_asian)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_asian,
	sum(shp_blocks_in_uas.ct_natisl) AS ct_natisl,
	round(
		sum(shp_blocks_in_uas.ct_natisl)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_natisl,
	sum(shp_blocks_in_uas.ct_othr) AS ct_othr,
	round(
		sum(shp_blocks_in_uas.ct_othr)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_ct_othr,
	sum(shp_blocks_in_uas.one_race) AS one_race,
	round(
		sum(shp_blocks_in_uas.one_race)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_one_race,
	sum(shp_blocks_in_uas.two_or_more_races) AS two_or_more_races,
	round(
		sum(shp_blocks_in_uas.two_or_more_races)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_two_or_more_races,
	sum(shp_blocks_in_uas.two_races) AS two_races,
	round(
		sum(shp_blocks_in_uas.two_races)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_two_races,
	sum(shp_blocks_in_uas.three_races) AS three_races,
	round(
		sum(shp_blocks_in_uas.three_races)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_three_races,
	sum(shp_blocks_in_uas.four_races) AS four_races,
	round(
		sum(shp_blocks_in_uas.four_races)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_four_races,
	sum(shp_blocks_in_uas.five_races) AS five_races,
	round(
		sum(shp_blocks_in_uas.five_races)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_five_races,
	sum(shp_blocks_in_uas.six_races) AS six_race,
	round(
		sum(shp_blocks_in_uas.six_races)::numeric / sum(shp_blocks_in_uas.total)::numeric * 100::numeric,
		2
	) AS pct_six_race
FROM shp_blocks_in_uas
GROUP BY shp_blocks_in_uas.ua,
	shp_blocks_in_uas.ua_id,
	shp_blocks_in_uas.ua_geom
ORDER BY (sum(shp_blocks_in_uas.total)) DESC);

create view pts_fdic_ncua_below_95 as 
SELECT pts_fdic_ncua.id,
	pts_fdic_ncua.geog_point,
	pts_fdic_ncua.wkt,
	pts_fdic_ncua.accuracy_score
FROM pts_fdic_ncua
WHERE pts_fdic_ncua.accuracy_score <= 0.95;

create view pts_ncua_below_95 as 
SELECT p.id,
	p.cu_number,
	p.cycle_date,
	p.join_number,
	p.siteid,
	p.cu_name,
	p.sitename,
	p.sitetypename,
	p.mainoffice,
	p.physicaladdressline1,
	p.physicaladdressline2,
	p.physicaladdresscity,
	p.physicaladdressstatecode,
	p.physicaladdresspostalcode,
	p.physicaladdresscountyname,
	p.physicaladdresscountry,
	p.mailingaddressline1,
	p.mailingaddressline2,
	p.mailingaddresscity,
	p.mailingaddressstatecode,
	p.mailingaddressstatename,
	p.mailingaddresspostalcode,
	p.phonenumber,
	p.hoursofoperation,
	p.memberservices,
	p.atm,
	p.drivethru,
	p.latitude__0,
	p.longitude__0,
	p.latitude__1,
	p.longitude__1,
	p.accuracy_score,
	p.accuracy_type,
	p.number,
	p.street,
	p.unit_type,
	p.unit_number,
	p.city,
	p.state,
	p.county,
	p.zip,
	p.country,
	p.source,
	p.geog_point
FROM pts_ncua p,
	pts_fdic_ncua_below_95 b
WHERE b.id::text = p.id;

create view pts_fdic_below_95 as 
SELECT p.year,
	p.cert,
	p.brnum,
	p.uninumbr,
	p.namefull,
	p.addresbr,
	p.citybr,
	p.cntynamb,
	p.stalpbr,
	p.zipbr,
	p.brcenm,
	p.consold,
	p.brsertyp,
	p.depsumbr,
	p.bkmo,
	p.cbsa_div_namb,
	p.city2br,
	p.cntrynab,
	p.cntynumb,
	p.csabr,
	p.csanambr,
	p.divisionb,
	p.msabr,
	p.msanamb,
	p.metrobr,
	p.microbr,
	p.namebr,
	p.nectabr,
	p.necnamb,
	p.placenum,
	p.sims_acquired_date,
	p.sims_established_date,
	p.sims_latitude,
	p.sims_longitude,
	p.sims_description,
	p.sims_projection,
	p.stcntybr,
	p.stnamebr,
	p.stnumbr,
	p.hctmult,
	p.rssdhcr,
	p.namehcr,
	p.cityhcr,
	p.stalphcr,
	p.rssdid,
	p.unit,
	p.address,
	p.city__0,
	p.stalp,
	p.zip__0,
	p.asset,
	p.bkclass,
	p.call,
	p.charter,
	p.chrtagnn,
	p.chrtagnt,
	p.clcode,
	p.cntryna,
	p.denovo,
	p.depdom,
	p.depsum,
	p.docket,
	p.escrow,
	p.fdicdbs,
	p.fdicname,
	p.fed,
	p.fedname,
	p.insagnt1,
	p.insured,
	p.insbrdd,
	p.insbrts,
	p.occdist,
	p.occname,
	p.regagnt,
	p.specgrp,
	p.specdesc,
	p.stcnty,
	p.stname,
	p.usa,
	p.latitude,
	p.longitude,
	p.accuracy_score,
	p.accuracy_type,
	p.number,
	p.street,
	p.unit_type,
	p.unit_number,
	p.city__1,
	p.state,
	p.county,
	p.zip__1,
	p.country,
	p.source,
	p.geog_point
FROM pts_fdic p,
	pts_fdic_ncua_below_95 b
WHERE b.id::text = p.uninumbr::text;

create table demographics_ca_blocks_summary_pct_geoid as (
SELECT demographics_ca_blocks_geoid.geographic_area_name,
	demographics_ca_blocks_geoid.geoid,
	demographics_ca_blocks_geoid.total,
	demographics_ca_blocks_geoid.hispanic_or_latino AS ct_hispanic_or_latino,
	round(
		demographics_ca_blocks_geoid.hispanic_or_latino::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_hispanic_or_latino,
	demographics_ca_blocks_geoid.not_hispanic_or_latino AS ct_not_hispanic_or_latino,
	round(
		demographics_ca_blocks_geoid.not_hispanic_or_latino::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_not_hispanic_or_latino,
	demographics_ca_blocks_geoid.wt + demographics_ca_blocks_geoid.wt_blkafam + demographics_ca_blocks_geoid.wt_natcon + demographics_ca_blocks_geoid.wt_asian + demographics_ca_blocks_geoid.wt_natisl + demographics_ca_blocks_geoid.wt_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon + demographics_ca_blocks_geoid.wt_blkafam_asian + demographics_ca_blocks_geoid.wt_blkafam_natisl + demographics_ca_blocks_geoid.wt_blkafam_othr + demographics_ca_blocks_geoid.wt_natcon_asian + demographics_ca_blocks_geoid.wt_natcon_natisl + demographics_ca_blocks_geoid.wt_natcon_othr + demographics_ca_blocks_geoid.wt_asian_natisl + demographics_ca_blocks_geoid.wt_asian_othr + demographics_ca_blocks_geoid.wt_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr AS ct_wt,
	round(
		(
			demographics_ca_blocks_geoid.wt + demographics_ca_blocks_geoid.wt_blkafam + demographics_ca_blocks_geoid.wt_natcon + demographics_ca_blocks_geoid.wt_asian + demographics_ca_blocks_geoid.wt_natisl + demographics_ca_blocks_geoid.wt_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon + demographics_ca_blocks_geoid.wt_blkafam_asian + demographics_ca_blocks_geoid.wt_blkafam_natisl + demographics_ca_blocks_geoid.wt_blkafam_othr + demographics_ca_blocks_geoid.wt_natcon_asian + demographics_ca_blocks_geoid.wt_natcon_natisl + demographics_ca_blocks_geoid.wt_natcon_othr + demographics_ca_blocks_geoid.wt_asian_natisl + demographics_ca_blocks_geoid.wt_asian_othr + demographics_ca_blocks_geoid.wt_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr
		)::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt,
	demographics_ca_blocks_geoid.blkafam + demographics_ca_blocks_geoid.wt_blkafam + demographics_ca_blocks_geoid.blkafam_natcon + demographics_ca_blocks_geoid.blkafam_asian + demographics_ca_blocks_geoid.blkafam_natisl + demographics_ca_blocks_geoid.blkafam_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon + demographics_ca_blocks_geoid.wt_blkafam_asian + demographics_ca_blocks_geoid.wt_blkafam_natisl + demographics_ca_blocks_geoid.wt_blkafam_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian + demographics_ca_blocks_geoid.blkafam_natcon_natisl + demographics_ca_blocks_geoid.blkafam_natcon_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl + demographics_ca_blocks_geoid.blkafam_asian_othr + demographics_ca_blocks_geoid.blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr AS ct_blkafam,
	round(
		(
			demographics_ca_blocks_geoid.blkafam + demographics_ca_blocks_geoid.wt_blkafam + demographics_ca_blocks_geoid.blkafam_natcon + demographics_ca_blocks_geoid.blkafam_asian + demographics_ca_blocks_geoid.blkafam_natisl + demographics_ca_blocks_geoid.blkafam_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon + demographics_ca_blocks_geoid.wt_blkafam_asian + demographics_ca_blocks_geoid.wt_blkafam_natisl + demographics_ca_blocks_geoid.wt_blkafam_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian + demographics_ca_blocks_geoid.blkafam_natcon_natisl + demographics_ca_blocks_geoid.blkafam_natcon_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl + demographics_ca_blocks_geoid.blkafam_asian_othr + demographics_ca_blocks_geoid.blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr
		)::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam,
	demographics_ca_blocks_geoid.natcon + demographics_ca_blocks_geoid.wt_natcon + demographics_ca_blocks_geoid.blkafam_natcon + demographics_ca_blocks_geoid.natcon_asian + demographics_ca_blocks_geoid.natcon_natisl + demographics_ca_blocks_geoid.natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon + demographics_ca_blocks_geoid.wt_natcon_asian + demographics_ca_blocks_geoid.wt_natcon_natisl + demographics_ca_blocks_geoid.wt_natcon_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian + demographics_ca_blocks_geoid.blkafam_natcon_natisl + demographics_ca_blocks_geoid.blkafam_natcon_othr + demographics_ca_blocks_geoid.natcon_asian_natisl + demographics_ca_blocks_geoid.natcon_asian_othr + demographics_ca_blocks_geoid.natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr AS ct_natcon,
	round(
		(
			demographics_ca_blocks_geoid.natcon + demographics_ca_blocks_geoid.wt_natcon + demographics_ca_blocks_geoid.blkafam_natcon + demographics_ca_blocks_geoid.natcon_asian + demographics_ca_blocks_geoid.natcon_natisl + demographics_ca_blocks_geoid.natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon + demographics_ca_blocks_geoid.wt_natcon_asian + demographics_ca_blocks_geoid.wt_natcon_natisl + demographics_ca_blocks_geoid.wt_natcon_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian + demographics_ca_blocks_geoid.blkafam_natcon_natisl + demographics_ca_blocks_geoid.blkafam_natcon_othr + demographics_ca_blocks_geoid.natcon_asian_natisl + demographics_ca_blocks_geoid.natcon_asian_othr + demographics_ca_blocks_geoid.natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr
		)::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon,
	demographics_ca_blocks_geoid.asian + demographics_ca_blocks_geoid.wt_asian + demographics_ca_blocks_geoid.blkafam_asian + demographics_ca_blocks_geoid.natcon_asian + demographics_ca_blocks_geoid.asian_natisl + demographics_ca_blocks_geoid.asian_othr + demographics_ca_blocks_geoid.wt_blkafam_asian + demographics_ca_blocks_geoid.wt_natcon_asian + demographics_ca_blocks_geoid.wt_asian_natisl + demographics_ca_blocks_geoid.wt_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian + demographics_ca_blocks_geoid.blkafam_asian_natisl + demographics_ca_blocks_geoid.blkafam_asian_othr + demographics_ca_blocks_geoid.natcon_asian_natisl + demographics_ca_blocks_geoid.natcon_asian_othr + demographics_ca_blocks_geoid.asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr AS ct_asian,
	round(
		(
			demographics_ca_blocks_geoid.asian + demographics_ca_blocks_geoid.wt_asian + demographics_ca_blocks_geoid.blkafam_asian + demographics_ca_blocks_geoid.natcon_asian + demographics_ca_blocks_geoid.asian_natisl + demographics_ca_blocks_geoid.asian_othr + demographics_ca_blocks_geoid.wt_blkafam_asian + demographics_ca_blocks_geoid.wt_natcon_asian + demographics_ca_blocks_geoid.wt_asian_natisl + demographics_ca_blocks_geoid.wt_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian + demographics_ca_blocks_geoid.blkafam_asian_natisl + demographics_ca_blocks_geoid.blkafam_asian_othr + demographics_ca_blocks_geoid.natcon_asian_natisl + demographics_ca_blocks_geoid.natcon_asian_othr + demographics_ca_blocks_geoid.asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr
		)::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_asian,
	demographics_ca_blocks_geoid.natisl + demographics_ca_blocks_geoid.wt_natisl + demographics_ca_blocks_geoid.blkafam_natisl + demographics_ca_blocks_geoid.natcon_natisl + demographics_ca_blocks_geoid.asian_natisl + demographics_ca_blocks_geoid.natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl + demographics_ca_blocks_geoid.wt_natcon_natisl + demographics_ca_blocks_geoid.wt_asian_natisl + demographics_ca_blocks_geoid.wt_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl + demographics_ca_blocks_geoid.blkafam_asian_natisl + demographics_ca_blocks_geoid.blkafam_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl + demographics_ca_blocks_geoid.natcon_natisl_othr + demographics_ca_blocks_geoid.asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr AS ct_natisl,
	round(
		(
			demographics_ca_blocks_geoid.natisl + demographics_ca_blocks_geoid.wt_natisl + demographics_ca_blocks_geoid.blkafam_natisl + demographics_ca_blocks_geoid.natcon_natisl + demographics_ca_blocks_geoid.asian_natisl + demographics_ca_blocks_geoid.natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl + demographics_ca_blocks_geoid.wt_natcon_natisl + demographics_ca_blocks_geoid.wt_asian_natisl + demographics_ca_blocks_geoid.wt_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl + demographics_ca_blocks_geoid.blkafam_asian_natisl + demographics_ca_blocks_geoid.blkafam_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl + demographics_ca_blocks_geoid.natcon_natisl_othr + demographics_ca_blocks_geoid.asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr
		)::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natisl,
	demographics_ca_blocks_geoid.othr + demographics_ca_blocks_geoid.wt_othr + demographics_ca_blocks_geoid.blkafam_othr + demographics_ca_blocks_geoid.natcon_othr + demographics_ca_blocks_geoid.asian_othr + demographics_ca_blocks_geoid.natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_othr + demographics_ca_blocks_geoid.wt_natcon_othr + demographics_ca_blocks_geoid.wt_asian_othr + demographics_ca_blocks_geoid.wt_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_othr + demographics_ca_blocks_geoid.blkafam_asian_othr + demographics_ca_blocks_geoid.blkafam_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_othr + demographics_ca_blocks_geoid.natcon_natisl_othr + demographics_ca_blocks_geoid.asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr AS ct_othr,
	round(
		(
			demographics_ca_blocks_geoid.othr + demographics_ca_blocks_geoid.wt_othr + demographics_ca_blocks_geoid.blkafam_othr + demographics_ca_blocks_geoid.natcon_othr + demographics_ca_blocks_geoid.asian_othr + demographics_ca_blocks_geoid.natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_othr + demographics_ca_blocks_geoid.wt_natcon_othr + demographics_ca_blocks_geoid.wt_asian_othr + demographics_ca_blocks_geoid.wt_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_othr + demographics_ca_blocks_geoid.blkafam_asian_othr + demographics_ca_blocks_geoid.blkafam_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_othr + demographics_ca_blocks_geoid.natcon_natisl_othr + demographics_ca_blocks_geoid.asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_othr + demographics_ca_blocks_geoid.wt_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr + demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr + demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr
		)::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_othr,
	demographics_ca_blocks_geoid.one_race,
	round(
		demographics_ca_blocks_geoid.one_race::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_one_race,
	demographics_ca_blocks_geoid.two_or_more_races,
	round(
		demographics_ca_blocks_geoid.two_or_more_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_two_or_more_races,
	demographics_ca_blocks_geoid.two_races,
	round(
		demographics_ca_blocks_geoid.two_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_two_races,
	demographics_ca_blocks_geoid.three_races,
	round(
		demographics_ca_blocks_geoid.three_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_three_races,
	demographics_ca_blocks_geoid.four_races,
	round(
		demographics_ca_blocks_geoid.four_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_four_races,
	demographics_ca_blocks_geoid.five_races,
	round(
		demographics_ca_blocks_geoid.five_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_five_races,
	demographics_ca_blocks_geoid.six_races,
	round(
		demographics_ca_blocks_geoid.six_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_six_races
FROM demographics_ca_blocks_geoid
WHERE demographics_ca_blocks_geoid.total > 0
ORDER BY demographics_ca_blocks_geoid.total DESC);

create table demographics_ca_blocks_pct_geoid as (
SELECT demographics_ca_blocks_geoid.geographic_area_name,
	demographics_ca_blocks_geoid.geoid,
	demographics_ca_blocks_geoid.total,
	round(
		demographics_ca_blocks_geoid.hispanic_or_latino::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_hispanic_or_latino,
	round(
		demographics_ca_blocks_geoid.not_hispanic_or_latino::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_not_hispanic_or_latino,
	round(
		demographics_ca_blocks_geoid.one_race::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_one_race,
	round(
		demographics_ca_blocks_geoid.wt::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt,
	round(
		demographics_ca_blocks_geoid.blkafam::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam,
	round(
		demographics_ca_blocks_geoid.natcon::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon,
	round(
		demographics_ca_blocks_geoid.asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_asian,
	round(
		demographics_ca_blocks_geoid.natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natisl,
	round(
		demographics_ca_blocks_geoid.othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_othr,
	round(
		demographics_ca_blocks_geoid.two_or_more_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_two_or_more_races,
	round(
		demographics_ca_blocks_geoid.two_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_two_races,
	round(
		demographics_ca_blocks_geoid.wt_blkafam::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam,
	round(
		demographics_ca_blocks_geoid.wt_natcon::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon,
	round(
		demographics_ca_blocks_geoid.wt_asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_asian,
	round(
		demographics_ca_blocks_geoid.wt_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natisl,
	round(
		demographics_ca_blocks_geoid.wt_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon,
	round(
		demographics_ca_blocks_geoid.blkafam_asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_asian,
	round(
		demographics_ca_blocks_geoid.blkafam_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natisl,
	round(
		demographics_ca_blocks_geoid.blkafam_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_othr,
	round(
		demographics_ca_blocks_geoid.natcon_asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon_asian,
	round(
		demographics_ca_blocks_geoid.natcon_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon_natisl,
	round(
		demographics_ca_blocks_geoid.natcon_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon_othr,
	round(
		demographics_ca_blocks_geoid.asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_asian_natisl,
	round(
		demographics_ca_blocks_geoid.asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_asian_othr,
	round(
		demographics_ca_blocks_geoid.natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natisl_othr,
	round(
		demographics_ca_blocks_geoid.three_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_three_races,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_asian,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natisl,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_othr,
	round(
		demographics_ca_blocks_geoid.wt_natcon_asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon_asian,
	round(
		demographics_ca_blocks_geoid.wt_natcon_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon_natisl,
	round(
		demographics_ca_blocks_geoid.wt_natcon_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon_othr,
	round(
		demographics_ca_blocks_geoid.wt_asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_asian_natisl,
	round(
		demographics_ca_blocks_geoid.wt_asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_asian_othr,
	round(
		demographics_ca_blocks_geoid.wt_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natisl_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon_asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon_asian,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon_natisl,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_asian_natisl,
	round(
		demographics_ca_blocks_geoid.blkafam_asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_asian_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natisl_othr,
	round(
		demographics_ca_blocks_geoid.natcon_asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon_asian_natisl,
	round(
		demographics_ca_blocks_geoid.natcon_asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon_asian_othr,
	round(
		demographics_ca_blocks_geoid.natcon_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon_natisl_othr,
	round(
		demographics_ca_blocks_geoid.asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_asian_natisl_othr,
	round(
		demographics_ca_blocks_geoid.four_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_four_races,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon_asian::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon_asian,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon_natisl,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon_othr,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_asian_natisl,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_asian_othr,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natisl_othr,
	round(
		demographics_ca_blocks_geoid.wt_natcon_asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon_asian_natisl,
	round(
		demographics_ca_blocks_geoid.wt_natcon_asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon_asian_othr,
	round(
		demographics_ca_blocks_geoid.wt_natcon_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon_natisl_othr,
	round(
		demographics_ca_blocks_geoid.wt_asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_asian_natisl_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon_asian_natisl,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon_asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon_asian_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon_natisl_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_asian_natisl_othr,
	round(
		demographics_ca_blocks_geoid.natcon_asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_natcon_asian_natisl_othr,
	round(
		demographics_ca_blocks_geoid.five_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_five_races,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon_asian_natisl,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon_asian_othr,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon_natisl_othr,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_asian_natisl_othr,
	round(
		demographics_ca_blocks_geoid.wt_natcon_asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_natcon_asian_natisl_othr,
	round(
		demographics_ca_blocks_geoid.blkafam_natcon_asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_blkafam_natcon_asian_natisl_othr,
	round(
		demographics_ca_blocks_geoid.six_races::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_six_races,
	round(
		demographics_ca_blocks_geoid.wt_blkafam_natcon_asian_natisl_othr::numeric / demographics_ca_blocks_geoid.total::numeric * 100::numeric,
		2
	) AS pct_wt_blkafam_natcon_asian_natisl_othr
FROM demographics_ca_blocks_geoid
WHERE demographics_ca_blocks_geoid.total > 0);

create table demographics_ca_blocks_geoid as (
SELECT "right"(demographics_ca_blocks.id::text, 15) AS geoid,
	demographics_ca_blocks.id,
	demographics_ca_blocks.geographic_area_name,
	demographics_ca_blocks.total,
	demographics_ca_blocks.hispanic_or_latino,
	demographics_ca_blocks.not_hispanic_or_latino,
	demographics_ca_blocks.one_race,
	demographics_ca_blocks.wt,
	demographics_ca_blocks.blkafam,
	demographics_ca_blocks.natcon,
	demographics_ca_blocks.asian,
	demographics_ca_blocks.natisl,
	demographics_ca_blocks.othr,
	demographics_ca_blocks.two_or_more_races,
	demographics_ca_blocks.two_races,
	demographics_ca_blocks.wt_blkafam,
	demographics_ca_blocks.wt_natcon,
	demographics_ca_blocks.wt_asian,
	demographics_ca_blocks.wt_natisl,
	demographics_ca_blocks.wt_othr,
	demographics_ca_blocks.blkafam_natcon,
	demographics_ca_blocks.blkafam_asian,
	demographics_ca_blocks.blkafam_natisl,
	demographics_ca_blocks.blkafam_othr,
	demographics_ca_blocks.natcon_asian,
	demographics_ca_blocks.natcon_natisl,
	demographics_ca_blocks.natcon_othr,
	demographics_ca_blocks.asian_natisl,
	demographics_ca_blocks.asian_othr,
	demographics_ca_blocks.natisl_othr,
	demographics_ca_blocks.three_races,
	demographics_ca_blocks.wt_blkafam_natcon,
	demographics_ca_blocks.wt_blkafam_asian,
	demographics_ca_blocks.wt_blkafam_natisl,
	demographics_ca_blocks.wt_blkafam_othr,
	demographics_ca_blocks.wt_natcon_asian,
	demographics_ca_blocks.wt_natcon_natisl,
	demographics_ca_blocks.wt_natcon_othr,
	demographics_ca_blocks.wt_asian_natisl,
	demographics_ca_blocks.wt_asian_othr,
	demographics_ca_blocks.wt_natisl_othr,
	demographics_ca_blocks.blkafam_natcon_asian,
	demographics_ca_blocks.blkafam_natcon_natisl,
	demographics_ca_blocks.blkafam_natcon_othr,
	demographics_ca_blocks.blkafam_asian_natisl,
	demographics_ca_blocks.blkafam_asian_othr,
	demographics_ca_blocks.blkafam_natisl_othr,
	demographics_ca_blocks.natcon_asian_natisl,
	demographics_ca_blocks.natcon_asian_othr,
	demographics_ca_blocks.natcon_natisl_othr,
	demographics_ca_blocks.asian_natisl_othr,
	demographics_ca_blocks.four_races,
	demographics_ca_blocks.wt_blkafam_natcon_asian,
	demographics_ca_blocks.wt_blkafam_natcon_natisl,
	demographics_ca_blocks.wt_blkafam_natcon_othr,
	demographics_ca_blocks.wt_blkafam_asian_natisl,
	demographics_ca_blocks.wt_blkafam_asian_othr,
	demographics_ca_blocks.wt_blkafam_natisl_othr,
	demographics_ca_blocks.wt_natcon_asian_natisl,
	demographics_ca_blocks.wt_natcon_asian_othr,
	demographics_ca_blocks.wt_natcon_natisl_othr,
	demographics_ca_blocks.wt_asian_natisl_othr,
	demographics_ca_blocks.blkafam_natcon_asian_natisl,
	demographics_ca_blocks.blkafam_natcon_asian_othr,
	demographics_ca_blocks.blkafam_natcon_natisl_othr,
	demographics_ca_blocks.blkafam_asian_natisl_othr,
	demographics_ca_blocks.natcon_asian_natisl_othr,
	demographics_ca_blocks.five_races,
	demographics_ca_blocks.wt_blkafam_natcon_asian_natisl,
	demographics_ca_blocks.wt_blkafam_natcon_asian_othr,
	demographics_ca_blocks.wt_blkafam_natcon_natisl_othr,
	demographics_ca_blocks.wt_blkafam_asian_natisl_othr,
	demographics_ca_blocks.wt_natcon_asian_natisl_othr,
	demographics_ca_blocks.blkafam_natcon_asian_natisl_othr,
	demographics_ca_blocks.six_races,
	demographics_ca_blocks.wt_blkafam_natcon_asian_natisl_othr
FROM demographics_ca_blocks
ORDER BY demographics_ca_blocks.total DESC
);

create table shpdemo_ca_blocks_pct_geoid as (
SELECT d.geographic_area_name,
    d.geoid,
    d.total,
    d.pct_hispanic_or_latino,
    d.pct_not_hispanic_or_latino,
    d.pct_one_race,
    d.pct_wt,
    d.pct_blkafam,
    d.pct_natcon,
    d.pct_asian,
    d.pct_natisl,
    d.pct_othr,
    d.pct_two_or_more_races,
    d.pct_two_races,
    d.pct_wt_blkafam,
    d.pct_wt_natcon,
    d.pct_wt_asian,
    d.pct_wt_natisl,
    d.pct_wt_othr,
    d.pct_blkafam_natcon,
    d.pct_blkafam_asian,
    d.pct_blkafam_natisl,
    d.pct_blkafam_othr,
    d.pct_natcon_asian,
    d.pct_natcon_natisl,
    d.pct_natcon_othr,
    d.pct_asian_natisl,
    d.pct_asian_othr,
    d.pct_natisl_othr,
    d.pct_three_races,
    d.pct_wt_blkafam_natcon,
    d.pct_wt_blkafam_asian,
    d.pct_wt_blkafam_natisl,
    d.pct_wt_blkafam_othr,
    d.pct_wt_natcon_asian,
    d.pct_wt_natcon_natisl,
    d.pct_wt_natcon_othr,
    d.pct_wt_asian_natisl,
    d.pct_wt_asian_othr,
    d.pct_wt_natisl_othr,
    d.pct_blkafam_natcon_asian,
    d.pct_blkafam_natcon_natisl,
    d.pct_blkafam_natcon_othr,
    d.pct_blkafam_asian_natisl,
    d.pct_blkafam_asian_othr,
    d.pct_blkafam_natisl_othr,
    d.pct_natcon_asian_natisl,
    d.pct_natcon_asian_othr,
    d.pct_natcon_natisl_othr,
    d.pct_asian_natisl_othr,
    d.pct_four_races,
    d.pct_wt_blkafam_natcon_asian,
    d.pct_wt_blkafam_natcon_natisl,
    d.pct_wt_blkafam_natcon_othr,
    d.pct_wt_blkafam_asian_natisl,
    d.pct_wt_blkafam_asian_othr,
    d.pct_wt_blkafam_natisl_othr,
    d.pct_wt_natcon_asian_natisl,
    d.pct_wt_natcon_asian_othr,
    d.pct_wt_natcon_natisl_othr,
    d.pct_wt_asian_natisl_othr,
    d.pct_blkafam_natcon_asian_natisl,
    d.pct_blkafam_natcon_asian_othr,
    d.pct_blkafam_natcon_natisl_othr,
    d.pct_blkafam_asian_natisl_othr,
    d.pct_natcon_asian_natisl_othr,
    d.pct_five_races,
    d.pct_wt_blkafam_natcon_asian_natisl,
    d.pct_wt_blkafam_natcon_asian_othr,
    d.pct_wt_blkafam_natcon_natisl_othr,
    d.pct_wt_blkafam_asian_natisl_othr,
    d.pct_wt_natcon_asian_natisl_othr,
    d.pct_blkafam_natcon_asian_natisl_othr,
    d.pct_six_races,
    d.pct_wt_blkafam_natcon_asian_natisl_othr,
    shp.geom
FROM demographics_ca_blocks_pct_geoid d,
    shp_ca_blocks shp
WHERE d.geoid = shp.geoid20::text);