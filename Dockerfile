FROM postgres:11

LABEL maintainer "Reynaldo Morillo <reynaldo.morillo@uconn.edu>"

WORKDIR /db
RUN mkdir -p postgres_data

COPY . /db

EXPOSE 5432

ENV POSTGRES_DB="bgp"
ENV PGDATA="/var/lib/postgresql/data/pgdata"

COPY database_structure.sql /docker-entrypoint-initdb.d/
COPY create_extrapolator_user.sql /docker-entrypoint-initdb.d/
