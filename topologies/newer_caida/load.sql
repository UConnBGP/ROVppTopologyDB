-- Delete all rows in peers, roas, and customer_providers tables
TRUNCATE TABLE peers, roas, customer_providers;

-- Load data into tables
COPY peers FROM '/db/topologies/newer_caida/peers.csv' WITH (FORMAT 'csv');
COPY customer_providers FROM '/db/topologies/newer_caida/customer_providers.csv' WITH (FORMAT 'csv');
-- COPY roas FROM 'topologies/newer_caida/roas.csv' WITH (FORMAT 'csv');
