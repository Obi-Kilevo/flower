--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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
-- Name: camp_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.camp_hotels_id_seq OWNED BY public.camp_hotels.id;


--
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
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
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
-- Name: lodges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lodges_id_seq OWNED BY public.lodges.id;


--
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
-- Name: luxury_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.luxury_hotels_id_seq OWNED BY public.luxury_hotels.id;


--
-- Name: mountains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mountains (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


ALTER TABLE public.mountains OWNER TO postgres;

--
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
-- Name: mountains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mountains_id_seq OWNED BY public.mountains.id;


--
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
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
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
-- Name: uface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uface_id_seq OWNED BY public.uface.id;


--
-- Name: camp_hotels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camp_hotels ALTER COLUMN id SET DEFAULT nextval('public.camp_hotels_id_seq'::regclass);


--
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- Name: lodges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lodges ALTER COLUMN id SET DEFAULT nextval('public.lodges_id_seq'::regclass);


--
-- Name: luxury_hotels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.luxury_hotels ALTER COLUMN id SET DEFAULT nextval('public.luxury_hotels_id_seq'::regclass);


--
-- Name: mountains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains ALTER COLUMN id SET DEFAULT nextval('public.mountains_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- Name: uface id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uface ALTER COLUMN id SET DEFAULT nextval('public.uface_id_seq'::regclass);


--
-- Name: camp_hotels camp_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camp_hotels
    ADD CONSTRAINT camp_hotels_pkey PRIMARY KEY (id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- Name: lodges lodges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lodges
    ADD CONSTRAINT lodges_pkey PRIMARY KEY (id);


--
-- Name: luxury_hotels luxury_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.luxury_hotels
    ADD CONSTRAINT luxury_hotels_pkey PRIMARY KEY (id);


--
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (id);


--
-- Name: nationalparks nationalparks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalparks
    ADD CONSTRAINT nationalparks_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: uface uface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uface
    ADD CONSTRAINT uface_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

