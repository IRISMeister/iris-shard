#!/bin/bash
docker-compose up -d iris1
#docker-compose exec -T iris1 bash -c "\$ISC_PACKAGE_INSTALLDIR/dev/Cloud/ICM/waitISC.sh '' 60"
sleep 30
docker-compose up -d iris2
docker-compose up -d iris3

docker-compose exec -T iris1 iris session iris -U IRISCLUSTER < cos/nytaxi.cos
docker-compose up -d java
