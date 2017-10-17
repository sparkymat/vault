--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ajith
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO ajith;

--
-- Name: users; Type: TABLE; Schema: public; Owner: ajith
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    encrypted_password text NOT NULL,
    CONSTRAINT users_email_check CHECK ((email <> ''::text)),
    CONSTRAINT users_encrypted_password_check CHECK ((encrypted_password <> ''::text)),
    CONSTRAINT users_name_check CHECK ((name <> ''::text))
);


ALTER TABLE users OWNER TO ajith;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ajith
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO ajith;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ajith
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ajith
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: users email_uniq; Type: CONSTRAINT; Schema: public; Owner: ajith
--

ALTER TABLE ONLY users
    ADD CONSTRAINT email_uniq UNIQUE (email);


--
-- Name: schema_migrations schema_migrations_version_key; Type: CONSTRAINT; Schema: public; Owner: ajith
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_version_key UNIQUE (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ajith
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ajith
--

COPY schema_migrations (version) FROM stdin;
201708098115541
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ajith
--

COPY users (id, name, email, encrypted_password) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ajith
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

