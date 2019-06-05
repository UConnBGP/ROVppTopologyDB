CREATE TABLE rovpp_mrt_announcements (
  origin BIGINT,
  as_path BIGINT[],
  prefix CIDR
);
CREATE TABLE rovpp_roas (
  asn BIGINT,
  prefix INET,
  max_length INTEGER
);
CREATE TABLE rovpp_peers (
  peer_as_1 BIGINT,
  peer_as_2 BIGINT
);
CREATE TABLE rovpp_customer_providers (
  provider_as BIGINT,
  customer_as BIGINT
);
CREATE TABLE rovpp_stubs (
  stub_asn BIGINT PRIMARY KEY,
  parent_asn BIGINT
);
CREATE TABLE rovpp_extrapolation_results (
  asn BIGINT PRIMARY KEY,
  prefix CIDR,
  origin BIGINT,
  received_from_asn BIGINT
);
CREATE TABLE rovpp_rov_ases (
  asn BIGINT
);
