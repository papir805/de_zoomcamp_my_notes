(YAML for docker compose:
(When creating multiple services that you compose together, they're automatically on the same network and
you don't need to set up the docker network environmental variables as you would if you were running
two separate containers)

services:
  pgdatabase:
    #
    image: postgres:13
    environment: 
      - POSTGRES_USER=root  #no quotes are needed here
      - POSTGRES_PASSWORD=root #no quotes are needed here
      - POSTGRES_DB=ny_taxi #no quotes are needed here
    volumes:
      - "/Users/rancher/Google Drive/Coding/Github/data-engineering-zoomcamp/my_notes/week_1/my_work/ny_taxi_postgres_data:/var/lib/postgresql/data:rw"  # quotes ARE needed here
    ports:
      - "5432:5432" # quotes ARE needed here
  pgadmin:
    #
    image: dpage/pgadmin4
    volumes:
      - ./data_pgadmin:/var/lib/pgadmin
    environment:
      - PGADMIN_DEFAULT_EMAIL=admin@admin.com #no quotes are needed here
      - PGADMIN_DEFAULT_PASSWORD=root #no quotes are needed here
    ports:
      - "8080:80" # quotes ARE needed here



docker commands:

docker-compose up -d

docker-compose up -d (run in detached mode, so we get our terminal access back)

docker-compose down

docker-compose down (correct way to shut down a compose)