--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-06-01 09:07:44 UTC

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
-- TOC entry 215 (class 1259 OID 16396)
-- Name: order_totals; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.order_totals (
    order_id integer NOT NULL,
    total integer NOT NULL
);


ALTER TABLE public.order_totals OWNER TO admin;

--
-- TOC entry 214 (class 1259 OID 16389)
-- Name: orders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.orders (
    order_id character varying NOT NULL,
    item character varying NOT NULL,
    item_price integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.orders OWNER TO admin;

--
-- TOC entry 3326 (class 0 OID 16396)
-- Dependencies: 215
-- Data for Name: order_totals; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.order_totals (order_id, total) FROM stdin;
\.


--
-- TOC entry 3325 (class 0 OID 16389)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.orders (order_id, item, item_price, amount) FROM stdin;
1	bubbles	20	1
2	gum	20	10
3	flash drive	200	1
4	book	300	3
5	candle	500	5
\.


--
-- TOC entry 3182 (class 2606 OID 16400)
-- Name: order_totals order_totals_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_totals
    ADD CONSTRAINT order_totals_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3180 (class 2606 OID 16395)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


-- Completed on 2023-06-01 09:07:44 UTC

--
-- PostgreSQL database dump complete
--

