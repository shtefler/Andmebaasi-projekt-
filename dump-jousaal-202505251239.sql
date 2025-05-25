--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.3

-- Started on 2025-05-25 12:39:29

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
-- TOC entry 236 (class 1255 OID 57667)
-- Name: sp_eemalda_aegunud_tellimused(); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.sp_eemalda_aegunud_tellimused()
    LANGUAGE plpgsql
    AS $$
declare mitu_aegunud integer;
BEGIN
	select count(*) into mitu_aegunud
	from tellimused
	where lopukuupaev < current_date;
	if mitu_aegunud > 0 then
    	delete from tellimused where lopukuupaev < current_date;
    	raise notice 'Aegunud tellimused on eemaldatud.';
	else
    	raise notice 'Aegunud tellimusi, mida eemaldada, ei ole.';
	end if;
END;
$$;


--
-- TOC entry 235 (class 1255 OID 57666)
-- Name: sp_lisa_kylastus(integer, timestamp without time zone, integer, timestamp without time zone); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.sp_lisa_kylastus(IN k_klient_id integer, IN k_sisenemise_aeg timestamp without time zone, IN k_klubi_id integer, IN k_valjumise_aeg timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO kylastused (klient, sisenemise_aeg, klubi, valjumise_aeg)
    VALUES (k_klient_id, k_sisenemise_aeg, k_klubi_id, k_valjumise_aeg);
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 57552)
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
-- TOC entry 218 (class 1259 OID 57555)
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
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 218
-- Name: kliendid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kliendid_id_seq OWNED BY public.kliendid.id;


--
-- TOC entry 219 (class 1259 OID 57556)
-- Name: klubid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.klubid (
    id integer NOT NULL,
    nimi character varying(100) NOT NULL,
    linn character varying(50) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 57559)
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
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 220
-- Name: klubid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.klubid_id_seq OWNED BY public.klubid.id;


--
-- TOC entry 221 (class 1259 OID 57560)
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
-- TOC entry 222 (class 1259 OID 57563)
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
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 222
-- Name: kylastused_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kylastused_id_seq OWNED BY public.kylastused.id;


--
-- TOC entry 223 (class 1259 OID 57564)
-- Name: on_klubis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.on_klubis (
    id integer NOT NULL,
    vahend integer NOT NULL,
    klubi integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 57567)
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
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 224
-- Name: on_klubis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.on_klubis_id_seq OWNED BY public.on_klubis.id;


--
-- TOC entry 225 (class 1259 OID 57568)
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
-- TOC entry 226 (class 1259 OID 57571)
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
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 226
-- Name: tellimused_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tellimused_id_seq OWNED BY public.tellimused.id;


--
-- TOC entry 227 (class 1259 OID 57572)
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
-- TOC entry 228 (class 1259 OID 57575)
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
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 228
-- Name: treenerid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.treenerid_id_seq OWNED BY public.treenerid.id;


--
-- TOC entry 231 (class 1259 OID 57656)
-- Name: v_kliendi_tellimuse_detailid; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_kliendi_tellimuse_detailid AS
 SELECT k.id AS klient_id,
    (((k.eesnimi)::text || ' '::text) || (k.perenimi)::text) AS nimi,
    t.alguskuupaev,
    t.lopukuupaev,
    kl.nimi AS koduklubi_nimi,
    t.tasutav_summa,
        CASE
            WHEN (t.kas_tasutud = '1'::"bit") THEN 'jah'::text
            ELSE 'ei'::text
        END AS kas_tasutud
   FROM ((public.kliendid k
     JOIN public.tellimused t ON ((k.tellimus = t.id)))
     JOIN public.klubid kl ON ((t.koduklubi = kl.id)));


--
-- TOC entry 232 (class 1259 OID 57661)
-- Name: v_treenerid_klubides; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_treenerid_klubides AS
 SELECT t.id AS treener_id,
    (((t.eesnimi)::text || ' '::text) || (t.perenimi)::text) AS nimi,
    k.nimi AS klubi_nimi,
    k.linn AS klubi_linn
   FROM (public.treenerid t
     JOIN public.klubid k ON ((t.klubi = k.id)));


--
-- TOC entry 233 (class 1259 OID 57668)
-- Name: v_treenerid_treenitavate_jargi; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_treenerid_treenitavate_jargi AS
 SELECT (((t.eesnimi)::text || ' '::text) || (t.perenimi)::text) AS treener,
    kl.nimi AS klubi,
    count(k.treener) AS "treenitavate arv"
   FROM ((public.treenerid t
     JOIN public.klubid kl ON ((t.klubi = kl.id)))
     LEFT JOIN public.kliendid k ON ((k.treener = t.id)))
  GROUP BY t.eesnimi, t.perenimi, kl.nimi
  ORDER BY (count(k.treener)) DESC, (((t.eesnimi)::text || ' '::text) || (t.perenimi)::text);


--
-- TOC entry 229 (class 1259 OID 57576)
-- Name: vahendid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vahendid (
    id integer NOT NULL,
    nimetus character varying(80) NOT NULL,
    tyyp character varying(80) NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 57673)
-- Name: v_vahendid_klubides; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_vahendid_klubides AS
 SELECT k.nimi AS klubi,
    v.nimetus AS treeningvahend
   FROM public.klubid k,
    public.vahendid v,
    public.on_klubis o
  WHERE ((k.id = o.klubi) AND (o.vahend = v.id))
  ORDER BY k.nimi;


--
-- TOC entry 230 (class 1259 OID 57579)
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
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 230
-- Name: vahendid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vahendid_id_seq OWNED BY public.vahendid.id;


--
-- TOC entry 4743 (class 2604 OID 57677)
-- Name: kliendid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid ALTER COLUMN id SET DEFAULT nextval('public.kliendid_id_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 57678)
-- Name: klubid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klubid ALTER COLUMN id SET DEFAULT nextval('public.klubid_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 57679)
-- Name: kylastused id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused ALTER COLUMN id SET DEFAULT nextval('public.kylastused_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 57680)
-- Name: on_klubis id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis ALTER COLUMN id SET DEFAULT nextval('public.on_klubis_id_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 57681)
-- Name: tellimused id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tellimused ALTER COLUMN id SET DEFAULT nextval('public.tellimused_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 57682)
-- Name: treenerid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid ALTER COLUMN id SET DEFAULT nextval('public.treenerid_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 57683)
-- Name: vahendid id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vahendid ALTER COLUMN id SET DEFAULT nextval('public.vahendid_id_seq'::regclass);


--
-- TOC entry 4930 (class 0 OID 57552)
-- Dependencies: 217
-- Data for Name: kliendid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.kliendid VALUES (6, 'Tarmo', 'Tamme', '39703016580', '1997-03-01', 'm', 2, 5);
INSERT INTO public.kliendid VALUES (7, 'Madis', 'Kask', '50601282776', '2006-01-28', 'm', 3, 1);
INSERT INTO public.kliendid VALUES (8, 'Susanna', 'Saar', '60302012277', '2003-02-01', 'n', 1, 4);
INSERT INTO public.kliendid VALUES (9, 'Tiiu', 'Tihane', '48006286546', '1980-06-28', 'n', 4, 4);
INSERT INTO public.kliendid VALUES (10, 'Peeter', 'Karu', '37111205723', '1971-11-20', 'm', 5, NULL);


--
-- TOC entry 4932 (class 0 OID 57556)
-- Dependencies: 219
-- Data for Name: klubid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.klubid VALUES (1, 'Tasku', 'Tartu');
INSERT INTO public.klubid VALUES (2, 'Veeriku', 'Tartu');
INSERT INTO public.klubid VALUES (3, 'Vanalinna', 'Tallinn');
INSERT INTO public.klubid VALUES (4, 'Ülemiste', 'Tallinn');
INSERT INTO public.klubid VALUES (5, 'Port Arturi', 'Pärnu');


--
-- TOC entry 4934 (class 0 OID 57560)
-- Dependencies: 221
-- Data for Name: kylastused; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.kylastused VALUES (1, 6, '2024-10-10 18:15:30', 4, '2024-10-10 20:30:00');
INSERT INTO public.kylastused VALUES (2, 10, '2025-01-15 15:00:00', 3, '2025-01-15 18:17:00');
INSERT INTO public.kylastused VALUES (3, 8, '2024-09-01 08:12:00', 2, '2024-09-01 09:30:00');
INSERT INTO public.kylastused VALUES (4, 8, '2024-11-04 08:06:00', 1, '2024-11-04 09:23:00');
INSERT INTO public.kylastused VALUES (5, 10, '2025-01-27 16:12:00', 3, '2025-01-27 18:53:00');
INSERT INTO public.kylastused VALUES (6, 7, '2025-05-02 14:30:00', 3, '2025-05-02 16:00:00');
INSERT INTO public.kylastused VALUES (7, 8, '2025-05-03 10:15:00', 1, '2025-05-03 11:15:00');
INSERT INTO public.kylastused VALUES (8, 6, '2025-05-03 12:30:00', 3, '2025-05-03 16:00:00');
INSERT INTO public.kylastused VALUES (9, 10, '2025-05-03 11:30:00', 4, '2025-05-03 16:20:00');


--
-- TOC entry 4936 (class 0 OID 57564)
-- Dependencies: 223
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
-- TOC entry 4938 (class 0 OID 57568)
-- Dependencies: 225
-- Data for Name: tellimused; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tellimused VALUES (1, 202400001, '2024-08-21 00:00:00', '2025-06-01 00:00:00', 2, 130.99, B'1');
INSERT INTO public.tellimused VALUES (2, 202300082, '2023-01-01 00:00:00', '2026-01-01 00:00:00', 4, 550.00, B'1');
INSERT INTO public.tellimused VALUES (3, 202500102, '2025-03-01 00:00:00', '2026-02-01 00:00:00', 1, 215.99, B'1');
INSERT INTO public.tellimused VALUES (4, 202500113, '2025-05-01 00:00:00', '2026-01-01 00:00:00', 2, 139.99, B'0');
INSERT INTO public.tellimused VALUES (5, 202400002, '2024-09-01 00:00:00', '2025-08-31 00:00:00', 3, 215.99, B'0');


--
-- TOC entry 4940 (class 0 OID 57572)
-- Dependencies: 227
-- Data for Name: treenerid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.treenerid VALUES (1, 'Mihkel', 'Mets', '38110084941', '1981-10-08', 'm', 1);
INSERT INTO public.treenerid VALUES (2, 'Kevin', 'Kuusepuu', '39206222774', '1992-06-22', 'm', 3);
INSERT INTO public.treenerid VALUES (3, 'Jaan', 'Oja', '38806105750', '1988-06-10', 'm', 5);
INSERT INTO public.treenerid VALUES (4, 'Liis', 'Rand', '49604035752', '1996-04-03', 'n', 2);
INSERT INTO public.treenerid VALUES (5, 'Maria', 'Ivanova', '49901087056', '1999-01-08', 'n', 4);


--
-- TOC entry 4942 (class 0 OID 57576)
-- Dependencies: 229
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
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 218
-- Name: kliendid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kliendid_id_seq', 10, true);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 220
-- Name: klubid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.klubid_id_seq', 5, true);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 222
-- Name: kylastused_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kylastused_id_seq', 5, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 224
-- Name: on_klubis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.on_klubis_id_seq', 28, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 226
-- Name: tellimused_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tellimused_id_seq', 5, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 228
-- Name: treenerid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.treenerid_id_seq', 5, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 230
-- Name: vahendid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vahendid_id_seq', 8, true);


--
-- TOC entry 4751 (class 2606 OID 57588)
-- Name: kliendid kliendid_isikukood_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT kliendid_isikukood_key UNIQUE (isikukood);


--
-- TOC entry 4753 (class 2606 OID 57590)
-- Name: kliendid kliendid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT kliendid_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 57685)
-- Name: kliendid kliendid_tellimus_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT kliendid_tellimus_key UNIQUE (tellimus);


--
-- TOC entry 4757 (class 2606 OID 57592)
-- Name: klubid klubid_nimi_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klubid
    ADD CONSTRAINT klubid_nimi_key UNIQUE (nimi);


--
-- TOC entry 4759 (class 2606 OID 57594)
-- Name: klubid klubid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.klubid
    ADD CONSTRAINT klubid_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 57596)
-- Name: kylastused kylastused_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused
    ADD CONSTRAINT kylastused_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 57598)
-- Name: on_klubis on_klubis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis
    ADD CONSTRAINT on_klubis_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 57600)
-- Name: tellimused tellimused_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tellimused
    ADD CONSTRAINT tellimused_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 57602)
-- Name: treenerid treenerid_isikukood_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid
    ADD CONSTRAINT treenerid_isikukood_key UNIQUE (isikukood);


--
-- TOC entry 4769 (class 2606 OID 57604)
-- Name: treenerid treenerid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid
    ADD CONSTRAINT treenerid_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 57606)
-- Name: vahendid vahendid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vahendid
    ADD CONSTRAINT vahendid_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 57607)
-- Name: kliendid fk_klient_tellimus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT fk_klient_tellimus FOREIGN KEY (tellimus) REFERENCES public.tellimused(id);


--
-- TOC entry 4773 (class 2606 OID 57612)
-- Name: kliendid fk_klient_treener; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kliendid
    ADD CONSTRAINT fk_klient_treener FOREIGN KEY (treener) REFERENCES public.treenerid(id);


--
-- TOC entry 4774 (class 2606 OID 57617)
-- Name: kylastused fk_kylastus_klient; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused
    ADD CONSTRAINT fk_kylastus_klient FOREIGN KEY (klient) REFERENCES public.kliendid(id);


--
-- TOC entry 4775 (class 2606 OID 57686)
-- Name: kylastused fk_kylastus_klubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused
    ADD CONSTRAINT fk_kylastus_klubi FOREIGN KEY (klubi) REFERENCES public.klubid(id);


--
-- TOC entry 4777 (class 2606 OID 57622)
-- Name: on_klubis fk_on_klubis_klubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis
    ADD CONSTRAINT fk_on_klubis_klubi FOREIGN KEY (klubi) REFERENCES public.klubid(id);


--
-- TOC entry 4778 (class 2606 OID 57627)
-- Name: on_klubis fk_on_klubis_vahend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.on_klubis
    ADD CONSTRAINT fk_on_klubis_vahend FOREIGN KEY (vahend) REFERENCES public.vahendid(id);


--
-- TOC entry 4779 (class 2606 OID 57632)
-- Name: tellimused fk_tellimus_koduklubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tellimused
    ADD CONSTRAINT fk_tellimus_koduklubi FOREIGN KEY (koduklubi) REFERENCES public.klubid(id);


--
-- TOC entry 4780 (class 2606 OID 57637)
-- Name: treenerid fk_treener_klubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treenerid
    ADD CONSTRAINT fk_treener_klubi FOREIGN KEY (klubi) REFERENCES public.klubid(id);


--
-- TOC entry 4776 (class 2606 OID 57642)
-- Name: kylastused fk_ylastus_klubi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kylastused
    ADD CONSTRAINT fk_ylastus_klubi FOREIGN KEY (klubi) REFERENCES public.klubid(id);


-- Completed on 2025-05-25 12:39:29

--
-- PostgreSQL database dump complete
--

