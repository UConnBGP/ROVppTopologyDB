#!/bin/sh

echo "Tearing Down DB"
docker-compose down --rmi local --volumes
sudo rm -rf pgdata
docker rmi ireynaldo/forecastdb

echo "Rebuilding Docker Image"
docker build -t="ireynaldo/forecastdb" .
docker-compose up -d

echo "Loading Data"
sleep 3
docker exec -it database_db_1 change_topology newer_caida
