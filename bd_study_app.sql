--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 12.11

-- Started on 2023-05-19 20:21:40

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

DROP DATABASE db_study_app;
--
-- TOC entry 2864 (class 1262 OID 16808)
-- Name: db_study_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_study_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Latin America.1252' LC_CTYPE = 'Spanish_Latin America.1252';


ALTER DATABASE db_study_app OWNER TO postgres;

\connect db_study_app

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 16855)
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    description character varying,
    keywords character varying,
    owner_user_id integer
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16853)
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO postgres;

--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 204
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- TOC entry 209 (class 1259 OID 16892)
-- Name: themes_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes_properties (
    id integer NOT NULL,
    theme_id integer,
    property_name character varying,
    property_value character varying
);


ALTER TABLE public.themes_properties OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16890)
-- Name: themes_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_properties_id_seq OWNER TO postgres;

--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 208
-- Name: themes_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_properties_id_seq OWNED BY public.themes_properties.id;


--
-- TOC entry 207 (class 1259 OID 16871)
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    topic_id integer,
    "order" integer,
    priority integer,
    color character varying,
    owner_user_id integer
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16869)
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO postgres;

--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 206
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- TOC entry 203 (class 1259 OID 16844)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    last_name character varying,
    avatar character varying,
    email character varying,
    password character varying,
    deleted boolean,
    token character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16842)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2710 (class 2604 OID 16858)
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 16895)
-- Name: themes_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties ALTER COLUMN id SET DEFAULT nextval('public.themes_properties_id_seq'::regclass);


--
-- TOC entry 2711 (class 2604 OID 16874)
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- TOC entry 2709 (class 2604 OID 16847)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 16855)
-- Dependencies: 205
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, create_date, name, description, keywords, owner_user_id) FROM stdin;
3	2023-03-03 03:00:00	per	oo	kkkk	1
6	2023-03-03 03:00:00	pepppppppr	ommmmmo	kkkkmmmmm	1
9	2023-03-31 06:45:00	lenguaje	v	analisis	2
8	2023-05-19 00:00:00	lenguaje 5 	septimo semestre 	programacion con JS 	1
10	2023-05-19 00:00:00	mmm	lllll	kkkk	1
2	2023-05-19 00:00:00	Lenguaje	Programacion con JS	JS, HTML, IONIC	1
\.


--
-- TOC entry 2858 (class 0 OID 16892)
-- Dependencies: 209
-- Data for Name: themes_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes_properties (id, theme_id, property_name, property_value) FROM stdin;
4	9	visitado	Milena
5	6	gestion	verificado
\.


--
-- TOC entry 2856 (class 0 OID 16871)
-- Dependencies: 207
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (id, create_date, name, topic_id, "order", priority, color, owner_user_id) FROM stdin;
5	2023-03-03 00:00:00	s	\N	2	2	black	1
8	2023-03-03 00:00:00	s	\N	2	2	black	1
\.


--
-- TOC entry 2852 (class 0 OID 16844)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, last_name, avatar, email, password, deleted, token) FROM stdin;
2	monse	perez	\N	monse@gmail.com	456	t	\N
4	gabi	ortega	gg	gabi@gmail.com	899	t	\N
3	iria	orrego	ff	iria@hotmail.com	1234	t	\N
8	Milena Mireya M	riverooooo	null	milenamireya@gmail.com	12345l	t	\N
9	Mmmm	riverooooo	\N	milenamireya@gmail.com	12345l	t	\N
10	Mmmm	riverooooo	\N	milenamireya@gmail.com	12345l	f	\N
1	mile	rivero	\N	mile@gmail.com	123	t	\N
6	Milena Mireya M	rivero p	null	milenamireya@gmail.com	12345l	t	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTWlsZW5hIE1pcmV5YSBNIiwiYXZhdGFyIjoibnVsbCIsImVtYWlsIjoibWlsZW5hbWlyZXlhQGdtYWlsLmNvbSIsImlhdCI6MTY4NDAyMDgxM30.DhS4EQ6ZX0Okw8HtqUlecvcF306fbBIQzoXv8zzWmaU
7	Milena Mireya Mon	riverooooo2	null	milenamireya@gmail.com.py	12345l	f	\N
14	jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj	kkkkkkkkkkkkkkkkkkkkkkkkk	\N	jjjjjjjjjjjjjjj@gmail.com.py	\N	t	\N
13	jeje	juuju	\N	jjjjjj@hotmail.com	12345l	t	\N
15	prueba	prueba 	\N	ccc@prueba.com	\N	f	\N
12	vic	riverooooo	\N	milenamireya@gmail.com	12345l	t	\N
11	vic	riverooooo	\N	milenamireya@gmail.com	12345l	t	\N
5	Milena Mireya M	rivero p	null	milenamireya@gmail.com	12345l	t	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTWlsZW5hIE1pcmV5YSBNIiwibGFzdF9uYW1lIjoicml2ZXJvIHAiLCJhdmF0YXIiOiJudWxsIiwiZW1haWwiOiJtaWxlbmFtaXJleWFAZ21haWwuY29tIiwiaWF0IjoxNjg0NTQxNDgyfQ.W5SlKf7x-AIKL_b1T3FFTevFqqq4W3Vw04zOz9gOdGE
\.


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 204
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_id_seq', 10, true);


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 208
-- Name: themes_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_properties_id_seq', 5, true);


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 206
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 8, true);


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- TOC entry 2716 (class 2606 OID 16863)
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 16900)
-- Name: themes_properties themes_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 16879)
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 16852)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 16864)
-- Name: themes themes_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);


--
-- TOC entry 2724 (class 2606 OID 16901)
-- Name: themes_properties themes_properties_theme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES public.themes(id);


--
-- TOC entry 2723 (class 2606 OID 16885)
-- Name: topics topics_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);


--
-- TOC entry 2722 (class 2606 OID 16880)
-- Name: topics topics_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);


-- Completed on 2023-05-19 20:21:43

--
-- PostgreSQL database dump complete
--

