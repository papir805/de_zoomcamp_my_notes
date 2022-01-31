docker commands:
  docker network create pg-network 

  docker network create pg-network (creates network that docker containers can connect over )




  docker run -it \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v '/Users/rancher/Google Drive/Coding/Github/data-engineering-zoomcamp/my_notes/week_1/my_work/ny_taxi_postgres_data':/var/lib/postgresql/data \
  -p 5432:5432 \
  --network=pg-network \
  --name pg-database \
postgres:13 


  docker run -it \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v '/Users/rancher/Google Drive/Coding/Github/data-engineering-zoomcamp/my_notes/week_1/my_work/ny_taxi_postgres_data':/var/lib/postgresql/data \
  -p 5432:5432 \
  --network=pg-network \ (connect to network that we created)
  --name pg-database \ (name of this docker container on the network, so we can find it)
postgres:13 


docker run -it \
 -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
 -e PGADMIN_DEFAULT_PASSWORD="root" \
 -p 8080:80 \
 --network=pg-network \
 --name pgadmin \
 dpage/pgadmin4