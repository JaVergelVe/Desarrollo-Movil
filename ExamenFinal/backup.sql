--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    email character varying,
    password character varying,
    name character varying,
    role character varying,
    avatar character varying
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_id_seq OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, email, password, name, role, avatar) FROM stdin;
1	john@mail.com	changeme	Jhon	customer	https://i.imgur.com/LDOO4Qs.jpg
2	maria@mail.com	12345	Maria	customer	https://i.imgur.com/DTfowdu.jpg
3	admin@mail.com	admin123	Admin	admin	https://i.imgur.com/yhW6Yw1.jpg
4	Jaggu@gmail.com	1234567890	Nicolas	customer	https://picsum.photos/800
5	test@test.ru	1234	test1	admin	https://sputnik.kg/img/101808/12/1018081237_1488:0:4629:3455_1920x0_80_0_0_36b9c41458690f8543f8ce86421ba380.jpg
\.


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_id_seq', 5, true);


--
-- Name: login pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

