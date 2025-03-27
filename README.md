This is dbt3 and tpch dockerized to run on mac machines. Trying to compile directly on mac was taking longer than expected so this works by communicating with the postgres running on host machine. 


Based on [this](https://www.postgresql.fastware.com/pzone/2025-01-running-the-tpc-h-benchmark-using-dbt3).

# How to run

1. To build the container you would need to get tpch. See link above. Rename the zip to ```tpch.zip```.
1. Exec into docker, and move to the ```/proj``` folder.
2. ```dbt3-build-dbgen --patch-dir=/proj/dbt3/patches --query-dir=/proj/dbt3/queries pgsql "TPC-H V3.0.1"/```
3. You should have postgres running on your host machine. export the following env vars accordingly. ```export PGHOST=host.docker.internal, export PGUSER="", export PGPASSWORD=""```. 
4. ```psql -c 'CREATE DATABASE dbt3;'```. You should also drop the database after every run. 