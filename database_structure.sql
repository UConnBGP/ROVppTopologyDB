CREATE TABLE mrt_announcements (
  origin BIGINT,
  as_path BIGINT[],
  prefix CIDR,
);
CREATE TABLE roas (
  asn BIGINT,
  prefix INET,
  max_length INTEGER
);
CREATE TABLE peers (
  peer_as_1 BIGINT,
  peer_as_2 BIGINT
);
CREATE TABLE customer_providers (
  provider_as BIGINT,
  customer_as BIGINT
);
CREATE TABLE stubs (
  stub_asn BIGINT PRIMARY KEY,
  parent_asn BIGINT
);
CREATE TABLE extrapolation_results (
  asn BIGINT PRIMARY KEY,
  prefix CIDR,
  origin BIGINT,
  received_from_asn BIGINT
);
