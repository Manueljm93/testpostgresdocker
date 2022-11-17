--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 14.5

-- Started on 2022-11-17 15:38:55

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

--
-- TOC entry 8 (class 2615 OID 7688235)
-- Name: geostats; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA geostats;


ALTER SCHEMA geostats OWNER TO postgres;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: safeWeb; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "safeWeb";


ALTER SCHEMA "safeWeb" OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA "safeWeb"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "safeWeb" IS 'standard public schema';


--
-- TOC entry 4 (class 2615 OID 7709073)
-- Name: safeweb; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA safeweb;


ALTER SCHEMA safeweb OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 218 (class 1259 OID 7711865)
-- Name: actions; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.actions (
    id integer NOT NULL,
    action character varying(255),
    data text,
    date timestamp with time zone
);


ALTER TABLE geostats.actions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 7711863)
-- Name: actions_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.actions_id_seq OWNER TO postgres;

--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 217
-- Name: actions_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.actions_id_seq OWNED BY geostats.actions.id;


--
-- TOC entry 209 (class 1259 OID 7711815)
-- Name: applications; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.applications (
    id integer NOT NULL,
    app text,
    package text,
    version text,
    system boolean,
    "groupApp" integer,
    last_date timestamp with time zone
);


ALTER TABLE geostats.applications OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 7711813)
-- Name: applications_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.applications_id_seq OWNER TO postgres;

--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 208
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.applications_id_seq OWNED BY geostats.applications.id;


--
-- TOC entry 224 (class 1259 OID 7711897)
-- Name: completeds; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.completeds (
    id integer NOT NULL,
    result character varying(255),
    date timestamp with time zone,
    "actionId" integer,
    "deviceId" integer
);


ALTER TABLE geostats.completeds OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 7711895)
-- Name: completeds_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.completeds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.completeds_id_seq OWNER TO postgres;

--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 223
-- Name: completeds_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.completeds_id_seq OWNED BY geostats.completeds.id;


--
-- TOC entry 228 (class 1259 OID 7711916)
-- Name: defaultThiefs; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats."defaultThiefs" (
    id integer NOT NULL,
    touch boolean,
    screen boolean,
    background boolean,
    usb boolean,
    alarm boolean,
    pass boolean,
    "statusMessage" boolean,
    "messageTitle" text,
    "messageBody" text,
    photo boolean,
    quality character varying(255),
    recursive boolean,
    "timeImage" integer,
    email character varying(255),
    "statusTracking" boolean,
    "timeRequest" integer,
    "timeTracking" integer,
    date timestamp with time zone
);


ALTER TABLE geostats."defaultThiefs" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 7711914)
-- Name: defaultThiefs_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats."defaultThiefs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats."defaultThiefs_id_seq" OWNER TO postgres;

--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 227
-- Name: defaultThiefs_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats."defaultThiefs_id_seq" OWNED BY geostats."defaultThiefs".id;


--
-- TOC entry 211 (class 1259 OID 7711828)
-- Name: devices; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.devices (
    id integer NOT NULL,
    so character varying(255),
    name text DEFAULT 'Automático'::text,
    type character varying(255),
    id_processor character varying(255),
    serial_number character varying(255),
    mac character varying(255),
    status_lock boolean,
    motive_lock character varying(255),
    id_device character varying(255),
    last_connection timestamp with time zone,
    identity character varying(255),
    "locationId" integer,
    "statId" integer
);


ALTER TABLE geostats.devices OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 7711885)
-- Name: devicesActions; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats."devicesActions" (
    "deviceId" integer NOT NULL,
    "actionId" integer NOT NULL
);


ALTER TABLE geostats."devicesActions" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 7711840)
-- Name: devicesApplication; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats."devicesApplication" (
    "deviceId" integer NOT NULL,
    "applicationId" integer NOT NULL
);


ALTER TABLE geostats."devicesApplication" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 7711853)
-- Name: devicesGroup; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats."devicesGroup" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer NOT NULL,
    "groupId" integer NOT NULL
);


ALTER TABLE geostats."devicesGroup" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 7711826)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.devices_id_seq OWNER TO postgres;

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 210
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.devices_id_seq OWNED BY geostats.devices.id;


--
-- TOC entry 205 (class 1259 OID 7711796)
-- Name: findings; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.findings (
    id integer NOT NULL,
    findings character varying(255),
    date time without time zone,
    "deviceId" integer
);


ALTER TABLE geostats.findings OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 7711794)
-- Name: findings_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.findings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.findings_id_seq OWNER TO postgres;

--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 204
-- Name: findings_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.findings_id_seq OWNED BY geostats.findings.id;


--
-- TOC entry 214 (class 1259 OID 7711847)
-- Name: groups; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.groups (
    id integer NOT NULL,
    name character varying(255),
    visible boolean,
    user_id integer,
    date timestamp with time zone,
    "preferencesId" integer
);


ALTER TABLE geostats.groups OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 7711890)
-- Name: groupsActions; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats."groupsActions" (
    "groupId" integer NOT NULL,
    "actionId" integer NOT NULL
);


ALTER TABLE geostats."groupsActions" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 7711845)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.groups_id_seq OWNER TO postgres;

--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 213
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.groups_id_seq OWNED BY geostats.groups.id;


--
-- TOC entry 201 (class 1259 OID 7711774)
-- Name: locations; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.locations (
    id integer NOT NULL,
    lat double precision,
    lon double precision,
    acc double precision,
    ip_wan character varying(255),
    ip_lan character varying(255),
    place character varying(255),
    date timestamp with time zone,
    "deviceId" integer
);


ALTER TABLE geostats.locations OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 7711772)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.locations_id_seq OWNER TO postgres;

--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 200
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.locations_id_seq OWNED BY geostats.locations.id;


--
-- TOC entry 226 (class 1259 OID 7711905)
-- Name: preferences; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.preferences (
    id integer NOT NULL,
    time_connection integer,
    time_persistence integer,
    use_other boolean,
    use_google boolean,
    stats boolean,
    aplications boolean,
    "browserList" text,
    time_location integer,
    url_google character varying(255),
    key_google character varying(255),
    user_id integer,
    "Ws_port" integer,
    date timestamp with time zone,
    "defaultThiefId" integer
);


ALTER TABLE geostats.preferences OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 7711903)
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.preferences_id_seq OWNER TO postgres;

--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 225
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.preferences_id_seq OWNED BY geostats.preferences.id;


--
-- TOC entry 207 (class 1259 OID 7711804)
-- Name: stats; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.stats (
    id integer NOT NULL,
    "Ram" text,
    "Disk" text,
    las_date timestamp with time zone
);


ALTER TABLE geostats.stats OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 7711802)
-- Name: stats_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.stats_id_seq OWNER TO postgres;

--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 206
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.stats_id_seq OWNED BY geostats.stats.id;


--
-- TOC entry 220 (class 1259 OID 7711876)
-- Name: thiefs; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.thiefs (
    id integer NOT NULL,
    identity character varying(255),
    order_id character varying(255),
    images text,
    path character varying(255),
    date timestamp with time zone
);


ALTER TABLE geostats.thiefs OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 7711874)
-- Name: thiefs_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.thiefs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.thiefs_id_seq OWNER TO postgres;

--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 219
-- Name: thiefs_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.thiefs_id_seq OWNED BY geostats.thiefs.id;


--
-- TOC entry 203 (class 1259 OID 7711785)
-- Name: trackings; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.trackings (
    id integer NOT NULL,
    order_id bigint,
    tracking text,
    date_order timestamp with time zone,
    date_finish timestamp with time zone,
    "deviceId" integer
);


ALTER TABLE geostats.trackings OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 7711783)
-- Name: trackings_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.trackings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.trackings_id_seq OWNER TO postgres;

--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 202
-- Name: trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.trackings_id_seq OWNED BY geostats.trackings.id;


--
-- TOC entry 199 (class 1259 OID 7711763)
-- Name: users; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats.users (
    id integer NOT NULL,
    "user" character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255),
    last character varying(255),
    phone character varying(255),
    email character varying(255),
    range integer NOT NULL,
    geo_id integer,
    date timestamp with time zone,
    session_id character varying(255)
);


ALTER TABLE geostats.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 7711858)
-- Name: usersGroup; Type: TABLE; Schema: geostats; Owner: postgres
--

CREATE TABLE geostats."usersGroup" (
    "userId" integer NOT NULL,
    "groupId" integer NOT NULL
);


ALTER TABLE geostats."usersGroup" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 7711761)
-- Name: users_id_seq; Type: SEQUENCE; Schema: geostats; Owner: postgres
--

CREATE SEQUENCE geostats.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geostats.users_id_seq OWNER TO postgres;

--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: geostats; Owner: postgres
--

ALTER SEQUENCE geostats.users_id_seq OWNED BY geostats.users.id;


--
-- TOC entry 231 (class 1259 OID 7711995)
-- Name: blackDevices; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."blackDevices" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "blackListId" integer NOT NULL,
    "deviceId" integer NOT NULL
);


ALTER TABLE "safeWeb"."blackDevices" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 7711986)
-- Name: blackLists; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."blackLists" (
    id integer NOT NULL,
    url text,
    suspect boolean,
    count integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "safeWeb"."blackLists" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 7711984)
-- Name: blackLists_id_seq; Type: SEQUENCE; Schema: safeWeb; Owner: postgres
--

CREATE SEQUENCE "safeWeb"."blackLists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "safeWeb"."blackLists_id_seq" OWNER TO postgres;

--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 229
-- Name: blackLists_id_seq; Type: SEQUENCE OWNED BY; Schema: safeWeb; Owner: postgres
--

ALTER SEQUENCE "safeWeb"."blackLists_id_seq" OWNED BY "safeWeb"."blackLists".id;


--
-- TOC entry 233 (class 1259 OID 7712012)
-- Name: keywordsLists; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."keywordsLists" (
    id integer NOT NULL,
    keyword text,
    percent integer,
    "create" timestamp with time zone
);


ALTER TABLE "safeWeb"."keywordsLists" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 7712010)
-- Name: keywordsLists_id_seq; Type: SEQUENCE; Schema: safeWeb; Owner: postgres
--

CREATE SEQUENCE "safeWeb"."keywordsLists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "safeWeb"."keywordsLists_id_seq" OWNER TO postgres;

--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 232
-- Name: keywordsLists_id_seq; Type: SEQUENCE OWNED BY; Schema: safeWeb; Owner: postgres
--

ALTER SEQUENCE "safeWeb"."keywordsLists_id_seq" OWNED BY "safeWeb"."keywordsLists".id;


--
-- TOC entry 238 (class 1259 OID 7712045)
-- Name: queryDevices; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."queryDevices" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "queryListId" integer NOT NULL,
    "deviceId" integer NOT NULL
);


ALTER TABLE "safeWeb"."queryDevices" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 7712036)
-- Name: queryLists; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."queryLists" (
    id integer NOT NULL,
    url text,
    count integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "safeWeb"."queryLists" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 7712034)
-- Name: queryLists_id_seq; Type: SEQUENCE; Schema: safeWeb; Owner: postgres
--

CREATE SEQUENCE "safeWeb"."queryLists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "safeWeb"."queryLists_id_seq" OWNER TO postgres;

--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 236
-- Name: queryLists_id_seq; Type: SEQUENCE OWNED BY; Schema: safeWeb; Owner: postgres
--

ALTER SEQUENCE "safeWeb"."queryLists_id_seq" OWNED BY "safeWeb"."queryLists".id;


--
-- TOC entry 235 (class 1259 OID 7712023)
-- Name: sfwbPreferences; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."sfwbPreferences" (
    id integer NOT NULL,
    "blackList" boolean,
    "whiteList" boolean,
    "keyWords" boolean,
    "preferenceId" integer
);


ALTER TABLE "safeWeb"."sfwbPreferences" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 7712021)
-- Name: sfwbPreferences_id_seq; Type: SEQUENCE; Schema: safeWeb; Owner: postgres
--

CREATE SEQUENCE "safeWeb"."sfwbPreferences_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "safeWeb"."sfwbPreferences_id_seq" OWNER TO postgres;

--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 234
-- Name: sfwbPreferences_id_seq; Type: SEQUENCE OWNED BY; Schema: safeWeb; Owner: postgres
--

ALTER SEQUENCE "safeWeb"."sfwbPreferences_id_seq" OWNED BY "safeWeb"."sfwbPreferences".id;


--
-- TOC entry 241 (class 1259 OID 7712071)
-- Name: whiteDevices; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."whiteDevices" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "whiteListId" integer NOT NULL,
    "deviceId" integer NOT NULL
);


ALTER TABLE "safeWeb"."whiteDevices" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 7712062)
-- Name: whiteLists; Type: TABLE; Schema: safeWeb; Owner: postgres
--

CREATE TABLE "safeWeb"."whiteLists" (
    id integer NOT NULL,
    url text,
    count integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "safeWeb"."whiteLists" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 7712060)
-- Name: whiteLists_id_seq; Type: SEQUENCE; Schema: safeWeb; Owner: postgres
--

CREATE SEQUENCE "safeWeb"."whiteLists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "safeWeb"."whiteLists_id_seq" OWNER TO postgres;

--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 239
-- Name: whiteLists_id_seq; Type: SEQUENCE OWNED BY; Schema: safeWeb; Owner: postgres
--

ALTER SEQUENCE "safeWeb"."whiteLists_id_seq" OWNED BY "safeWeb"."whiteLists".id;


--
-- TOC entry 2943 (class 2604 OID 7711868)
-- Name: actions id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.actions ALTER COLUMN id SET DEFAULT nextval('geostats.actions_id_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 7711818)
-- Name: applications id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.applications ALTER COLUMN id SET DEFAULT nextval('geostats.applications_id_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 7711900)
-- Name: completeds id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.completeds ALTER COLUMN id SET DEFAULT nextval('geostats.completeds_id_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 7711919)
-- Name: defaultThiefs id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats."defaultThiefs" ALTER COLUMN id SET DEFAULT nextval('geostats."defaultThiefs_id_seq"'::regclass);


--
-- TOC entry 2940 (class 2604 OID 7711831)
-- Name: devices id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.devices ALTER COLUMN id SET DEFAULT nextval('geostats.devices_id_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 7711799)
-- Name: findings id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.findings ALTER COLUMN id SET DEFAULT nextval('geostats.findings_id_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 7711850)
-- Name: groups id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.groups ALTER COLUMN id SET DEFAULT nextval('geostats.groups_id_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 7711777)
-- Name: locations id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.locations ALTER COLUMN id SET DEFAULT nextval('geostats.locations_id_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 7711908)
-- Name: preferences id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.preferences ALTER COLUMN id SET DEFAULT nextval('geostats.preferences_id_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 7711807)
-- Name: stats id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.stats ALTER COLUMN id SET DEFAULT nextval('geostats.stats_id_seq'::regclass);


--
-- TOC entry 2944 (class 2604 OID 7711879)
-- Name: thiefs id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.thiefs ALTER COLUMN id SET DEFAULT nextval('geostats.thiefs_id_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 7711788)
-- Name: trackings id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.trackings ALTER COLUMN id SET DEFAULT nextval('geostats.trackings_id_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 7711766)
-- Name: users id; Type: DEFAULT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.users ALTER COLUMN id SET DEFAULT nextval('geostats.users_id_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 7711989)
-- Name: blackLists id; Type: DEFAULT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."blackLists" ALTER COLUMN id SET DEFAULT nextval('"safeWeb"."blackLists_id_seq"'::regclass);


--
-- TOC entry 2949 (class 2604 OID 7712015)
-- Name: keywordsLists id; Type: DEFAULT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."keywordsLists" ALTER COLUMN id SET DEFAULT nextval('"safeWeb"."keywordsLists_id_seq"'::regclass);


--
-- TOC entry 2951 (class 2604 OID 7712039)
-- Name: queryLists id; Type: DEFAULT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."queryLists" ALTER COLUMN id SET DEFAULT nextval('"safeWeb"."queryLists_id_seq"'::regclass);


--
-- TOC entry 2950 (class 2604 OID 7712026)
-- Name: sfwbPreferences id; Type: DEFAULT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."sfwbPreferences" ALTER COLUMN id SET DEFAULT nextval('"safeWeb"."sfwbPreferences_id_seq"'::regclass);


--
-- TOC entry 2952 (class 2604 OID 7712065)
-- Name: whiteLists id; Type: DEFAULT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."whiteLists" ALTER COLUMN id SET DEFAULT nextval('"safeWeb"."whiteLists_id_seq"'::regclass);


--
-- TOC entry 3170 (class 0 OID 7711865)
-- Dependencies: 218
-- Data for Name: actions; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.actions (id, action, data, date) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 7711815)
-- Dependencies: 209
-- Data for Name: applications; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.applications (id, app, package, version, system, "groupApp", last_date) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 7711897)
-- Dependencies: 224
-- Data for Name: completeds; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.completeds (id, result, date, "actionId", "deviceId") FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 7711916)
-- Dependencies: 228
-- Data for Name: defaultThiefs; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats."defaultThiefs" (id, touch, screen, background, usb, alarm, pass, "statusMessage", "messageTitle", "messageBody", photo, quality, recursive, "timeImage", email, "statusTracking", "timeRequest", "timeTracking", date) FROM stdin;
1	f	f	f	f	f	f	f	Alerta de Robo!	Por Favor Devolver el Dispositivo al Esablecimiento!!	t	low	f	2	server.notify.monitoring.pixart@gmail.com	t	3	1	2022-11-17 12:28:43.781-03
\.


--
-- TOC entry 3163 (class 0 OID 7711828)
-- Dependencies: 211
-- Data for Name: devices; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.devices (id, so, name, type, id_processor, serial_number, mac, status_lock, motive_lock, id_device, last_connection, identity, "locationId", "statId") FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 7711885)
-- Dependencies: 221
-- Data for Name: devicesActions; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats."devicesActions" ("deviceId", "actionId") FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 7711840)
-- Dependencies: 212
-- Data for Name: devicesApplication; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats."devicesApplication" ("deviceId", "applicationId") FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 7711853)
-- Dependencies: 215
-- Data for Name: devicesGroup; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats."devicesGroup" ("createdAt", "updatedAt", "deviceId", "groupId") FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 7711796)
-- Dependencies: 205
-- Data for Name: findings; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.findings (id, findings, date, "deviceId") FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 7711847)
-- Dependencies: 214
-- Data for Name: groups; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.groups (id, name, visible, user_id, date, "preferencesId") FROM stdin;
1	Todos	f	1	2022-11-17 12:28:43.781-03	1
\.


--
-- TOC entry 3174 (class 0 OID 7711890)
-- Dependencies: 222
-- Data for Name: groupsActions; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats."groupsActions" ("groupId", "actionId") FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 7711774)
-- Dependencies: 201
-- Data for Name: locations; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.locations (id, lat, lon, acc, ip_wan, ip_lan, place, date, "deviceId") FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 7711905)
-- Dependencies: 226
-- Data for Name: preferences; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.preferences (id, time_connection, time_persistence, use_other, use_google, stats, aplications, "browserList", time_location, url_google, key_google, user_id, "Ws_port", date, "defaultThiefId") FROM stdin;
1	5	5	t	f	t	t	["com.android.chrome"]	15	\N	\N	1	8083	2022-11-17 12:28:43.781-03	1
\.


--
-- TOC entry 3159 (class 0 OID 7711804)
-- Dependencies: 207
-- Data for Name: stats; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.stats (id, "Ram", "Disk", las_date) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 7711876)
-- Dependencies: 220
-- Data for Name: thiefs; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.thiefs (id, identity, order_id, images, path, date) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 7711785)
-- Dependencies: 203
-- Data for Name: trackings; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.trackings (id, order_id, tracking, date_order, date_finish, "deviceId") FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 7711763)
-- Dependencies: 199
-- Data for Name: users; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats.users (id, "user", password, name, last, phone, email, range, geo_id, date, session_id) FROM stdin;
1	Admin	AdminPixart	admin	\N	123456789	soporte@pixartargentina.com	1	1	2022-11-17 12:28:43.781-03	\N
\.


--
-- TOC entry 3168 (class 0 OID 7711858)
-- Dependencies: 216
-- Data for Name: usersGroup; Type: TABLE DATA; Schema: geostats; Owner: postgres
--

COPY geostats."usersGroup" ("userId", "groupId") FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 7711995)
-- Dependencies: 231
-- Data for Name: blackDevices; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."blackDevices" ("createdAt", "updatedAt", "blackListId", "deviceId") FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 7711986)
-- Dependencies: 230
-- Data for Name: blackLists; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."blackLists" (id, url, suspect, count, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 7712012)
-- Dependencies: 233
-- Data for Name: keywordsLists; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."keywordsLists" (id, keyword, percent, "create") FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 7712045)
-- Dependencies: 238
-- Data for Name: queryDevices; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."queryDevices" ("createdAt", "updatedAt", "queryListId", "deviceId") FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 7712036)
-- Dependencies: 237
-- Data for Name: queryLists; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."queryLists" (id, url, count, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 7712023)
-- Dependencies: 235
-- Data for Name: sfwbPreferences; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."sfwbPreferences" (id, "blackList", "whiteList", "keyWords", "preferenceId") FROM stdin;
1	t	t	t	1
\.


--
-- TOC entry 3193 (class 0 OID 7712071)
-- Dependencies: 241
-- Data for Name: whiteDevices; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."whiteDevices" ("createdAt", "updatedAt", "whiteListId", "deviceId") FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 7712062)
-- Dependencies: 240
-- Data for Name: whiteLists; Type: TABLE DATA; Schema: safeWeb; Owner: postgres
--

COPY "safeWeb"."whiteLists" (id, url, count, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 217
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.actions_id_seq', 1, false);


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 208
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.applications_id_seq', 1, false);


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 223
-- Name: completeds_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.completeds_id_seq', 1, false);


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 227
-- Name: defaultThiefs_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats."defaultThiefs_id_seq"', 1, true);


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 210
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.devices_id_seq', 1, false);


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 204
-- Name: findings_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.findings_id_seq', 1, false);


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 213
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.groups_id_seq', 1, true);


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 200
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.locations_id_seq', 1, false);


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 225
-- Name: preferences_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.preferences_id_seq', 1, true);


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 206
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.stats_id_seq', 1, false);


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 219
-- Name: thiefs_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.thiefs_id_seq', 1, false);


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 202
-- Name: trackings_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.trackings_id_seq', 1, false);


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: geostats; Owner: postgres
--

SELECT pg_catalog.setval('geostats.users_id_seq', 1, true);


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 229
-- Name: blackLists_id_seq; Type: SEQUENCE SET; Schema: safeWeb; Owner: postgres
--

SELECT pg_catalog.setval('"safeWeb"."blackLists_id_seq"', 1, false);


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 232
-- Name: keywordsLists_id_seq; Type: SEQUENCE SET; Schema: safeWeb; Owner: postgres
--

SELECT pg_catalog.setval('"safeWeb"."keywordsLists_id_seq"', 1, false);


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 236
-- Name: queryLists_id_seq; Type: SEQUENCE SET; Schema: safeWeb; Owner: postgres
--

SELECT pg_catalog.setval('"safeWeb"."queryLists_id_seq"', 1, false);


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 234
-- Name: sfwbPreferences_id_seq; Type: SEQUENCE SET; Schema: safeWeb; Owner: postgres
--

SELECT pg_catalog.setval('"safeWeb"."sfwbPreferences_id_seq"', 1, true);


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 239
-- Name: whiteLists_id_seq; Type: SEQUENCE SET; Schema: safeWeb; Owner: postgres
--

SELECT pg_catalog.setval('"safeWeb"."whiteLists_id_seq"', 1, false);


--
-- TOC entry 2984 (class 2606 OID 7711873)
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 7711945)
-- Name: applications applications_package_key; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.applications
    ADD CONSTRAINT applications_package_key UNIQUE (package);


--
-- TOC entry 2966 (class 2606 OID 7711943)
-- Name: applications applications_package_key1; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.applications
    ADD CONSTRAINT applications_package_key1 UNIQUE (package);


--
-- TOC entry 2968 (class 2606 OID 7711823)
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- TOC entry 2992 (class 2606 OID 7711902)
-- Name: completeds completeds_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.completeds
    ADD CONSTRAINT completeds_pkey PRIMARY KEY (id);


--
-- TOC entry 2996 (class 2606 OID 7711924)
-- Name: defaultThiefs defaultThiefs_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats."defaultThiefs"
    ADD CONSTRAINT "defaultThiefs_pkey" PRIMARY KEY (id);


--
-- TOC entry 2988 (class 2606 OID 7711889)
-- Name: devicesActions devicesActions_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats."devicesActions"
    ADD CONSTRAINT "devicesActions_pkey" PRIMARY KEY ("deviceId", "actionId");


--
-- TOC entry 2976 (class 2606 OID 7711844)
-- Name: devicesApplication devicesApplication_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats."devicesApplication"
    ADD CONSTRAINT "devicesApplication_pkey" PRIMARY KEY ("deviceId", "applicationId");


--
-- TOC entry 2980 (class 2606 OID 7711857)
-- Name: devicesGroup devicesGroup_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats."devicesGroup"
    ADD CONSTRAINT "devicesGroup_pkey" PRIMARY KEY ("deviceId", "groupId");


--
-- TOC entry 2970 (class 2606 OID 7711953)
-- Name: devices devices_identity_key; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.devices
    ADD CONSTRAINT devices_identity_key UNIQUE (identity);


--
-- TOC entry 2972 (class 2606 OID 7711951)
-- Name: devices devices_identity_key1; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.devices
    ADD CONSTRAINT devices_identity_key1 UNIQUE (identity);


--
-- TOC entry 2974 (class 2606 OID 7711837)
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- TOC entry 2960 (class 2606 OID 7711801)
-- Name: findings findings_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.findings
    ADD CONSTRAINT findings_pkey PRIMARY KEY (id);


--
-- TOC entry 2990 (class 2606 OID 7711894)
-- Name: groupsActions groupsActions_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats."groupsActions"
    ADD CONSTRAINT "groupsActions_pkey" PRIMARY KEY ("groupId", "actionId");


--
-- TOC entry 2978 (class 2606 OID 7711852)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2956 (class 2606 OID 7711782)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 7711913)
-- Name: preferences preferences_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 7711812)
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- TOC entry 2986 (class 2606 OID 7711884)
-- Name: thiefs thiefs_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.thiefs
    ADD CONSTRAINT thiefs_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 7711793)
-- Name: trackings trackings_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.trackings
    ADD CONSTRAINT trackings_pkey PRIMARY KEY (id);


--
-- TOC entry 2982 (class 2606 OID 7711862)
-- Name: usersGroup usersGroup_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats."usersGroup"
    ADD CONSTRAINT "usersGroup_pkey" PRIMARY KEY ("userId", "groupId");


--
-- TOC entry 2954 (class 2606 OID 7711771)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3000 (class 2606 OID 7711999)
-- Name: blackDevices blackDevices_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."blackDevices"
    ADD CONSTRAINT "blackDevices_pkey" PRIMARY KEY ("blackListId", "deviceId");


--
-- TOC entry 2998 (class 2606 OID 7711994)
-- Name: blackLists blackLists_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."blackLists"
    ADD CONSTRAINT "blackLists_pkey" PRIMARY KEY (id);


--
-- TOC entry 3002 (class 2606 OID 7712020)
-- Name: keywordsLists keywordsLists_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."keywordsLists"
    ADD CONSTRAINT "keywordsLists_pkey" PRIMARY KEY (id);


--
-- TOC entry 3008 (class 2606 OID 7712049)
-- Name: queryDevices queryDevices_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."queryDevices"
    ADD CONSTRAINT "queryDevices_pkey" PRIMARY KEY ("queryListId", "deviceId");


--
-- TOC entry 3006 (class 2606 OID 7712044)
-- Name: queryLists queryLists_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."queryLists"
    ADD CONSTRAINT "queryLists_pkey" PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 7712028)
-- Name: sfwbPreferences sfwbPreferences_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."sfwbPreferences"
    ADD CONSTRAINT "sfwbPreferences_pkey" PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 7712075)
-- Name: whiteDevices whiteDevices_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."whiteDevices"
    ADD CONSTRAINT "whiteDevices_pkey" PRIMARY KEY ("whiteListId", "deviceId");


--
-- TOC entry 3010 (class 2606 OID 7712070)
-- Name: whiteLists whiteLists_pkey; Type: CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."whiteLists"
    ADD CONSTRAINT "whiteLists_pkey" PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 7711969)
-- Name: completeds completeds_actionId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.completeds
    ADD CONSTRAINT "completeds_actionId_fkey" FOREIGN KEY ("actionId") REFERENCES geostats.actions(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3020 (class 2606 OID 7711974)
-- Name: completeds completeds_deviceId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.completeds
    ADD CONSTRAINT "completeds_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES geostats.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3016 (class 2606 OID 7711954)
-- Name: devices devices_locationId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.devices
    ADD CONSTRAINT "devices_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES geostats.locations(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3017 (class 2606 OID 7711959)
-- Name: devices devices_statId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.devices
    ADD CONSTRAINT "devices_statId_fkey" FOREIGN KEY ("statId") REFERENCES geostats.stats(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3015 (class 2606 OID 7711935)
-- Name: findings findings_deviceId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.findings
    ADD CONSTRAINT "findings_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES geostats.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3018 (class 2606 OID 7711964)
-- Name: groups groups_preferencesId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.groups
    ADD CONSTRAINT "groups_preferencesId_fkey" FOREIGN KEY ("preferencesId") REFERENCES geostats.preferences(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3013 (class 2606 OID 7711925)
-- Name: locations locations_deviceId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.locations
    ADD CONSTRAINT "locations_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES geostats.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3021 (class 2606 OID 7711979)
-- Name: preferences preferences_defaultThiefId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.preferences
    ADD CONSTRAINT "preferences_defaultThiefId_fkey" FOREIGN KEY ("defaultThiefId") REFERENCES geostats."defaultThiefs"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3014 (class 2606 OID 7711930)
-- Name: trackings trackings_deviceId_fkey; Type: FK CONSTRAINT; Schema: geostats; Owner: postgres
--

ALTER TABLE ONLY geostats.trackings
    ADD CONSTRAINT "trackings_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES geostats.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3022 (class 2606 OID 7712000)
-- Name: blackDevices blackDevices_blackListId_fkey; Type: FK CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."blackDevices"
    ADD CONSTRAINT "blackDevices_blackListId_fkey" FOREIGN KEY ("blackListId") REFERENCES "safeWeb"."blackLists"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3023 (class 2606 OID 7712005)
-- Name: blackDevices blackDevices_deviceId_fkey; Type: FK CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."blackDevices"
    ADD CONSTRAINT "blackDevices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES geostats.devices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3026 (class 2606 OID 7712055)
-- Name: queryDevices queryDevices_deviceId_fkey; Type: FK CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."queryDevices"
    ADD CONSTRAINT "queryDevices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES geostats.devices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3025 (class 2606 OID 7712050)
-- Name: queryDevices queryDevices_queryListId_fkey; Type: FK CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."queryDevices"
    ADD CONSTRAINT "queryDevices_queryListId_fkey" FOREIGN KEY ("queryListId") REFERENCES "safeWeb"."queryLists"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3024 (class 2606 OID 7712029)
-- Name: sfwbPreferences sfwbPreferences_preferenceId_fkey; Type: FK CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."sfwbPreferences"
    ADD CONSTRAINT "sfwbPreferences_preferenceId_fkey" FOREIGN KEY ("preferenceId") REFERENCES geostats.preferences(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3028 (class 2606 OID 7712081)
-- Name: whiteDevices whiteDevices_deviceId_fkey; Type: FK CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."whiteDevices"
    ADD CONSTRAINT "whiteDevices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES geostats.devices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3027 (class 2606 OID 7712076)
-- Name: whiteDevices whiteDevices_whiteListId_fkey; Type: FK CONSTRAINT; Schema: safeWeb; Owner: postgres
--

ALTER TABLE ONLY "safeWeb"."whiteDevices"
    ADD CONSTRAINT "whiteDevices_whiteListId_fkey" FOREIGN KEY ("whiteListId") REFERENCES "safeWeb"."whiteLists"(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-11-17 15:39:19

--
-- PostgreSQL database dump complete
--

