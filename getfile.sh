#!/bin/bash

curl https://data.cityofnewyork.us/api/views/755u-8jsi/rows.csv?accessType=DOWNLOAD -o isc-taxi-demo/taxi_zones.csv

curl https://data.cityofnewyork.us/api/views/kxp8-n2sj/rows.csv?accessType=DOWNLOAD -o isc-taxi-demo/2020_Yellow_Taxi_Trip_Data.csv

head isc-taxi-demo/2020_Yellow_Taxi_Trip_Data.csv -n 100001 > isc-taxi-demo/100K.csv
head isc-taxi-demo/2020_Yellow_Taxi_Trip_Data.csv -n 10000001 > isc-taxi-demo/10M.csv

# need to convert date format into which IRIS can understand(I picked ODBC format for max. safety).
# can't use panda because input files are kind of dirty. (missing values)
python3 conv.py 100K.csv
python3 conv.py 10M.csv
