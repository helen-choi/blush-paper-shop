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
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
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
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


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
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


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
262	226	3	2900
263	226	5	9900
264	226	5	9900
265	226	5	9900
266	227	3	2900
267	227	2	2595
268	227	2	2595
269	227	3	2900
270	227	1	2999
271	227	3	2900
272	227	3	2900
273	226	5	9900
274	227	2	2595
275	226	5	9900
276	227	2	2595
277	227	2	2595
278	227	2	2595
279	227	3	2900
280	227	2	2595
281	227	3	2900
282	227	3	2900
283	227	3	2900
284	228	3	2900
285	228	1	2999
286	228	3	2900
287	228	2	2595
288	228	1	2999
289	228	4	999
290	228	6	830
291	228	5	9900
292	228	6	830
293	228	1	2999
294	229	6	830
295	229	6	830
296	229	6	830
297	230	2	2595
298	231	2	2595
299	231	2	2595
300	231	3	2900
301	231	1	2999
302	231	3	2900
303	231	3	2900
304	231	3	2900
305	231	2	2595
306	231	6	830
307	231	2	2595
308	231	1	2999
309	231	4	999
310	232	2	2595
311	233	2	2595
312	234	2	2595
313	235	3	2900
314	235	2	2595
315	235	2	2595
316	235	2	2595
317	234	1	2999
318	234	3	2900
319	234	3	2900
320	234	1	2999
321	234	2	2595
322	234	1	2999
323	234	3	2900
324	236	2	2595
325	236	3	2900
326	237	1	2999
327	237	1	2999
328	237	1	2999
329	237	1	2999
330	237	1	2999
331	237	1	2999
332	237	1	2999
333	237	3	2900
334	238	1	2999
335	239	2	2595
336	239	1	2999
337	240	1	2999
338	240	1	2999
339	241	1	2999
340	241	1	2999
341	241	4	999
342	241	5	9900
343	241	2	2595
344	242	5	9900
345	242	3	2900
346	242	1	2999
347	242	2	2595
348	243	2	2595
349	243	1	2999
350	243	2	2595
351	244	1	2999
352	244	1	2999
353	245	4	999
354	245	2	2595
355	246	1	2999
356	247	1	2999
357	248	6	830
358	249	2	2595
359	250	3	2900
360	251	4	999
361	252	3	2900
362	253	6	830
363	254	3	2900
364	255	3	2900
365	256	6	830
366	257	2	2595
367	258	3	2900
368	259	5	9900
369	260	3	2900
370	261	1	2999
371	262	1	2999
372	262	1	2999
373	262	1	2999
374	262	1	2999
375	262	1	2999
376	262	1	2999
377	260	2	2595
378	260	2	2595
379	260	2	2595
380	260	2	2595
381	260	2	2595
382	260	2	2595
383	260	2	2595
384	260	2	2595
385	260	2	2595
386	260	2	2595
387	263	1	2999
388	263	1	2999
389	264	1	2999
390	265	1	2999
391	266	1	2999
392	267	1	2999
393	267	1	2999
394	268	1	2999
395	269	2	2595
396	270	1	2999
397	271	1	2999
398	272	6	830
399	273	6	830
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
226	2020-04-28 04:47:07.522319+00
2	2020-04-25 21:55:29.347413+00
3	2020-04-25 22:15:19.219136+00
4	2020-04-25 22:15:32.739188+00
5	2020-04-25 22:18:34.745578+00
6	2020-04-25 22:19:13.770963+00
7	2020-04-25 22:19:35.64358+00
8	2020-04-25 22:22:59.445255+00
9	2020-04-26 04:01:45.611488+00
10	2020-04-26 04:04:25.804921+00
227	2020-04-28 04:50:31.815977+00
228	2020-04-28 16:55:14.169631+00
229	2020-04-29 18:05:14.670879+00
230	2020-04-29 20:04:49.236275+00
231	2020-05-01 05:49:05.067422+00
232	2020-05-04 19:03:24.705473+00
233	2020-05-05 17:21:14.724788+00
234	2020-05-22 05:29:32.463871+00
235	2020-05-22 05:30:52.319114+00
236	2020-05-22 18:13:25.151439+00
237	2020-05-22 18:18:56.50194+00
238	2020-05-22 18:27:20.933635+00
239	2020-05-22 18:29:05.797852+00
240	2020-05-22 19:03:25.261544+00
241	2020-05-22 19:54:55.673847+00
242	2020-05-22 19:57:34.928319+00
243	2020-05-22 19:58:59.596278+00
244	2020-05-22 20:28:51.126555+00
245	2020-05-22 21:08:19.674874+00
246	2020-05-22 21:21:25.122658+00
247	2020-05-22 21:53:47.153915+00
248	2020-05-22 22:00:13.613466+00
249	2020-05-22 22:01:30.710895+00
250	2020-05-22 22:02:12.996725+00
251	2020-05-22 22:03:07.3832+00
252	2020-05-22 22:07:42.03123+00
253	2020-05-22 22:27:50.748313+00
254	2020-05-22 22:35:26.123718+00
255	2020-05-22 22:36:22.890349+00
256	2020-05-22 22:38:30.626107+00
257	2020-05-22 22:39:13.973262+00
258	2020-05-22 22:43:22.886951+00
259	2020-05-22 23:03:30.513879+00
260	2020-05-22 23:05:13.01487+00
261	2020-05-22 23:22:36.148365+00
262	2020-05-22 23:23:20.49903+00
263	2020-05-22 23:34:12.460442+00
264	2020-05-22 23:35:50.299128+00
265	2020-05-22 23:36:45.443639+00
266	2020-05-22 23:44:32.195653+00
267	2020-05-22 23:46:09.413387+00
268	2020-05-23 05:11:09.910171+00
269	2020-05-23 05:11:41.351737+00
270	2020-05-23 05:25:51.268059+00
271	2020-05-23 05:42:21.172828+00
272	2020-05-23 05:53:44.367717+00
273	2020-05-23 05:53:56.550797+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
1	229	Helen	1234	1234 Hello	2020-04-29 18:05:22.328477+00
2	229	Helen	1234	1234 Hello	2020-04-29 18:05:56.947152+00
3	229	Helen	1234	1234 Hello	2020-04-29 18:06:30.297501+00
4	229	Helen	1234	1234 Hello	2020-04-29 18:06:44.852288+00
5	229	Helen	1234	1234 Hello	2020-04-29 18:13:02.346878+00
6	229	Helen	1234	1234 Hello	2020-04-29 18:13:19.475554+00
7	229	Helen	1234	1234 Hello	2020-04-29 18:13:37.162+00
8	229	Helen	1234	1234 Hello	2020-04-29 18:14:43.126942+00
9	229	Helen	1234	1234 Hello	2020-04-29 18:15:39.340919+00
10	229	Helen	1234	1234 Hello	2020-04-29 18:15:43.897804+00
18	231	Jae Choi	1234	7777 Brea Blvd	2020-05-01 07:23:56.531112+00
19	231				2020-05-01 07:24:05.77581+00
20	231	Logan Choi	5678	7777 Happy Lane	2020-05-01 07:35:16.931239+00
21	231	Jae Choi	1234	7777 Hello	2020-05-01 07:35:48.358644+00
22	231	Helen	123	123	2020-05-01 07:42:16.335835+00
23	231	Helen Choi	12345678	1234 Hello Lane	2020-05-01 07:43:50.981213+00
24	234				2020-05-22 05:50:14.170634+00
25	234				2020-05-22 05:55:34.556281+00
26	234				2020-05-22 05:55:42.011708+00
27	234				2020-05-22 05:56:14.073536+00
28	234	Debbie			2020-05-22 06:02:10.429249+00
29	234	sdf	sdf	sdf	2020-05-22 06:15:58.122461+00
30	234	Helen	1234	1234	2020-05-22 06:27:41.592727+00
31	234	asdf	adsf	asdf	2020-05-22 06:30:51.414471+00
32	236	Helen	1234	1234	2020-05-22 18:13:38.413034+00
33	237	gnm	gfhfghj	ghjfghj	2020-05-22 18:19:43.784482+00
34	237	Helen	1234	1234	2020-05-22 18:23:29.659769+00
35	237	dsfg	345	sdfgh	2020-05-22 18:24:49.468148+00
36	237	aesdf	1234	1234	2020-05-22 18:26:36.784872+00
37	238	Helen	0000	0000	2020-05-22 18:27:32.446587+00
38	239	hello	1234	1234	2020-05-22 18:29:13.845215+00
39	239	asdf	adsfasdf	asdf	2020-05-22 18:38:01.581977+00
40	239	Helen	1234	1234	2020-05-22 18:40:31.952967+00
41	239	new 	1234	1324	2020-05-22 18:42:37.31469+00
42	239	Name	1234	1234	2020-05-22 18:48:07.455462+00
43	239	Helen	0000	0000	2020-05-22 18:49:02.434969+00
44	239	New order	0000	0000	2020-05-22 18:50:16.665243+00
45	239	asdf	asdf	asdf	2020-05-22 18:51:42.482182+00
46	239	asdf	asdf	asdf	2020-05-22 18:53:25.696003+00
47	239	asdf	asdf	asdf	2020-05-22 18:54:02.377361+00
48	239	asdf	asdf	asdf	2020-05-22 18:55:22.389953+00
49	239	asdfasdf	asdf	adsf	2020-05-22 18:55:57.867183+00
50	239	asdf	adsf	adsf	2020-05-22 18:58:57.401826+00
51	239	asdf	adsfa	sdf	2020-05-22 18:59:18.595314+00
52	240	asdf	asdf	1234	2020-05-22 19:03:34.778979+00
53	240	adsf	asdf	adsf	2020-05-22 19:04:06.223345+00
54	240	asdf	asdf	adsf	2020-05-22 19:05:01.8824+00
55	240	asdf	asdf	asdf	2020-05-22 19:06:12.300959+00
56	240	asd	asdf	asdf	2020-05-22 19:07:40.562835+00
57	240	asdf	asdf	asdf	2020-05-22 19:08:27.420127+00
58	240	ASDF	ADSF	ASDF	2020-05-22 19:08:58.640237+00
59	240	asdf	adsf	asdf	2020-05-22 19:10:59.092784+00
60	240	asdf	asdf	adsf	2020-05-22 19:19:44.686286+00
61	240	asdf	asdf	asdf	2020-05-22 19:21:19.396327+00
62	240	asdf	asdf	adsf	2020-05-22 19:44:39.210506+00
63	240	asdf	asdf	adsf	2020-05-22 19:51:26.63162+00
64	241	asdf	asdf	asdf	2020-05-22 19:55:00.184493+00
65	241	asdf	adsf	adsf	2020-05-22 19:55:48.629752+00
66	241	asdf	asdf	asdf	2020-05-22 19:56:04.529619+00
67	241	adsf	adsf	adf	2020-05-22 19:56:26.520045+00
68	241	asdf	asdf	asdf	2020-05-22 19:57:14.421398+00
69	242	asdf	asdf	asdf	2020-05-22 19:57:39.741441+00
70	242	adsf	asdf	adf	2020-05-22 19:57:57.580722+00
71	242	asdf	adsf	adsf	2020-05-22 19:58:12.223693+00
72	242	asdf	asdf	adf	2020-05-22 19:58:51.38186+00
73	243	asdf	adsf	adsf	2020-05-22 19:59:03.852914+00
74	243	asdf	adsfa	dsf	2020-05-22 19:59:17.871389+00
75	243	asdf	asdf	adsf	2020-05-22 20:04:32.796928+00
76	243	asdf	asdf	adf	2020-05-22 20:05:06.18709+00
77	243	asd	asd	SD	2020-05-22 20:05:35.413368+00
78	243	asdf	asdf	asdf	2020-05-22 20:06:17.826074+00
79	243	asdf	adsf	adf	2020-05-22 20:09:11.516912+00
80	243	adsf	adsf	adsf	2020-05-22 20:09:25.228956+00
81	243	asdf	adf	adf	2020-05-22 20:15:20.628011+00
82	243	sadf	asdf	adf	2020-05-22 20:18:19.042166+00
83	243	asdf	adsf	adf	2020-05-22 20:20:26.61703+00
84	243	asdf	adsf	adsf	2020-05-22 20:24:38.381398+00
85	243	adsf	adsf	asdf	2020-05-22 20:28:04.550961+00
86	244	asdasdf	sdf	sdf	2020-05-22 20:30:09.945657+00
87	244	sdf	sdf	sdf	2020-05-22 20:32:16.970004+00
88	244	asdf	sdf	sdf	2020-05-22 20:36:58.669994+00
89	244	sdf	sdf	sdf	2020-05-22 20:38:00.82973+00
90	244	sdf	sdf	sdf	2020-05-22 20:39:42.161007+00
92	244	asdf	asdf	asdf	2020-05-22 21:05:21.41416+00
93	245	hk	hjk	hjk	2020-05-22 21:08:32.27882+00
94	245	sdf	sdfs	df	2020-05-22 21:14:56.646127+00
95	245	sdf	sdf	sdf	2020-05-22 21:17:44.268954+00
96	245	sdf	sdf	sdf	2020-05-22 21:19:29.57287+00
97	246	sdf	sdf	sdf	2020-05-22 21:21:30.001976+00
98	246	asdf	adsf	adsf	2020-05-22 21:37:28.975665+00
99	246	sdf	sdf	sdf	2020-05-22 21:43:43.91939+00
100	246	sdf	asdf	asdf	2020-05-22 21:51:35.91978+00
101	247	asdf	asdf	asdf	2020-05-22 21:53:56.31523+00
102	247	sdf	sdf	sdf	2020-05-22 21:57:09.474144+00
103	247	sdf	sdf	sdf	2020-05-22 21:58:01.86167+00
104	247	adsf	adf	asdf	2020-05-22 21:59:04.69405+00
105	247	sdf	sdf	sdf	2020-05-22 22:00:01.436974+00
106	248	sdf	asdf	adf	2020-05-22 22:00:19.259398+00
107	248	sdf	sdf	sdf	2020-05-22 22:00:28.763052+00
108	248	sdf	sdf	sdf	2020-05-22 22:00:55.784642+00
109	249	asdf	asdf	asdf	2020-05-22 22:01:36.288045+00
110	250	sdf	sdf	sdf	2020-05-22 22:02:17.502629+00
111	251	asdf	asdf	asdf	2020-05-22 22:03:44.21821+00
112	252	asdf	adsf	asdf	2020-05-22 22:07:48.200025+00
113	252	sdf	sdf	sdf	2020-05-22 22:09:27.262641+00
114	252	sadfs	sdf	sdf	2020-05-22 22:09:44.423632+00
115	252	sdf	sdf	sdf	2020-05-22 22:09:57.842991+00
116	252	sdf	sdf	sdf	2020-05-22 22:10:16.172649+00
117	252	sdf	sdf	sdf	2020-05-22 22:10:37.816584+00
118	252	sdf	sdf	sdf	2020-05-22 22:11:18.813535+00
119	252	sdf	sdf	sdf	2020-05-22 22:13:04.662484+00
120	252	asdf	adf	adsf	2020-05-22 22:14:09.137821+00
121	252	sdf	sdf	sdf	2020-05-22 22:14:54.326431+00
122	252	sdf	sdf	sdf	2020-05-22 22:15:51.061836+00
123	252	adsf	adsf	adfs	2020-05-22 22:16:26.606786+00
124	252	sdf	sdf	sdf	2020-05-22 22:17:15.981368+00
125	252	sdf	sdf	sdf	2020-05-22 22:19:57.328654+00
126	252	1234	1234	1234	2020-05-22 22:23:49.818943+00
127	253	asdf	adf	adf	2020-05-22 22:27:55.299761+00
128	254	sdf	sdf	sdf	2020-05-22 22:35:32.546527+00
129	255	Helen	12341234	1234	2020-05-22 22:36:33.900755+00
130	255	Helen	1234	1234	2020-05-22 22:37:03.993009+00
131	255	asfd	asdf	adsf	2020-05-22 22:37:50.249215+00
132	256	asdf	asdf	adsf	2020-05-22 22:38:36.360002+00
133	257	HELEN	asdf	asdf	2020-05-22 22:39:21.825525+00
134	258	adsf	asdf	adsf	2020-05-22 22:43:28.483749+00
135	258	asdf	adsf	adf	2020-05-22 22:50:01.966372+00
136	258	asdf	adsf	adsf	2020-05-22 22:55:47.921313+00
137	258	asdf	asdf	adf	2020-05-22 22:56:31.350645+00
138	258	adsf	adsf	asdf	2020-05-22 22:58:51.651048+00
139	259	asdf	adf	adsf	2020-05-22 23:03:37.405022+00
140	260	asdf	adsf	asdf	2020-05-22 23:05:19.204955+00
141	260	asdf	asdf	asdf	2020-05-22 23:08:54.648912+00
142	260	asdf	adf	adf	2020-05-22 23:10:23.004295+00
143	260	adsf	adsf	adf	2020-05-22 23:10:33.883611+00
144	261	helen	1234	1234asdf	2020-05-22 23:23:04.941946+00
145	262	helen	1234	1234asdf	2020-05-22 23:24:42.395005+00
146	260	sdfgterdf	34534	dsfgsdf	2020-05-22 23:27:59.871962+00
147	263	sdhgf	456	sdg	2020-05-22 23:34:37.019747+00
148	264	helen	1234	1234asdf	2020-05-22 23:36:05.17587+00
149	265	helen	1234	1234asdf	2020-05-22 23:36:56.405484+00
150	263	fdhgj	456	sdgfh	2020-05-22 23:37:10.562726+00
151	266	xdgcn	456	xfgn	2020-05-22 23:44:41.237151+00
152	267	cvb	456	dfgh	2020-05-22 23:46:23.26267+00
153	267	asdf	asdf	asdf	2020-05-22 23:48:31.209718+00
154	267	asdf	asdf	asdf	2020-05-22 23:52:51.762375+00
155	268	Helen	1234	1234	2020-05-23 05:11:17.494915+00
156	269	Jae	1234	1234	2020-05-23 05:11:48.876773+00
157	271	Logan	1234	1234	2020-05-23 05:42:42.101104+00
158	272	asdf	adf	adf	2020-05-23 05:53:50.580338+00
159	273	asdf	adsf	adsf	2020-05-23 05:54:01.974625+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Rosen Wedding Invitation	650	/images/rosen-invitation.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
5	White Flower Menu	600	/images/white-flower-menu.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
7	Greenery Wedding Invitation	750	/images/greenery-invitation.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
9	Greenery Table Numbers	500	/images/greenery-table-number.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
3	White Flower Wedding Invitation	650	/images/white-flower-invitation.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
4	White Flower Program	650	/images/white-flower-program.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
6	White Flower Table Numbers	500	/images/white-flower-table-number.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
8	Greenery Program	700	/images/greenery-program.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
10	Greenery Menu	500	/images/greenery-menu.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
2	Rosen Menu	600	/images/rosen-menu.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 399, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 273, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 159, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 4, true);


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
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


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

