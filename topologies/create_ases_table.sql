-- This was moved outside of the load sql files because this query is common to all topologies
-- Create ases table
CREATE TABLE ases
AS (
    SELECT peer_as_1 AS "asn", 'bgp' "as_type" FROM peers
    UNION
    SELECT peer_as_2 AS "asn", 'bgp' "as_type" FROM peers
    UNION
    SELECT provider_as AS "asn", 'bgp' "as_type" FROM customer_providers
    UNION
    SELECT customer_as AS "asn", 'bgp' "as_type" FROM customer_providers
    ORDER BY "asn"
)
