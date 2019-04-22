--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bgp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bgp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE bgp OWNER TO postgres;

\connect bgp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customer_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_providers (
    customer_providers_id integer NOT NULL,
    provider_as bigint,
    customer_as bigint
);


ALTER TABLE public.customer_providers OWNER TO postgres;

--
-- Name: mrt_announcements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mrt_announcements (
    origin bigint,
    as_path bigint[],
    prefix cidr,
    "time" timestamp without time zone
);


ALTER TABLE public.mrt_announcements OWNER TO postgres;

--
-- Name: non_stubs; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.non_stubs (
    non_stub_asn bigint NOT NULL
);


ALTER TABLE public.non_stubs OWNER TO user_name;

--
-- Name: non_stubs_non_stub_asn_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.non_stubs_non_stub_asn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.non_stubs_non_stub_asn_seq OWNER TO user_name;

--
-- Name: non_stubs_non_stub_asn_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.non_stubs_non_stub_asn_seq OWNED BY public.non_stubs.non_stub_asn;


--
-- Name: peers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peers (
    peers_id integer NOT NULL,
    peer_as_1 bigint,
    peer_as_2 bigint
);


ALTER TABLE public.peers OWNER TO postgres;

--
-- Name: roas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roas (
    roas_id integer NOT NULL,
    asn bigint,
    prefix inet,
    max_length integer
);


ALTER TABLE public.roas OWNER TO postgres;

--
-- Name: stubs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stubs (
    stub_asn bigint NOT NULL,
    parent_asn bigint
);


ALTER TABLE public.stubs OWNER TO postgres;

--
-- Name: supernodes; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.supernodes (
    supernode_asn bigint NOT NULL,
    supernode_lowest_asn bigint
);


ALTER TABLE public.supernodes OWNER TO user_name;

--
-- Name: supernodes_supernode_asn_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.supernodes_supernode_asn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supernodes_supernode_asn_seq OWNER TO user_name;

--
-- Name: supernodes_supernode_asn_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.supernodes_supernode_asn_seq OWNED BY public.supernodes.supernode_asn;


--
-- Name: non_stubs non_stub_asn; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.non_stubs ALTER COLUMN non_stub_asn SET DEFAULT nextval('public.non_stubs_non_stub_asn_seq'::regclass);


--
-- Name: supernodes supernode_asn; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.supernodes ALTER COLUMN supernode_asn SET DEFAULT nextval('public.supernodes_supernode_asn_seq'::regclass);


--
-- Data for Name: customer_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_providers VALUES (1, 2, 6);
INSERT INTO public.customer_providers VALUES (2, 2, 7);
INSERT INTO public.customer_providers VALUES (3, 5, 6);
INSERT INTO public.customer_providers VALUES (4, 6, 8);
INSERT INTO public.customer_providers VALUES (5, 6, 9);
INSERT INTO public.customer_providers VALUES (6, 7, 9);
INSERT INTO public.customer_providers VALUES (7, 7, 10);


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
INSERT INTO public.peers VALUES (6, 2, 5);
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


--
-- Data for Name: stubs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: supernodes; Type: TABLE DATA; Schema: public; Owner: user_name
--



--
-- Name: non_stubs_non_stub_asn_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.non_stubs_non_stub_asn_seq', 1, false);


--
-- Name: supernodes_supernode_asn_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.supernodes_supernode_asn_seq', 1, false);


--
-- Name: customer_providers customer_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_providers
    ADD CONSTRAINT customer_providers_pkey PRIMARY KEY (customer_providers_id);


--
-- Name: non_stubs non_stubs_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.non_stubs
    ADD CONSTRAINT non_stubs_pkey PRIMARY KEY (non_stub_asn);


--
-- Name: peers peers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peers
    ADD CONSTRAINT peers_pkey PRIMARY KEY (peers_id);


--
-- Name: roas roas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roas
    ADD CONSTRAINT roas_pkey PRIMARY KEY (roas_id);


--
-- Name: stubs stubs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stubs
    ADD CONSTRAINT stubs_pkey PRIMARY KEY (stub_asn);


--
-- Name: supernodes supernodes_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.supernodes
    ADD CONSTRAINT supernodes_pkey PRIMARY KEY (supernode_asn);


--
-- Name: DATABASE bgp; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE bgp TO user_name;


--
-- Name: TABLE customer_providers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customer_providers TO user_name;


--
-- Name: TABLE peers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.peers TO user_name;


--
-- Name: TABLE roas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.roas TO user_name;


--
-- Name: TABLE stubs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.stubs TO user_name;


--
-- PostgreSQL database dump complete
--

