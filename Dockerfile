FROM postgres:11

LABEL maintainer "Reynaldo Morillo <reynaldo.morillo@uconn.edu>"

WORKDIR /db
RUN mkdir -p postgres_data

COPY . /db

EXPOSE 5432

# Set default DB and data location in Postgres
ENV POSTGRES_DB="bgp"
ENV PGDATA="/var/lib/postgresql/data/pgdata"

# Database Initialization scripts
COPY database_structure.sql /docker-entrypoint-initdb.d/
COPY create_extrapolator_user.sql /docker-entrypoint-initdb.d/

# Move change_topology script/command into /usr/local/bin for global access in docker
RUN chmod +x change_topology.sh
RUN mv change_topology.sh change_topology
RUN mv change_topology /usr/local/bin/
