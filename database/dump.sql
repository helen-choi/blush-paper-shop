--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
1	21	1	2999
2	22	1	2999
3	23	1	2999
4	24	1	2999
5	25	1	2999
6	26	1	2999
7	27	1	2999
8	28	1	2999
9	29	1	2999
10	30	1	2999
11	31	1	2999
12	32	1	2999
13	33	1	2999
14	34	1	2999
15	35	1	2999
16	36	1	2999
17	37	1	2999
18	38	1	2999
19	39	1	2999
20	40	1	2999
21	41	1	2999
22	42	1	2999
23	43	1	2999
24	44	1	2999
25	45	1	2999
26	46	1	2999
27	47	1	2999
28	49	1	2999
29	50	1	2999
30	51	1	2999
31	52	1	2999
32	53	1	2999
33	54	1	2999
34	55	1	2999
35	56	1	2999
36	57	1	2999
37	58	1	2999
38	59	1	2999
39	60	1	2999
40	61	1	2999
41	62	1	2999
42	63	1	2999
43	64	1	2999
44	65	1	2999
45	68	1	2999
46	69	1	2999
47	70	1	2999
48	71	1	2999
49	72	1	2999
50	73	1	2999
51	74	1	2999
52	75	1	2999
53	76	1	2999
54	77	1	2999
55	78	1	2999
56	79	1	2999
57	80	1	2999
58	81	1	2999
59	82	1	2999
60	83	1	2999
61	84	1	2999
62	85	1	2999
63	86	1	2999
64	87	1	2999
65	88	1	2999
66	89	1	2999
67	90	1	2999
68	91	1	2999
69	92	1	2999
70	94	1	2999
71	95	1	2999
72	96	1	2999
73	97	1	2999
74	98	1	2999
75	99	1	2999
76	100	1	2999
77	101	1	2999
78	102	1	2999
79	103	1	2999
80	104	1	2999
81	105	1	2999
82	106	1	2999
83	107	1	2999
84	108	1	2999
85	109	1	2999
86	110	1	2999
87	111	1	2999
88	112	1	2999
89	113	1	2999
90	114	1	2999
91	115	1	2999
92	116	1	2999
93	117	1	2999
94	118	1	2999
95	119	1	2999
96	120	1	2999
97	121	1	2999
98	122	1	2999
99	123	1	2999
100	124	1	2999
101	125	1	2999
102	126	1	2999
103	127	1	2999
104	128	1	2999
105	129	1	2999
106	130	1	2999
107	131	1	2999
108	132	1	2999
109	133	1	2999
110	134	1	2999
111	134	1	2999
112	135	1	2999
113	135	1	2999
114	136	1	2999
115	136	1	2999
116	137	1	2999
117	137	1	2999
118	138	1	2999
119	138	1	2999
120	139	1	2999
121	139	1	2999
122	140	1	2999
123	140	1	2999
124	141	1	2999
125	141	1	2999
126	142	1	2999
127	142	1	2999
128	143	1	2999
129	143	1	2999
130	144	1	2999
131	144	1	2999
132	145	1	2999
133	145	1	2999
134	146	1	2999
135	146	1	2999
136	147	1	2999
137	147	1	2999
138	148	1	2999
139	148	1	2999
140	149	1	2999
141	149	1	2999
142	150	1	2999
143	150	1	2999
144	151	1	2999
145	151	1	2999
146	152	1	2999
147	152	1	2999
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
2	2020-04-25 21:55:29.347413+00
3	2020-04-25 22:15:19.219136+00
4	2020-04-25 22:15:32.739188+00
5	2020-04-25 22:18:34.745578+00
6	2020-04-25 22:19:13.770963+00
7	2020-04-25 22:19:35.64358+00
8	2020-04-25 22:22:59.445255+00
9	2020-04-26 04:01:45.611488+00
10	2020-04-26 04:04:25.804921+00
11	2020-04-26 04:05:19.699454+00
12	2020-04-26 04:06:03.108425+00
13	2020-04-26 04:06:11.771139+00
14	2020-04-26 04:07:37.326067+00
15	2020-04-26 04:08:48.872318+00
16	2020-04-26 04:20:48.271142+00
17	2020-04-26 04:21:51.703527+00
18	2020-04-26 04:33:41.146262+00
19	2020-04-26 04:34:19.642494+00
20	2020-04-26 04:44:45.666255+00
21	2020-04-26 04:45:58.403113+00
22	2020-04-26 04:47:46.636259+00
23	2020-04-26 04:48:02.22859+00
24	2020-04-26 04:48:25.618401+00
25	2020-04-26 04:52:10.881082+00
26	2020-04-26 04:52:32.353197+00
27	2020-04-26 04:53:41.611056+00
28	2020-04-26 04:56:01.392717+00
29	2020-04-26 04:56:14.544185+00
30	2020-04-26 04:56:17.711596+00
31	2020-04-26 04:56:42.692128+00
32	2020-04-26 04:57:16.95124+00
33	2020-04-26 04:57:26.970873+00
34	2020-04-26 05:00:28.434638+00
35	2020-04-26 05:02:16.14619+00
36	2020-04-26 05:02:40.340352+00
37	2020-04-26 05:03:42.528546+00
38	2020-04-26 05:06:09.15237+00
39	2020-04-26 05:07:02.159438+00
40	2020-04-26 05:15:58.132582+00
41	2020-04-26 05:23:49.45822+00
42	2020-04-26 05:29:40.777642+00
43	2020-04-26 05:34:42.138201+00
44	2020-04-26 05:38:41.980933+00
45	2020-04-26 05:40:03.813612+00
46	2020-04-26 05:40:06.083385+00
47	2020-04-26 05:42:31.778739+00
48	2020-04-26 05:57:41.497633+00
49	2020-04-26 05:59:19.945059+00
50	2020-04-26 06:15:41.187261+00
51	2020-04-26 06:15:45.956119+00
52	2020-04-26 06:16:19.141346+00
53	2020-04-26 06:16:42.59497+00
54	2020-04-26 06:16:51.624264+00
55	2020-04-26 06:38:18.689008+00
56	2020-04-26 06:38:47.083322+00
57	2020-04-26 06:39:47.378289+00
58	2020-04-26 06:40:07.946128+00
59	2020-04-26 06:40:33.253372+00
60	2020-04-26 06:41:30.887145+00
61	2020-04-26 06:41:56.774484+00
62	2020-04-26 06:43:03.20911+00
63	2020-04-26 06:47:45.310491+00
64	2020-04-26 06:48:14.215861+00
65	2020-04-26 06:48:56.089325+00
66	2020-04-26 06:50:37.460247+00
67	2020-04-26 06:50:54.883111+00
68	2020-04-26 06:52:20.977312+00
69	2020-04-26 06:56:17.687033+00
70	2020-04-26 06:58:44.916922+00
71	2020-04-26 07:01:31.491521+00
72	2020-04-26 07:04:32.107701+00
73	2020-04-26 07:04:59.615313+00
74	2020-04-26 07:05:38.436102+00
75	2020-04-26 07:06:16.310451+00
76	2020-04-26 07:06:55.814338+00
77	2020-04-26 07:07:35.089703+00
78	2020-04-26 07:08:26.377235+00
79	2020-04-26 07:08:56.07661+00
80	2020-04-26 07:09:06.0412+00
81	2020-04-26 07:09:23.08662+00
82	2020-04-26 07:10:09.325098+00
83	2020-04-26 07:10:20.799529+00
84	2020-04-26 07:10:50.176216+00
85	2020-04-26 07:11:13.761136+00
86	2020-04-26 07:11:28.373587+00
87	2020-04-26 07:12:48.274447+00
88	2020-04-26 07:12:59.144862+00
89	2020-04-26 07:17:07.912041+00
90	2020-04-26 07:17:36.152068+00
91	2020-04-26 07:18:21.110951+00
92	2020-04-26 07:20:46.440655+00
93	2020-04-26 07:21:07.540996+00
94	2020-04-26 07:21:54.686377+00
95	2020-04-26 07:22:27.946076+00
96	2020-04-26 07:22:51.579278+00
97	2020-04-26 07:23:29.260368+00
98	2020-04-26 07:23:47.686543+00
99	2020-04-26 07:24:05.528086+00
100	2020-04-26 07:24:15.6876+00
101	2020-04-26 07:24:28.052848+00
102	2020-04-26 07:25:03.925386+00
103	2020-04-26 07:25:14.649294+00
104	2020-04-26 07:25:48.326558+00
105	2020-04-26 07:26:18.03629+00
106	2020-04-26 07:26:33.315632+00
107	2020-04-26 07:28:10.803948+00
108	2020-04-26 07:29:08.449475+00
109	2020-04-26 07:29:41.598502+00
110	2020-04-26 07:29:55.000459+00
111	2020-04-26 07:45:07.343034+00
112	2020-04-26 07:45:39.060705+00
113	2020-04-26 17:00:49.193177+00
114	2020-04-26 17:01:32.813549+00
115	2020-04-26 17:09:48.980032+00
116	2020-04-26 17:10:18.936971+00
117	2020-04-26 17:17:30.716309+00
118	2020-04-26 17:17:44.678491+00
119	2020-04-26 17:18:07.555755+00
120	2020-04-26 17:18:40.812323+00
121	2020-04-26 17:18:56.375467+00
122	2020-04-26 17:24:21.318707+00
123	2020-04-26 17:24:39.316681+00
124	2020-04-26 17:25:00.730428+00
125	2020-04-26 17:25:26.43872+00
126	2020-04-26 17:25:39.382975+00
127	2020-04-26 17:57:18.226903+00
128	2020-04-26 17:58:17.085045+00
129	2020-04-26 17:59:03.638016+00
130	2020-04-26 17:59:29.102755+00
131	2020-04-26 17:59:37.361931+00
132	2020-04-26 18:00:28.786934+00
133	2020-04-26 18:01:48.602712+00
134	2020-04-26 18:08:13.402257+00
135	2020-04-26 18:10:09.85838+00
136	2020-04-26 18:10:35.607833+00
137	2020-04-26 18:10:47.503878+00
138	2020-04-26 18:11:10.379986+00
139	2020-04-26 18:12:33.769854+00
140	2020-04-26 18:17:23.316071+00
141	2020-04-26 18:18:23.582286+00
142	2020-04-26 18:18:54.078547+00
143	2020-04-26 18:18:59.581422+00
144	2020-04-26 18:19:11.376285+00
145	2020-04-26 18:20:28.619572+00
146	2020-04-26 18:21:44.653885+00
147	2020-04-26 18:22:04.416657+00
148	2020-04-26 18:22:29.021957+00
149	2020-04-26 18:23:57.891524+00
150	2020-04-26 18:24:40.538875+00
151	2020-04-26 18:24:43.654443+00
152	2020-04-26 18:24:50.827745+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Shake Weight	2999	/images/shake-weight.jpg	Dynamic Inertia technology ignites muscles in arms, shoulders, and chest.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
2	ShamWow	2595	/images/shamwow.jpg	It's like a chamois, towel, and sponge, all in one! Soaks up to 10x it's weight in any liquid!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
3	Snuggie	2900	/images/snuggie.jpg	Super-Soft Fleece with pockets! One Size fits all Adults! Keeps you Warm & Your Hands-Free!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
4	Wax Vac	999	/images/wax-vac.jpg	Gentle way to remove ear wax. Safe and hygienic. Reduces the risk of painful infections.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
5	Ostrich Pillow	9900	/images/ostrich-pillow.jpg	Create your own snugly space in the world and feel-good anywhere with the ultimate cocoon pillow.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
6	Tater Mitts	830	/images/tater-mitts.jpg	8 Seconds is all you need with Tater Mitts. Quickly and easily prepare all your favorite potato dishes with Tater Mitts.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 147, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 152, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

