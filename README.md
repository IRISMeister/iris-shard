# iris-shard

Not documented yet.

Relying on a IRIS 2020.1 jar file for bulk loading.
```
$ curl https://data.cityofnewyork.us/api/views/kxp8-n2sj/rows.csv?accessType=DOWNLOAD -o isc-taxi-demo/2020_Yellow_Taxi_Trip_Data.csv
$ head isc-taxi-demo/2020_Yellow_Taxi_Trip_Data.csv -n 10000001 > isc-taxi-demo/10M.csv

# need to convert date format into which IRIS can understand(I picked ODBC format for max. safety).
# Couldn't use panda.read_csv because input files are kind of dirty. (missing values)
$ python3 conv.py 10M.csv

$ docker-compose exec java bash
bash-4.4# cd src
bash-4.4# ./runCSV.sh yellow.csv.properties
```
