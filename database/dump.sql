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
400	274	7	750
401	275	1	650
402	276	7	750
403	277	5	600
404	278	5	600
405	278	1	650
406	279	5	600
407	279	1	650
408	280	7	750
409	280	7	750
410	280	7	750
411	280	7	750
412	280	7	750
413	280	7	750
414	281	7	750
415	281	1	650
416	281	3	650
417	281	7	750
418	281	7	750
419	281	7	750
420	282	7	750
421	282	7	750
422	282	7	750
423	282	7	750
424	282	7	750
425	282	7	750
426	282	7	750
427	283	7	750
428	284	7	750
429	285	7	750
430	286	7	750
431	287	5	600
432	288	4	650
433	289	7	750
434	290	5	600
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
274	2020-05-24 05:36:54.819378+00
275	2020-05-24 07:36:40.003151+00
276	2020-05-25 06:33:16.403887+00
277	2020-05-25 17:35:36.994867+00
278	2020-05-26 04:57:11.800406+00
279	2020-05-26 07:50:02.848096+00
280	2020-05-26 17:13:25.210376+00
281	2020-05-26 18:26:00.758707+00
282	2020-06-04 17:09:27.307985+00
283	2020-06-04 19:45:14.006306+00
284	2020-06-04 20:37:33.411173+00
285	2020-06-05 17:47:38.550699+00
286	2020-06-05 18:30:19.57833+00
287	2020-06-05 18:31:43.936679+00
288	2020-06-05 18:34:14.841598+00
289	2020-06-05 23:22:16.202391+00
290	2020-06-05 23:27:31.659505+00
291	2020-06-05 23:38:14.967885+00
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
166	286	Helen	1234123412341234	asdf	2020-06-05 18:30:36.062288+00
167	287	Helen	1234123412341234	asdf1234	2020-06-05 18:31:57.314999+00
168	288	Helen	1234123412341234	1234	2020-06-05 18:34:36.641656+00
169	289	aasdf	1232342342342342	asdf	2020-06-05 23:22:24.727178+00
170	290	asdf	1231231231231231	asdf	2020-06-05 23:27:40.843488+00
171	291	asdf	1231231231231231	asdf	2020-06-05 23:38:24.224115+00
172	291	asdf	1231231231231231	asdf	2020-06-05 23:39:29.734635+00
18	231	Jae Choi	1234	7777 Brea Blvd	2020-05-01 07:23:56.531112+00
19	231				2020-05-01 07:24:05.77581+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
7	Greenery Wedding Invitation	750	/images/greenery-invitation.jpg	Minimalistic wedding invitation with simple greenery that goes well with any wedding color themes.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
3	White Flower Wedding Invitation	650	/images/white-flower-invitation.jpg	Elegant invitation with simple greenery and delicate white flower accented with golden borders.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
9	Greenery Table Numbers	500	/images/greenery-table-number.jpg	Minimalistic table numbers with simple greenery that goes well with any wedding color themes.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
1	Rosen Wedding Invitation	650	/images/rosen-invitation.jpg	Vibrant wedding invitation with beautiful red and white flowers that your guests will love to keep on their refrigerators!	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
5	White Flower Menu	600	/images/white-flower-menu.jpg	Elegant menu with simple greenery and delicate white flower accented with golden borders. (Optional icons are available for menu items)	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
4	White Flower Program	650	/images/white-flower-program.jpg	Elegant wedding program with simple greenery, delicate white flower accented, and golden borders.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
8	Greenery Program	700	/images/greenery-program.jpg	Minimalistic wedding program with simple greenery that goes well with any wedding color themes.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
10	Greenery Menu	500	/images/greenery-menu.jpg	Minimalistic menu with simple greenery that goes well with any wedding color themes.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
6	White Flower Table Numbers	500	/images/white-flower-table-number.jpg	Elegant table numbers with simple greenery, delicate white flower accented, and golden borders.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
2	Rosen Menu	600	/images/rosen-menu.jpg	Vibrant wedding menu with beautiful red and white flowers. (Optional icons are available for menu items)	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed diam facilisis, vulputate arcu at, laoreet libero. Nunc sed nisi consectetur, feugiat lorem at, semper arcu. Etiam et sem mauris. Fusce a ante rhoncus, luctus leo non, ultrices lorem. Maecenas egestas volutpat lectus at tristique. Morbi vitae pretium sapien. Vestibulum pretium urna eget nibh iaculis, a tincidunt leo tincidunt. Duis ac vestibulum enim, at pulvinar tortor.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 436, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 291, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 172, true);


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

