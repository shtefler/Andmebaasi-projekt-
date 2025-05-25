--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-28 21:53:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 41817)
-- Name: kliendid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kliendid (
    id integer NOT NULL,
    eesnimi character varying(70) NOT NULL,
    perenimi character varying(100) NOT NULL,
    isikukood character varying(11) NOT NULL,
    synniaeg date NOT NULL,
    sugu character varying(1) NOT NULL,
    tellimus integer NOT NULL,
    treener integer
);


--
-- TOC entry 217 (class 1259 OID 41816)
-- Name: kliendid_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kliendid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 217
-- Name: kliendid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kliendid_id_seq OWNED BY public.kliendid.id;


--
-- TOC entry 222 (class 1259 OID 41835)
-- Name: klubid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.klubid (
    id integer NOT NULL,
    nimi character varying(100) NOT NULL,
    linn character varying(50) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 41834)
-- Name: klubid_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.klubid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 221
-- Name: klubid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.klubid_id_seq OWNED BY public.klubid.id;


--
-- TOC entry 226 (class 1259 OID 41851)
-- Name: kylastused; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kylastused (
    id integer NOT NULL,
    klient integer NOT NULL,
    sisenemise_aeg timestamp without time zone NOT NULL,
    klubi integer NOT NULL,
    valjumise_aeg timestamp without time zone NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 41850)
-- Name: kylastused_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kylastused_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 225
-- Name: kylastused_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kylastused_id_seq OWNED BY public.kylastused.id;


--
-- TOC entry 230 (class 1259 OID 41865)
-- Name: on_klubis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.on_klubis (
    id integer NOT NULL,
    vahend integer NOT NULL,
    klubi integer NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 41864)
-- Name: on_klubis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.on_klubis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 229
-- Name: on_klubis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.on_klubis_id_seq OWNED BY public.on_klubis.id;


--
-- TOC entry 224 (class 1259 OID 41844)
-- Name: tellimused; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tellimused (
    id integer NOT NULL,
    tellimuse_nr integer NOT NULL,
    alguskuupaev timestamp without time zone NOT NULL,
    lopukuupaev timestamp without time zone NOT NULL,
    koduklubi integer NOT NULL,
    tasutav_summa numeric(5,2) NOT NULL,
    kas_tasutud bit(1)
);


--
-- TOC entry 223 (class 1259 OID 41843)
-- Name: tellimused_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tellimused_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 223
-- Name: tellimused_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tellimused_id_seq OWNED BY public.tellimused.id;


--
-- TOC entry 220 (class 1259 OID 41826)
-- Name: treenerid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.treenerid (
    id integer NOT NULL,
    eesnimi character varying(100) NOT NULL,
    perenimi character varying(70) NOT NULL,
    isikukood character varying(11) NOT NULL,
    synniaeg date NOT NULL,
    sugu character varying(1) NOT NULL,
    klubi integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 41825)
-- Name: treenerid_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.treenerid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 219
-- Name: treenerid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.treenerid_id_seq OWNED BY public.treenerid.id;


--
-- TOC entry 228 (class 1259 OID 41858)
-- Name: vahendid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vahendid (
    id integer NOT NULL,
    nimetus character varying(80) NOT NULL,
    tyyp character varying(80) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 41857)
-- Name: vahendid_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vahendid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 227
-- Name: vahendid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vahendid_id_seq OWNED BY public.vahendid.id;


--
-- TOC entry 4725 (class 2604 OID 41820)
-- Name: kliendid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid ALTER COLUMN id SET DEFAULT nextval('public.kliendid_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 41838)
-- Name: klubid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klubid ALTER COLUMN id SET DEFAULT nextval('public.klubid_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 41854)
-- Name: kylastused id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused ALTER COLUMN id SET DEFAULT nextval('public.kylastused_id_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 41868)
-- Name: on_klubis id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis ALTER COLUMN id SET DEFAULT nextval('public.on_klubis_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 41847)
-- Name: tellimused id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tellimused ALTER COLUMN id SET DEFAULT nextval('public.tellimused_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 41829)
-- Name: treenerid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid ALTER COLUMN id SET DEFAULT nextval('public.treenerid_id_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 41861)
-- Name: vahendid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vahendid ALTER COLUMN id SET DEFAULT nextval('public.vahendid_id_seq'::regclass);


--
-- TOC entry 4906 (class 0 OID 41817)
-- Dependencies: 218
-- Data for Name: kliendid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.kliendid VALUES (6, 'Tarmo', 'Tamme', '39703016580', '1997-03-01', 'm', 2, 5);
INSERT INTO public.kliendid VALUES (7, 'Madis', 'Kask', '50601282776', '2006-01-28', 'm', 3, 1);
INSERT INTO public.kliendid VALUES (8, 'Susanna', 'Saar', '60302012277', '2003-02-01', 'n', 1, 4);
INSERT INTO public.kliendid VALUES (9, 'Tiiu', 'Tihane', '48006286546', '1980-06-28', 'n', 4, 4);
INSERT INTO public.kliendid VALUES (10, 'Peeter', 'Karu', '37111205723', '1971-11-20', 'm', 5, NULL);


--
-- TOC entry 4910 (class 0 OID 41835)
-- Dependencies: 222
-- Data for Name: klubid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.klubid VALUES (1, 'Tasku', 'Tartu');
INSERT INTO public.klubid VALUES (2, 'Veeriku', 'Tartu');
INSERT INTO public.klubid VALUES (3, 'Vanalinna', 'Tallinn');
INSERT INTO public.klubid VALUES (4, 'Ülemiste', 'Tallinn');
INSERT INTO public.klubid VALUES (5, 'Port Arturi', 'Pärnu');


--
-- TOC entry 4914 (class 0 OID 41851)
-- Dependencies: 226
-- Data for Name: kylastused; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.kylastused VALUES (1, 6, '2024-10-10 18:15:30', 4, '2024-10-10 20:30:00');
INSERT INTO public.kylastused VALUES (2, 10, '2025-01-15 15:00:00', 3, '2025-01-15 18:17:00');
INSERT INTO public.kylastused VALUES (3, 8, '2024-09-01 08:12:00', 2, '2024-09-01 09:30:00');
INSERT INTO public.kylastused VALUES (4, 8, '2024-11-04 08:06:00', 1, '2024-11-04 09:23:00');
INSERT INTO public.kylastused VALUES (5, 10, '2025-01-27 16:12:00', 3, '2025-01-27 18:53:00');


--
-- TOC entry 4918 (class 0 OID 41865)
-- Dependencies: 230
-- Data for Name: on_klubis; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.on_klubis VALUES (1, 1, 5);
INSERT INTO public.on_klubis VALUES (2, 2, 5);
INSERT INTO public.on_klubis VALUES (3, 3, 5);
INSERT INTO public.on_klubis VALUES (4, 4, 5);
INSERT INTO public.on_klubis VALUES (5, 1, 2);
INSERT INTO public.on_klubis VALUES (6, 3, 2);
INSERT INTO public.on_klubis VALUES (7, 5, 2);
INSERT INTO public.on_klubis VALUES (8, 6, 2);
INSERT INTO public.on_klubis VALUES (9, 8, 2);
INSERT INTO public.on_klubis VALUES (10, 1, 1);
INSERT INTO public.on_klubis VALUES (11, 2, 1);
INSERT INTO public.on_klubis VALUES (12, 4, 1);
INSERT INTO public.on_klubis VALUES (13, 6, 1);
INSERT INTO public.on_klubis VALUES (14, 7, 1);
INSERT INTO public.on_klubis VALUES (15, 1, 3);
INSERT INTO public.on_klubis VALUES (16, 2, 3);
INSERT INTO public.on_klubis VALUES (17, 3, 3);
INSERT INTO public.on_klubis VALUES (18, 4, 3);
INSERT INTO public.on_klubis VALUES (19, 5, 3);
INSERT INTO public.on_klubis VALUES (20, 6, 3);
INSERT INTO public.on_klubis VALUES (21, 7, 3);
INSERT INTO public.on_klubis VALUES (22, 8, 3);
INSERT INTO public.on_klubis VALUES (23, 1, 4);
INSERT INTO public.on_klubis VALUES (24, 2, 4);
INSERT INTO public.on_klubis VALUES (25, 5, 4);
INSERT INTO public.on_klubis VALUES (26, 6, 4);
INSERT INTO public.on_klubis VALUES (27, 7, 4);
INSERT INTO public.on_klubis VALUES (28, 8, 4);


--
-- TOC entry 4912 (class 0 OID 41844)
-- Dependencies: 224
-- Data for Name: tellimused; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tellimused VALUES (1, 202400001, '2024-08-21 00:00:00', '2025-06-01 00:00:00', 2, 130.99, B'1');
INSERT INTO public.tellimused VALUES (2, 202300082, '2023-01-01 00:00:00', '2026-01-01 00:00:00', 4, 550.00, B'1');
INSERT INTO public.tellimused VALUES (3, 202500102, '2025-03-01 00:00:00', '2026-02-01 00:00:00', 1, 215.99, B'1');
INSERT INTO public.tellimused VALUES (4, 202500113, '2025-05-01 00:00:00', '2026-01-01 00:00:00', 2, 139.99, B'0');
INSERT INTO public.tellimused VALUES (5, 202400002, '2024-09-01 00:00:00', '2025-08-31 00:00:00', 3, 215.99, B'0');


--
-- TOC entry 4908 (class 0 OID 41826)
-- Dependencies: 220
-- Data for Name: treenerid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.treenerid VALUES (1, 'Mihkel', 'Mets', '38110084941', '1981-10-08', 'm', 1);
INSERT INTO public.treenerid VALUES (2, 'Kevin', 'Kuusepuu', '39206222774', '1992-06-22', 'm', 3);
INSERT INTO public.treenerid VALUES (3, 'Jaan', 'Oja', '38806105750', '1988-06-10', 'm', 5);
INSERT INTO public.treenerid VALUES (4, 'Liis', 'Rand', '49604035752', '1996-04-03', 'n', 2);
INSERT INTO public.treenerid VALUES (5, 'Maria', 'Ivanova', '49901087056', '1999-01-08', 'n', 4);


--
-- TOC entry 4916 (class 0 OID 41858)
-- Dependencies: 228
-- Data for Name: vahendid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vahendid VALUES (1, 'Rinnalt surumise pink', 'mitteliikuv vahend');
INSERT INTO public.vahendid VALUES (2, 'Kükiraam', 'mitteliikuv vahend');
INSERT INTO public.vahendid VALUES (3, 'Jooksulint', 'masin');
INSERT INTO public.vahendid VALUES (4, 'Hantliriiul hantlitega', 'mitteliikuv vahend');
INSERT INTO public.vahendid VALUES (5, 'Sõudeergomeeter', 'masin');
INSERT INTO public.vahendid VALUES (6, 'Reiesirutusmasin', 'masin');
INSERT INTO public.vahendid VALUES (7, 'Jõutõmbe platvorm', 'mitteliikuv vahend');
INSERT INTO public.vahendid VALUES (8, 'Võimlemisraam', 'mitteliikuv vahend');


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 217
-- Name: kliendid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kliendid_id_seq', 10, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 221
-- Name: klubid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.klubid_id_seq', 5, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 225
-- Name: kylastused_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kylastused_id_seq', 5, true);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 229
-- Name: on_klubis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.on_klubis_id_seq', 28, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 223
-- Name: tellimused_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tellimused_id_seq', 5, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 219
-- Name: treenerid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.treenerid_id_seq', 5, true);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 227
-- Name: vahendid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vahendid_id_seq', 8, true);


--
-- TOC entry 4733 (class 2606 OID 41824)
-- Name: kliendid kliendid_isikukood_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT kliendid_isikukood_key UNIQUE (isikukood);


--
-- TOC entry 4735 (class 2606 OID 41822)
-- Name: kliendid kliendid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT kliendid_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 41842)
-- Name: klubid klubid_nimi_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klubid
    ADD CONSTRAINT klubid_nimi_key UNIQUE (nimi);


--
-- TOC entry 4743 (class 2606 OID 41840)
-- Name: klubid klubid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klubid
    ADD CONSTRAINT klubid_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 41856)
-- Name: kylastused kylastused_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused
    ADD CONSTRAINT kylastused_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 41870)
-- Name: on_klubis on_klubis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis
    ADD CONSTRAINT on_klubis_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 41849)
-- Name: tellimused tellimused_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tellimused
    ADD CONSTRAINT tellimused_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 41833)
-- Name: treenerid treenerid_isikukood_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid
    ADD CONSTRAINT treenerid_isikukood_key UNIQUE (isikukood);


--
-- TOC entry 4739 (class 2606 OID 41831)
-- Name: treenerid treenerid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid
    ADD CONSTRAINT treenerid_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 41863)
-- Name: vahendid vahendid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vahendid
    ADD CONSTRAINT vahendid_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 41871)
-- Name: kliendid fk_klient_tellimus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT fk_klient_tellimus FOREIGN KEY (tellimus) REFERENCES public.tellimused(id);


--
-- TOC entry 4753 (class 2606 OID 41876)
-- Name: kliendid fk_klient_treener; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT fk_klient_treener FOREIGN KEY (treener) REFERENCES public.treenerid(id);


--
-- TOC entry 4756 (class 2606 OID 41891)
-- Name: kylastused fk_kylastus_klient; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused
    ADD CONSTRAINT fk_kylastus_klient FOREIGN KEY (klient) REFERENCES public.kliendid(id);


--
-- TOC entry 4758 (class 2606 OID 41907)
-- Name: on_klubis fk_on_klubis_klubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis
    ADD CONSTRAINT fk_on_klubis_klubi FOREIGN KEY (klubi) REFERENCES public.klubid(id);


--
-- TOC entry 4759 (class 2606 OID 41901)
-- Name: on_klubis fk_on_klubis_vahend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis
    ADD CONSTRAINT fk_on_klubis_vahend FOREIGN KEY (vahend) REFERENCES public.vahendid(id);


--
-- TOC entry 4755 (class 2606 OID 41886)
-- Name: tellimused fk_tellimus_koduklubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tellimused
    ADD CONSTRAINT fk_tellimus_koduklubi FOREIGN KEY (koduklubi) REFERENCES public.klubid(id);


--
-- TOC entry 4754 (class 2606 OID 41881)
-- Name: treenerid fk_treener_klubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid
    ADD CONSTRAINT fk_treener_klubi FOREIGN KEY (klubi) REFERENCES public.klubid(id);


--
-- TOC entry 4757 (class 2606 OID 41896)
-- Name: kylastused fk_ylastus_klubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused
    ADD CONSTRAINT fk_ylastus_klubi FOREIGN KEY (klubi) REFERENCES public.klubid(id);


-- Completed on 2025-04-28 21:53:46

--
-- PostgreSQL database dump complete
--

