-- Delete all rows in peers, roas, and customer_providers tables
TRUNCATE TABLE peers, roas, customer_providers;

-- Load data into tables
COPY peers FROM '/db/topologies/bigger_test/peers.csv' WITH (FORMAT 'csv');
COPY customer_providers FROM '/db/topologies/bigger_test/customer_providers.csv' WITH (FORMAT 'csv');
-- COPY roas FROM '/db/topologies/bigger_test/roas.csv' WITH (FORMAT 'csv');
