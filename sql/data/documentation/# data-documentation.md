# Data Documentation

## Source

### Census
* California state-level P2 table - Hispanic/Non-hispanic
  * `sql/data/source/state/DECENNIALPL2020.P2_2021-12-28T132330`
  * https://data.census.gov/cedsci/
  * Downloaded: 2021-12-28
* California block-level P2 table - Hispanic/Non-hispanic
  * `sql/data/source/blocks/DECENNIALPL2020.P2_2021-12-28T135050`
  * https://data.census.gov/cedsci/
  * Downloaded: 2021-12-28
* Shapefiles
  * California blocks 2020
    * `sql/data/source/blocks/tl_2021_06_tabblock20`
    * https://www.census.gov/cgi-bin/geo/shapefiles/index.php
    * Downloaded: 2021-12-28
  * US Counties 2021
    * `sql/data/source/tl_2021_us_county`
    * https://www.census.gov/cgi-bin/geo/shapefiles/index.php
    * Downloaded: 2021-12-30
  * US Urban Areas 2010
    * `sql/data/source/tl_2021_us_uac10`
    * https://www.census.gov/cgi-bin/geo/shapefiles/index.php
    * Downloaded: 2021-12-28

### FDIC
* Current locations for all institutions (branches and main offices)
  * `sql/data/source/fdic/Offices2/OFFICES2_ALL.CSV`
  * https://www7.fdic.gov/idasp/advSearch_warp_download_all.asp?intTab=1
  * Downloaded: 2021-12-28
  * Data as of 12/23/2021 (updated weekly)
* Branch office deposits
  * This data is the result of the annual Summary of Deposits survey of branch office deposits as of June 30. Data is available back to 1994. Additional functionality including deposit market share reports and downloads are available at [Summary of Deposits](https://www7.fdic.gov/sod/sodMarketBank.asp?barItem=2).
  * `sql/data/source/fdic/ALL_2021/ALL_2021.csv`
  * Downloaded: 2021-12-28

### NCUA (National Credit Union Administration)
* FOIA response
  * `sql/data/source/ncua/Attached_Reply_21-FOI-00009`
  * Fulfilled: 2021-12-26

## Processed

### Census

* California state-level P2 table - Hispanic/Non-hispanic
  * Visidata `DECENNIALPL2020.P2_data_with_overlays_2021-12-20T211350.csv`
    * Make first row column header.
    * Delete first row.
    * Normalize column names with `[SPACE] normalize-col-names`
    * Save as: `sql/data/processed/california-demographics.csv`
    * Run summary table, adding a pct column.
    * Save as: `sql/data/processed/california-demographics-summary-table.csv`

* California block-level P2 table - Hispanic/Non-hispanic
  * Visidata `DECENNIALPL2020.P2_data_with_overlays_2021-12-20T211350.csv`
    * Make first row column header.
    * Delete first row.
    * Normalize column names with `[SPACE] normalize-col-names`
    * Save as: `sql/data/processed/blocks-demographics.csv`
    * Run summary table, adding a pct column.
    * Save as: `sql/data/processed/blocks-demographics-summary-table.csv`

* Shapefiles - California blocks 2020
  * QGIS `sql/data/source/tl_2021_us_uac10/tl_2021_us_uac10.shp`
    * Export as csv w/ WKT column.
    * Visidata move WKT column to end.
    * Save as: `sql/data/processed/blocks-shapes-wkt.csv`

* Shapefiles - US Urban Areas 2010
  * QGIS `sql/data/source/tl_2021_us_uac10/tl_2021_us_uac10.shp`
    * Filter for only Calif. with `"NAME10"  LIKE '%CA'`
    * Export as csv w/ WKT column.
    * Visidata move WKT column to end.
    * Save as: `sql/data/processed/california-urban-areas-shapes-wkt.csv`

* Shapefiles - US Counties 2021
  * QGIS `sql/data/source/tl_2021_us_uac10/tl_2021_us_uac10.shp`
    * Filter for only Calif. with `"STATEFP" = '06'`
    * Export as csv w/ WKT column.
    * Visidata move WKT column to end.
    * Save as: `sql/data/processed/california-counties-shapes-wkt.csv`

* Lookup table for P2 data
  * Visidata `vd --header=0 sql/data/source/state/DECENNIALPL2020.P2_2021-12-28T132330/DECENNIALPL2020.P2_data_with_overlays_2021-12-28T132323.csv`
    * Name columns with `jgz^` on row 2 then `[SPACE] normalize-col-names`
    * Transpose `T`
    * Delete first two rows `dd`
    * Derive lowercase columns of 2nd and 4rd columns using `l=curcol.casefold()[RETURN]ll=curcol.casefold()[RETURN]`
    * Derive `pct` column with `ll#^value[RETURN]=value/39538223*100[RETURN]l^pct[RETURN]%`
    * Rearrange and name columns `hhhhhh!ll[HOLD SHIFT]hh[RELEASE SHIFT]^id![RETURN]l^name_normalized[RETURN]l^id_orig[RETURN]l^name_orig[RETURN]l^name_lower[RETURN]`
    * Save as: `sql/data/processed/p2-lookup-w-pct.csv`
    * Open `sql/data/processed/p2-lookup-w-pct.csv` in text editor and add column `name_short` after `id`:
      * `total`
      * `hispanic_or_latino`
      * `not_hispanic_or_latino`
      * `one_race`
      * `wt`
      * `blkafam`
      * `natcon`
      * `asian`
      * `natisl`
      * `othr`
      * `two_or_more_races`
      * `two_races`
      * `wt_blkafam`
      * `wt_natcon`
      * `wt_asian`
      * `wt_natisl`
      * `wt_othr`
      * `blkafam_natcon`
      * `blkafam_asian`
      * `blkafam_natisl`
      * `blkafam_othr`
      * `natcon_asian`
      * `natcon_natisl`
      * `natcon_othr`
      * `asian_natisl`
      * `asian_othr`
      * `natisl_othr`
      * `three_races`
      * `wt_blkafam_natcon`
      * `wt_blkafam_asian`
      * `wt_blkafam_natisl`
      * `wt_blkafam_othr`
      * `wt_natcon_asian`
      * `wt_natcon_natisl`
      * `wt_natcon_othr`
      * `wt_asian_natisl`
      * `wt_asian_othr`
      * `wt_natisl_othr`
      * `blkafam_natcon_asian`
      * `blkafam_natcon_natisl`
      * `blkafam_natcon_othr`
      * `blkafam_asian_natisl`
      * `blkafam_asian_othr`
      * `blkafam_natisl_othr`
      * `natcon_asian_natisl`
      * `natcon_asian_othr`
      * `natcon_natisl_othr`
      * `asian_natisl_othr`
      * `four_races`
      * `wt_blkafam_natcon_asian`
      * `wt_blkafam_natcon_natisl`
      * `wt_blkafam_natcon_othr`
      * `wt_blkafam_asian_natisl`
      * `wt_blkafam_asian_othr`
      * `wt_blkafam_natisl_othr`
      * `wt_natcon_asian_natisl`
      * `wt_natcon_asian_othr`
      * `wt_natcon_natisl_othr`
      * `wt_asian_natisl_othr`
      * `blkafam_natcon_asian_natisl`
      * `blkafam_natcon_asian_othr`
      * `blkafam_natcon_natisl_othr`
      * `blkafam_asian_natisl_othr`
      * `natcon_asian_natisl_othr`
      * `five_races`
      * `wt_blkafam_natcon_asian_natisl`
      * `wt_blkafam_natcon_asian_othr`
      * `wt_blkafam_natcon_natisl_othr`
      * `wt_blkafam_asian_natisl_othr`
      * `wt_natcon_asian_natisl_othr`
      * `blkafam_natcon_asian_natisl_othr`
      * `six_races`
      * `wt_blkafam_natcon_asian_natisl_othr`
    * Save
    * View command log `sql/data/processed/p2-lookup-w-pct.vd`

### FDIC
* Limit current locations for all institutions (branches and main offices) to CA, AZ, NV, OR and servtype to 11 and 12 (full service physical offices) and remove commas from numeric columns.
  * Visidata OFFICES_ALL.CSV
    * Normalize column names
    * Filter for CA, AZ, NV, OR on stalp
    * Filter for 11, 12 on servtype
    * Save as: `sql/data/processed/fdic-branches-ca-az-nv-or-11-12.csv`

* Limit branch office deposits to CA, AZ, NV, OR and servtype to 11 and 12 (full service physical offices)
  * Visidata ALL_2021.csv
    * Normalize column names
    * Filter for CA, AZ, NV, OR on stalpbr
    * Filter for 11, 12 on brsertyp
    * Save as: `sql/data/processed/fdic-deposits-ca-az-nv-or-11-12.csv`
        * Run through geocodio
        * Run Visidata `[SPACE] normalize-col-names`
          * Remove commas from numeric columns with `*\,[RETURN]`
          * Remove old column, rename new column to old column name
        * Save as: `sql/data/processed/fdic-deposits-ca-az-nv-or-11-12-geocodio.csv`

### NCUA (National Credit Union Administration)
* Limit NCUA data to credit unions in CA, AZ, NV, OR
  * Visidata - source .html file
    * `[SPACE] normalize-col-names`
    * remove empty duplicate cu_number column
    * filter for CA, AZ, NV, OR on physicaladdressstatecode
    * filter for 1 on memberservices
    * Save as: `sql/data/processed/ncua-ca-az-nv-or-member-services.csv`
      * Run through geocodio
      * Run Visidata `[SPACE] normalize-col-names`
      * Save as: `sql/data/processed/ncua-ca-az-nv-or-member-services-geocodio.csv`