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

ALTER TABLE ONLY public.wedding DROP CONSTRAINT wedding_user_id_fkey;
ALTER TABLE ONLY public.vacation DROP CONSTRAINT vacation_user_id_fkey;
ALTER TABLE ONLY public.festivals DROP CONSTRAINT festivals_user_id_fkey;
ALTER TABLE ONLY public.demise DROP CONSTRAINT demise_user_id_fkey;
ALTER TABLE ONLY public.birthdays DROP CONSTRAINT birthdays_user_id_fkey;
ALTER TABLE ONLY public.wedding DROP CONSTRAINT wedding_pkey;
ALTER TABLE ONLY public.wedding DROP CONSTRAINT wedding_mrs_email_key;
ALTER TABLE ONLY public.wedding DROP CONSTRAINT "wedding_mrs_Phone_number_key";
ALTER TABLE ONLY public.wedding DROP CONSTRAINT wedding_mr_email_key;
ALTER TABLE ONLY public.wedding DROP CONSTRAINT "wedding_mr_Phone_number_key";
ALTER TABLE ONLY public.vacation DROP CONSTRAINT vacation_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
ALTER TABLE ONLY public.festivals DROP CONSTRAINT festivals_pkey;
ALTER TABLE ONLY public.demise DROP CONSTRAINT demise_pkey;
ALTER TABLE ONLY public.birthdays DROP CONSTRAINT birthdays_pkey;
ALTER TABLE ONLY public.birthdays DROP CONSTRAINT birthdays_email_key;
ALTER TABLE public.wedding ALTER COLUMN wedding_id DROP DEFAULT;
ALTER TABLE public.vacation ALTER COLUMN vac_id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.festivals ALTER COLUMN festive_id DROP DEFAULT;
ALTER TABLE public.demise ALTER COLUMN demise_id DROP DEFAULT;
ALTER TABLE public.birthdays ALTER COLUMN birth_id DROP DEFAULT;
DROP SEQUENCE public.wedding_wedding_id_seq;
DROP TABLE public.wedding;
DROP SEQUENCE public.vacation_vac_id_seq;
DROP TABLE public.vacation;
DROP SEQUENCE public.users_user_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.festivals_festive_id_seq;
DROP TABLE public.festivals;
DROP SEQUENCE public.demise_demise_id_seq;
DROP TABLE public.demise;
DROP SEQUENCE public.birthdays_birth_id_seq;
DROP TABLE public.birthdays;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: birthdays; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: birthdays_birth_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.birthdays_birth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: birthdays_birth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.birthdays_birth_id_seq OWNED BY public.birthdays.birth_id;


--
-- Name: demise; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demise (
    demise_id integer NOT NULL,
    name character varying NOT NULL,
    gender character varying,
    relation character varying,
    demise_date timestamp without time zone NOT NULL,
    user_id integer
);


--
-- Name: demise_demise_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demise_demise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demise_demise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demise_demise_id_seq OWNED BY public.demise.demise_id;


--
-- Name: festivals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.festivals (
    festive_id integer NOT NULL,
    festive_name character varying,
    overview character varying,
    festive_date timestamp without time zone,
    user_id integer
);


--
-- Name: festivals_festive_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.festivals_festive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: festivals_festive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.festivals_festive_id_seq OWNED BY public.festivals.festive_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying,
    password character varying,
    name character varying,
    phone_number character varying
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: vacation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vacation (
    vac_id integer NOT NULL,
    location_name character varying,
    vac_start_date timestamp without time zone,
    vac_end_date timestamp without time zone,
    user_id integer
);


--
-- Name: vacation_vac_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vacation_vac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vacation_vac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vacation_vac_id_seq OWNED BY public.vacation.vac_id;


--
-- Name: wedding; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: wedding_wedding_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wedding_wedding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wedding_wedding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wedding_wedding_id_seq OWNED BY public.wedding.wedding_id;


--
-- Name: birthdays birth_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.birthdays ALTER COLUMN birth_id SET DEFAULT nextval('public.birthdays_birth_id_seq'::regclass);


--
-- Name: demise demise_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demise ALTER COLUMN demise_id SET DEFAULT nextval('public.demise_demise_id_seq'::regclass);


--
-- Name: festivals festive_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.festivals ALTER COLUMN festive_id SET DEFAULT nextval('public.festivals_festive_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: vacation vac_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vacation ALTER COLUMN vac_id SET DEFAULT nextval('public.vacation_vac_id_seq'::regclass);


--
-- Name: wedding wedding_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wedding ALTER COLUMN wedding_id SET DEFAULT nextval('public.wedding_wedding_id_seq'::regclass);


--
-- Data for Name: birthdays; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.birthdays (birth_id, email, name, gender, relation, phone_number, birth_date, user_id) FROM stdin;
1	Aradhya@user.com	Aradhya cherukumalli	Female	Daughter	000-000-0000	2013-01-21 00:00:00	\N
2	Arya@user.com	Arya cherukumalli	male	Son	000-000-0000	2013-01-21 00:00:00	\N
3	Anika@user.com	Anika Paruchuri	female	niece	000-000-0000	2013-01-28 00:00:00	\N
4	venky20@gmail.com	venky	male	in-law	8327647623	1957-11-30 00:00:00	\N
5	user50@gmail.com	user50	male	friend	8345745595	1975-01-01 00:00:00	1
6	user51@gmail.com	user51	male	inlaw	8374345555	1971-11-27 00:00:00	1
7	user32	user32	female	daughter	82374823	1991-11-27 00:00:00	1
8	divya16@gmail.com	divya	female	cousin	94854558588	2005-12-12 00:00:00	3
9	jersey@gmail.com	jersey	female	friend	398493555	2021-11-11 00:00:00	3
10	cherukumallitwins@gmail.com	twinArya	male	son	7634639637	2013-01-21 00:00:00	3
11	subbu@gmail.com	subbu	male	friend	9384783455	2001-12-01 00:00:00	3
12	pranav@gmail.com	pranav	male	friend	9475849575	1999-12-02 00:00:00	3
13	pranav1@gmail.com	pranav	male	friend	945748566	2000-02-02 00:00:00	3
14	venky1@gmail.com	venky	male	family	93457593845	2000-12-02 00:00:00	3
15	suresh@gmail.com	suresh	male	spouse	7343234123	1976-12-13 00:00:00	8
19	rajani.velchuri@gmail.com	arya	male	son	7634639637	2013-01-21 00:00:00	8
21	divya1641@gmail.com	divya	female	friend	83453456547	1971-12-24 00:00:00	8
22	neeraja1234@gmail.com	neeraja	female	friend	9348754345	1991-12-27 00:00:00	8
23	venky4567@gmail.com	venky	male	uncle	8901237654	1952-01-05 00:00:00	8
24	prasad234@gmail.com	prasad	male	brother	9834243443	1972-05-02 00:00:00	8
25	jill@gmail.com	jill	female	friend	3829473456	1972-05-02 00:00:00	8
26	anderson@gmail.com	anderson	female	teacher	4732765432	1992-04-02 00:00:00	8
27	kristin@gmail.com	kristin	female	friend	9485554556	1991-12-02 00:00:00	8
29	kristin5@gmail.com	kristin	female	friend	9324783753	1971-12-03 00:00:00	8
30	uaer56@gmail.com	user56	male	frien	04856946	2010-01-01 00:00:00	8
\.


--
-- Data for Name: demise; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.demise (demise_id, name, gender, relation, demise_date, user_id) FROM stdin;
1	Veeraiah Gorijavolu	male	grandfather	2008-06-21 00:00:00	\N
2	Subbu velchuri	male	grandfather	2012-04-23 00:00:00	\N
3	Anitha chennupati	female	friend	2011-03-22 00:00:00	\N
4	Lalitha K	female	cousin	2001-03-25 00:00:00	\N
5	naani	female	grandparent	2000-12-20 00:00:00	3
6	veeraiah	male	grandparent	2008-05-06 00:00:00	3
7	naani	female	grandparent	2020-11-20 00:00:00	8
8	Veeraiah	male	grandparent	2010-10-10 00:00:00	8
9	ammamma	female	grandparent	2016-06-25 00:00:00	8
\.


--
-- Data for Name: festivals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.festivals (festive_id, festive_name, overview, festive_date, user_id) FROM stdin;
1	Diwali	Making sweets, litting Diya and fireworks...super fun filled festival	2021-11-04 00:00:00	\N
2	sankranthi	Making pongal, litting Diya and kite flying, wearing new clothes, doing bogi mantalu and a fun filled festival	2022-01-14 00:00:00	\N
3	christmas	jesus birthday	2021-12-25 00:00:00	3
4	christmas	jesus birthday	2021-12-25 00:00:00	3
5	christmas	jesus birthday	2021-12-25 00:00:00	3
6	christmas	jesus birthday	2021-12-25 00:00:00	3
7	christmas	jesus birthday	2021-12-25 00:00:00	8
8	sankranthi	big festival for telugu people	2022-01-14 00:00:00	8
9	New Year	starting of new year	2022-01-01 00:00:00	8
10	Kids annual day	they both performed very well in dance	2016-06-08 00:00:00	8
11	christmas	big festival for telugu people	2022-01-14 00:00:00	8
12	sankranthi	jesus birthday	2022-01-14 00:00:00	8
13	New Year	starting of new year	2022-01-01 00:00:00	8
14	New Year	starting of new year	2022-01-01 00:00:00	8
15	New Year	starting of new year	2022-01-01 00:00:00	8
16	New Year	starting of new year	2022-01-01 00:00:00	8
17	New Year	starting of new year	2022-01-01 00:00:00	8
18	New Year	starting of new year	2022-01-01 00:00:00	8
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, email, password, name, phone_number) FROM stdin;
1	venky@gmail.com	venky	\N	\N
2	suri@gmail.com	suri	\N	\N
3	suresh@gmail.com	suresh	suresh	834758435
4	vinodh@gmail.com	vinodh	vinodh	2983745385
5	ammu@user.com	ammu	ammu	9347584355
6	arya@gmail.com	arya	arya	73467467632
7				
8	aradhya@gmail.com	sri	Aradhya	7634639637
\.


--
-- Data for Name: vacation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vacation (vac_id, location_name, vac_start_date, vac_end_date, user_id) FROM stdin;
1	Houston,Texas	2021-11-05 00:00:00	2021-11-08 00:00:00	\N
2	Guntur,India	2021-12-18 00:00:00	2022-01-10 00:00:00	\N
3	guntur	2022-01-01 00:00:00	2022-02-02 00:00:00	3
4	guntur	2022-01-01 00:00:00	2022-02-02 00:00:00	8
5	mexico	2021-12-20 00:00:00	2021-12-30 00:00:00	8
6	mexico	2021-12-20 00:00:00	2021-12-30 00:00:00	8
7	florida	2022-01-25 00:00:00	2022-01-30 00:00:00	8
\.


--
-- Data for Name: wedding; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wedding (wedding_id, mr_name, mrs_name, mr_email, mrs_email, "mr_Phone_number", "mrs_Phone_number", wedding_date, relation, user_id) FROM stdin;
1	Suresh cherukumalli	Rajani Velchuri	suresh@user.com	rajani@gmail.com	732-406-2223	732-814-7184	2005-02-17 00:00:00	spouse	\N
2	Ram velchuri	Madhavi battineni	ram@user.com	madhavi@gmail.com	732-406-2224	732-814-7174	2006-08-05 00:00:00	brother	\N
3	prasad paruchuri	Neeraja Meka	ram@gmail.com	neeraja@user.com	763-604-2224	763-814-7174	2002-09-24 00:00:00	friend	\N
4	abc	def	abc@abc.com	def@def.com	725463443	2873466273	2005-12-11 00:00:00	friend	3
5	prasad	neeraja	prasad@gmail.com	neeraja@gmail.com	4083686062	4083696062	2005-11-06 00:00:00	friends	8
6	Bharath	jyothi	cherukumallitwins@gmail.com	jyothi@gmail.com	9438758455	4355435345	2017-01-21 00:00:00	friends	8
7	sridhar	archana	sridhar@gmail.com	archana@gmail.com	4095834322	9343234654	2002-02-02 00:00:00	cousin	8
\.


--
-- Name: birthdays_birth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.birthdays_birth_id_seq', 31, true);


--
-- Name: demise_demise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.demise_demise_id_seq', 9, true);


--
-- Name: festivals_festive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.festivals_festive_id_seq', 18, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 8, true);


--
-- Name: vacation_vac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vacation_vac_id_seq', 7, true);


--
-- Name: wedding_wedding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wedding_wedding_id_seq', 7, true);


--
-- Name: birthdays birthdays_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.birthdays
    ADD CONSTRAINT birthdays_email_key UNIQUE (email);


--
-- Name: birthdays birthdays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.birthdays
    ADD CONSTRAINT birthdays_pkey PRIMARY KEY (birth_id);


--
-- Name: demise demise_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demise
    ADD CONSTRAINT demise_pkey PRIMARY KEY (demise_id);


--
-- Name: festivals festivals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT festivals_pkey PRIMARY KEY (festive_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: vacation vacation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vacation
    ADD CONSTRAINT vacation_pkey PRIMARY KEY (vac_id);


--
-- Name: wedding wedding_mr_Phone_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT "wedding_mr_Phone_number_key" UNIQUE ("mr_Phone_number");


--
-- Name: wedding wedding_mr_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_mr_email_key UNIQUE (mr_email);


--
-- Name: wedding wedding_mrs_Phone_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT "wedding_mrs_Phone_number_key" UNIQUE ("mrs_Phone_number");


--
-- Name: wedding wedding_mrs_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_mrs_email_key UNIQUE (mrs_email);


--
-- Name: wedding wedding_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_pkey PRIMARY KEY (wedding_id);


--
-- Name: birthdays birthdays_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.birthdays
    ADD CONSTRAINT birthdays_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: demise demise_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demise
    ADD CONSTRAINT demise_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: festivals festivals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT festivals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: vacation vacation_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vacation
    ADD CONSTRAINT vacation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: wedding wedding_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wedding
    ADD CONSTRAINT wedding_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

