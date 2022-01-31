docker commands:
docker run -it \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v '/Users/rancher/Google Drive/Coding/Github/data-engineering-zoomcamp/my_notes/week_1/my_work/ny_taxi_postgres_data':/var/lib/postgresql/data \
  -p 5432:5432 \
postgres:13 


* docker run -it \ (run in interactive mode)
  -e POSTGRES_USER="root" \ (-e flag for environmental variables)
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v '/Users/rancher/Google Drive/Coding/Github/data-engineering-zoomcamp/my_notes/week_1/my_work/ny_taxi_postgres_data':/var/lib/postgresql/data \ (map host machine folder with postgres data to image folder with postgres data))
  -p 5432:5432 \ (map post of host machine to port of image machine)
 postgres:13 (run postgres img with tag 13)



pgcli commands:
pgcli -h localhost -u root -p 5432

shell commands:
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2021-01.csv