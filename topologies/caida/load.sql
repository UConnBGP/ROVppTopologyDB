-- Delete all rows in peers, roas, and customer_providers tables
TRUNCATE TABLE rovpp_peers, rovpp_roas, rovpp_customer_providers;

-- Load data into tables
COPY rovpp_peers FROM '/db/topologies/caida/peers.csv' WITH (FORMAT 'csv');
COPY rovpp_customer_providers FROM '/db/topologies/caida/customer_providers.csv' WITH (FORMAT 'csv');
-- COPY rovpp_roas FROM 'topologies/caida/roas.csv' WITH (FORMAT 'csv');
