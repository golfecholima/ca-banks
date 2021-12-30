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
    * Make second row column header.
    * Delete second row.
    * Normalize column names.
    * Save as: `sql/data/processed/california-demographics.csv`
    * Run summary table, adding a pct column.
    * Save as: `sql/data/processed/california-demographics-summary-table.csv`

* California block-level P2 table - Hispanic/Non-hispanic
  * Visidata `DECENNIALPL2020.P2_data_with_overlays_2021-12-20T211350.csv`
    * Make second row column header.
    * Delete second row.
    * Normalize column names.
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
    * Export as csv w/ WKT column.
    * Visidata move WKT column to end.
    * Save as: `sql/data/processed/california-urban-areas-shapes.csv`


### FDIC
* Limit current locations for all institutions (branches and main offices) to CA, AZ, NV, OR and servtype to 11 and 12 (full service physical offices)
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
        * Run Visidata normalize column names
        * Save as: `sql/data/processed/fdic-deposits-ca-az-nv-or-11-12-geocodio.csv`

### NCUA (National Credit Union Administration)
* Limit NCUA data to credit unions in CA, AZ, NV, OR
  * Visidata - source .html file
    * normalize column names
    * remove empty duplicate cu_number column
    * filter for CA, AZ, NV, OR on physicaladdressstatecode
    * filter for 1 on memberservices
    * Save as: `sql/data/processed/ncua-ca-az-nv-or-member-services.csv`
      * Run through geocodio
      * Run Visidata normalize column names
      * Save as: `sql/data/processed/ncua-ca-az-nv-or-member-services-geocodio.csv`