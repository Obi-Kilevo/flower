--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2026-02-11 19:02:00

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
-- TOC entry 247 (class 1259 OID 124529)
-- Name: budget_camps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.budget_camps (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price numeric(10,2),
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    from_path character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 246 (class 1259 OID 124528)
-- Name: budget_camps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.budget_camps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 246
-- Name: budget_camps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.budget_camps_id_seq OWNED BY public.budget_camps.id;


--
-- TOC entry 241 (class 1259 OID 116412)
-- Name: budget_hotels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.budget_hotels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 240 (class 1259 OID 116411)
-- Name: budget_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.budget_hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 240
-- Name: budget_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.budget_hotels_id_seq OWNED BY public.budget_hotels.id;


--
-- TOC entry 253 (class 1259 OID 124565)
-- Name: budget_lodges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.budget_lodges (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 252 (class 1259 OID 124564)
-- Name: budget_lodges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.budget_lodges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 252
-- Name: budget_lodges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.budget_lodges_id_seq OWNED BY public.budget_lodges.id;


--
-- TOC entry 237 (class 1259 OID 116380)
-- Name: budget_routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.budget_routes (
    id bigint NOT NULL,
    park_name character varying(255) NOT NULL,
    route_name character varying(255) NOT NULL,
    description character varying(255),
    price double precision,
    show_price boolean DEFAULT true,
    status character varying(255) DEFAULT 'available'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    desc_adventure_type character varying(255),
    desc_duration character varying(255),
    desc_meals character varying(255),
    desc_accommodation character varying(255),
    desc_activities character varying(255),
    desc_transport character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 236 (class 1259 OID 116379)
-- Name: budget_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.budget_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 236
-- Name: budget_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.budget_routes_id_seq OWNED BY public.budget_routes.id;


--
-- TOC entry 222 (class 1259 OID 99817)
-- Name: luxury_camps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.luxury_camps (
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
    image_url character varying(255),
    from_path character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 221 (class 1259 OID 99816)
-- Name: camp_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.camp_hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 221
-- Name: camp_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.camp_hotels_id_seq OWNED BY public.luxury_camps.id;


--
-- TOC entry 230 (class 1259 OID 108156)
-- Name: currency; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 229 (class 1259 OID 108155)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 229
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- TOC entry 245 (class 1259 OID 116437)
-- Name: face_camps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.face_camps (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price numeric(10,2),
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 244 (class 1259 OID 116436)
-- Name: face_camps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.face_camps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 244
-- Name: face_camps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.face_camps_id_seq OWNED BY public.face_camps.id;


--
-- TOC entry 239 (class 1259 OID 116394)
-- Name: face_hotels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.face_hotels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::character varying,
    features character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 238 (class 1259 OID 116393)
-- Name: face_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.face_hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 238
-- Name: face_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.face_hotels_id_seq OWNED BY public.face_hotels.id;


--
-- TOC entry 251 (class 1259 OID 124553)
-- Name: face_lodges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.face_lodges (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 250 (class 1259 OID 124552)
-- Name: face_lodge_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.face_lodge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 250
-- Name: face_lodge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.face_lodge_id_seq OWNED BY public.face_lodges.id;


--
-- TOC entry 231 (class 1259 OID 116336)
-- Name: face_route; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.face_route (
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
    desc_adventure_type character varying(255),
    desc_duration character varying(255),
    desc_meals character varying(255),
    desc_accommodation character varying(255),
    desc_activities character varying(255),
    desc_transport character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 224 (class 1259 OID 99888)
-- Name: luxury_lodges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.luxury_lodges (
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
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 223 (class 1259 OID 99887)
-- Name: lodges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lodges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 223
-- Name: lodges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lodges_id_seq OWNED BY public.luxury_lodges.id;


--
-- TOC entry 220 (class 1259 OID 99746)
-- Name: luxury_hotels; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 219 (class 1259 OID 99745)
-- Name: luxury_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.luxury_hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 219
-- Name: luxury_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.luxury_hotels_id_seq OWNED BY public.luxury_hotels.id;


--
-- TOC entry 233 (class 1259 OID 116349)
-- Name: luxury_routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.luxury_routes (
    id bigint NOT NULL,
    park_name character varying(255) NOT NULL,
    route_name character varying(255) NOT NULL,
    description character varying(255),
    price double precision,
    show_price boolean DEFAULT true,
    status character varying(255) DEFAULT 'available'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    desc_adventure_type character varying(255),
    desc_duration character varying(255),
    desc_meals character varying(255),
    desc_accommodation character varying(255),
    desc_activities character varying(255),
    desc_transport character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 232 (class 1259 OID 116348)
-- Name: luxury_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.luxury_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 232
-- Name: luxury_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.luxury_routes_id_seq OWNED BY public.luxury_routes.id;


--
-- TOC entry 249 (class 1259 OID 124541)
-- Name: midrange_camps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.midrange_camps (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price numeric(10,2),
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    from_path character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 248 (class 1259 OID 124540)
-- Name: midrange_camps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.midrange_camps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 248
-- Name: midrange_camps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.midrange_camps_id_seq OWNED BY public.midrange_camps.id;


--
-- TOC entry 242 (class 1259 OID 116424)
-- Name: midrange_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.midrange_hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 243 (class 1259 OID 116425)
-- Name: midrange_hotels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.midrange_hotels (
    id bigint DEFAULT nextval('public.midrange_hotels_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 255 (class 1259 OID 124577)
-- Name: midrange_lodges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.midrange_lodges (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(255),
    country character varying(255),
    address character varying(255),
    price double precision,
    currency character varying(255) DEFAULT 'USD'::character varying,
    features text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 254 (class 1259 OID 124576)
-- Name: midrange_lodges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.midrange_lodges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 254
-- Name: midrange_lodges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.midrange_lodges_id_seq OWNED BY public.midrange_lodges.id;


--
-- TOC entry 235 (class 1259 OID 116366)
-- Name: midrange_routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.midrange_routes (
    id bigint NOT NULL,
    park_name character varying(255) NOT NULL,
    route_name character varying(255) NOT NULL,
    description character varying(255),
    price double precision,
    show_price boolean DEFAULT true,
    status character varying(255) DEFAULT 'available'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    image_url character varying(255),
    desc_adventure_type character varying(255),
    desc_duration character varying(255),
    desc_meals character varying(255),
    desc_accommodation character varying(255),
    desc_activities character varying(255),
    desc_transport character varying(255),
    form_path character varying(255)
);


--
-- TOC entry 234 (class 1259 OID 116365)
-- Name: midrange_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.midrange_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 234
-- Name: midrange_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.midrange_routes_id_seq OWNED BY public.midrange_routes.id;


--
-- TOC entry 226 (class 1259 OID 99953)
-- Name: mountains; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 225 (class 1259 OID 99952)
-- Name: mountains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mountains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 225
-- Name: mountains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mountains_id_seq OWNED BY public.mountains.id;


--
-- TOC entry 218 (class 1259 OID 99684)
-- Name: nationalparks; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 217 (class 1259 OID 99683)
-- Name: nationalparks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 228 (class 1259 OID 108145)
-- Name: uface; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 227 (class 1259 OID 108144)
-- Name: uface_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.uface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 227
-- Name: uface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.uface_id_seq OWNED BY public.uface.id;


--
-- TOC entry 4845 (class 2604 OID 124532)
-- Name: budget_camps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_camps ALTER COLUMN id SET DEFAULT nextval('public.budget_camps_id_seq'::regclass);


--
-- TOC entry 4833 (class 2604 OID 116415)
-- Name: budget_hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_hotels ALTER COLUMN id SET DEFAULT nextval('public.budget_hotels_id_seq'::regclass);


--
-- TOC entry 4857 (class 2604 OID 124568)
-- Name: budget_lodges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_lodges ALTER COLUMN id SET DEFAULT nextval('public.budget_lodges_id_seq'::regclass);


--
-- TOC entry 4824 (class 2604 OID 116383)
-- Name: budget_routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_routes ALTER COLUMN id SET DEFAULT nextval('public.budget_routes_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 108159)
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 116440)
-- Name: face_camps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.face_camps ALTER COLUMN id SET DEFAULT nextval('public.face_camps_id_seq'::regclass);


--
-- TOC entry 4829 (class 2604 OID 116397)
-- Name: face_hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.face_hotels ALTER COLUMN id SET DEFAULT nextval('public.face_hotels_id_seq'::regclass);


--
-- TOC entry 4853 (class 2604 OID 124556)
-- Name: face_lodges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.face_lodges ALTER COLUMN id SET DEFAULT nextval('public.face_lodge_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 99828)
-- Name: luxury_camps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_camps ALTER COLUMN id SET DEFAULT nextval('public.camp_hotels_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 99757)
-- Name: luxury_hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_hotels ALTER COLUMN id SET DEFAULT nextval('public.luxury_hotels_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 99899)
-- Name: luxury_lodges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_lodges ALTER COLUMN id SET DEFAULT nextval('public.lodges_id_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 116352)
-- Name: luxury_routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_routes ALTER COLUMN id SET DEFAULT nextval('public.luxury_routes_id_seq'::regclass);


--
-- TOC entry 4849 (class 2604 OID 124544)
-- Name: midrange_camps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.midrange_camps ALTER COLUMN id SET DEFAULT nextval('public.midrange_camps_id_seq'::regclass);


--
-- TOC entry 4861 (class 2604 OID 124580)
-- Name: midrange_lodges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.midrange_lodges ALTER COLUMN id SET DEFAULT nextval('public.midrange_lodges_id_seq'::regclass);


--
-- TOC entry 4819 (class 2604 OID 116369)
-- Name: midrange_routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.midrange_routes ALTER COLUMN id SET DEFAULT nextval('public.midrange_routes_id_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 99956)
-- Name: mountains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mountains ALTER COLUMN id SET DEFAULT nextval('public.mountains_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 108148)
-- Name: uface id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uface ALTER COLUMN id SET DEFAULT nextval('public.uface_id_seq'::regclass);


--
-- TOC entry 5083 (class 0 OID 124529)
-- Dependencies: 247
-- Data for Name: budget_camps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.budget_camps (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, from_path, form_path) FROM stdin;
1	Available 		Tananana		\N	USD		\N	2026-02-10 16:27:20.600973	https://images.pexels.com/photos/17831034/pexels-photo-17831034.jpeg		1
2	Star Camp	near destinaion	Tanzania	arusha hometown	23.00	USD	photo taking	\N	2026-02-10 16:28:51.841065	https://images.pexels.com/photos/9491328/pexels-photo-9491328.jpeg	1	1
3	Moon Camp 	Group Safari	Tanzania	obi@gmail.com	232.00	USD	free WIFI & TEA Coffee	\N	\N	https://images.pexels.com/photos/13621218/pexels-photo-13621218.jpeg	1	1
4	Free Camp	Moshi	Tanzania	moshi@gmail.com	232.00	USD	free luggage carrying 	\N	\N	https://images.pexels.com/photos/35509512/pexels-photo-35509512.jpeg	1	1
\.


--
-- TOC entry 5077 (class 0 OID 116412)
-- Dependencies: 241
-- Data for Name: budget_hotels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.budget_hotels (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	TanTan Budget Hotel	Arusha	Tanzania Country	Address kindly check our main page below	15	USD	welcome to BigPanda's Arena	2026-02-10 12:22:46.580528	2026-02-11 11:53:12.782679	https://images.pexels.com/photos/4907459/pexels-photo-4907459.jpeg	1
2	Super BUdget Hotels	Available please contact obi🙏 	Tanzania Country	+86 130 1394 8115	19	USD	Budget Hotels BigPanda offers best minimal prices ❤️\r\n	2026-02-11 11:55:04.965253	2026-02-11 11:55:04.965253	https://images.pexels.com/photos/13463929/pexels-photo-13463929.jpeg	2
3	Kimo Budget Hotle	in Moshin Region	Tanzania 		34	USD	All features are presents with great Hospitability 🙏❤️\r\n\r\n	2026-02-11 11:56:50.82368	2026-02-11 11:57:30.804405	https://images.pexels.com/photos/6962992/pexels-photo-6962992.jpeg	3
\.


--
-- TOC entry 5089 (class 0 OID 124565)
-- Dependencies: 253
-- Data for Name: budget_lodges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.budget_lodges (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	Celciu Budget Lodge	Avaiable in Arusha 	Location Tanzania	contact Seu for more information	323	USD	❤️\r\n	\N	2026-02-11 12:13:59.145868	https://images.pexels.com/photos/34221261/pexels-photo-34221261.jpeg	1
2	Kili Budget Lodge	Available Moshi	Location Tanzania 	Please kindly contact Obi and Seuri ❤️	354	USD	❤️\r\n	\N	\N	https://images.pexels.com/photos/14025037/pexels-photo-14025037.jpeg	2
3	Ubor Budget Lodge	Available Kenya	Location Kenya Nairobi	Please kindly contact Obi and Seuri ❤️	53	USD	❤️\r\n	\N	\N	https://images.pexels.com/photos/19737829/pexels-photo-19737829.jpeg	3
\.


--
-- TOC entry 5073 (class 0 OID 116380)
-- Dependencies: 237
-- Data for Name: budget_routes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.budget_routes (id, park_name, route_name, description, price, show_price, status, created_at, updated_at, image_url, desc_adventure_type, desc_duration, desc_meals, desc_accommodation, desc_activities, desc_transport, form_path) FROM stdin;
1	4 - Days Maasai Mara Lake Nakuru Budget Kenya Safari Tour	Best Sellers 	Shared tour (max 7 people per vehicle) - Budget - Tented Camp & Hotel\r\n\r\nYou Visit: Nairobi (Start), Masai Mara NR, Lake Nakuru NP, Nairobi (End)	560	t	available	2026-02-09 21:58:19.344876	2026-02-11 10:49:17.126796	https://images.pexels.com/photos/34141832/pexels-photo-34141832.jpeg	Budget tour, kids are allowed too	Maximum of 4 Days only	Meals are available with free breakfast	 Best Chinese Translator	Game reserve, Photos are allowed 	Transportation included 	1
3	7 - Day Best Safari Tanzania	BigPandas Bonus Today!!!	Arusha (Start), Arusha NP, Tarangire NP, Serengeti NP, Ngorongoro Crater, Lake Manyara NP, Arusha (End)	2499	t	available	2026-02-11 10:56:37.390125	2026-02-11 10:56:37.390125	https://images.pexels.com/photos/31995217/pexels-photo-31995217.jpeg	tent & camps available	maximum of 7- Days only 		Freedom adventure 			3
4	44 - Day Tarangire, Serengeti & Ngorongoro Budget Camping	Available now	 Arusha (Start), Tarangire NP, Serengeti NP, Ngorongoro Crater, Arusha (End)	1871	t	available	2026-02-11 11:00:33.368876	2026-02-11 11:00:33.369901	https://images.pexels.com/photos/15041589/pexels-photo-15041589.jpeg	Camping & tents Route	Duration of 4 Days only 	Meals are availble			Airport Pickup included 	4
2	3 - Days Amaizing Northern Tanzania 	Bigpanda Special offer on April	 Arusha (Start), Tarangire NP, Serengeti NP, Ngorongoro Crater, Lake Manyara NP, Arusha (End)	1955	t	available	2026-02-10 05:49:29.895113	2026-02-11 17:13:05.576898	https://images.pexels.com/photos/416074/pexels-photo-416074.jpeg	Best session on April 	23	Meals(breakfast,lunch,Dinner) included 	make your booking now 	photos are allowed, 	all transportation available 	2
\.


--
-- TOC entry 5066 (class 0 OID 108156)
-- Dependencies: 230
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.currency (id, name, code, rate, symbol, description, image_url, created_at, updated_at) FROM stdin;
1	Usd dollar	USD	364.0000		only yuan , usd and tzs are aceptble 	https://images.pexels.com/photos/35329907/pexels-photo-35329907.jpeg	2026-02-07 12:34:21.832093	2026-02-07 12:34:21.832093
\.


--
-- TOC entry 5081 (class 0 OID 116437)
-- Dependencies: 245
-- Data for Name: face_camps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.face_camps (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
2	Mid-Range Camps	Available 	Tanzania		544.00	USD	free WIFI, snacks	2026-02-10 15:14:01.023081	2026-02-10 15:14:01.023081	https://images.pexels.com/photos/2662816/pexels-photo-2662816.jpeg	1
3	Budget Camps	available with friendly prices	Africa	close to your choosen route or national park	65.00	USD	free snacks, free RIDE etc	2026-02-10 15:15:40.382706	2026-02-10 15:15:40.382706	https://images.pexels.com/photos/1309586/pexels-photo-1309586.jpeg	1
1	Luxury Camps	Available Everywhere 	Africa		1.00	USD	swimming, free WIFI, house cleaning each moment	2026-02-10 15:01:20.219842	2026-02-10 15:16:25.00537	https://images.pexels.com/photos/35509820/pexels-photo-35509820.jpeg	1
\.


--
-- TOC entry 5075 (class 0 OID 116394)
-- Dependencies: 239
-- Data for Name: face_hotels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.face_hotels (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	BigPanda's Luxury Hotels ❤️	Note: for any Travellors using our company and decide to book Hotels on their own, we will NOT engage in future Hotels troubles apart from providing correct service selected	Location of Each Luxury Hotels has been classified kindly view ❤️	uaya	2	GBP	Elegant five-star comfort with world-class service and unforgettable luxury. ✨🏨\r\n	2026-02-10 06:38:33.361988	2026-02-11 15:48:25.294581	https://images.pexels.com/photos/6466295/pexels-photo-6466295.jpeg	2
2	BigPanda's Mid-Range Hotels	Note: for any Travellors using our company and decide to book Hotels on their own, we will NOT engage in future Hotels troubles apart from providing correct service selected	Different MidRange exists Different Locations 	More details Please contact Seu	1	USD	Comfortable, stylish stays with great service at a fair price. 🏨✨\r\n	2026-02-10 06:59:40.9962	2026-02-11 15:51:09.501116	https://images.pexels.com/photos/30336915/pexels-photo-30336915.jpeg	1
3	BigPanda's Budget Hotel	Note: for any Travellors using our company and decide to book Hotels on their own, we will NOT engage in future Hotels troubles apart from providing correct service selected	Location of Each Budget Hotels has been classified kindly view ❤️	obi	100	USD	Clean, friendly, and affordable stays perfect for smart travelers. 🛏️🌍\r\n	2026-02-10 07:00:39.335929	2026-02-11 15:53:43.167327	https://images.pexels.com/photos/8125508/pexels-photo-8125508.jpeg	1
\.


--
-- TOC entry 5087 (class 0 OID 124553)
-- Dependencies: 251
-- Data for Name: face_lodges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.face_lodges (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	Mid-Range Lodges	Work 24/7	Africa	+ 86 130 1394 8115	11	USD	Accomodation available	\N	\N	https://images.pexels.com/photos/9130979/pexels-photo-9130979.jpeg	1
2	Luxury Lodges	Available now, please contact Obi	Africa Content	obi@gmail.com	12111	USD	All services available with  epic services 	\N	\N	https://images.pexels.com/photos/9297000/pexels-photo-9297000.jpeg	1
3	Budget Lodges	Available now for you	Africa	contact Obi	32	USD	Feel at Home with BigPanda Greate services	\N	2026-02-10 21:34:20.029372	https://images.pexels.com/photos/6790680/pexels-photo-6790680.jpeg	1
\.


--
-- TOC entry 5067 (class 0 OID 116336)
-- Dependencies: 231
-- Data for Name: face_route; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.face_route (id, park_name, route_name, description, price, show_price, status, created_at, updated_at, image_url, desc_adventure_type, desc_duration, desc_meals, desc_accommodation, desc_activities, desc_transport, form_path) FROM stdin;
27	Mid-Range routes	BigPanda'sBest MidRange Routes ❤️	Affordable comfort with unforgettable adventures — perfect balance of quality, experience, and value. 🌍✨\r\n	2	f	available	2026-02-09 14:05:54.505691	2026-02-11 15:31:17.337362	https://images.pexels.com/photos/28037215/pexels-photo-28037215.jpeg	Midrange Best and acceptable ❤️	Within Mid-Range Route Each Selected Route Contains soecific Duration & Prices. Note Prices Will be changing 	This Mid-Range Routes Contains Meals to Every Customer selecting it ❤️	Also Accomodation available!!	Each Path under this route has special Activities kindly open to learn More. 🙏	Transportations are highly assured with great safety under this Route 🔒	
20	BigPanda's Luxury Routes ❤️	Best Sellers	Exclusive, first-class experiences with premium comfort, private service, and unforgettable elegance. ✨🌍\r\n	1	f	available	2026-02-09 10:36:48.183842	2026-02-11 15:37:58.561241	https://images.pexels.com/photos/10740862/pexels-photo-10740862.jpeg	Luxury Routes Offers Great potentional  & Good Experience 	Duration of each Luxury Route is clearly avaialble in each path route	All meals are included freely ❤️	(Hostel, Lodgess & Camps & Tents are included all with free WIFI ❤️	All special park activities included with maximum security to each customers 🔒	Transportation is we Guarantee 🚗✈️	\N
22	BigPanda's Budget Routes ❤️	Available at anytime	Smart, affordable adventures designed to give you the best experience at the lowest cost. 🌍💰\r\n	\N	t	available	2026-02-09 12:58:40.901858	2026-02-11 15:42:40.816298	https://images.pexels.com/photos/32457066/pexels-photo-32457066.jpeg	Budget routes are designedfor loweest price with still great services	Maximum time for each travellors under this route is clearly written in each path	Meals under this route are categorize if available or not on each path 	Hostel,Lodges,Tents & Camps available 	All activiteies are well included with pure security 🔒	Transportation are also categorized under this route 	
\.


--
-- TOC entry 5058 (class 0 OID 99817)
-- Dependencies: 222
-- Data for Name: luxury_camps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.luxury_camps (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, from_path, form_path) FROM stdin;
1	Tanuru Luxury Camps	Dododma	Tanzania	Please kindly contact Obi and Seuri ❤️	54.00	USD	fireworkers Play\r\nchoma nyama\r\nFree Wifi 	\N	2026-02-11 12:02:26.146367	https://images.pexels.com/photos/5364961/pexels-photo-5364961.jpeg	\N	\N
4	New life Camps	zanzibar 	Tanzania	Please Contact Seuri	54.00	USD	❤️\r\n	\N	2026-02-11 12:03:38.001137	https://images.pexels.com/photos/4989501/pexels-photo-4989501.jpeg	\N	\N
3	5 star Camps	Arusha	Tanzania	Contact Seur Now	211.00	USD	chapat\r\nmorning breakfast\r\n❤️\r\n	\N	2026-02-11 12:05:05.758054	https://images.pexels.com/photos/5358926/pexels-photo-5358926.jpeg	\N	\N
2	5- Stars Camps 	Zanzibar	Tanzania	Available now, please Contact Seu ❤️	65.00	USD	Al service available including free WIFI ❤️\r\n	\N	2026-02-11 12:05:44.749555	https://images.pexels.com/photos/5365267/pexels-photo-5365267.jpeg	\N	\N
\.


--
-- TOC entry 5056 (class 0 OID 99746)
-- Dependencies: 220
-- Data for Name: luxury_hotels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.luxury_hotels (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url) FROM stdin;
1	Elewana Arusha Hotel	Arusha	Tanzania	obi@gmail.com	323	USD	All service of Luxury Hotels side are Available ❤️\r\n	\N	2026-02-11 11:33:31.394251	https://images.pexels.com/photos/33824474/pexels-photo-33824474.jpeg
4	Zuri Hotel 	Zare Zanzibar	Tazania	contact Obi +130-1394-8115	\N	USD	All Luxury Hotels service Available ❤️❤️\r\n❤️	\N	\N	https://images.pexels.com/photos/161758/governor-s-mansion-montgomery-alabama-grand-staircase-161758.jpeg
2	Coffee Hostel	Arusha	Tanzania	contact Obi +86 130-1394-8115 via whatsapp	432	USD	Free meals and othr hotels services available with good quality!!!\r\n	\N	2026-02-11 11:38:14.021047	https://images.pexels.com/photos/33810140/pexels-photo-33810140.jpeg
3	5 - Star Hotels	Arusha	Tanzania	contact Obi available now in +86 130-1394-8115	423	USD	All Hotels services available with good Customer care experience ❤️\r\n	\N	2026-02-11 11:40:01.114455	https://images.pexels.com/photos/34559240/pexels-photo-34559240.jpeg
\.


--
-- TOC entry 5060 (class 0 OID 99888)
-- Dependencies: 224
-- Data for Name: luxury_lodges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.luxury_lodges (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	Tanzanite Lodges gold	Arusha	Location Tanzania	obi@gmail.com	100	USD	i i am not sure	\N	2026-02-11 12:10:54.608097	https://images.pexels.com/photos/18864959/pexels-photo-18864959.jpeg	
2	KenKen Lodge	Nairobi	Location Kenya	101 hao ❤️	2132	USD	Luxury suites drinks,wifi,care and Hostage	\N	2026-02-11 12:11:07.553881	https://images.pexels.com/photos/9130979/pexels-photo-9130979.jpeg	1
3	NInj Lodge Luxury 	Arusha	Location Tanzania	Please Make Contacts with Seu	232	USD	Welcome Home ❤️\r\n	\N	2026-02-11 12:11:17.52806	https://images.pexels.com/photos/279805/pexels-photo-279805.jpeg	2
\.


--
-- TOC entry 5069 (class 0 OID 116349)
-- Dependencies: 233
-- Data for Name: luxury_routes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.luxury_routes (id, park_name, route_name, description, price, show_price, status, created_at, updated_at, image_url, desc_adventure_type, desc_duration, desc_meals, desc_accommodation, desc_activities, desc_transport, form_path) FROM stdin;
1	7 - Day Journey of the WildBeest	BigPand Epic Luxury Tours	 Arusha (Start), Lake Manyara NP, Ngorongoro Crater, Central Serengeti NP, Serengeti NP, Arusha (End)	6120	t	available	2026-02-09 14:04:10.121839	2026-02-11 16:52:35.880745	https://images.pexels.com/photos/618960/pexels-photo-618960.jpeg	Luxury Tour with Kids Acceptable	Duration of 7- Days only with Best Experience EVER!!!	All Meals incuded free(BreakFast, Dinner & Lunch)	Hotels & Camp & Lodges❤️	❤️ All activities available	Aiport Pick up and return freely 	1
4	3 - Day Fly in & out Luxury ✈️	Panda's ❤️  Tours	: Zanzibar (Start), Central Serengeti NP, Ngorongoro Crater, Zanzibar (End)	3145	t	available	2026-02-11 11:27:32.582343	2026-02-11 16:53:49.810023	https://images.pexels.com/photos/5958628/pexels-photo-5958628.jpeg	Luxury Tour Group, Single or family all included 	Panda's Company over Dur of 3 Day to Enjoy	All meals are available with great customer care ❤️❤️❤️	Hotels availanble with freeWIFI 		🚗✈️ Transportation available with strong security 🔒	2
3	4 - Day Touch Of Wilderness Luxury	Experience Panda's Moments ❤️	 Arusha (Start), Lake Manyara NP, Serengeti NP, Ngorongoro Crater, Arusha (End)	3873	t	available	2026-02-11 11:18:39.189363	2026-02-11 16:55:11.313148	https://images.pexels.com/photos/33650635/pexels-photo-33650635.jpeg	❤️ Epic Luxury Experience 	Maximum Duration ofn 4 Days Care	All meals are included with great Love and neat preparations ❤️	❤️ Hostels,Lodges and Camps(Tented) available)	All activities and Best Language translator available 😊	🚗🚗Transport available with great Safety	3
2	5 - Day Living among Lions	❤️ Panda's Luxury Experience	 Arusha (Start), Lake Manyara NP, Serengeti NP, Ngorongoro Crater, Arusha (End)	4100	t	available	2026-02-11 11:13:42.404523	2026-02-11 16:57:23.484632	https://images.pexels.com/photos/26841265/pexels-photo-26841265.jpeg	Family Travel including Children are acceptable 	Duration of 5 days Only	All meals are included freely ❤️		Hiking,Photos all included with great Safety care	Transports 🚗✈️ Included	2
\.


--
-- TOC entry 5085 (class 0 OID 124541)
-- Dependencies: 249
-- Data for Name: midrange_camps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.midrange_camps (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, from_path, form_path) FROM stdin;
1	Festival Camps 	Arusha	Tanzania 	welcome 	\N	USD	Services 24/7	\N	\N	https://images.pexels.com/photos/1309586/pexels-photo-1309586.jpeg	1	 best sellers 
2	New Mid Camp 	Meru	Zanzibar	availble 	1.00	USD	photos, free lunch, free ride	\N	\N	https://images.pexels.com/photos/1687845/pexels-photo-1687845.jpeg	1	children are allowed 
3	Renal Camp 	Forest	Tanzania 	From Arusha to Mwanza	433.00	USD	Free Translater	\N	\N	https://images.pexels.com/photos/10552759/pexels-photo-10552759.jpeg	1	Enjoy 
4	Chemka Mid Camps 	Moshi Boma Ng'ombe 	Tanzania 	Good View 	100.00	USD	Only Adults allowed 	\N	\N	https://images.pexels.com/photos/18717342/pexels-photo-18717342.jpeg	1	Best Sellers 
\.


--
-- TOC entry 5079 (class 0 OID 116425)
-- Dependencies: 243
-- Data for Name: midrange_hotels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.midrange_hotels (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	mid range hotel  baby	Moshi	Tanzania	comntact Obi for more details 🙏	232	USD	Welcome experience with Bigpanda's Tours now ❤️\r\n	2026-02-10 12:53:44.408637	2026-02-11 11:42:50.336095	https://images.pexels.com/photos/5371570/pexels-photo-5371570.jpeg	1
2	Kubwa Hotel	Available in Arusha City	Tanzania 	Please contacto Obi 🙏	121	USD	Contact Obi for more details 🙏\r\n🙏\r\n	2026-02-11 11:44:22.878173	2026-02-11 11:44:22.878173	https://images.pexels.com/photos/7820321/pexels-photo-7820321.jpeg	2
3	Lush Stars Hotel	Please conact Obi now🙏	Please conact Obi now🙏	Please conact Obi now🙏	111	USD	All information, Please conact Obi now🙏	2026-02-11 11:45:55.549031	2026-02-11 11:45:55.549031	https://images.pexels.com/photos/6466295/pexels-photo-6466295.jpeg	3
4	6 - Stars	About City please contact Obi, owner of the Company direct through +86 130-1394-8115. Thanks 🙏	About Country details please contact Obi	🙏	11	USD	All features available \r\n🙏, welcome 	2026-02-11 11:48:25.30538	2026-02-11 11:48:25.30538	https://images.pexels.com/photos/5378703/pexels-photo-5378703.jpeg	3
\.


--
-- TOC entry 5091 (class 0 OID 124577)
-- Dependencies: 255
-- Data for Name: midrange_lodges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.midrange_lodges (id, name, city, country, address, price, currency, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	Star Mid Range Lodge ⭐⭐⭐	In Arusha Region	Location Tanzania		42	USD	Contact Seu ❤️\r\n	\N	2026-02-11 12:18:35.120583	https://images.pexels.com/photos/9297000/pexels-photo-9297000.jpeg	1
2	Kiss Lodge(Mid - Range)	Available in Moshi	Location Tanznia	contact Seu for more details	97	USD	Make contacts now ❤️\r\n	\N	\N	https://images.pexels.com/photos/14025911/pexels-photo-14025911.jpeg	2
3	Three Mid Range Lodge 	avaialble in rea	Zanzibar	contact Seu	433	USD	All featues available ❤️\r\n	\N	\N	https://images.pexels.com/photos/8298858/pexels-photo-8298858.jpeg	3
\.


--
-- TOC entry 5071 (class 0 OID 116366)
-- Dependencies: 235
-- Data for Name: midrange_routes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.midrange_routes (id, park_name, route_name, description, price, show_price, status, created_at, updated_at, image_url, desc_adventure_type, desc_duration, desc_meals, desc_accommodation, desc_activities, desc_transport, form_path) FROM stdin;
1	4 - Day Fly in MidRange HoneyMoon safaris 🐆	Best sellers Todays	Zanzibar (Starts) Serengeti, Ngorongoro Crater, Tarangire and Zanzibar Ends	2220	t	available	2026-02-09 21:34:44.141289	2026-02-11 16:00:30.207959	https://images.pexels.com/photos/29198900/pexels-photo-29198900.jpeg		4 Days Maximum	 Meals Available	tented & camp Safari			1
2	5 - Days Northern Parks MidRange Offer 	Jan, March Oct, Sept and December 	Arusha (Start), Tarangire NP, Ngorongoro Crater, Serengeti NP, Lake Manyara NP, Arusha (End)	2017	t	available	2026-02-11 10:34:53.609098	2026-02-11 16:40:55.016474	https://images.pexels.com/photos/13409974/pexels-photo-13409974.jpeg		5 Days Only 	Breakfast available free	Hotels, Tents.Camps 	All activiteies are well included with pure security 🔒		2
4	5 - Day MidRange Safari + Kili Excursion from Zanzibar	Special offers available this month!	 Zanzibar (Start), Tarangire NP, Serengeti NP, Ngorongoro Crater, Materuni Waterfalls (Highlight), Zanzibar (End)	\N	t	available	2026-02-11 10:43:47.755248	2026-02-11 16:44:48.857688	https://images.pexels.com/photos/33650548/pexels-photo-33650548.jpeg	Mid range offers best experience!!!	5 Days only with offer to increase Days 	Meals are allowed 	free WIFI	Children are not allowed(below 17) 	 Transport included 	3
3	7 - Day a mix of Migration	mid - Range lodges, tented & camps 	 Arusha (Start), Tarangire NP, Northern Serengeti NP, Central Serengeti NP, Ngorongoro Crater, Lake Eyasi, Arusha (End)	2763	t	available	2026-02-11 10:38:13.321127	2026-02-11 16:45:24.711492	https://images.pexels.com/photos/12756544/pexels-photo-12756544.jpeg	Special for Mid - Range Travellors 	7 Days only, can alter days 			Children are allowed 		4
\.


--
-- TOC entry 5062 (class 0 OID 99953)
-- Dependencies: 226
-- Data for Name: mountains; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mountains (id, name, features, created_at, updated_at, image_url, form_path) FROM stdin;
1	Mount Kilimanjaro	🌍 Africa’s highest mountain (5,895 m)\r\n\r\n🚶‍♂️ World-famous trekking & climbing destination\r\n\r\n❄️ Snow-capped peak near the equator\r\n\r\n⭐ Biggest tourist magnet in Tanzania	\N	2026-02-09 03:27:01.761368	https://images.pexels.com/photos/15993989/pexels-photo-15993989.jpeg	/mountain/kilimanjaro
5	Usambara Mountains	🌿 Famous for green scenery & cool climate\r\n\r\n🦋 Popular for hiking, eco-tourism & bird watching\r\n\r\n📍 Includes Lushoto	\N	2026-02-09 03:27:28.784564	https://images.pexels.com/photos/4861119/pexels-photo-4861119.jpeg	/mountain/usambara
2	Mount Oldoinyo Lengai	it once corrupts volcanoes 🌋 Known as the “Mountain of God” (by Maasai)\r\n\r\n🔥 Only active volcano with carbonatite lava\r\n\r\n📸 Very popular with adventure tourists & photographers	\N	2026-02-09 03:28:04.550477	https://images.pexels.com/photos/12432475/pexels-photo-12432475.jpeg	/mountain/lengai
3	Mount Meru	🌋 Active volcano near Arusha\r\n\r\n\r\n\r\n🥾 Popular acclimatization climb before Kilimanjaro\r\n\r\n\r\n\r\n🌿 Amazing wildlife views inside Arusha National Park	\N	2026-02-09 03:31:12.93363	https://images.pexels.com/photos/2063892/pexels-photo-2063892.jpeg	/mountain/meru
4	Mount Hanang	🏔️ One of the highest mountains in Tanzania\r\n\r\n🌄 Less crowded, peaceful trekking experience\r\n\r\n\r\n📍 Located in Manyara region	\N	2026-02-09 03:36:42.350341	https://images.pexels.com/photos/997443/pexels-photo-997443.jpeg	/mountain/hanang
\.


--
-- TOC entry 5054 (class 0 OID 99684)
-- Dependencies: 218
-- Data for Name: nationalparks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nationalparks (id, created_at, description, park_name, price, route_name, show_price, status, updated_at, image_url, visittime, animalnumber, form_path) FROM stdin;
12	2026-02-05 07:24:42.782983	Wildlife: Elephants, lions, giraffes, buffaloes	Saadani National Park	43	Location: Coastal Tanzania, along the Indian Ocean.	f	available	2026-02-09 06:27:21.137865	https://images.pexels.com/photos/6729635/pexels-photo-6729635.jpeg	🕒 Best time to visit: June – February.	over 10,000+ animals 	saadan
5	2026-02-02 12:40:48.363267	🦓 Wildlife: (mainly birds and small aquatic life)	🌊 Kikuletwa Hot Springs (Chemka)	0	Location: Near Boma la Ng’ombe, between Arusha and Moshi	f	available	2026-02-09 06:53:57.617273	https://images.pexels.com/photos/29865515/pexels-photo-29865515.jpeg	🕒 Best time to visit: June – October (dry season, clear water	(not a wildlife destination)	kikuletwa
9	2026-02-03 08:09:55.886832	🦓 Wildlife: Lions, cheetahs, elephants and more 	Serengeti National Park	3433	Location: Northern Tanzania, bordering Kenya’s Maasai Mara.	f	available	2026-02-09 06:26:16.198794	https://images.pexels.com/photos/12756544/pexels-photo-12756544.jpeg	🕒 Best time to visit: June – October; January – March	3,000,000+ animals.	serengeti
4	2026-02-02 12:39:51.126919	🌳 Famous for massive baobab trees and large elephant herds.	Tarangire National Park	3	Location: Northern Tanzania, south of the Serengeti.	f	available	2026-02-09 06:26:29.353527	https://images.pexels.com/photos/33837670/pexels-photo-33837670.jpeg	🕒 Best time to visit: June – October.	Over 50,000+ animals.	tarangire
13	2026-02-07 02:30:42.151642	🌊 Famous for tree-climbing lions, flamingos, and lush scenery.\r\n🦓 Wildlife: Elephants, baboons, hippos, giraffes, lions, birds.	Lake Manyara National Park	2	Location: At the base of the Great Rift Valley	f	available	2026-02-09 06:26:52.022855	https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg	🕒 Best time to visit: June – October (wildlife)	over 25,000+ animals 	manyara
10	2026-02-05 06:23:18.728787	⭐ Best for: Botany lovers, hiking, birdwatching.	Kitulo National Park	23	Location: Southern Highlands of Tanzania.	f	available	2026-02-09 06:27:03.038144	https://images.pexels.com/photos/868097/pexels-photo-868097.jpeg	🕒 Best time to visit: December – April (flower season).	plant-focused park	kitulo
11	2026-02-05 07:00:22.092648	🦓 Wildlife: Elephants, hippos, crocodiles, lions, wild dogs, buffaloes.	Nyerere National Park	32	Location: Southern Tanzania.	f	available	2026-02-09 06:27:12.429669	https://images.pexels.com/photos/6532270/pexels-photo-6532270.jpeg	🕒 Best time to visit: June – October	over 200,000+ animals	nyerere
3	2026-02-02 12:38:02.437315	🦁 Wildlife: Rhinos, lions, elephants	Ngorongoro Crater	3	ocation: Northern Tanzania	t	available	2026-02-09 05:59:27.61584	https://images.pexels.com/photos/35356079/pexels-photo-35356079.jpeg	Best time to visit:  June – October	over 30,000 animals 	ngorongoro
\.


--
-- TOC entry 5064 (class 0 OID 108145)
-- Dependencies: 228
-- Data for Name: uface; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.uface (id, park_name, about, description, image_url, visittime, animalnumber, form_path, created_at, updated_at) FROM stdin;
4	Mountain Adventure 	g	the best mountain in Tanzania ever !!!	https://images.pexels.com/photos/1271619/pexels-photo-1271619.jpeg	january to march	454	/mountain/all	2026-02-08 14:29:04.292267	2026-02-09 04:02:31.71562
5	Money Analysis 	best rates ever 	we only offer best rates for Dollar .,,yuan and Tz shiling  	https://images.pexels.com/photos/4968660/pexels-photo-4968660.jpeg	24/7 service available	Any amount feel free to make exchange	/money/all	2026-02-08 14:31:52.149931	2026-02-09 04:08:09.875379
1	All Famus National parks 	See the Beauty Of Tanzania	Make your Dream come true ❤️  💕  💗 🫶\r\n	https://images.pexels.com/photos/23710324/pexels-photo-23710324.jpeg	January to June best time also September to December 	View different types and species of Animals 		2026-02-06 23:45:15.112793	2026-02-09 09:53:32.688056
\.


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 246
-- Name: budget_camps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.budget_camps_id_seq', 4, true);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 240
-- Name: budget_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.budget_hotels_id_seq', 3, true);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 252
-- Name: budget_lodges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.budget_lodges_id_seq', 3, true);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 236
-- Name: budget_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.budget_routes_id_seq', 4, true);


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 221
-- Name: camp_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.camp_hotels_id_seq', 4, true);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 229
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.currency_id_seq', 1, true);


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 244
-- Name: face_camps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.face_camps_id_seq', 3, true);


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 238
-- Name: face_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.face_hotels_id_seq', 3, true);


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 250
-- Name: face_lodge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.face_lodge_id_seq', 3, true);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 223
-- Name: lodges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lodges_id_seq', 4, true);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 219
-- Name: luxury_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.luxury_hotels_id_seq', 4, true);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 232
-- Name: luxury_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.luxury_routes_id_seq', 4, true);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 248
-- Name: midrange_camps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.midrange_camps_id_seq', 4, true);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 242
-- Name: midrange_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.midrange_hotels_id_seq', 4, true);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 254
-- Name: midrange_lodges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.midrange_lodges_id_seq', 3, true);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 234
-- Name: midrange_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.midrange_routes_id_seq', 4, true);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 225
-- Name: mountains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mountains_id_seq', 5, true);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 217
-- Name: nationalparks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nationalparks_id_seq', 14, true);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 227
-- Name: uface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.uface_id_seq', 5, true);


--
-- TOC entry 4899 (class 2606 OID 124539)
-- Name: budget_camps budget_camps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_camps
    ADD CONSTRAINT budget_camps_pkey PRIMARY KEY (id);


--
-- TOC entry 4893 (class 2606 OID 116422)
-- Name: budget_hotels budget_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_hotels
    ADD CONSTRAINT budget_hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4905 (class 2606 OID 124575)
-- Name: budget_lodges budget_lodges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_lodges
    ADD CONSTRAINT budget_lodges_pkey PRIMARY KEY (id);


--
-- TOC entry 4888 (class 2606 OID 116391)
-- Name: budget_routes budget_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_routes
    ADD CONSTRAINT budget_routes_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 99830)
-- Name: luxury_camps camp_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_camps
    ADD CONSTRAINT camp_hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4878 (class 2606 OID 108165)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- TOC entry 4897 (class 2606 OID 116447)
-- Name: face_camps face_camps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.face_camps
    ADD CONSTRAINT face_camps_pkey PRIMARY KEY (id);


--
-- TOC entry 4891 (class 2606 OID 116404)
-- Name: face_hotels face_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.face_hotels
    ADD CONSTRAINT face_hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4903 (class 2606 OID 124563)
-- Name: face_lodges face_lodge_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.face_lodges
    ADD CONSTRAINT face_lodge_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 116347)
-- Name: face_route face_route_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.face_route
    ADD CONSTRAINT face_route_pkey PRIMARY KEY (id);


--
-- TOC entry 4872 (class 2606 OID 99901)
-- Name: luxury_lodges lodges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_lodges
    ADD CONSTRAINT lodges_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 99759)
-- Name: luxury_hotels luxury_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_hotels
    ADD CONSTRAINT luxury_hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 116360)
-- Name: luxury_routes luxury_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.luxury_routes
    ADD CONSTRAINT luxury_routes_pkey PRIMARY KEY (id);


--
-- TOC entry 4901 (class 2606 OID 124551)
-- Name: midrange_camps midrange_camps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.midrange_camps
    ADD CONSTRAINT midrange_camps_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 116435)
-- Name: midrange_hotels midrange_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.midrange_hotels
    ADD CONSTRAINT midrange_hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4907 (class 2606 OID 124587)
-- Name: midrange_lodges midrange_lodges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.midrange_lodges
    ADD CONSTRAINT midrange_lodges_pkey PRIMARY KEY (id);


--
-- TOC entry 4886 (class 2606 OID 116377)
-- Name: midrange_routes midrange_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.midrange_routes
    ADD CONSTRAINT midrange_routes_pkey PRIMARY KEY (id);


--
-- TOC entry 4874 (class 2606 OID 99962)
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 99690)
-- Name: nationalparks nationalparks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nationalparks
    ADD CONSTRAINT nationalparks_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 108154)
-- Name: uface uface_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uface
    ADD CONSTRAINT uface_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 1259 OID 116392)
-- Name: idx_budget_routes_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_budget_routes_status ON public.budget_routes USING btree (status);


--
-- TOC entry 4881 (class 1259 OID 116361)
-- Name: idx_luxury_routes_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_luxury_routes_status ON public.luxury_routes USING btree (status);


--
-- TOC entry 4884 (class 1259 OID 116378)
-- Name: idx_midrange_routes_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_midrange_routes_status ON public.midrange_routes USING btree (status);


-- Completed on 2026-02-11 19:02:01

--
-- PostgreSQL database dump complete
--

