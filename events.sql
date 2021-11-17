--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: birthdays; Type: TABLE; Schema: public; Owner: rajani
--

CREATE TABLE public.birthdays (
    birth_id integer NOT NULL,
    email character varying,
    name character varying NOT NULL,
    gender character varying,
    relation character varying,
    phone_number character varying,
    birth_date timestamp without time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.birthdays OWNER TO rajani;

--
-- Name: birthdays_birth_id_seq; Type: SEQUENCE; Schema: public; Owner: rajani
--

CREATE SEQUENCE public.birthdays_birth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.birthdays_birth_id_seq OWNER TO rajani;

--
-- Name: birthdays_birth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rajani
--

ALTER SEQUENCE public.birthdays_birth_id_seq OWNED BY public.birthdays.birth_id;


--
-- Name: demise; Type: TABLE; Schema: public; Owner: rajani
--

CREATE TABLE public.demise (
    demise_id integer NOT NULL,
    name character varying NOT NULL,
    gender character varying,
    relation character varying,
    demise_date timestamp without time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.demise OWNER TO rajani;

--
-- Name: demise_demise_id_seq; Type: SEQUENCE; Schema: public; Owner: rajani
--

CREATE SEQUENCE public.demise_demise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demise_demise_id_seq OWNER TO rajani;

--
-- Name: demise_demise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rajani
--

ALTER SEQUENCE public.demise_demise_id_seq OWNED BY public.demise.demise_id;


--
-- Name: festivals; Type: TABLE; Schema: public; Owner: rajani
--

CREATE TABLE public.festivals (
    festive_id integer NOT NULL,
    festive_name character varying,
    overview character varying,
    festive_date timestamp without time zone,
    user_id integer
);


ALTER TABLE public.festivals OWNER TO rajani;

--
-- Name: festivals_festive_id_seq; Type: SEQUENCE; Schema: public; Owner: rajani
--

CREATE SEQUENCE public.festivals_festive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.festivals_festive_id_seq OWNER TO rajani;

--
-- Name: festivals_festive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rajani
--

ALTER SEQUENCE public.festivals_festive_id_seq OWNED BY public.festivals.festive_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rajani
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO rajani;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rajani
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO rajani;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rajani
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: vacation; Type: TABLE; Schema: public; Owner: rajani
--

CREATE TABLE public.vacation (
    vac_id integer NOT NULL,
    location_name character varying,
    vac_start_date timestamp without time zone,
    vac_end_date timestamp without time zone,
    user_id integer
);


ALTER TABLE public.vacation OWNER TO rajani;

--
-- Name: vacation_vac_id_seq; Type: SEQUENCE; Schema: public; Owner: rajani
--

CREATE SEQUENCE public.vacation_vac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vacation_vac_id_seq OWNER TO rajani;

--
-- Name: vacation_vac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rajani
--

ALTER SEQUENCE public.vacation_vac_id_seq OWNED BY public.vacation.vac_id;


--
-- Name: wedding; Type: TABLE; Schema: public; Owner: rajani
--

CREATE TABLE public.wedding (
    wedding_id integer NOT NULL,
    mr_name character varying NOT NULL,
    mrs_name character varying NOT NULL,
    mr_email character varying NOT NULL,
    mrs_email character varying NOT NULL,
    "mr_Phone_number" character varying NOT NULL,
    "mrs_Phone_number" character varying NOT NULL,
    wedding_date timestamp without time zone NOT NULL,
    relation character varying,
    user_id integer
);


ALTER TABLE public.wedding OWNER TO rajani;

--
-- Name: wedding_wedding_id_seq; Type: SEQUENCE; Schema: public; Owner: rajani
--

CREATE SEQUENCE public.wedding_wedding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wedding_wedding_id_seq OWNER TO rajani;

--
-- Name: wedding_wedding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rajani
--

ALTER SEQUENCE public.wedding_wedding_id_seq OWNED BY public.wedding.wedding_id;


--
-- Name: birthdays birth_id; Type: DEFAULT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.birthdays ALTER COLUMN birth_id SET DEFAULT nextval('public.birthdays_birth_id_seq'::regclass);


--
-- Name: demise demise_id; Type: DEFAULT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.demise ALTER COLUMN demise_id SET DEFAULT nextval('public.demise_demise_id_seq'::regclass);


--
-- Name: festivals festive_id; Type: DEFAULT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.festivals ALTER COLUMN festive_id SET DEFAULT nextval('public.festivals_festive_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: vacation vac_id; Type: DEFAULT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.vacation ALTER COLUMN vac_id SET DEFAULT nextval('public.vacation_vac_id_seq'::regclass);


--
-- Name: wedding wedding_id; Type: DEFAULT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.wedding ALTER COLUMN wedding_id SET DEFAULT nextval('public.wedding_wedding_id_seq'::regclass);


--
-- Data for Name: birthdays; Type: TABLE DATA; Schema: public; Owner: rajani
--

COPY public.birthdays (birth_id, email, name, gender, relation, phone_number, birth_date, user_id) FROM stdin;
1	Aradhya@user.com	Aradhya cherukumalli	Female	Daughter	000-000-0000	2013-01-21 00:00:00	\N
2	Arya@user.com	Arya cherukumalli	male	Son	000-000-0000	2013-01-21 00:00:00	\N
3	Anika@user.com	Anika Paruchuri	female	niece	000-000-0000	2013-01-28 00:00:00	\N
4	Sameera2@user.com	sameera	female	friend	72644862451	2000-11-29 00:00:00	\N
6	Sameera@user.com	sam	female	friend	7324063344	2000-11-29 00:00:00	\N
7	abc@abc.com	abc	abc	abc	8234723849	1999-12-12 00:00:00	4
8	aradhya@gmail.com	Aradhya	female	daughter	7328147184	2013-01-21 00:00:00	4
10	Sameerarat@user.com	sameera	female	friend	726448624366	1999-01-02 00:00:00	4
11	ammamma@test.com	subbu	male	grandparent	763262782342	1957-12-31 00:00:00	4
12	monday@gmaill.com	monday	male	friend	32846374664	1995-02-02 00:00:00	4
14	tuesday@gmail.com	tuesday	female	son	83743536545	1967-03-25 00:00:00	4
\.


--
-- Data for Name: demise; Type: TABLE DATA; Schema: public; Owner: rajani
--

COPY public.demise (demise_id, name, gender, relation, demise_date, user_id) FROM stdin;
1	Veeraiah Gorijavolu	male	grandfather	2008-06-21 00:00:00	\N
2	Subbu velchuri	male	grandfather	2012-04-23 00:00:00	\N
3	Anitha chennupati	female	friend	2011-03-22 00:00:00	\N
4	Lalitha K	female	cousin	2001-03-25 00:00:00	\N
5	naayanamma	female	grandmother	2021-11-20 00:00:00	\N
6	naayanamma	female	grandmother	2021-11-20 00:00:00	4
7	subbu	male	grandparent	2008-03-02 00:00:00	4
8	veeraiah	male	grandparent	2010-12-10 00:00:00	4
\.


--
-- Data for Name: festivals; Type: TABLE DATA; Schema: public; Owner: rajani
--

COPY public.festivals (festive_id, festive_name, overview, festive_date, user_id) FROM stdin;
1	Diwali	Making sweets, litting Diya and fireworks...super fun filled festival	2021-11-04 00:00:00	\N
2	sankranthi	Making pongal, litting Diya and kite flying, wearing new clothes, doing bogi mantalu and a fun filled festival	2022-01-14 00:00:00	\N
3	christmas	jesus birthday...	2021-12-25 00:00:00	\N
4	Kaarthika Pournami	auspicious day of lord Shiva	2021-11-21 00:00:00	4
5	ugadi	telugu new year	2022-04-15 00:00:00	4
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rajani
--

COPY public.users (user_id, email, password) FROM stdin;
1	rajani@test.com	test
3	rajani1@test.com	test
4	venky@gmail.com	venky
\.


--
-- Data for Name: vacation; Type: TABLE DATA; Schema: public; Owner: rajani
--

COPY public.vacation (vac_id, location_name, vac_start_date, vac_end_date, user_id) FROM stdin;
1	Houston,Texas	2021-11-05 00:00:00	2021-11-08 00:00:00	\N
2	Guntur,India	2021-12-18 00:00:00	2022-01-10 00:00:00	\N
3	hyderabad	2021-12-05 00:00:00	2022-08-08 00:00:00	\N
4	hyderabad	2021-12-05 00:00:00	2022-01-01 00:00:00	4
5	ponnur	2022-03-05 00:00:00	2022-01-01 00:00:00	4
6	guntur	2021-12-17 00:00:00	2021-11-05 00:00:00	4
\.


--
-- Data for Name: wedding; Type: TABLE DATA; Schema: public; Owner: rajani
--

COPY public.wedding (wedding_id, mr_name, mrs_name, mr_email, mrs_email, "mr_Phone_number", "mrs_Phone_number", wedding_date, relation, user_id) FROM stdin;
1	Suresh cherukumalli	Rajani Velchuri	suresh@user.com	rajani@gmail.com	732-406-2223	732-814-7184	2005-02-17 00:00:00	spouse	\N
2	Ram velchuri	Madhavi battineni	ram@user.com	madhavi@gmail.com	732-406-2224	732-814-7174	2006-08-05 00:00:00	brother	\N
3	prasad paruchuri	Neeraja Meka	ram@gmail.com	neeraja@user.com	763-604-2224	763-814-7174	2002-09-24 00:00:00	friend	\N
4	venky	lakshmi	venky@user.com	lakshmi@user.com	8019935007	8019935006	1973-11-28 00:00:00	parents	\N
5	Suri	rajani	suri@gmail.com	cherukumallitwins@gmail.com	92374835729	92478234724	2005-02-17 00:00:00	self	4
6	dasu	latha	dasu@user.com	latha@test.com	8394857348	5964859655	2005-02-05 00:00:00	friend	4
\.


--
-- Name: birthdays_birth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rajani
--

SELECT pg_catalog.setval('public.birthdays_birth_id_seq', 14, true);


--
-- Name: demise_demise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rajani
--

SELECT pg_catalog.setval('public.demise_demise_id_seq', 8, true);


--
-- Name: festivals_festive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rajani
--

SELECT pg_catalog.setval('public.festivals_festive_id_seq', 5, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rajani
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: vacation_vac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rajani
--

SELECT pg_catalog.setval('public.vacation_vac_id_seq', 6, true);


--
-- Name: wedding_wedding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rajani
--

SELECT pg_catalog.setval('public.wedding_wedding_id_seq', 6, true);


--
-- Name: birthdays birthdays_email_key; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.birthdays
    ADD CONSTRAINT birthdays_email_key UNIQUE (email);


--
-- Name: birthdays birthdays_pkey; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.birthdays
    ADD CONSTRAINT birthdays_pkey PRIMARY KEY (birth_id);


--
-- Name: demise demise_pkey; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.demise
    ADD CONSTRAINT demise_pkey PRIMARY KEY (demise_id);


--
-- Name: festivals festivals_pkey; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT festivals_pkey PRIMARY KEY (festive_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: vacation vacation_pkey; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.vacation
    ADD CONSTRAINT vacation_pkey PRIMARY KEY (vac_id);


--
-- Name: wedding wedding_mr_Phone_number_key; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT "wedding_mr_Phone_number_key" UNIQUE ("mr_Phone_number");


--
-- Name: wedding wedding_mr_email_key; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_mr_email_key UNIQUE (mr_email);


--
-- Name: wedding wedding_mrs_Phone_number_key; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT "wedding_mrs_Phone_number_key" UNIQUE ("mrs_Phone_number");


--
-- Name: wedding wedding_mrs_email_key; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_mrs_email_key UNIQUE (mrs_email);


--
-- Name: wedding wedding_pkey; Type: CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_pkey PRIMARY KEY (wedding_id);


--
-- Name: birthdays birthdays_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.birthdays
    ADD CONSTRAINT birthdays_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: demise demise_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.demise
    ADD CONSTRAINT demise_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: festivals festivals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT festivals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: vacation vacation_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.vacation
    ADD CONSTRAINT vacation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: wedding wedding_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rajani
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

