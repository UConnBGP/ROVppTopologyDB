CREATE TABLE mrt_announcements (
  origin BIGINT,
  as_path BIGINT[],
  prefix CIDR,
  time timestamp without time zone
);
CREATE TABLE roas (
  roas_id INTEGER PRIMARY KEY,
  asn BIGINT,
  prefix INET,
  max_length INTEGER
);
CREATE TABLE peers (
  peers_id INTEGER PRIMARY KEY,
  peer_as_1 BIGINT,
  peer_as_2 BIGINT
);
CREATE TABLE customer_providers (
  customer_providers_id INTEGER PRIMARY KEY,
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

--
-- Data for Name: customer_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_providers VALUES (1, 2, 6);
INSERT INTO public.customer_providers VALUES (2, 2, 7);
INSERT INTO public.customer_providers VALUES (3, 6, 5);
INSERT INTO public.customer_providers VALUES (4, 6, 8);
INSERT INTO public.customer_providers VALUES (5, 6, 9);
INSERT INTO public.customer_providers VALUES (6, 7, 9);
INSERT INTO public.customer_providers VALUES (7, 7, 10);
INSERT INTO public.customer_providers VALUES (8, 5, 2);


--
-- Data for Name: mrt_announcements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mrt_announcements VALUES (4, '{4}', '4.0.0.0/8', '2018-07-12 00:00:00');


--
-- Data for Name: non_stubs; Type: TABLE DATA; Schema: public; Owner: user_name
--



--
-- Data for Name: peers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.peers VALUES (1, 1, 2);
INSERT INTO public.peers VALUES (2, 1, 3);
INSERT INTO public.peers VALUES (3, 1, 4);
INSERT INTO public.peers VALUES (4, 2, 3);
INSERT INTO public.peers VALUES (5, 2, 4);
INSERT INTO public.peers VALUES (7, 3, 4);
INSERT INTO public.peers VALUES (8, 6, 7);
INSERT INTO public.peers VALUES (9, 8, 9);
INSERT INTO public.peers VALUES (10, 9, 10);


--
-- Data for Name: roas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roas VALUES (1, 1, '1.0.0.0/8', 8);
INSERT INTO public.roas VALUES (2, 2, '2.0.0.0/8', 8);
INSERT INTO public.roas VALUES (3, 3, '3.0.0.0/8', 8);
INSERT INTO public.roas VALUES (4, 4, '4.0.0.0/8', 8);
INSERT INTO public.roas VALUES (5, 5, '5.0.0.0/8', 8);
INSERT INTO public.roas VALUES (7, 7, '2.7.0.0/16', 16);
INSERT INTO public.roas VALUES (8, 8, '5.6.8.0/24', 24);
INSERT INTO public.roas VALUES (9, 9, '2.7.9.0/24', 24);
INSERT INTO public.roas VALUES (10, 10, '2.7.10.0/24', 24);
INSERT INTO public.roas VALUES (6, 6, '5.6.0.0/16', 16);
