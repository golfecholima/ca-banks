--------------
-- ANALYSIS --
--------------

-- BEGIN Demographic summaries

-- ua/iso overlap --
analyze iso_60_min_drive_single_ca_only_ua;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_60_min_drive_only_ua as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_60_min_drive_single_ca_only_ua i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_60_min_drive_only_ua_idx on blocks_in_iso_60_min_drive_only_ua using btree (geoid);

create table blocks_in_iso_60_min_drive_only_ua_summary as (
	select
		'blocks_in_iso_60_min_drive_only_ua_summary' as iso,
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
	from
		blocks_in_iso_60_min_drive_only_ua b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_30_min_drive_single_ca_only_ua;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_30_min_drive_only_ua as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_30_min_drive_single_ca_only_ua i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_30_min_drive_only_ua_idx on blocks_in_iso_30_min_drive_only_ua using btree (geoid);

create table blocks_in_iso_30_min_drive_only_ua_summary as (
	select
		'blocks_in_iso_30_min_drive_only_ua_summary' as iso,
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
	from
		blocks_in_iso_30_min_drive_only_ua b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_20_min_drive_single_ca_only_ua;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_20_min_drive_only_ua as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_20_min_drive_single_ca_only_ua i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_20_min_drive_only_ua_idx on blocks_in_iso_20_min_drive_only_ua using btree (geoid);

create table blocks_in_iso_20_min_drive_only_ua_summary as (
	select
		'blocks_in_iso_20_min_drive_only_ua_summary' as iso,
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
	from
		blocks_in_iso_20_min_drive_only_ua b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_10_min_drive_single_ca_only_ua;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_10_min_drive_only_ua as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_10_min_drive_single_ca_only_ua i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_10_min_drive_only_ua_idx on blocks_in_iso_10_min_drive_only_ua using btree (geoid);

create table blocks_in_iso_10_min_drive_only_ua_summary as (
	select
		'blocks_in_iso_10_min_drive_only_ua_summary' as iso,
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
	from
		blocks_in_iso_10_min_drive_only_ua b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_30_min_walk_single_ca_only_ua;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_30_min_walk_only_ua as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_30_min_walk_single_ca_only_ua i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_30_min_walk_only_ua_idx on blocks_in_iso_30_min_walk_only_ua using btree (geoid);

create table blocks_in_iso_30_min_walk_only_ua_summary as (
	select
		'blocks_in_iso_30_min_walk_only_ua_summary' as iso,
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
	from
		blocks_in_iso_30_min_walk_only_ua b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_20_min_walk_single_ca_only_ua;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_20_min_walk_only_ua as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_20_min_walk_single_ca_only_ua i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_20_min_walk_only_ua_idx on blocks_in_iso_20_min_walk_only_ua using btree (geoid);

create table blocks_in_iso_20_min_walk_only_ua_summary as (
	select
		'blocks_in_iso_20_min_walk_only_ua_summary' as iso,
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
	from
		blocks_in_iso_20_min_walk_only_ua b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

analyze iso_10_min_walk_single_ca_only_ua;
analyze shp_ca_blocks;
analyze demographics_ca_blocks_summary_pct_geoid;

create table blocks_in_iso_10_min_walk_only_ua as (
	select
		b.geoid20 as geoid,
		round((st_area(st_intersection(i.geom, b.geom)) / st_area(b.geom))::decimal, 2) AS block_portion
	from
		iso_10_min_walk_single_ca_only_ua i,
		shp_ca_blocks b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid20 = d.geoid
		and st_intersects(i.geom, b.geom)
);
create index blocks_in_iso_10_min_walk_only_ua_idx on blocks_in_iso_10_min_walk_only_ua using btree (geoid);

create table blocks_in_iso_10_min_walk_only_ua_summary as (
	select
		'blocks_in_iso_10_min_walk_only_ua_summary' as iso,
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
	from
		blocks_in_iso_10_min_walk_only_ua b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
);

-- END ua/iso overlap --

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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(b.total * b.block_portion), 2) as ct_total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(b.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(b.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(b.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(b.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(b.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(b.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(b.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(b.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(b.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(b.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(b.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(b.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(b.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
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
		round(sum(b.total * b.block_portion), 2) as ct_total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(b.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt), 2) as ct_wt,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(b.ct_blkafam), 2) as ct_blkafam,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(b.ct_natcon), 2) as ct_natcon,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(b.ct_asian), 2) as ct_asian,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(b.ct_natisl), 2) as ct_natisl,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(b.ct_othr), 2) as ct_othr,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(b.one_race), 2) as ct_one_race,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(b.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(b.two_races), 2) as ct_two_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(b.three_races), 2) as ct_three_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(b.four_races), 2) as ct_four_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(b.five_races), 2) as ct_five_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(b.six_races), 2) as ct_six_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(b.total * b.block_portion), 2) as ct_total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(b.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt), 2) as ct_wt,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(b.ct_blkafam), 2) as ct_blkafam,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(b.ct_natcon), 2) as ct_natcon,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(b.ct_asian), 2) as ct_asian,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(b.ct_natisl), 2) as ct_natisl,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(b.ct_othr), 2) as ct_othr,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(b.one_race), 2) as ct_one_race,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(b.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(b.two_races), 2) as ct_two_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(b.three_races), 2) as ct_three_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(b.four_races), 2) as ct_four_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(b.five_races), 2) as ct_five_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(b.six_races), 2) as ct_six_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(b.total * b.block_portion), 2) as ct_total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(b.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt), 2) as ct_wt,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(b.ct_blkafam), 2) as ct_blkafam,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(b.ct_natcon), 2) as ct_natcon,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(b.ct_asian), 2) as ct_asian,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(b.ct_natisl), 2) as ct_natisl,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(b.ct_othr), 2) as ct_othr,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(b.one_race), 2) as ct_one_race,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(b.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(b.two_races), 2) as ct_two_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(b.three_races), 2) as ct_three_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(b.four_races), 2) as ct_four_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(b.five_races), 2) as ct_five_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(b.six_races), 2) as ct_six_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(b.total * b.block_portion), 2) as ct_total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(b.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt), 2) as ct_wt,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(b.ct_blkafam), 2) as ct_blkafam,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(b.ct_natcon), 2) as ct_natcon,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(b.ct_asian), 2) as ct_asian,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(b.ct_natisl), 2) as ct_natisl,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(b.ct_othr), 2) as ct_othr,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(b.one_race), 2) as ct_one_race,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(b.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(b.two_races), 2) as ct_two_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(b.three_races), 2) as ct_three_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(b.four_races), 2) as ct_four_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(b.five_races), 2) as ct_five_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(b.six_races), 2) as ct_six_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(b.total * b.block_portion), 2) as ct_total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(b.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt), 2) as ct_wt,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(b.ct_blkafam), 2) as ct_blkafam,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(b.ct_natcon), 2) as ct_natcon,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(b.ct_asian), 2) as ct_asian,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(b.ct_natisl), 2) as ct_natisl,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(b.ct_othr), 2) as ct_othr,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(b.one_race), 2) as ct_one_race,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(b.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(b.two_races), 2) as ct_two_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(b.three_races), 2) as ct_three_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(b.four_races), 2) as ct_four_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(b.five_races), 2) as ct_five_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(b.six_races), 2) as ct_six_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(d.total * b.block_portion), 2) as ct_total,
		round(sum(d.total * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion), 2) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion), 2) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion), 2) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion), 2) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion), 2) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion), 2) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion), 2) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion), 2) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(d.one_race * b.block_portion), 2) as ct_one_race,
		round(sum(d.one_race * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion), 2) as ct_two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion), 2) as ct_two_races,
		round(sum(d.two_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(d.three_races * b.block_portion), 2) as ct_three_races,
		round(sum(d.three_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(d.four_races * b.block_portion), 2) as ct_four_races,
		round(sum(d.four_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(d.five_races * b.block_portion), 2) as ct_five_races,
		round(sum(d.five_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(d.six_races * b.block_portion), 2) as ct_six_races,
		round(sum(d.six_races * b.block_portion) / sum(d.total * b.block_portion) * 100, 2) as pct_six_races
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
		round(sum(b.total * b.block_portion), 2) as ct_total,
		round(sum(b.total * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_total,
		round(sum(b.ct_hispanic_or_latino), 2) as ct_hispanic_or_latino,
		round(sum(b.ct_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino), 2) as ct_not_hispanic_or_latino,
		round(sum(b.ct_not_hispanic_or_latino * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_not_hispanic_or_latino,
		round(sum(b.ct_wt), 2) as ct_wt,
		round(sum(b.ct_wt * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_wt,
		round(sum(b.ct_blkafam), 2) as ct_blkafam,
		round(sum(b.ct_blkafam * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_blkafam,
		round(sum(b.ct_natcon), 2) as ct_natcon,
		round(sum(b.ct_natcon * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natcon,
		round(sum(b.ct_asian), 2) as ct_asian,
		round(sum(b.ct_asian * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_asian,
		round(sum(b.ct_natisl), 2) as ct_natisl,
		round(sum(b.ct_natisl * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_natisl,
		round(sum(b.ct_othr), 2) as ct_othr,
		round(sum(b.ct_othr * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_othr,
		round(sum(b.one_race), 2) as ct_one_race,
		round(sum(b.one_race * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_one_race,
		round(sum(b.two_or_more_races), 2) as ct_two_or_more_races,
		round(sum(b.two_or_more_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_or_more_races,
		round(sum(b.two_races), 2) as ct_two_races,
		round(sum(b.two_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_two_races,
		round(sum(b.three_races), 2) as ct_three_races,
		round(sum(b.three_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_three_races,
		round(sum(b.four_races), 2) as ct_four_races,
		round(sum(b.four_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_four_races,
		round(sum(b.five_races), 2) as ct_five_races,
		round(sum(b.five_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_five_races,
		round(sum(b.six_races), 2) as ct_six_races,
		round(sum(b.six_races * b.block_portion) / sum(b.total * b.block_portion) * 100, 2) as pct_six_races
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

create table demographics_ca_urban_areas as (
	select
		b.ua as ua,
		round(sum(d.total * b.block_portion)) as total,
		round(sum(d.total * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.block_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.block_portion)) as ct_wt,
		round(sum(d.ct_wt * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.block_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.block_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.block_portion)) as ct_asian,
		round(sum(d.ct_asian * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.block_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.block_portion)) as ct_othr,
		round(sum(d.ct_othr * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.block_portion)) as one_race,
		round(sum(d.one_race * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.block_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.block_portion)) as two_races,
		round(sum(d.two_races * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.block_portion)) as three_races,
		round(sum(d.three_races * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.block_portion)) as four_races,
		round(sum(d.four_races * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.block_portion)) as five_races,
		round(sum(d.five_races * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.block_portion)) as six_races,
		round(sum(d.six_races * b.block_portion) / nullif(sum(d.total * b.block_portion),0) * 100) as pct_six_races
	from
		blocks_in_ca_urban_areas b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		d.geoid = b.b_geoid
	group by
		b.ua
);
create index demographics_ca_urban_areas_bt_idx on demographics_ca_urban_areas using btree (ua);

-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--
-- a;sfja;dksjf;lahksdg;lksdaj--

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
create index blocks_in_ua_10_min_walk_bt_idx on blocks_in_ua_10_min_walk using btree (geoid);

create table blocks_in_ua_10_min_walk_summary as (
	select
		'blocks_in_ua_10_min_walk_summary' as iso,
		b.ua as ua,
		round(sum(d.total * b.ua_portion * b.iso_portion)) as total,
		round(sum(d.total * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion)) as ct_wt,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion)) as ct_asian,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion)) as ct_othr,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.ua_portion * b.iso_portion)) as one_race,
		round(sum(d.one_race * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion)) as two_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion)) as three_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion)) as four_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion)) as five_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion)) as six_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_six_races
	from
		blocks_in_ua_10_min_walk b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
	group by
		b.ua
);
create index blocks_in_ua_10_min_walk_summary_ua_bt_idx on blocks_in_ua_10_min_walk_summary using btree (ua);
create index blocks_in_ua_10_min_walk_summary_iso_bt_idx on blocks_in_ua_10_min_walk_summary using btree (iso);

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
create index blocks_in_ua_20_min_walk_only_bt_idx on blocks_in_ua_20_min_walk_only using btree (geoid);

create table blocks_in_ua_20_min_walk_only_summary as (
	select
		'blocks_in_ua_20_min_walk_only_summary' as iso,
		b.ua as ua,
		round(sum(d.total * b.ua_portion * b.iso_portion)) as total,
		round(sum(d.total * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion)) as ct_wt,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion)) as ct_asian,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion)) as ct_othr,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.ua_portion * b.iso_portion)) as one_race,
		round(sum(d.one_race * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion)) as two_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion)) as three_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion)) as four_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion)) as five_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion)) as six_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_six_races
	from
		blocks_in_ua_20_min_walk_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
	group by
		b.ua
);
create index blocks_in_ua_20_min_walk_only_summary_ua_bt_idx on blocks_in_ua_20_min_walk_only_summary using btree (ua);
create index blocks_in_ua_20_min_walk_only_summary_iso_bt_idx on blocks_in_ua_20_min_walk_only_summary using btree (iso);

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
create index blocks_in_ua_30_min_walk_only_bt_idx on blocks_in_ua_30_min_walk_only using btree (geoid);

create table blocks_in_ua_30_min_walk_only_summary as (
	select
		'blocks_in_ua_30_min_walk_only_summary' as iso,
		b.ua as ua,
		round(sum(d.total * b.ua_portion * b.iso_portion)) as total,
		round(sum(d.total * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion)) as ct_wt,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion)) as ct_asian,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion)) as ct_othr,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.ua_portion * b.iso_portion)) as one_race,
		round(sum(d.one_race * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion)) as two_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion)) as three_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion)) as four_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion)) as five_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion)) as six_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_six_races
	from
		blocks_in_ua_30_min_walk_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
	group by
		b.ua
);
create index blocks_in_ua_30_min_walk_only_summary_ua_bt_idx on blocks_in_ua_30_min_walk_only_summary using btree (ua);
create index blocks_in_ua_30_min_walk_only_summary_iso_bt_idx on blocks_in_ua_30_min_walk_only_summary using btree (iso);

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
create index blocks_in_ua_10_min_drive_only_bt_idx on blocks_in_ua_10_min_drive_only using btree (geoid);

create table blocks_in_ua_10_min_drive_only_summary as (
	select
		'blocks_in_ua_10_min_drive_only_summary' as iso,
		b.ua as ua,
		round(sum(d.total * b.ua_portion * b.iso_portion)) as total,
		round(sum(d.total * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion)) as ct_wt,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion)) as ct_asian,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion)) as ct_othr,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.ua_portion * b.iso_portion)) as one_race,
		round(sum(d.one_race * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion)) as two_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion)) as three_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion)) as four_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion)) as five_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion)) as six_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_six_races
	from
		blocks_in_ua_10_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
	group by
		b.ua
);
create index blocks_in_ua_10_min_drive_only_summary_ua_bt_idx on blocks_in_ua_10_min_drive_only_summary using btree (ua);
create index blocks_in_ua_10_min_drive_only_summary_iso_bt_idx on blocks_in_ua_10_min_drive_only_summary using btree (iso);

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
create index blocks_in_ua_20_min_drive_only_bt_idx on blocks_in_ua_20_min_drive_only using btree (geoid);

create table blocks_in_ua_20_min_drive_only_summary as (
	select
		'blocks_in_ua_20_min_drive_only_summary' as iso,
		b.ua as ua,
		round(sum(d.total * b.ua_portion * b.iso_portion)) as total,
		round(sum(d.total * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion)) as ct_wt,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion)) as ct_asian,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion)) as ct_othr,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.ua_portion * b.iso_portion)) as one_race,
		round(sum(d.one_race * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion)) as two_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion)) as three_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion)) as four_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion)) as five_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion)) as six_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_six_races
	from
		blocks_in_ua_20_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
	group by
		b.ua
);
create index blocks_in_ua_20_min_drive_only_summary_ua_bt_idx on blocks_in_ua_20_min_drive_only_summary using btree (ua);
create index blocks_in_ua_20_min_drive_only_summary_iso_bt_idx on blocks_in_ua_20_min_drive_only_summary using btree (iso);

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
create index blocks_in_ua_30_min_drive_only_bt_idx on blocks_in_ua_30_min_drive_only using btree (geoid);

create table blocks_in_ua_30_min_drive_only_summary as (
	select
		'blocks_in_ua_30_min_drive_only_summary' as iso,
		b.ua as ua,
		round(sum(d.total * b.ua_portion * b.iso_portion)) as total,
		round(sum(d.total * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion)) as ct_wt,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion)) as ct_asian,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion)) as ct_othr,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.ua_portion * b.iso_portion)) as one_race,
		round(sum(d.one_race * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion)) as two_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion)) as three_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion)) as four_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion)) as five_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion)) as six_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_six_races
	from
		blocks_in_ua_30_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
	group by
		b.ua
);
create index blocks_in_ua_30_min_drive_only_summary_ua_bt_idx on blocks_in_ua_30_min_drive_only_summary using btree (ua);
create index blocks_in_ua_30_min_drive_only_summary_iso_bt_idx on blocks_in_ua_30_min_drive_only_summary using btree (iso);

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
create index blocks_in_ua_60_min_drive_only_bt_idx on blocks_in_ua_60_min_drive_only using btree (geoid);

create table blocks_in_ua_60_min_drive_only_summary as (
	select
		'blocks_in_ua_60_min_drive_only_summary' as iso,
		b.ua as ua,
		round(sum(d.total * b.ua_portion * b.iso_portion)) as total,
		round(sum(d.total * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_total,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion)) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_not_hispanic_or_latino,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion)) as ct_wt,
		round(sum(d.ct_wt * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_wt,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion)) as ct_blkafam,
		round(sum(d.ct_blkafam * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_blkafam,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion)) as ct_natcon,
		round(sum(d.ct_natcon * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natcon,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion)) as ct_asian,
		round(sum(d.ct_asian * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_asian,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion)) as ct_natisl,
		round(sum(d.ct_natisl * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_natisl,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion)) as ct_othr,
		round(sum(d.ct_othr * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_othr,
		round(sum(d.one_race * b.ua_portion * b.iso_portion)) as one_race,
		round(sum(d.one_race * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_one_race,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion)) as two_or_more_races,
		round(sum(d.two_or_more_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_or_more_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion)) as two_races,
		round(sum(d.two_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_two_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion)) as three_races,
		round(sum(d.three_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_three_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion)) as four_races,
		round(sum(d.four_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_four_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion)) as five_races,
		round(sum(d.five_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_five_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion)) as six_races,
		round(sum(d.six_races * b.ua_portion * b.iso_portion) / nullif(sum(d.total * b.ua_portion * b.iso_portion),0) * 100) as pct_six_races
	from
		blocks_in_ua_60_min_drive_only b,
		demographics_ca_blocks_summary_pct_geoid d
	where
		b.geoid = d.geoid
	group by
		b.ua
);
create index blocks_in_ua_60_min_drive_only_summary_ua_bt_idx on blocks_in_ua_60_min_drive_only_summary using btree (ua);
create index blocks_in_ua_60_min_drive_only_summary_iso_bt_idx on blocks_in_ua_60_min_drive_only_summary using btree (iso);

create table demographics_ua_iso_all as (
	select * from blocks_in_ua_10_min_walk_summary
	union
	select * from blocks_in_ua_20_min_walk_only_summary
	union
	select * from blocks_in_ua_30_min_walk_only_summary
	union
	select * from blocks_in_ua_10_min_drive_only_summary
	union
	select * from blocks_in_ua_20_min_drive_only_summary
	union
	select * from blocks_in_ua_30_min_drive_only_summary
	union
	select * from blocks_in_ua_60_min_drive_only_summary
	order by iso, ua
);

create table demographics_ca_iso_all_summary as (
	select * from blocks_in_iso_10_min_walk_summary
	union
	select * from blocks_in_iso_20_min_walk_only_summary
	union
	select * from blocks_in_iso_30_min_walk_only_summary
	union
	select * from blocks_in_iso_10_min_drive_only_summary
	union
	select * from blocks_in_iso_20_min_drive_only_summary
	union
	select * from blocks_in_iso_30_min_drive_only_summary
	union
	select * from blocks_in_iso_60_min_drive_only_summary
	order by iso
);

create table demographics_ua_v_ca as (
	select
		u.ua,
		u.iso,
		u.ct_hispanic_or_latino - c.ct_hispanic_or_latino as d_ct_hispanic_or_latino,
        u.pct_hispanic_or_latino - c.pct_hispanic_or_latino as d_pct_hispanic_or_latino,
		u.ct_not_hispanic_or_latino - c.ct_not_hispanic_or_latino as d_ct_not_hispanic_or_latino,
        u.pct_not_hispanic_or_latino - c.pct_not_hispanic_or_latino as d_pct_not_hispanic_or_latino,
		u.ct_wt - c.ct_wt as d_ct_wt,
        u.pct_wt - c.pct_wt as d_pct_wt,
		u.ct_blkafam - c.ct_blkafam as d_ct_blkafam,
        u.pct_blkafam - c.pct_blkafam as d_pct_blkafam,
		u.ct_natcon - c.ct_natcon as d_ct_natcon,
        u.pct_natcon - c.pct_natcon as d_pct_natcon,
		u.ct_asian - c.ct_asian as d_ct_asian,
        u.pct_asian - c.pct_asian as d_pct_asian,
		u.ct_natisl - c.ct_natisl as d_ct_natisl,
        u.pct_natisl - c.pct_natisl as d_pct_natisl,
		u.ct_othr - c.ct_othr as d_ct_othr,
        u.pct_othr - c.pct_othr as d_pct_othr
	from
		demographics_ua_iso_all u,
		demographics_ca_iso_all_summary c
	where
		ltrim(c.iso,'blocks_in_iso_') = ltrim(u.iso,'blocks_in_ua_')
);

create table demographics_ua_iso_all_summary as (
	select
		u.iso as iso,
        sum(u.total) as total,
        sum(u.ct_hispanic_or_latino) as ct_hispanic_or_latino,
        round(sum(u.ct_hispanic_or_latino)::numeric / sum(u.total)::numeric * 100::numeric) as pct_hispanic_or_latino,
        sum(u.ct_not_hispanic_or_latino) as ct_not_hispanic_or_latino,
        round(sum(u.ct_not_hispanic_or_latino)::numeric / sum(u.total)::numeric * 100::numeric) as pct_not_hispanic_or_latino,
        sum(u.ct_wt) as ct_wt,
        round(sum(u.ct_wt)::numeric / sum(u.total)::numeric * 100::numeric) as pct_wt,
        sum(u.ct_blkafam) as ct_blkafam,
        round(sum(u.ct_blkafam)::numeric / sum(u.total)::numeric * 100::numeric) as pct_blkafam,
        sum(u.ct_natcon) as ct_natcon,
        round(sum(u.ct_natcon)::numeric / sum(u.total)::numeric * 100::numeric) as pct_natcon,
        sum(u.ct_asian) as ct_asian,
        round(sum(u.ct_asian)::numeric / sum(u.total)::numeric * 100::numeric) as pct_asian,
        sum(u.ct_natisl) as ct_natisl,
        round(sum(u.ct_natisl)::numeric / sum(u.total)::numeric * 100::numeric) as pct_natisl,
        sum(u.ct_othr) as ct_othr,
        round(sum(u.ct_othr)::numeric / sum(u.total)::numeric * 100::numeric) as pct_othr,
        sum(u.one_race) as ct_one_race,
        round(sum(u.one_race)::numeric / sum(u.total)::numeric * 100::numeric) as pct_one_race,
        sum(u.two_or_more_races) as ct_two_or_more_races,
        round(sum(u.two_or_more_races)::numeric / sum(u.total)::numeric * 100::numeric) as pct_two_or_more_races,
        sum(u.two_races) as ct_two_races,
        round(sum(u.two_races)::numeric / sum(u.total)::numeric * 100::numeric) as pct_two_races,
        sum(u.three_races) as ct_three_races,
        round(sum(u.three_races)::numeric / sum(u.total)::numeric * 100::numeric) as pct_three_races,
        sum(u.four_races) as ct_four_races,
        round(sum(u.four_races)::numeric / sum(u.total)::numeric * 100::numeric) as pct_four_races,
        sum(u.five_races) as ct_five_races,
        round(sum(u.five_races)::numeric / sum(u.total)::numeric * 100::numeric) as pct_five_races,
        sum(u.six_races) as ct_six_races,
        round(sum(u.six_races)::numeric / sum(u.total)::numeric * 100::numeric) as pct_six_races
	from
		demographics_ua_iso_all u
	group by
		u.iso
);

create table demographics_ua_cities_v_ua_totals as (
	select
		u.ua,
		u.iso,
		u.pct_hispanic_or_latino - s.pct_hispanic_or_latino as d_pct_hispanic_or_latino,
		u.pct_not_hispanic_or_latino - s.pct_not_hispanic_or_latino as d_pct_not_hispanic_or_latino,
		u.pct_wt - s.pct_wt as d_pct_wt,
		u.pct_blkafam - s.pct_blkafam as d_pct_blkafam,
		u.pct_natcon - s.pct_natcon as d_pct_natcon,
		u.pct_asian - s.pct_asian as d_pct_asian,
		u.pct_natisl - s.pct_natisl as d_pct_natisl,
		u.pct_othr - s.pct_othr as d_pct_othr
	from
		demographics_ua_iso_all u,
		demographics_ua_iso_all_summary s
	where
		s.iso = u.iso
);

create table demographics_uas_pct as (
	select
		sum(d.total) as total,
		sum(d.ct_hispanic_or_latino) as ct_hispanic_or_latino,
		round(sum(d.ct_hispanic_or_latino)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_hispanic_or_latino,
		sum(d.ct_not_hispanic_or_latino) as ct_not_hispanic_or_latino,
		round(sum(d.ct_not_hispanic_or_latino)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_not_hispanic_or_latino,
		sum(d.ct_wt) as ct_wt,
		round(sum(d.ct_wt)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_wt,
		sum(d.ct_blkafam) as ct_blkafam,
		round(sum(d.ct_blkafam)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_blkafam,
		sum(d.ct_natcon) as ct_natcon,
		round(sum(d.ct_natcon)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_natcon,
		sum(d.ct_asian) as ct_asian,
		round(sum(d.ct_asian)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_asian,
		sum(d.ct_natisl) as ct_natisl,
		round(sum(d.ct_natisl)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_natisl,
		sum(d.ct_othr) as ct_othr,
		round(sum(d.ct_othr)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_othr,
		sum(d.one_race) as ct_one_race,
		round(sum(d.one_race)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_one_race,
		sum(d.two_or_more_races) as ct_two_or_more_races,
		round(sum(d.two_or_more_races)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_two_or_more_races,
		sum(d.two_races) as ct_two_races,
		round(sum(d.two_races)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_two_races,
		sum(d.three_races) as ct_three_races,
		round(sum(d.three_races)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_three_races,
		sum(d.four_races) as ct_four_races,
		round(sum(d.four_races)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_four_races,
		sum(d.five_races) as ct_five_races,
		round(sum(d.five_races)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_five_races,
		sum(d.six_races) as ct_six_races,
		round(sum(d.six_races)::numeric / sum(d.total)::numeric * 100::numeric, 1) as pct_six_races
	from
		demographics_ca_urban_areas d
);

create table demographics_uas_pct_less_ca_urban_areas as (
	select
		a.ua as ua,
		(s.total - a.total) as ct_total,
		round((s.total - a.total)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_total,
		(s.ct_hispanic_or_latino - a.ct_hispanic_or_latino) as ct_hispanic_or_latino,
		round((s.ct_hispanic_or_latino - a.ct_hispanic_or_latino)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_hispanic_or_latino,
		(s.ct_not_hispanic_or_latino - a.ct_not_hispanic_or_latino) as ct_not_hispanic_or_latino,
		round((s.ct_not_hispanic_or_latino - a.ct_not_hispanic_or_latino)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_not_hispanic_or_latino,
		(s.ct_wt - a.ct_wt) as ct_wt,
		round((s.ct_wt - a.ct_wt)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_wt,
		(s.ct_blkafam - a.ct_blkafam) as ct_blkafam,
		round((s.ct_blkafam - a.ct_blkafam)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_blkafam,
		(s.ct_natcon - a.ct_natcon) as ct_natcon,
		round((s.ct_natcon - a.ct_natcon)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_natcon,
		(s.ct_asian - a.ct_asian) as ct_asian,
		round((s.ct_asian - a.ct_asian)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_asian,
		(s.ct_natisl - a.ct_natisl) as ct_natisl,
		round((s.ct_natisl - a.ct_natisl)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_natisl,
		(s.ct_othr - a.ct_othr) as ct_othr,
		round((s.ct_othr - a.ct_othr)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_othr,
		(s.ct_one_race - a.one_race) as ct_one_race,
		round((s.ct_one_race - a.one_race)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_one_race,
		(s.ct_two_or_more_races - a.two_or_more_races) as ct_two_or_more_races,
		round((s.ct_two_or_more_races - a.two_or_more_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_two_or_more_races,
		(s.ct_two_races - a.two_races) as ct_two_races,
		round((s.ct_two_races - a.two_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_two_races,
		(s.ct_three_races - a.three_races) as ct_three_races,
		round((s.ct_three_races - a.three_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_three_races,
		(s.ct_four_races - a.four_races) as ct_four_races,
		round((s.ct_four_races - a.four_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_four_races,
		(s.ct_five_races - a.five_races) as ct_five_races,
		round((s.ct_five_races - a.five_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_five_races,
		(s.ct_six_races - a.six_races) as ct_six_races,
		round((s.ct_six_races - a.six_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_six_races
	from
		demographics_ca_urban_areas a,
		demographics_uas_pct s
);

create table demographics_uas_pct_less_ua_iso_all as (
	select
		a.ua as ua,
		a.iso as iso,
		(s.total - a.total) as ct_total,
		round((s.total - a.total)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_total,
		(s.ct_hispanic_or_latino - a.ct_hispanic_or_latino) as ct_hispanic_or_latino,
		round((s.ct_hispanic_or_latino - a.ct_hispanic_or_latino)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_hispanic_or_latino,
		(s.ct_not_hispanic_or_latino - a.ct_not_hispanic_or_latino) as ct_not_hispanic_or_latino,
		round((s.ct_not_hispanic_or_latino - a.ct_not_hispanic_or_latino)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_not_hispanic_or_latino,
		(s.ct_wt - a.ct_wt) as ct_wt,
		round((s.ct_wt - a.ct_wt)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_wt,
		(s.ct_blkafam - a.ct_blkafam) as ct_blkafam,
		round((s.ct_blkafam - a.ct_blkafam)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_blkafam,
		(s.ct_natcon - a.ct_natcon) as ct_natcon,
		round((s.ct_natcon - a.ct_natcon)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_natcon,
		(s.ct_asian - a.ct_asian) as ct_asian,
		round((s.ct_asian - a.ct_asian)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_asian,
		(s.ct_natisl - a.ct_natisl) as ct_natisl,
		round((s.ct_natisl - a.ct_natisl)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_natisl,
		(s.ct_othr - a.ct_othr) as ct_othr,
		round((s.ct_othr - a.ct_othr)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_othr,
		(s.ct_one_race - a.one_race) as ct_one_race,
		round((s.ct_one_race - a.one_race)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_one_race,
		(s.ct_two_or_more_races - a.two_or_more_races) as ct_two_or_more_races,
		round((s.ct_two_or_more_races - a.two_or_more_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_two_or_more_races,
		(s.ct_two_races - a.two_races) as ct_two_races,
		round((s.ct_two_races - a.two_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_two_races,
		(s.ct_three_races - a.three_races) as ct_three_races,
		round((s.ct_three_races - a.three_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_three_races,
		(s.ct_four_races - a.four_races) as ct_four_races,
		round((s.ct_four_races - a.four_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_four_races,
		(s.ct_five_races - a.five_races) as ct_five_races,
		round((s.ct_five_races - a.five_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_five_races,
		(s.ct_six_races - a.six_races) as ct_six_races,
		round((s.ct_six_races - a.six_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_six_races
	from
		demographics_ua_iso_all a,
		demographics_uas_pct s
	where
		a.ua = s.ua
		and a.iso = s.iso
);

create table demographics_ua_iso_all_summary_less_ua_iso_all as (
	select
		a.ua as ua,
		a.iso as iso,
		(s.total - a.total) as ct_total,
		round((s.total - a.total)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_total,
		(s.ct_hispanic_or_latino - a.ct_hispanic_or_latino) as ct_hispanic_or_latino,
		round((s.ct_hispanic_or_latino - a.ct_hispanic_or_latino)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_hispanic_or_latino,
		(s.ct_not_hispanic_or_latino - a.ct_not_hispanic_or_latino) as ct_not_hispanic_or_latino,
		round((s.ct_not_hispanic_or_latino - a.ct_not_hispanic_or_latino)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_not_hispanic_or_latino,
		(s.ct_wt - a.ct_wt) as ct_wt,
		round((s.ct_wt - a.ct_wt)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_wt,
		(s.ct_blkafam - a.ct_blkafam) as ct_blkafam,
		round((s.ct_blkafam - a.ct_blkafam)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_blkafam,
		(s.ct_natcon - a.ct_natcon) as ct_natcon,
		round((s.ct_natcon - a.ct_natcon)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_natcon,
		(s.ct_asian - a.ct_asian) as ct_asian,
		round((s.ct_asian - a.ct_asian)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_asian,
		(s.ct_natisl - a.ct_natisl) as ct_natisl,
		round((s.ct_natisl - a.ct_natisl)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_natisl,
		(s.ct_othr - a.ct_othr) as ct_othr,
		round((s.ct_othr - a.ct_othr)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_othr,
		(s.ct_one_race - a.one_race) as ct_one_race,
		round((s.ct_one_race - a.one_race)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_one_race,
		(s.ct_two_or_more_races - a.two_or_more_races) as ct_two_or_more_races,
		round((s.ct_two_or_more_races - a.two_or_more_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_two_or_more_races,
		(s.ct_two_races - a.two_races) as ct_two_races,
		round((s.ct_two_races - a.two_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_two_races,
		(s.ct_three_races - a.three_races) as ct_three_races,
		round((s.ct_three_races - a.three_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_three_races,
		(s.ct_four_races - a.four_races) as ct_four_races,
		round((s.ct_four_races - a.four_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_four_races,
		(s.ct_five_races - a.five_races) as ct_five_races,
		round((s.ct_five_races - a.five_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_five_races,
		(s.ct_six_races - a.six_races) as ct_six_races,
		round((s.ct_six_races - a.six_races)::numeric / (s.total - a.total)::numeric * 100::numeric, 2) as pct_six_races
	from
		demographics_ua_iso_all a,
		demographics_ua_iso_all_summary s
	where
		a.iso = s.iso
);

select
	a.ua as ua,
	ct_total,
	ct_hispanic_or_latino,
	ct_not_hispanic_or_latino,
	ct_wt,
	ct_blkafam,
	ct_natcon,
	ct_asian,
	ct_natisl,
	ct_othr
from
	demographics_uas_pct_less_ca_urban_areas