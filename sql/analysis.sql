--------------
-- ANALYSIS --
--------------

-- BEGIN Demographic summaries

analyze iso_60_min_drive_single_ca_only;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_60_min_drive_only as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_60_min_drive_single_ca_only i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_60_min_drive_only_idx on blocks_in_iso_60_min_drive_only using btree (geoid);

create table blocks_in_iso_60_min_drive_only_summary as (
	select
		'blocks_in_iso_60_min_drive_only_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_60_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_30_min_drive_single_ca_only;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_30_min_drive_only as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_30_min_drive_single_ca_only i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_30_min_drive_only_idx on blocks_in_iso_30_min_drive_only using btree (geoid);

create table blocks_in_iso_30_min_drive_only_summary as (
	select
		'blocks_in_iso_30_min_drive_only_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_30_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_20_min_drive_single_ca_only;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_20_min_drive_only as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_20_min_drive_single_ca_only i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_20_min_drive_only_idx on blocks_in_iso_20_min_drive_only using btree (geoid);

create table blocks_in_iso_20_min_drive_only_summary as (
	select
		'blocks_in_iso_20_min_drive_only_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_20_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_10_min_drive_single_ca_only;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_10_min_drive_only as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_10_min_drive_single_ca_only i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_10_min_drive_only_idx on blocks_in_iso_10_min_drive_only using btree (geoid);

create table blocks_in_iso_10_min_drive_only_summary as (
	select
		'blocks_in_iso_10_min_drive_only_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_10_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_30_min_walk_single_ca_only;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_30_min_walk_only as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_30_min_walk_single_ca_only i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_30_min_walk_only_idx on blocks_in_iso_30_min_walk_only using btree (geoid);

create table blocks_in_iso_30_min_walk_only_summary as (
	select
		'blocks_in_iso_30_min_walk_only_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_30_min_walk_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_20_min_walk_single_ca_only;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_20_min_walk_only as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_20_min_walk_single_ca_only i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_20_min_walk_only_idx on blocks_in_iso_20_min_walk_only using btree (geoid);

create table blocks_in_iso_20_min_walk_only_summary as (
	select
		'blocks_in_iso_20_min_walk_only_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_20_min_walk_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_60_min_drive_single_ca;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_60_min_drive as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_60_min_drive_single_ca i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);

create table blocks_in_iso_60_min_drive_summary as (
	select
		'blocks_in_iso_60_min_drive_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_60_min_drive b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

create table blocks_out_iso_60_min_drive as (
	select
		d.*,
		1 - b.block_portion as block_portion
	from 
		demographics_ca_blocks_summary_pct_geoid d
		left join blocks_in_iso_60_min_drive b
		on d.geoid = b.geoid
	where
		b.block_portion < 1
		or b.block_portion is null
);

update blocks_out_iso_60_min_drive
	set block_portion = 1
	where block_portion is NULL;

create table blocks_out_iso_60_min_drive_summary as (
	select
		'blocks_out_iso_60_min_drive_summary' as iso,
		round(sum(b.total * b.block_portion)) as total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_othr,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_three_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_four_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_five_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_out_iso_60_min_drive b
);

analyze iso_30_min_drive_single_ca;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_30_min_drive as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_30_min_drive_single_ca i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);

create table blocks_in_iso_30_min_drive_summary as (
	select
		'blocks_in_iso_30_min_drive_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_30_min_drive b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

create table blocks_out_iso_30_min_drive as (
	select
		d.*,
		1 - b.block_portion as block_portion
	from 
		demographics_ca_blocks_summary_pct_geoid d
		left join blocks_in_iso_30_min_drive b
		on d.geoid = b.geoid
	where
		b.block_portion < 1
		or b.block_portion is null
);

update blocks_out_iso_30_min_drive
	set block_portion = 1
	where block_portion is NULL;

create table blocks_out_iso_30_min_drive_summary as (
	select
		'blocks_out_iso_30_min_drive_summary' as iso,
		round(sum(b.total * b.block_portion)) as total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_othr,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_three_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_four_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_five_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_out_iso_30_min_drive b
);

analyze iso_20_min_drive_single_ca;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_20_min_drive as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_20_min_drive_single_ca i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);

create table blocks_in_iso_20_min_drive_summary as (
	select
		'blocks_in_iso_20_min_drive_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_20_min_drive b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

create table blocks_out_iso_20_min_drive as (
	select
		d.*,
		1 - b.block_portion as block_portion
	from 
		demographics_ca_blocks_summary_pct_geoid d
		left join blocks_in_iso_20_min_drive b
		on d.geoid = b.geoid
	where
		b.block_portion < 1
		or b.block_portion is null
);

update blocks_out_iso_20_min_drive
	set block_portion = 1
	where block_portion is NULL;

create table blocks_out_iso_20_min_drive_summary as (
	select
		'blocks_out_iso_20_min_drive_summary' as iso,
		round(sum(b.total * b.block_portion)) as total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_othr,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_three_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_four_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_five_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_out_iso_20_min_drive b
);

analyze iso_10_min_drive_single_ca;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_10_min_drive as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_10_min_drive_single_ca i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);

create table blocks_in_iso_10_min_drive_summary as (
	select
		'blocks_in_iso_10_min_drive_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_10_min_drive b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

create table blocks_out_iso_10_min_drive as (
	select
		d.*,
		1 - b.block_portion as block_portion
	from 
		demographics_ca_blocks_summary_pct_geoid d
		left join blocks_in_iso_10_min_drive b
		on d.geoid = b.geoid
	where
		b.block_portion < 1
		or b.block_portion is null
);

update blocks_out_iso_10_min_drive
	set block_portion = 1
	where block_portion is NULL;

create table blocks_out_iso_10_min_drive_summary as (
	select
		'blocks_out_iso_10_min_drive_summary' as iso,
		round(sum(b.total * b.block_portion)) as total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_othr,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_three_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_four_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_five_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_out_iso_10_min_drive b
);

analyze iso_30_min_walk_single_ca;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_30_min_walk as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_30_min_walk_single_ca i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);

create table blocks_in_iso_30_min_walk_summary as (
	select
		'blocks_in_iso_30_min_walk_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_30_min_walk b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

create table blocks_out_iso_30_min_walk as (
	select
		d.*,
		1 - b.block_portion as block_portion
	from 
		demographics_ca_blocks_summary_pct_geoid d
		left join blocks_in_iso_30_min_walk b
		on d.geoid = b.geoid
	where
		b.block_portion < 1
		or b.block_portion is null
);

update blocks_out_iso_30_min_walk
	set block_portion = 1
	where block_portion is NULL;

create table blocks_out_iso_30_min_walk_summary as (
	select
		'blocks_out_iso_30_min_walk_summary' as iso,
		round(sum(b.total * b.block_portion)) as total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_othr,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_three_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_four_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_five_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_out_iso_30_min_walk b
);

analyze iso_20_min_walk_single_ca;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_20_min_walk as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_20_min_walk_single_ca i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);

create table blocks_in_iso_20_min_walk_summary as (
	select
		'blocks_in_iso_20_min_walk_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_20_min_walk b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

create table blocks_out_iso_20_min_walk as (
	select
		d.*,
		1 - b.block_portion as block_portion
	from 
		demographics_ca_blocks_summary_pct_geoid d
		left join blocks_in_iso_20_min_walk b
		on d.geoid = b.geoid
	where
		b.block_portion < 1
		or b.block_portion is null
);

update blocks_out_iso_20_min_walk
	set block_portion = 1
	where block_portion is NULL;

create table blocks_out_iso_20_min_walk_summary as (
	select
		'blocks_out_iso_20_min_walk_summary' as iso,
		round(sum(b.total * b.block_portion)) as total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_othr,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_three_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_four_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_five_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_out_iso_20_min_walk b
);

analyze iso_10_min_walk_single_ca;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_10_min_walk as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_10_min_walk_single_ca i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);

create table blocks_in_iso_10_min_walk_summary as (
	select
		'blocks_in_iso_10_min_walk_summary' as iso,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_in_iso_10_min_walk b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

create table blocks_out_iso_10_min_walk as (
	select
		d.*,
		1 - b.block_portion as block_portion
	from 
		demographics_ca_blocks_summary_pct_geoid d
		left join blocks_in_iso_10_min_walk b
		on d.geoid = b.geoid
	where
		b.block_portion < 1
		or b.block_portion is null
);

update blocks_out_iso_10_min_walk
	set block_portion = 1
	where block_portion is NULL;

create table blocks_out_iso_10_min_walk_summary as (
	select
		'blocks_out_iso_10_min_walk_summary' as iso,
		round(sum(b.total * b.block_portion)) as total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_othr,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_two_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_three_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_four_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_five_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100) as pct_six_races
	from
		blocks_out_iso_10_min_walk b
);

create table blocks_in_isos_summary as (
	select * from blocks_in_iso_10_min_drive_summary
	union 
	select * from blocks_in_iso_20_min_drive_summary
	union 
	select * from blocks_in_iso_30_min_drive_summary
	union 
	select * from blocks_in_iso_60_min_drive_summary
	union 
	select * from blocks_out_iso_10_min_drive_summary
	union 
	select * from blocks_out_iso_20_min_drive_summary
	union 
	select * from blocks_out_iso_30_min_drive_summary
	union 
	select * from blocks_out_iso_60_min_drive_summary
	union 
	select * from blocks_in_iso_10_min_walk_summary
	union 
	select * from blocks_in_iso_20_min_walk_summary
	union 
	select * from blocks_in_iso_30_min_walk_summary
	union 
	select * from blocks_out_iso_10_min_walk_summary
	union 
	select * from blocks_out_iso_20_min_walk_summary
	union 
	select * from blocks_out_iso_30_min_walk_summary
);

create table blocks_in_isos_summary_ca (
	select * from blocks_in_isos_summary
	union 
	select
		'california' as iso,
		total,
		100 as pct_total,
		round(pct_hispanic_or_latino),
		round(pct_not_hispanic_or_latino),
		round(pct_wt),
		round(pct_blkafam),
		round(pct_natcon),
		round(pct_asian),
		round(pct_natisl),
		round(pct_othr),
		round(pct_one_race),
		round(pct_two_or_more_races),
		round(pct_two_races),
		round(pct_three_races),
		round(pct_four_races),
		round(pct_five_races),
		round(pct_six_races)
	from
		demographics_ca_pct
	order by
		iso
);

create table blocks_in_iso_10_min as (
	select d.* from blocks_in_iso_10_min_drive d, blocks_in_iso_10_min_walk w where d.block_portion >= w.block_portion
	union
	select w.* from blocks_in_iso_10_min_drive d, blocks_in_iso_10_min_walk w where d.block_portion <= w.block_portion
);

create table blocks_in_iso_20_min as (
	select * from blocks_in_iso_20_min_drive d where 
	union
	select * from blocks_in_iso_20_min_walk w where 
);

create table blocks_in_iso_30_min as (
	select * from blocks_in_iso_30_min_drive
	union
	select * from blocks_in_iso_30_min_walk
);


-- END Demographic summaries in and out of isochrones

-- blocks in urban areas with portion
create table blocks_in_ca_urban_areas as (select
	b.geoid20 as b_geoid,
	u.geoid10 as ua_geoid,
	u.name10 as ua,
	round((st_area(st_intersection(u.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
from 
	shp_ca_urban_areas u,
	shp_ca_blocks b
where
	st_intersects(u.geom, b.geom)
);
create index blocks_in_ca_urban_areas_bt_idx on blocks_in_ca_urban_areas using btree (b_geoid);




create table blocks_in_ua_10_min_walk as (
	select
		u.b_geoid as geoid,
		u.ua as ua,
		u.block_portion as ua_portion,
		i.block_portion as iso_portion
	from
		blocks_in_iso_10_min_walk i,
		blocks_in_ca_urban_areas u
	where
		u.b_geoid = i.geoid
);

create table blocks_in_ua_10_min_walk_summary as (
	select
		b.geoid,
		b.ua,
		
	from
		blocks_in_ua_10_min_walk b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid;

create table blocks_in_ua_20_min_walk_only as (
	select
		u.b_geoid as geoid,
		u.ua as ua,
		u.block_portion as ua_portion,
		i.block_portion as iso_portion
	from
		blocks_in_iso_20_min_walk_only i,
		blocks_in_ca_urban_areas u
	where
		u.b_geoid = i.geoid
);

create table blocks_in_ua_20_min_walk_only_summary as (
	select
		b.geoid,
		b.ua,
		
	from
		blocks_in_ua_20_min_walk_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid;

create table blocks_in_ua_30_min_walk_only as (
	select
		u.b_geoid as geoid,
		u.ua as ua,
		u.block_portion as ua_portion,
		i.block_portion as iso_portion
	from
		blocks_in_iso_30_min_walk_only i,
		blocks_in_ca_urban_areas u
	where
		u.b_geoid = i.geoid
);

create table blocks_in_ua_30_min_walk_only_summary as (
	select
		b.geoid,
		b.ua,
		
	from
		blocks_in_ua_30_min_walk_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid;

create table blocks_in_ua_10_min_drive_only as (
	select
		u.b_geoid as geoid,
		u.ua as ua,
		u.block_portion as ua_portion,
		i.block_portion as iso_portion
	from
		blocks_in_iso_10_min_drive_only i,
		blocks_in_ca_urban_areas u
	where
		u.b_geoid = i.geoid
);

create table blocks_in_ua_10_min_drive_only_summary as (
	select
		b.geoid,
		b.ua,
		
	from
		blocks_in_ua_10_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid;

create table blocks_in_ua_20_min_drive_only as (
	select
		u.b_geoid as geoid,
		u.ua as ua,
		u.block_portion as ua_portion,
		i.block_portion as iso_portion
	from
		blocks_in_iso_20_min_drive_only i,
		blocks_in_ca_urban_areas u
	where
		u.b_geoid = i.geoid
);

create table blocks_in_ua_20_min_drive_only_summary as (
	select
		b.geoid,
		b.ua,
		
	from
		blocks_in_ua_20_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid;

create table blocks_in_ua_30_min_drive_only as (
	select
		u.b_geoid as geoid,
		u.ua as ua,
		u.block_portion as ua_portion,
		i.block_portion as iso_portion
	from
		blocks_in_iso_30_min_drive_only i,
		blocks_in_ca_urban_areas u
	where
		u.b_geoid = i.geoid
);

create table blocks_in_ua_30_min_drive_only_summary as (
	select
		b.geoid,
		b.ua,
		
	from
		blocks_in_ua_30_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid;

create table blocks_in_ua_60_min_drive_only as (
	select
		u.b_geoid as geoid,
		u.ua as ua,
		u.block_portion as ua_portion,
		i.block_portion as iso_portion
	from
		blocks_in_iso_60_min_drive_only i,
		blocks_in_ca_urban_areas u
	where
		u.b_geoid = i.geoid
);

create table blocks_in_ua_60_min_drive_only_summary as (
	select
		b.geoid,
		b.ua,
		
	from
		blocks_in_ua_60_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid;
