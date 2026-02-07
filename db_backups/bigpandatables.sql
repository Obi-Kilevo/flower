--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2026-02-08 02:24:15

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 99817)
-- Name: camp_hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camp_hotels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price numeric(10,2),
    currency character varying(255) DEFAULT 'USD'::text,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255)
);


ALTER TABLE public.camp_hotels OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 99816)
-- Name: camp_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.camp_hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.camp_hotels_id_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 223
-- Name: camp_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.camp_hotels_id_seq OWNED BY public.camp_hotels.id;


--
-- TOC entry 232 (class 1259 OID 108156)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    rate numeric(10,4),
    symbol character varying(255),
    description text,
    image_url character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 108155)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.currency_id_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 231
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- TOC entry 226 (class 1259 OID 99888)
-- Name: lodges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lodges (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::text,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255)
);


ALTER TABLE public.lodges OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 99887)
-- Name: lodges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lodges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lodges_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 225
-- Name: lodges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lodges_id_seq OWNED BY public.lodges.id;


--
-- TOC entry 222 (class 1259 OID 99746)
-- Name: luxury_hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.luxury_hotels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::text,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255)
);


ALTER TABLE public.luxury_hotels OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 99745)
-- Name: luxury_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.luxury_hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.luxury_hotels_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 221
-- Name: luxury_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.luxury_hotels_id_seq OWNED BY public.luxury_hotels.id;


--
-- TOC entry 228 (class 1259 OID 99953)
-- Name: mountains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mountains (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255)
);


ALTER TABLE public.mountains OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 99952)
-- Name: mountains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mountains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mountains_id_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 227
-- Name: mountains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mountains_id_seq OWNED BY public.mountains.id;


--
-- TOC entry 220 (class 1259 OID 99684)
-- Name: nationalparks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nationalparks (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    description character varying(255),
    park_name character varying(255) NOT NULL,
    price double precision,
    route_name character varying(255) NOT NULL,
    show_price boolean,
    status character varying(255),
    updated_at timestamp(6) without time zone,
    image_url character varying(255),
    visittime character varying(255),
    animalnumber character varying(255),
    form_path character varying(255)
);


ALTER TABLE public.nationalparks OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 99683)
-- Name: nationalparks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nationalparks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nationalparks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 99622)
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    id bigint NOT NULL,
    park_name character varying(255) NOT NULL,
    route_name character varying(255) NOT NULL,
    description character varying(255),
    price double precision,
    show_price boolean DEFAULT true,
    status character varying(255) DEFAULT 'available'::text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    desc_adventure_type character varying(200),
    desc_duration character varying(200),
    desc_meals character varying(200),
    desc_accommodation character varying(200),
    desc_activities character varying(200),
    desc_transport character varying(200)
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 99621)
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routes_id_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 217
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- TOC entry 230 (class 1259 OID 108145)
-- Name: uface; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uface (
    id bigint NOT NULL,
    park_name character varying(255) NOT NULL,
    about character varying(255) NOT NULL,
    description character varying(255),
    image_url character varying(255),
    visittime character varying(255),
    animalnumber character varying(255),
    form_path character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.uface OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 108144)
-- Name: uface_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.uface_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 229
-- Name: uface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uface_id_seq OWNED BY public.uface.id;


--
-- TOC entry 4739 (class 2604 OID 99828)
-- Name: camp_hotels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camp_hotels ALTER COLUMN id SET DEFAULT nextval('public.camp_hotels_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 108159)
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 99899)
-- Name: lodges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lodges ALTER COLUMN id SET DEFAULT nextval('public.lodges_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 99757)
-- Name: luxury_hotels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.luxury_hotels ALTER COLUMN id SET DEFAULT nextval('public.luxury_hotels_id_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 99956)
-- Name: mountains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains ALTER COLUMN id SET DEFAULT nextval('public.mountains_id_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 99642)
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 108148)
-- Name: uface id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uface ALTER COLUMN id SET DEFAULT nextval('public.uface_id_seq'::regclass);


--
-- TOC entry 4924 (class 0 OID 99817)
-- Dependencies: 224
-- Data for Name: camp_hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.camp_hotels (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url) FROM stdin;
1	Tanuru	Dododma	Tanzania	wew	54.00	USD	fire\r\nchuma nyama\r\ntomba	\N	\N	https://images.pexels.com/photos/10939082/pexels-photo-10939082.jpeg
2	Mama baba	Zanzibar	Tanzania	no for now	\N	USD	no food\r\nno drinks	\N	2026-02-05 20:02:18.341526	/images/lion.jpg
3	5 star Hotel	Arusha	Tanzania	wella	211.00	USD	chapat\r\nmorning breakfast	\N	\N	https://images.pexels.com/photos/16983056/pexels-photo-16983056.jpeg
4	New life	zanzibar 	Tanzania		\N	USD		\N	\N	
\.


--
-- TOC entry 4932 (class 0 OID 108156)
-- Dependencies: 232
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (id, name, code, rate, symbol, description, image_url, created_at, updated_at) FROM stdin;
1	Usd dollar	USD	364.0000		only yuan , usd and tzs are aceptble 	https://images.pexels.com/photos/35329907/pexels-photo-35329907.jpeg	2026-02-07 12:34:21.832093	2026-02-07 12:34:21.832093
\.


--
-- TOC entry 4926 (class 0 OID 99888)
-- Dependencies: 226
-- Data for Name: lodges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lodges (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url) FROM stdin;
1	Tanzanite Lodges	Arusha	Tanzania	obi@gmail.com	100	USD	i i am not sure	\N	\N	https://images.pexels.com/photos/16355539/pexels-photo-16355539.jpeg
2	Kenyata 	Nairobi	Kenya	101 hao	2132	USD		\N	\N	/images/lion.jpg
3	America NInja	Calfornia	America	hahahaa	222121	CNY		\N	\N	/images/lion.jpg
\.


--
-- TOC entry 4922 (class 0 OID 99746)
-- Dependencies: 222
-- Data for Name: luxury_hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.luxury_hotels (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url) FROM stdin;
1	tazama	Arusha	Tanzania	bbbbbbbbb	2	USD		\N	\N	https://images.pexels.com/photos/35671097/pexels-photo-35671097.jpeg
2	Fido Vato	Arusha	Tanzania	bbbbbbbbb	\N	USD	what ?\r\n\r\n\r\nfree meals \r\n\r\nswimming 	\N	2026-02-05 11:06:07.78101	/images/lion.jpg
3	Obi 	Arusha	Tanzania		12221	USD	funnyworkdfdf	\N	2026-02-05 11:16:22.111402	/images/lion.jpg
\.


--
-- TOC entry 4928 (class 0 OID 99953)
-- Dependencies: 228
-- Data for Name: mountains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mountains (id, name, features, created_at, updated_at, image_url) FROM stdin;
1	Kilimanjaro ndo home	5000km hig	\N	2026-02-07 12:10:51.059288	https://images.pexels.com/photos/35329907/pexels-photo-35329907.jpeg
2	Oldonyo Mountain	it once corrupts volcanoes 	\N	\N	https://images.pexels.com/photos/35329907/pexels-photo-35329907.jpeg
\.


--
-- TOC entry 4920 (class 0 OID 99684)
-- Dependencies: 220
-- Data for Name: nationalparks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nationalparks (id, created_at, description, park_name, price, route_name, show_price, status, updated_at, image_url, visittime, animalnumber, form_path) FROM stdin;
4	2026-02-02 12:39:51.126919	famous in Twigger 	Tarangire 	3	At Arusha	f	available	2026-02-02 12:39:51.126919	\N	\N	\N	\N
10	2026-02-05 06:23:18.728787	FUCK HIM , N STOP DEPENDING ON YOUR PARENTS ESPECIALLY MOTHER 	CHRIS	23	CHRISS	f	available	2026-02-05 06:48:43.619017	\N	january - Feb	overr 3500 beest animals 	\N
11	2026-02-05 07:00:22.092648	welcome niggaz	Ombeni	32	today is hot Arusha	t	available	2026-02-05 07:00:22.092648	\N	january - december	over 300 thousands	\N
9	2026-02-03 08:09:55.886832	mambo	Komwe	3433	n	f	available	2026-02-05 07:05:14.854566	\N		only 2 giraffes	\N
12	2026-02-05 07:24:42.782983	tonight is warm 	Kasale 	43	uko wapi baba	f	available	2026-02-05 07:24:42.782983	https://images.pexels.com/photos/982021/pexels-photo-982021.jpeg	jin to dec only 	0 tembo	\N
3	2026-02-02 12:38:02.437315	We live, we laugh, we sleep	Ngorongoro Crater	3	at Arusha	f	available	2026-02-02 12:38:02.437315	\N	\N	\N	parks/parkspath/ngorongoro
5	2026-02-02 12:40:48.363267	Hot water Spring	Kikuletwa	0	at Moshi	f	available	2026-02-02 12:40:48.363267	\N	\N	\N	parks/parkspath/kikuletwa
13	2026-02-07 02:30:42.151642	2	checking it 	2	32	t	available	2026-02-07 02:34:04.481514	https://images.pexels.com/photos/35329907/pexels-photo-35329907.jpeg			\N
\.


--
-- TOC entry 4918 (class 0 OID 99622)
-- Dependencies: 218
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (id, park_name, route_name, description, price, show_price, status, created_at, updated_at, image_url, desc_adventure_type, desc_duration, desc_meals, desc_accommodation, desc_activities, desc_transport) FROM stdin;
13	Aneth	15 - Days To Moshi	i would like to confess that i am wrong 	3444	t	available	2026-02-03 13:01:58.397475	2026-02-03 13:01:58.397475		this is a Luxury Tour	6 Dyas in Total	Meals included	Luxury  Lodge	Hiking, walking 	pick up vehicle included
16	ETI HAPA NDO PARK NAME 	ETI HAPA NDO ROUTE NAME	HAPA NDO DESCRIPTION WAZEE WANGU	2100	t	available	2026-02-05 07:41:54.513473	2026-02-05 07:41:54.513473		ETI HAPA NDO ADVENTURE TYPE	HAPA NI DURATION KAKA	MISOSI BABY	HAPA ACCOMODATION 	HAPA ACTIVITIES 	HAPA TRANSPORT BABAB
3	goods	Kikuletwa	amaizing swimmers only 	\N	t	available	2026-01-28 14:37:32.090164	2026-02-05 08:17:40.875454	https://images.pexels.com/photos/31321173/pexels-photo-31321173.jpeg	\N	\N	\N	\N	\N	\N
10	20 - Arusha to Mwanza	10 - DAYS ARUSHA TO ZANZIBAR	WHY RAIN and i would like to confes that i was very wrong , i apologize	243453	t	available	2026-02-03 10:50:19.070756	2026-02-05 08:19:35.789387	https://images.pexels.com/photos/10836116/pexels-photo-10836116.jpeg	\N	\N	\N	\N	\N	\N
18	MAC	C	REDFGHFFGDFSGFNHJHDBVNMGNB NBF	4	f	available	2026-02-05 08:22:14.322344	2026-02-05 08:22:14.322344		I DONKNOW ADVENTURE TYPE		YES UGALI			
7	10 - Kilimanjaro to ngara	here is route name	here is route description	100	t	available	2026-02-03 07:27:09.316888	2026-02-05 08:27:48.865969	https://images.pexels.com/photos/12123657/pexels-photo-12123657.jpeg			UGALI			
17	30 - DAYS TO ZANZIBAR	BEST SELLERS	GOD BE WITH YOU	6	t	available	2026-02-05 08:09:20.844955	2026-02-05 08:33:09.437532	https://images.pexels.com/photos/35671097/pexels-photo-35671097.jpeg					FLY YOURSELF 	
19	6 -Days to study	best markets	today is good n final	2	t	available	2026-02-05 08:33:46.149662	2026-02-05 08:33:46.149662							
\.


--
-- TOC entry 4930 (class 0 OID 108145)
-- Dependencies: 230
-- Data for Name: uface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uface (id, park_name, about, description, image_url, visittime, animalnumber, form_path, created_at, updated_at) FROM stdin;
1	all parks available home	everything	welcome china people	https://images.pexels.com/photos/14688807/pexels-photo-14688807.jpeg	morning	all kinds		2026-02-06 23:45:15.112793	2026-02-07 01:46:24.198907
2	Mambo	Mountains in Africa	we have 12 main famous mountains in tz	https://images.pexels.com/photos/3651335/pexels-photo-3651335.jpeg	january	123121		2026-02-07 01:47:39.529888	2026-02-07 01:47:39.529888
3	Money Currency	Rate changing	we have better rate ever	https://images.pexels.com/photos/35329907/pexels-photo-35329907.jpeg	21	232		2026-02-07 02:28:53.770351	2026-02-07 02:28:53.770351
\.


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 223
-- Name: camp_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.camp_hotels_id_seq', 4, true);


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 231
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 1, true);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 225
-- Name: lodges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lodges_id_seq', 3, true);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 221
-- Name: luxury_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.luxury_hotels_id_seq', 3, true);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 227
-- Name: mountains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mountains_id_seq', 2, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 219
-- Name: nationalparks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nationalparks_id_seq', 13, true);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 217
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.routes_id_seq', 19, true);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 229
-- Name: uface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uface_id_seq', 3, true);


--
-- TOC entry 4763 (class 2606 OID 99830)
-- Name: camp_hotels camp_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camp_hotels
    ADD CONSTRAINT camp_hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 108165)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 99901)
-- Name: lodges lodges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lodges
    ADD CONSTRAINT lodges_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 99759)
-- Name: luxury_hotels luxury_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.luxury_hotels
    ADD CONSTRAINT luxury_hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 99962)
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 99690)
-- Name: nationalparks nationalparks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalparks
    ADD CONSTRAINT nationalparks_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 99644)
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 108154)
-- Name: uface uface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uface
    ADD CONSTRAINT uface_pkey PRIMARY KEY (id);


-- Completed on 2026-02-08 02:24:16

--
-- PostgreSQL database dump complete
--

