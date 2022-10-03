#!/bin/bash
docker-compose up -d iris1
docker-compose exec -T iris1 bash -c "\$ISC_PACKAGE_INSTALLDIR/dev/Cloud/ICM/waitISC.sh '' 60"

# You can't simply "up" members. They will fail to join a cluster without wait something/somehow. Not clear to me.
docker-compose up -d iris2
docker-compose exec -T iris2 bash -c "\$ISC_PACKAGE_INSTALLDIR/dev/Cloud/ICM/waitISC.sh '' 60"
docker-compose up -d iris3
docker-compose exec -T iris3 bash -c "\$ISC_PACKAGE_INSTALLDIR/dev/Cloud/ICM/waitISC.sh '' 60"
echo "Verifing shards"
docker-compose exec iris1 iris session iris -UIRISCLUSTER "##class(%SYSTEM.Sharding).VerifyShards()"

echo "Loading classes"
docker-compose exec -T iris1 iris session iris -U IRISCLUSTER < cos/nytaxi.cos
docker-compose up -d java

# $ docker-compose exec java bash
# bash-4.4# cd src
# bash-4.4# ./runCSV.sh yellow.csv.properties
