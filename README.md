# Banking analysis

## Todo
* Reformat banks geojson, moving csv lat lon columns to geojson geometry field
* Reproject to NAD83 for buffer calculations.
* 

## Done
* Quick back of the napkin tract level analysis for SD County.
* 

## Notes
* Check for banks that are closed on Google but still in the FDIC database.
* Remove/fix outliers in Delware by ordering longitude column of Googling coords and editing cells
* Check granularity of Geocodio Census data (tract? block? zcta? county?)


## Process
* Download data from FDIC (all banks in California) and Census (tract shapefiles)
* Run FDIC data through Geocodio.
* Import both data sets to QGIS after setting CRS projection to NAD83.
* Attempt 1mi buffer circle around each bank point.
* 