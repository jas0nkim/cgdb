--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cgdb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO cgdb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cgdb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO cgdb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cgdb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO cgdb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: cgdb_core_user; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.cgdb_core_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.cgdb_core_user OWNER TO cgdb;

--
-- Name: cgdb_core_user_groups; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.cgdb_core_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.cgdb_core_user_groups OWNER TO cgdb;

--
-- Name: cgdb_core_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.cgdb_core_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cgdb_core_user_groups_id_seq OWNER TO cgdb;

--
-- Name: cgdb_core_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.cgdb_core_user_groups_id_seq OWNED BY public.cgdb_core_user_groups.id;


--
-- Name: cgdb_core_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.cgdb_core_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cgdb_core_user_id_seq OWNER TO cgdb;

--
-- Name: cgdb_core_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.cgdb_core_user_id_seq OWNED BY public.cgdb_core_user.id;


--
-- Name: cgdb_core_user_user_permissions; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.cgdb_core_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.cgdb_core_user_user_permissions OWNER TO cgdb;

--
-- Name: cgdb_core_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.cgdb_core_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cgdb_core_user_user_permissions_id_seq OWNER TO cgdb;

--
-- Name: cgdb_core_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.cgdb_core_user_user_permissions_id_seq OWNED BY public.cgdb_core_user_user_permissions.id;


--
-- Name: developers; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.developers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    pictures jsonb NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.developers OWNER TO cgdb;

--
-- Name: developers_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.developers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.developers_id_seq OWNER TO cgdb;

--
-- Name: developers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.developers_id_seq OWNED BY public.developers.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO cgdb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO cgdb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cgdb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO cgdb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cgdb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO cgdb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cgdb;

--
-- Name: game_free_on_subscriptions; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.game_free_on_subscriptions (
    id integer NOT NULL,
    entered date NOT NULL,
    "left" date,
    game_id integer NOT NULL,
    platform_id integer NOT NULL
);


ALTER TABLE public.game_free_on_subscriptions OWNER TO cgdb;

--
-- Name: game_free_on_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.game_free_on_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_free_on_subscriptions_id_seq OWNER TO cgdb;

--
-- Name: game_free_on_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.game_free_on_subscriptions_id_seq OWNED BY public.game_free_on_subscriptions.id;


--
-- Name: game_prices; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.game_prices (
    id integer NOT NULL,
    price numeric(8,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    game_id integer NOT NULL,
    store_id integer NOT NULL,
    price_with_subscription numeric(8,2) NOT NULL
);


ALTER TABLE public.game_prices OWNER TO cgdb;

--
-- Name: game_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.game_prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_prices_id_seq OWNER TO cgdb;

--
-- Name: game_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.game_prices_id_seq OWNED BY public.game_prices.id;


--
-- Name: game_release_dates; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.game_release_dates (
    id integer NOT NULL,
    release_date date NOT NULL,
    game_id integer NOT NULL,
    platform_id integer NOT NULL
);


ALTER TABLE public.game_release_dates OWNER TO cgdb;

--
-- Name: game_release_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.game_release_dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_release_dates_id_seq OWNER TO cgdb;

--
-- Name: game_release_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.game_release_dates_id_seq OWNED BY public.game_release_dates.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    title_lc jsonb NOT NULL,
    description text,
    description_lc jsonb NOT NULL,
    pictures jsonb NOT NULL,
    links jsonb NOT NULL,
    slug character varying(200) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    esrb character varying(4) NOT NULL
);


ALTER TABLE public.games OWNER TO cgdb;

--
-- Name: games_developers; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games_developers (
    id integer NOT NULL,
    game_id integer NOT NULL,
    developer_id integer NOT NULL
);


ALTER TABLE public.games_developers OWNER TO cgdb;

--
-- Name: games_developers_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_developers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_developers_id_seq OWNER TO cgdb;

--
-- Name: games_developers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_developers_id_seq OWNED BY public.games_developers.id;


--
-- Name: games_genres; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games_genres (
    id integer NOT NULL,
    game_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.games_genres OWNER TO cgdb;

--
-- Name: games_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_genres_id_seq OWNER TO cgdb;

--
-- Name: games_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_genres_id_seq OWNED BY public.games_genres.id;


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO cgdb;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: games_modes; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games_modes (
    id integer NOT NULL,
    game_id integer NOT NULL,
    mode_id integer NOT NULL
);


ALTER TABLE public.games_modes OWNER TO cgdb;

--
-- Name: games_modes_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_modes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_modes_id_seq OWNER TO cgdb;

--
-- Name: games_modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_modes_id_seq OWNED BY public.games_modes.id;


--
-- Name: games_platforms; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games_platforms (
    id integer NOT NULL,
    game_id integer NOT NULL,
    platform_id integer NOT NULL
);


ALTER TABLE public.games_platforms OWNER TO cgdb;

--
-- Name: games_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_platforms_id_seq OWNER TO cgdb;

--
-- Name: games_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_platforms_id_seq OWNED BY public.games_platforms.id;


--
-- Name: games_publishers; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games_publishers (
    id integer NOT NULL,
    game_id integer NOT NULL,
    publisher_id integer NOT NULL
);


ALTER TABLE public.games_publishers OWNER TO cgdb;

--
-- Name: games_publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_publishers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_publishers_id_seq OWNER TO cgdb;

--
-- Name: games_publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_publishers_id_seq OWNED BY public.games_publishers.id;


--
-- Name: games_series; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games_series (
    id integer NOT NULL,
    game_id integer NOT NULL,
    series_id integer NOT NULL
);


ALTER TABLE public.games_series OWNER TO cgdb;

--
-- Name: games_series_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_series_id_seq OWNER TO cgdb;

--
-- Name: games_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_series_id_seq OWNED BY public.games_series.id;


--
-- Name: games_tags; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.games_tags (
    id integer NOT NULL,
    game_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.games_tags OWNER TO cgdb;

--
-- Name: games_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.games_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_tags_id_seq OWNER TO cgdb;

--
-- Name: games_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.games_tags_id_seq OWNED BY public.games_tags.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.genres OWNER TO cgdb;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO cgdb;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: language_codes; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.language_codes (
    id integer NOT NULL,
    iso character varying(5) NOT NULL,
    language character varying(255),
    language_eng character varying(100) NOT NULL
);


ALTER TABLE public.language_codes OWNER TO cgdb;

--
-- Name: language_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.language_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_codes_id_seq OWNER TO cgdb;

--
-- Name: language_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.language_codes_id_seq OWNED BY public.language_codes.id;


--
-- Name: modes; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.modes (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.modes OWNER TO cgdb;

--
-- Name: modes_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.modes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modes_id_seq OWNER TO cgdb;

--
-- Name: modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.modes_id_seq OWNED BY public.modes.id;


--
-- Name: platforms; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.platforms (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    pictures jsonb NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    available_countries jsonb NOT NULL,
    internet_requirements text,
    supported_devices jsonb NOT NULL,
    verdict jsonb NOT NULL
);


ALTER TABLE public.platforms OWNER TO cgdb;

--
-- Name: platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platforms_id_seq OWNER TO cgdb;

--
-- Name: platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.platforms_id_seq OWNED BY public.platforms.id;


--
-- Name: platforms_stores; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.platforms_stores (
    id integer NOT NULL,
    platform_id integer NOT NULL,
    store_id integer NOT NULL
);


ALTER TABLE public.platforms_stores OWNER TO cgdb;

--
-- Name: platforms_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.platforms_stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platforms_stores_id_seq OWNER TO cgdb;

--
-- Name: platforms_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.platforms_stores_id_seq OWNED BY public.platforms_stores.id;


--
-- Name: publishers; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.publishers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    slug character varying(100) NOT NULL,
    pictures jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.publishers OWNER TO cgdb;

--
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.publishers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publishers_id_seq OWNER TO cgdb;

--
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.publishers_id_seq OWNED BY public.publishers.id;


--
-- Name: series; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.series (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.series OWNER TO cgdb;

--
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_id_seq OWNER TO cgdb;

--
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.series_id_seq OWNED BY public.series.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.stores OWNER TO cgdb;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO cgdb;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: cgdb
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    tag character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO cgdb;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: cgdb
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO cgdb;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cgdb
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: cgdb_core_user id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user ALTER COLUMN id SET DEFAULT nextval('public.cgdb_core_user_id_seq'::regclass);


--
-- Name: cgdb_core_user_groups id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_groups ALTER COLUMN id SET DEFAULT nextval('public.cgdb_core_user_groups_id_seq'::regclass);


--
-- Name: cgdb_core_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.cgdb_core_user_user_permissions_id_seq'::regclass);


--
-- Name: developers id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.developers ALTER COLUMN id SET DEFAULT nextval('public.developers_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: game_free_on_subscriptions id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_free_on_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.game_free_on_subscriptions_id_seq'::regclass);


--
-- Name: game_prices id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_prices ALTER COLUMN id SET DEFAULT nextval('public.game_prices_id_seq'::regclass);


--
-- Name: game_release_dates id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_release_dates ALTER COLUMN id SET DEFAULT nextval('public.game_release_dates_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: games_developers id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_developers ALTER COLUMN id SET DEFAULT nextval('public.games_developers_id_seq'::regclass);


--
-- Name: games_genres id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_genres ALTER COLUMN id SET DEFAULT nextval('public.games_genres_id_seq'::regclass);


--
-- Name: games_modes id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_modes ALTER COLUMN id SET DEFAULT nextval('public.games_modes_id_seq'::regclass);


--
-- Name: games_platforms id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_platforms ALTER COLUMN id SET DEFAULT nextval('public.games_platforms_id_seq'::regclass);


--
-- Name: games_publishers id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_publishers ALTER COLUMN id SET DEFAULT nextval('public.games_publishers_id_seq'::regclass);


--
-- Name: games_series id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_series ALTER COLUMN id SET DEFAULT nextval('public.games_series_id_seq'::regclass);


--
-- Name: games_tags id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_tags ALTER COLUMN id SET DEFAULT nextval('public.games_tags_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: language_codes id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.language_codes ALTER COLUMN id SET DEFAULT nextval('public.language_codes_id_seq'::regclass);


--
-- Name: modes id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.modes ALTER COLUMN id SET DEFAULT nextval('public.modes_id_seq'::regclass);


--
-- Name: platforms id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms ALTER COLUMN id SET DEFAULT nextval('public.platforms_id_seq'::regclass);


--
-- Name: platforms_stores id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms_stores ALTER COLUMN id SET DEFAULT nextval('public.platforms_stores_id_seq'::regclass);


--
-- Name: publishers id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.publishers ALTER COLUMN id SET DEFAULT nextval('public.publishers_id_seq'::regclass);


--
-- Name: series id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.series ALTER COLUMN id SET DEFAULT nextval('public.series_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add developer	6	add_developer
22	Can change developer	6	change_developer
23	Can delete developer	6	delete_developer
24	Can view developer	6	view_developer
25	Can add genre	7	add_genre
26	Can change genre	7	change_genre
27	Can delete genre	7	delete_genre
28	Can view genre	7	view_genre
29	Can add language code	8	add_languagecode
30	Can change language code	8	change_languagecode
31	Can delete language code	8	delete_languagecode
32	Can view language code	8	view_languagecode
33	Can add mode	9	add_mode
34	Can change mode	9	change_mode
35	Can delete mode	9	delete_mode
36	Can view mode	9	view_mode
37	Can add platform	10	add_platform
38	Can change platform	10	change_platform
39	Can delete platform	10	delete_platform
40	Can view platform	10	view_platform
41	Can add publisher	11	add_publisher
42	Can change publisher	11	change_publisher
43	Can delete publisher	11	delete_publisher
44	Can view publisher	11	view_publisher
45	Can add series	12	add_series
46	Can change series	12	change_series
47	Can delete series	12	delete_series
48	Can view series	12	view_series
49	Can add tag	13	add_tag
50	Can change tag	13	change_tag
51	Can delete tag	13	delete_tag
52	Can view tag	13	view_tag
53	Can add game	14	add_game
54	Can change game	14	change_game
55	Can delete game	14	delete_game
56	Can view game	14	view_game
57	Can add user	15	add_user
58	Can change user	15	change_user
59	Can delete user	15	delete_user
60	Can view user	15	view_user
61	Can add store	16	add_store
62	Can change store	16	change_store
63	Can delete store	16	delete_store
64	Can view store	16	view_store
65	Can add game price	17	add_gameprice
66	Can change game price	17	change_gameprice
67	Can delete game price	17	delete_gameprice
68	Can view game price	17	view_gameprice
69	Can add game release date	18	add_gamereleasedate
70	Can change game release date	18	change_gamereleasedate
71	Can delete game release date	18	delete_gamereleasedate
72	Can view game release date	18	view_gamereleasedate
73	Can add game free on subscription	19	add_gamefreeonsubscription
74	Can change game free on subscription	19	change_gamefreeonsubscription
75	Can delete game free on subscription	19	delete_gamefreeonsubscription
76	Can view game free on subscription	19	view_gamefreeonsubscription
\.


--
-- Data for Name: cgdb_core_user; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.cgdb_core_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$BDxdH9HsFaK4$A0/P7BqZxXcqVif4LKLL9mCNElKFCFNK6ZOCbSC+mUs=	2021-02-09 18:24:36.363476+00	t	cgadmin				t	t	2020-12-12 22:02:01.568481+00
\.


--
-- Data for Name: cgdb_core_user_groups; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.cgdb_core_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: cgdb_core_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.cgdb_core_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: developers; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.developers (id, name, description, pictures, slug, created_at, updated_at) FROM stdin;
2	Sloclap	\N	[]	sloclap	2020-12-13 03:29:47.276595+00	2020-12-13 03:29:47.276617+00
3	Asobo Studio	\N	[]	asobo-studio	2020-12-13 03:40:14.612472+00	2020-12-13 03:40:14.612492+00
4	Triumph Studios	\N	[]	triumph-studios	2020-12-13 04:35:52.875201+00	2020-12-13 04:35:52.87522+00
5	Studio Wildcard	\N	[]	studio-wildcard	2020-12-13 04:39:08.302066+00	2020-12-13 04:39:08.302087+00
6	Rocksteady Studios	\N	[]	rocksteady-studios	2020-12-14 15:15:18.267003+00	2020-12-14 15:15:18.267022+00
8	System Era Softworks	\N	[]	system-era-softworks	2020-12-14 19:34:13.79197+00	2020-12-14 19:34:13.79199+00
10	Dlala Studios	\N	[]	dlala-studios	2020-12-14 19:34:13.893111+00	2020-12-14 19:34:13.893135+00
12	Bloober Team	\N	[]	bloober-team	2020-12-14 19:38:23.1484+00	2020-12-14 19:38:23.148419+00
13	Pearl Abyss	\N	[]	pearl-abyss	2020-12-14 19:38:23.149237+00	2020-12-14 19:38:23.149254+00
14	ClockStone	\N	[]	clockstone	2020-12-17 19:51:04.705533+00	2020-12-17 19:51:04.705565+00
7	Airship Syndicate	\N	[]	airship-syndicate	2020-12-14 15:16:09.406052+00	2020-12-17 19:51:04.963684+00
16	Dead Mage	\N	[]	dead-mage	2020-12-17 19:51:05.087909+00	2020-12-17 19:51:05.087931+00
17	SMG Studio	\N	[]	smg-studio	2020-12-17 19:51:05.090322+00	2020-12-17 19:51:05.090353+00
20	Motion Twin	\N	[]	motion-twin	2020-12-17 19:51:05.319967+00	2020-12-17 19:51:05.320005+00
21	Evil Empire	\N	[]	evil-empire	2020-12-17 19:51:05.373487+00	2020-12-17 19:51:05.37351+00
22	ArtPlay[a]	\N	[]	artplaya	2020-12-17 19:51:05.469163+00	2020-12-17 19:51:05.469201+00
23	Universomo (iOS)	\N	[]	universomo-ios	2020-12-17 19:51:05.727555+00	2020-12-17 19:51:05.727577+00
24	Blue Tongue Entertainment (Wii)	\N	[]	blue-tongue-entertainment-wii	2020-12-17 19:51:05.769662+00	2020-12-17 19:51:05.769687+00
25	Emily Mitchell	\N	[]	emily-mitchell	2020-12-17 19:51:05.805853+00	2020-12-17 19:51:05.805877+00
26	BlitWorks (PC PS4 Xbox One Nintendo Switch)	\N	[]	blitworks-pc-ps4-xbox-one-nintendo-switch	2020-12-17 19:51:05.815479+00	2020-12-17 19:51:05.815503+00
28	Behaviour Interactive	\N	[]	behaviour-interactive	2020-12-17 19:51:05.92746+00	2020-12-17 19:51:05.927484+00
29	Blacklight Interactive	\N	[]	blacklight-interactive	2020-12-17 19:51:06.112486+00	2020-12-17 19:51:06.112509+00
30	DrinkBox Studios	\N	[]	drinkbox-studios	2020-12-17 19:51:06.270639+00	2020-12-17 19:51:06.270662+00
31	Techland	\N	[]	techland	2020-12-17 19:51:06.284029+00	2020-12-17 19:51:06.284053+00
32	doinksoft	\N	[]	doinksoft	2020-12-17 19:51:06.305322+00	2020-12-17 19:51:06.305342+00
33	Klei Entertainment	\N	[]	klei-entertainment	2020-12-17 19:51:06.543576+00	2020-12-17 19:51:06.543595+00
34	Tendershoot	\N	[]	tendershoot	2020-12-17 19:51:06.850802+00	2020-12-17 19:51:06.850821+00
35	Typhoon Studios	\N	[]	typhoon-studios	2020-12-17 19:51:06.852496+00	2020-12-17 19:51:06.852513+00
36	Bombservice	\N	[]	bombservice	2020-12-17 19:51:07.21187+00	2020-12-17 19:51:07.211893+00
39	Oovee Game Studios (for the original game Spintires)	\N	[]	oovee-game-studios-for-the-original-game-spintires	2020-12-17 19:51:07.480051+00	2020-12-17 19:51:07.480075+00
40	Giants Software (2008–present)	\N	[]	giants-software-2008present	2020-12-17 19:51:07.641098+00	2020-12-17 19:51:07.641118+00
42	Vanguard Games	\N	[]	vanguard-games	2020-12-17 19:51:07.720257+00	2020-12-17 19:51:07.720275+00
45	The Bearded Ladies	\N	[]	the-bearded-ladies	2020-12-17 19:51:07.820689+00	2020-12-17 19:51:07.82071+00
46	Dynamic Pixels	\N	[]	dynamic-pixels	2020-12-17 19:51:07.826741+00	2020-12-17 19:51:07.826757+00
47	Coffee Stain Studios	\N	[]	coffee-stain-studios	2020-12-17 19:51:07.8704+00	2020-12-17 19:51:07.870416+00
48	Playful Studios	\N	[]	playful-studios	2020-12-17 19:51:07.877896+00	2020-12-17 19:51:07.877913+00
18	Gunfire Games	\N	[]	gunfire-games	2020-12-17 19:51:05.199784+00	2020-12-17 19:51:07.975991+00
49	Bethesda Game Studios	\N	[]	bethesda-game-studios	2020-12-17 19:51:08.007094+00	2020-12-17 19:51:08.00711+00
53	Playground Games	\N	[]	playground-games	2020-12-17 19:51:08.087678+00	2020-12-17 19:51:08.087695+00
57	No Brakes Games	\N	[]	no-brakes-games	2020-12-17 19:51:08.18483+00	2020-12-17 19:51:08.184848+00
59	Sectordub	\N	[]	sectordub	2020-12-17 19:51:08.281221+00	2020-12-17 19:51:08.281243+00
11	Night School Studio	\N	[]	night-school-studio	2020-12-14 19:38:23.013115+00	2020-12-17 19:51:08.77316+00
61	Ice-Pick Lodge	\N	[]	ice-pick-lodge	2020-12-17 19:51:08.793048+00	2020-12-17 19:51:08.793066+00
64	nWay	\N	[]	nway	2020-12-17 19:51:08.883599+00	2020-12-17 19:51:08.883615+00
65	Ghost Town Games	\N	[]	ghost-town-games	2020-12-17 19:51:08.945162+00	2020-12-17 19:51:08.94518+00
66	TaleWorlds Entertainment	\N	[]	taleworlds-entertainment	2020-12-17 19:51:09.282046+00	2020-12-17 19:51:09.282068+00
67	Monolith Productions	\N	[]	monolith-productions	2020-12-17 19:51:09.332683+00	2020-12-17 19:51:09.332708+00
69	Mojang Studios	\N	[]	mojang-studios	2020-12-17 19:51:10.033421+00	2020-12-17 19:51:10.03348+00
70	Double Eleven	\N	[]	double-eleven	2020-12-17 19:51:10.085613+00	2020-12-17 19:51:10.085636+00
72	PlatinumGames	\N	[]	platinumgames	2020-12-17 19:51:10.810909+00	2020-12-17 19:51:10.810967+00
74	Hello Games	\N	[]	hello-games	2020-12-17 19:51:10.889596+00	2020-12-17 19:51:10.889641+00
75	Matt Dabrowski	\N	[]	matt-dabrowski	2020-12-17 19:51:10.931743+00	2020-12-17 19:51:10.931766+00
76	The Voxel Agents	\N	[]	the-voxel-agents	2020-12-17 19:51:11.14997+00	2020-12-17 19:51:11.150002+00
78	Shin'en Multimedia	\N	[]	shinen-multimedia	2020-12-17 19:51:11.191936+00	2020-12-17 19:51:11.191958+00
79	MegaCrit	\N	[]	megacrit	2020-12-17 19:51:11.203502+00	2020-12-17 19:51:11.203532+00
80	Jackbox Games	\N	[]	jackbox-games	2020-12-17 19:51:11.272902+00	2020-12-17 19:51:11.272942+00
82	Whoop Games	\N	[]	whoop-games	2020-12-17 19:51:11.96553+00	2020-12-17 19:51:11.965551+00
84	Mouldy Toof Studios	\N	[]	mouldy-toof-studios	2020-12-17 19:51:12.075373+00	2020-12-17 19:51:12.075397+00
85	Blue Manchu	\N	[]	blue-manchu	2020-12-17 19:51:12.107235+00	2020-12-17 19:51:12.107263+00
37	The Coalition	\N	[]	the-coalition	2020-12-17 19:51:07.29435+00	2020-12-17 20:06:18.901724+00
86	Team Ladybug	\N	[]	team-ladybug	2020-12-17 19:51:12.245875+00	2020-12-17 19:51:12.245897+00
87	Dotemu	\N	[]	dotemu	2020-12-17 19:51:12.284324+00	2020-12-17 19:51:12.284352+00
89	Greg Lobanov	\N	[]	greg-lobanov	2020-12-17 19:51:12.381027+00	2020-12-17 19:51:12.381051+00
15	Landfall Games	\N	[]	landfall-games	2020-12-17 19:51:04.889104+00	2020-12-17 19:51:12.449683+00
90	Lizardcube	\N	[]	lizardcube	2020-12-17 19:51:12.455888+00	2020-12-17 19:51:12.455914+00
91	Unknown Worlds Entertainment	\N	[]	unknown-worlds-entertainment	2020-12-17 19:51:12.521666+00	2020-12-17 19:51:12.521711+00
93	Guard Crush Games	\N	[]	guard-crush-games	2020-12-17 19:51:12.557046+00	2020-12-17 19:51:12.557069+00
94	Dovetail Games	\N	[]	dovetail-games	2020-12-17 19:51:12.623626+00	2020-12-17 19:51:12.623661+00
96	Interplay (1988)	\N	[]	interplay-1988	2020-12-17 19:51:13.155093+00	2020-12-17 19:51:13.155126+00
98	inXile Entertainment (Since 2012)	\N	[]	inxile-entertainment-since-2012	2020-12-17 19:51:13.221409+00	2020-12-17 19:51:13.221427+00
100	Bitmap Bureau	\N	[]	bitmap-bureau	2020-12-17 19:51:13.365128+00	2020-12-17 19:51:13.365152+00
101	Hinterland Studio	\N	[]	hinterland-studio	2020-12-17 19:51:13.369746+00	2020-12-17 19:51:13.369877+00
62	Moon Studios	\N	[]	moon-studios	2020-12-17 19:51:08.867482+00	2020-12-17 20:06:20.479163+00
99	Rebellion Developments	\N	[]	rebellion-developments	2020-12-17 19:51:13.320863+00	2020-12-21 16:12:09.221157+00
38	Saber Interactive	\N	[]	saber-interactive	2020-12-17 19:51:07.301539+00	2020-12-21 16:12:08.850108+00
52	Ninja Theory	\N	[]	ninja-theory	2020-12-17 19:51:08.085578+00	2020-12-18 16:36:42.586781+00
9	Rare	\N	[]	rare	2020-12-14 19:34:13.886441+00	2020-12-18 16:36:45.278591+00
95	Obsidian Entertainment	\N	[]	obsidian-entertainment	2020-12-17 19:51:12.931121+00	2020-12-18 16:36:44.820021+00
27	Codemasters	\N	[]	codemasters	2020-12-17 19:51:05.838303+00	2020-12-20 04:21:10.204981+00
55	Capcom	\N	[]	capcom	2020-12-17 19:51:08.140314+00	2020-12-18 16:36:45.735155+00
71	4A Games	\N	[]	4a-games	2020-12-17 19:51:10.724122+00	2020-12-21 16:12:05.106406+00
19	Amplitude Studios	\N	[]	amplitude-studios	2020-12-17 19:51:05.20282+00	2020-12-20 04:21:10.509684+00
81	Flying Wild Hog	\N	[]	flying-wild-hog	2020-12-17 19:51:11.448074+00	2020-12-21 19:56:02.542164+00
97	CD Projekt Red	\N	[]	cd-projekt-red	2020-12-17 19:51:13.17703+00	2020-12-20 04:21:11.328225+00
77	Thunder Lotus Games	\N	[]	thunder-lotus-games	2020-12-17 19:51:11.155612+00	2020-12-21 16:12:06.585591+00
92	Croteam	\N	[]	croteam	2020-12-17 19:51:12.544899+00	2020-12-21 16:12:07.671911+00
88	Haemimont Games	\N	[]	haemimont-games	2020-12-17 19:51:12.344056+00	2020-12-21 19:56:04.088731+00
83	Deck13 Interactive	\N	[]	deck13-interactive	2020-12-17 19:51:12.042654+00	2020-12-21 19:56:04.257764+00
102	Contingent99	\N	[]	contingent99	2020-12-17 19:51:13.377393+00	2020-12-17 19:51:13.377446+00
103	Two Point Studios	\N	[]	two-point-studios	2020-12-17 19:51:13.582319+00	2020-12-17 19:51:13.582345+00
104	Red Kite Games	\N	[]	red-kite-games	2020-12-17 19:51:13.624976+00	2020-12-17 19:51:13.625+00
105	Avalanche Studios (2009–2015)	\N	[]	avalanche-studios-20092015	2020-12-17 19:51:13.675148+00	2020-12-17 19:51:13.675169+00
106	House House	\N	[]	house-house	2020-12-17 19:51:13.694572+00	2020-12-17 19:51:13.694593+00
109	Expansive Worlds (2015–2017)	\N	[]	expansive-worlds-20152017	2020-12-17 19:51:13.887938+00	2020-12-17 19:51:13.887953+00
63	Team17	\N	[]	team17	2020-12-17 19:51:08.869666+00	2020-12-17 19:51:13.988801+00
110	ZeniMax Online Studios	\N	[]	zenimax-online-studios	2020-12-17 19:51:14.027507+00	2020-12-17 19:51:14.027531+00
114	Compulsion Games	\N	[]	compulsion-games	2020-12-17 19:51:14.48962+00	2020-12-17 19:51:14.489642+00
172	NES	\N	[]	nes	2020-12-20 04:21:09.448901+00	2020-12-20 04:21:09.448921+00
118	Creative Assembly	\N	[]	creative-assembly	2020-12-17 20:06:19.283903+00	2020-12-17 20:06:19.283928+00
41	343 Industries	\N	[]	343-industries	2020-12-17 19:51:07.647603+00	2020-12-17 20:06:19.454865+00
173	Beam Software	\N	[]	beam-software	2020-12-20 04:21:09.556858+00	2020-12-20 04:21:09.556895+00
112	inXile Entertainment	\N	[]	inxile-entertainment	2020-12-17 19:51:14.230674+00	2020-12-17 20:06:23.173139+00
111	Ryu Ga Gotoku Studio	\N	[]	ryu-ga-gotoku-studio	2020-12-17 19:51:14.229545+00	2020-12-17 20:06:23.297941+00
119	Phobia Game Studio	\N	[]	phobia-game-studio	2020-12-18 16:36:42.055764+00	2020-12-18 16:36:42.055789+00
120	Bohemia Interactive	\N	[]	bohemia-interactive	2020-12-18 16:36:42.110182+00	2020-12-18 16:36:42.110222+00
121	Radical Fish Games	\N	[]	radical-fish-games	2020-12-18 16:36:42.323904+00	2020-12-18 16:36:42.323926+00
122	HopFrog	\N	[]	hopfrog	2020-12-18 16:36:42.580462+00	2020-12-18 16:36:42.580481+00
123	Sumo Digital	\N	[]	sumo-digital	2020-12-18 16:36:42.962948+00	2020-12-18 16:36:42.962972+00
125	DevM Games SMG Studio	\N	[]	devm-games-smg-studio	2020-12-18 16:36:43.06673+00	2020-12-18 16:36:43.066764+00
126	Parabole	\N	[]	parabole	2020-12-18 16:36:43.39934+00	2020-12-18 16:36:43.399367+00
127	Digital Sun	\N	[]	digital-sun	2020-12-18 16:36:43.508099+00	2020-12-18 16:36:43.508121+00
128	Lab Zero Games	\N	[]	lab-zero-games	2020-12-18 16:36:43.537846+00	2020-12-18 16:36:43.537865+00
129	No Code	\N	[]	no-code	2020-12-18 16:36:43.570383+00	2020-12-18 16:36:43.570407+00
130	11 bit studios	\N	[]	11-bit-studios	2020-12-18 16:36:43.707759+00	2020-12-18 16:36:43.707792+00
131	Pathea Games	\N	[]	pathea-games	2020-12-18 16:36:43.717793+00	2020-12-18 16:36:43.717812+00
132	Team Cherry	\N	[]	team-cherry	2020-12-18 16:36:43.778994+00	2020-12-18 16:36:43.779012+00
133	Askiisoft	\N	[]	askiisoft	2020-12-18 16:36:43.830449+00	2020-12-18 16:36:43.830466+00
134	WayForward	\N	[]	wayforward	2020-12-18 16:36:43.901405+00	2020-12-18 16:36:43.901424+00
135	Comcept	\N	[]	comcept	2020-12-18 16:36:43.904015+00	2020-12-18 16:36:43.904031+00
136	Armature Studio	\N	[]	armature-studio	2020-12-18 16:36:44.100475+00	2020-12-18 16:36:44.100498+00
137	Rare (1994-1996)	\N	[]	rare-1994-1996	2020-12-18 16:36:44.411366+00	2020-12-18 16:36:44.41139+00
138	Sabotage Studio	\N	[]	sabotage-studio	2020-12-18 16:36:44.415491+00	2020-12-18 16:36:44.415512+00
139	Infinite Fall	\N	[]	infinite-fall	2020-12-18 16:36:44.488241+00	2020-12-18 16:36:44.488265+00
140	Microsoft Studios (2013-present)	\N	[]	microsoft-studios-2013-present	2020-12-18 16:36:44.503948+00	2020-12-18 16:36:44.503973+00
141	Bulkhead Interactive	\N	[]	bulkhead-interactive	2020-12-18 16:36:44.545781+00	2020-12-18 16:36:44.5458+00
142	Fullbright	\N	[]	fullbright	2020-12-18 16:36:44.565964+00	2020-12-18 16:36:44.565985+00
143	Fatshark	\N	[]	fatshark	2020-12-18 16:36:44.585457+00	2020-12-18 16:36:44.585472+00
144	Double Helix Games (2013)	\N	[]	double-helix-games-2013	2020-12-18 16:36:44.611598+00	2020-12-18 16:36:44.611616+00
145	Iron Galaxy Studios (2014-2017)	\N	[]	iron-galaxy-studios-2014-2017	2020-12-18 16:36:44.70711+00	2020-12-18 16:36:44.707132+00
174	Genesis & 3DO	\N	[]	genesis-3do	2020-12-20 04:21:09.656821+00	2020-12-20 04:21:09.65684+00
146	Undead Labs	\N	[]	undead-labs	2020-12-18 16:36:44.73742+00	2020-12-18 16:36:44.737458+00
147	Ensemble Studios	\N	[]	ensemble-studios	2020-12-18 16:36:44.78452+00	2020-12-18 16:36:44.784537+00
148	Epic Games	\N	[]	epic-games	2020-12-18 16:36:44.855796+00	2020-12-18 16:36:44.855816+00
108	Telltale Games	\N	[]	telltale-games	2020-12-17 19:51:13.752883+00	2020-12-18 16:36:44.896498+00
149	Dontnod Entertainment	\N	[]	dontnod-entertainment	2020-12-18 16:36:45.426583+00	2020-12-18 16:36:45.426607+00
151	Paradox Development Studio	\N	[]	paradox-development-studio	2020-12-18 16:36:45.613821+00	2020-12-18 16:36:45.613844+00
152	Dodge Roll	\N	[]	dodge-roll	2020-12-18 16:41:43.922752+00	2020-12-18 16:41:43.922775+00
153	Exiin	\N	[]	exiin	2020-12-20 04:10:34.232631+00	2020-12-20 04:10:34.232651+00
154	Fishing Cactus	\N	[]	fishing-cactus	2020-12-20 04:10:34.239713+00	2020-12-20 04:10:34.239737+00
155	Omega Force	\N	[]	omega-force	2020-12-20 04:10:34.35323+00	2020-12-20 04:10:34.353254+00
157	Larian Studios	\N	[]	larian-studios	2020-12-20 04:10:34.828631+00	2020-12-20 04:10:34.828652+00
158	Gearbox Software	\N	[]	gearbox-software	2020-12-20 04:10:35.003783+00	2020-12-20 04:10:35.003806+00
162	Matt Makes Games	\N	[]	matt-makes-games	2020-12-20 04:10:35.310516+00	2020-12-20 04:10:35.310538+00
164	Midway Studios San Diego	\N	[]	midway-studios-san-diego	2020-12-20 04:21:06.951673+00	2020-12-20 04:21:06.951694+00
165	Nightdive Studios	\N	[]	nightdive-studios	2020-12-20 04:21:06.957938+00	2020-12-20 04:21:06.95798+00
166	(re-release)	\N	[]	re-release	2020-12-20 04:21:06.966641+00	2020-12-20 04:21:06.966662+00
197	Ubisoft Toronto[a]	\N	[]	ubisoft-torontoa	2020-12-20 04:21:11.018139+00	2020-12-20 04:21:11.018155+00
175	Eurocom	\N	[]	eurocom	2020-12-20 04:21:09.684561+00	2020-12-20 04:21:09.684579+00
167	Rockfish Games	\N	[]	rockfish-games	2020-12-20 04:21:08.621335+00	2020-12-20 04:21:08.621366+00
191	[18]	\N	[]	18	2020-12-20 04:21:10.471576+00	2020-12-20 04:21:10.471592+00
168	Black Forest Games	\N	[]	black-forest-games	2020-12-20 04:21:09.148193+00	2020-12-20 04:21:09.148214+00
169	Dimps	\N	[]	dimps	2020-12-20 04:21:09.318243+00	2020-12-20 04:21:09.318262+00
170	Sports Interactive	\N	[]	sports-interactive	2020-12-20 04:21:09.356493+00	2020-12-20 04:21:09.356525+00
171	Codemasters Cheshire	\N	[]	codemasters-cheshire	2020-12-20 04:21:09.409606+00	2020-12-20 04:21:09.409625+00
176	SNES	\N	[]	snes	2020-12-20 04:21:09.738861+00	2020-12-20 04:21:09.738878+00
177	Imagineering	\N	[]	imagineering	2020-12-20 04:21:09.879882+00	2020-12-20 04:21:09.879917+00
178	Bungie	\N	[]	bungie	2020-12-20 04:21:09.912285+00	2020-12-20 04:21:09.912309+00
179	Artech Studios	\N	[]	artech-studios	2020-12-20 04:21:09.945113+00	2020-12-20 04:21:09.94515+00
124	Codemasters Birmingham	\N	[]	codemasters-birmingham	2020-12-18 16:36:43.006525+00	2020-12-20 04:21:09.968307+00
180	EA Vancouver	\N	[]	ea-vancouver	2020-12-20 04:21:10.06667+00	2020-12-20 04:21:10.066695+00
182	PlayStation 2	\N	[]	playstation-2	2020-12-20 04:21:10.081741+00	2020-12-20 04:21:10.081757+00
183	EA Romania	\N	[]	ea-romania	2020-12-20 04:21:10.109325+00	2020-12-20 04:21:10.109342+00
184	Ingram	\N	[]	ingram	2020-12-20 04:21:10.150652+00	2020-12-20 04:21:10.15067+00
185	Game Boy Advance	\N	[]	game-boy-advance	2020-12-20 04:21:10.208963+00	2020-12-20 04:21:10.208978+00
186	Atomic Planet	\N	[]	atomic-planet	2020-12-20 04:21:10.273724+00	2020-12-20 04:21:10.273758+00
187	Ludia	\N	[]	ludia	2020-12-20 04:21:10.30996+00	2020-12-20 04:21:10.309977+00
189	Ubisoft	\N	[]	ubisoft	2020-12-20 04:21:10.350333+00	2020-12-20 04:21:10.350352+00
190	Snap Finger Click	\N	[]	snap-finger-click	2020-12-20 04:21:10.41485+00	2020-12-20 04:21:10.414871+00
193	Berzerk Studio	\N	[]	berzerk-studio	2020-12-20 04:21:10.634074+00	2020-12-20 04:21:10.63409+00
195	Abstraction Games	\N	[]	abstraction-games	2020-12-20 04:21:10.825745+00	2020-12-20 04:21:10.825769+00
196	Subset Games	\N	[]	subset-games	2020-12-20 04:21:10.958313+00	2020-12-20 04:21:10.958332+00
156	Ubisoft Quebec	\N	[]	ubisoft-quebec	2020-12-20 04:10:34.65599+00	2020-12-20 04:21:10.984922+00
181	Ubisoft Toronto	\N	[]	ubisoft-toronto	2020-12-20 04:21:10.07157+00	2020-12-21 16:12:09.862029+00
150	NetherRealm Studios	\N	[]	netherrealm-studios	2020-12-18 16:36:45.487495+00	2020-12-21 16:12:05.412091+00
192	IO Interactive	\N	[]	io-interactive	2020-12-20 04:21:10.486872+00	2020-12-21 16:12:02.469098+00
198	Ubisoft Paris	\N	[]	ubisoft-paris	2020-12-20 04:21:11.233199+00	2020-12-21 16:12:09.428748+00
188	id Software	\N	[]	id-software	2020-12-20 04:21:10.321337+00	2020-12-21 16:12:05.355265+00
107	(consoles)	\N	[]	consoles	2020-12-17 19:51:13.719472+00	2020-12-21 20:10:28.749734+00
200	Square Enix Business Division 2	\N	[]	square-enix-business-division-2	2020-12-20 04:21:11.283972+00	2020-12-20 04:21:11.283995+00
160	Ubisoft Montreal	\N	[]	ubisoft-montreal	2020-12-20 04:10:35.222547+00	2020-12-21 16:12:10.003347+00
205	Superhot Team	\N	[]	superhot-team	2020-12-21 16:11:59.034338+00	2020-12-21 16:11:59.03436+00
194	Dennaton Games	\N	[]	dennaton-games	2020-12-20 04:21:10.769456+00	2020-12-21 16:12:02.068111+00
207	EA Tiburon	\N	[]	ea-tiburon	2020-12-21 16:12:03.181916+00	2020-12-21 16:12:03.181933+00
206	Crystal Dynamics	\N	[]	crystal-dynamics	2020-12-21 16:12:03.179797+00	2020-12-21 16:12:10.424099+00
208	Ubisoft Pune	\N	[]	ubisoft-pune	2020-12-21 16:12:03.29297+00	2020-12-21 16:12:03.292991+00
209	Ubisoft Shanghai	\N	[]	ubisoft-shanghai	2020-12-21 16:12:03.403547+00	2020-12-21 16:12:03.403568+00
210	Ubisoft Bordeaux	\N	[]	ubisoft-bordeaux	2020-12-21 16:12:03.477991+00	2020-12-21 16:12:03.478015+00
211	Tarsier Studios	\N	[]	tarsier-studios	2020-12-21 16:12:03.536268+00	2020-12-21 16:12:03.536288+00
212	Milestone srl	\N	[]	milestone-srl	2020-12-21 16:12:03.617335+00	2020-12-21 16:12:03.617353+00
215	Robot Entertainment	\N	[]	robot-entertainment	2020-12-21 16:12:03.865669+00	2020-12-21 16:12:03.865686+00
216	Game Atelier	\N	[]	game-atelier	2020-12-21 16:12:03.938091+00	2020-12-21 16:12:03.938112+00
217	Nine Dots	\N	[]	nine-dots	2020-12-21 16:12:04.021526+00	2020-12-21 16:12:04.021544+00
218	Visual Concepts	\N	[]	visual-concepts	2020-12-21 16:12:04.034447+00	2020-12-21 16:12:04.034469+00
219	People Can Fly	\N	[]	people-can-fly	2020-12-21 16:12:04.11885+00	2020-12-21 16:12:04.118867+00
220	HB Studios	\N	[]	hb-studios	2020-12-21 16:12:04.203025+00	2020-12-21 16:12:04.203048+00
222	Snapshot Games	\N	[]	snapshot-games	2020-12-21 16:12:04.676664+00	2020-12-21 16:12:04.676683+00
223	Hangar 13	\N	[]	hangar-13	2020-12-21 16:12:04.70701+00	2020-12-21 16:12:04.707034+00
225	Sega Team Andromeda	\N	[]	sega-team-andromeda	2020-12-21 16:12:04.950255+00	2020-12-21 16:12:04.950278+00
226	Land Ho!	\N	[]	land-ho	2020-12-21 16:12:05.018592+00	2020-12-21 16:12:05.018613+00
228	Ubisoft Annecy	\N	[]	ubisoft-annecy	2020-12-21 16:12:05.067258+00	2020-12-21 16:12:05.067279+00
230	Acquire	\N	[]	acquire	2020-12-21 16:12:05.086271+00	2020-12-21 16:12:05.086291+00
232	Hopoo Games	\N	[]	hopoo-games	2020-12-21 16:12:05.2151+00	2020-12-21 16:12:05.215115+00
233	Avalanche Studios	\N	[]	avalanche-studios	2020-12-21 16:12:05.312455+00	2020-12-21 16:12:05.312505+00
234	Camouflaj	\N	[]	camouflaj	2020-12-21 16:12:05.388573+00	2020-12-21 16:12:05.388596+00
269	Appeal	\N	[]	appeal	2020-12-21 17:02:30.235553+00	2020-12-21 17:02:30.235595+00
235	2K Czech	\N	[]	2k-czech	2020-12-21 16:12:05.559915+00	2020-12-21 16:12:05.559937+00
237	Purple Lamp Studios	\N	[]	purple-lamp-studios	2020-12-21 16:12:05.903999+00	2020-12-21 16:12:05.904019+00
270	Big Ant Studios	\N	[]	big-ant-studios	2020-12-21 19:56:02.123404+00	2020-12-21 19:56:02.123427+00
238	SNK Corporation	\N	[]	snk-corporation	2020-12-21 16:12:06.683923+00	2020-12-21 16:12:06.683941+00
242	Drool	\N	[]	drool	2020-12-21 16:12:07.116763+00	2020-12-21 16:12:07.116782+00
243	Respawn Entertainment	\N	[]	respawn-entertainment	2020-12-21 16:12:07.327136+00	2020-12-21 16:12:07.327174+00
245	Eidos-Montréal	\N	[]	eidos-montreal	2020-12-21 16:12:07.518463+00	2020-12-21 16:12:07.51848+00
284	PagodaWest Games	\N	[]	pagodawest-games	2020-12-21 19:56:04.833989+00	2020-12-21 19:56:04.834043+00
272	Vertigo Gaming	\N	[]	vertigo-gaming	2020-12-21 19:56:02.19242+00	2020-12-21 19:56:02.192464+00
246	FromSoftware	\N	[]	fromsoftware	2020-12-21 16:12:08.198507+00	2020-12-21 16:12:08.198531+00
247	Rockstar Studios	\N	[]	rockstar-studios	2020-12-21 16:12:08.287337+00	2020-12-21 16:12:08.287373+00
248	Carbonated Games	\N	[]	carbonated-games	2020-12-21 16:12:08.323892+00	2020-12-21 16:12:08.32395+00
249	Ivory Tower	\N	[]	ivory-tower	2020-12-21 16:12:08.356037+00	2020-12-21 16:12:08.356057+00
252	HexaDrive	\N	[]	hexadrive	2020-12-21 16:12:08.458337+00	2020-12-21 16:12:08.458364+00
273	SeithCG	\N	[]	seithcg	2020-12-21 19:56:02.293811+00	2020-12-21 19:56:02.293848+00
253	M2	\N	[]	m2	2020-12-21 16:12:08.518698+00	2020-12-21 16:12:08.518716+00
254	Gameloft	\N	[]	gameloft	2020-12-21 16:12:08.52878+00	2020-12-21 16:12:08.528803+00
236	Ubisoft Chengdu	\N	[]	ubisoft-chengdu	2020-12-21 16:12:05.805676+00	2020-12-21 16:12:08.568073+00
274	Starbreeze Studios	\N	[]	starbreeze-studios	2020-12-21 19:56:02.437916+00	2020-12-21 19:56:02.437936+00
258	Asymmetric Publications	\N	[]	asymmetric-publications	2020-12-21 16:12:08.785314+00	2020-12-21 16:12:08.78533+00
259	Media.Vision	\N	[]	mediavision	2020-12-21 16:12:08.8733+00	2020-12-21 16:12:08.873322+00
285	Headcannon	\N	[]	headcannon	2020-12-21 19:56:04.839832+00	2020-12-21 19:56:04.839849+00
260	RedLynx	\N	[]	redlynx	2020-12-21 16:12:08.933592+00	2020-12-21 16:12:08.933611+00
261	Massive Entertainment	\N	[]	massive-entertainment	2020-12-21 16:12:08.96264+00	2020-12-21 16:12:08.962659+00
262	Ubisoft Kyiv	\N	[]	ubisoft-kyiv	2020-12-21 16:12:08.968961+00	2020-12-21 16:12:08.968991+00
277	WayForward Technologies	\N	[]	wayforward-technologies	2020-12-21 19:56:03.962583+00	2020-12-21 20:10:28.419427+00
263	Ubisoft Milan	\N	[]	ubisoft-milan	2020-12-21 16:12:09.487923+00	2020-12-21 16:12:09.48795+00
275	Q Entertainment	\N	[]	q-entertainment	2020-12-21 19:56:02.808726+00	2020-12-21 19:56:02.808764+00
265	Namco	\N	[]	namco	2020-12-21 16:12:09.633075+00	2020-12-21 16:12:09.633096+00
266	MachineGames	\N	[]	machinegames	2020-12-21 16:12:09.727956+00	2020-12-21 16:12:09.727976+00
267	Arkane Studios	\N	[]	arkane-studios	2020-12-21 16:12:09.754671+00	2020-12-21 16:12:09.754694+00
268	PUBG Corporation	\N	[]	pubg-corporation	2020-12-21 16:12:09.86128+00	2020-12-21 16:12:09.861302+00
276	Mimimi Productions	\N	[]	mimimi-productions	2020-12-21 19:56:03.507429+00	2020-12-21 19:56:03.507455+00
286	Konjak	\N	[]	konjak	2020-12-21 20:10:27.794856+00	2020-12-21 20:10:27.794873+00
287	The Game Kitchen	\N	[]	the-game-kitchen	2020-12-21 20:10:27.811154+00	2020-12-21 20:10:27.811173+00
289	Cyan Worlds	\N	[]	cyan-worlds	2020-12-21 20:10:28.182689+00	2020-12-21 20:10:28.182721+00
278	Nihon Falcom	\N	[]	nihon-falcom	2020-12-21 19:56:04.10076+00	2020-12-21 19:56:04.100786+00
239	Image & Form	\N	[]	image-form	2020-12-21 16:12:06.811971+00	2020-12-21 20:10:27.993665+00
279	United Game Artists	\N	[]	united-game-artists	2020-12-21 19:56:04.192821+00	2020-12-21 19:56:04.192857+00
293	Escape	\N	[]	escape	2020-12-21 20:10:28.692478+00	2020-12-21 20:10:28.692512+00
280	Cavalier Game Studios	\N	[]	cavalier-game-studios	2020-12-21 19:56:04.317141+00	2020-12-21 19:56:04.317162+00
283	Playtonic Games	\N	[]	playtonic-games	2020-12-21 19:56:04.767933+00	2020-12-21 20:10:28.030994+00
288	34BigThings	\N	[]	34bigthings	2020-12-21 20:10:28.050858+00	2020-12-21 20:10:28.050888+00
290	Villa Gorilla	\N	[]	villa-gorilla	2020-12-21 20:10:28.251183+00	2020-12-21 20:10:28.2512+00
50	[a]	\N	[]	a	2020-12-17 19:51:08.014646+00	2020-12-21 20:10:28.44839+00
291	Giant Squid Studios	\N	[]	giant-squid-studios	2020-12-21 20:10:28.292843+00	2020-12-21 20:10:28.292876+00
271	Daedalic Entertainment	\N	[]	daedalic-entertainment	2020-12-21 19:56:02.159747+00	2020-12-21 20:10:28.319869+00
282	Tequila Works	\N	[]	tequila-works	2020-12-21 19:56:04.394655+00	2020-12-21 20:10:28.420843+00
257	Sega	\N	[]	sega	2020-12-21 16:12:08.747278+00	2020-12-21 20:10:28.73311+00
294	Activision	\N	[]	activision	2020-12-21 20:10:28.764206+00	2020-12-21 20:10:28.764226+00
296	Remedy Entertainment	\N	[]	remedy-entertainment	2020-12-21 20:10:28.805665+00	2020-12-21 20:10:28.805698+00
250	Konami	\N	[]	konami	2020-12-21 16:12:08.363905+00	2020-12-21 20:10:29.096517+00
297	Zenimax Online	\N	[]	zenimax-online	2021-02-04 19:58:30.792953+00	2021-02-04 19:58:30.792976+00
298	Stadia Games and Entertainment	\N	[]	stadia-games-and-entertainment	2021-02-05 16:54:05.680349+00	2021-02-05 16:54:05.680376+00
299	Splash Damage	\N	[]	splash-damage	2021-02-05 16:54:05.788729+00	2021-02-05 16:54:05.788756+00
300	Rockstar Games	\N	[]	rockstar-games	2021-02-05 16:54:06.937511+00	2021-02-05 16:54:06.937535+00
227	Square Enix Business Division 11		[""]	square-enix-business-division-11	2020-12-21 16:12:05.047495+00	2021-02-10 05:01:55.382571+00
301	Sketchbook Games	\N	[]	sketchbook-games	2021-02-05 16:54:07.527199+00	2021-02-05 16:54:07.527234+00
302	Rainbow Studios	\N	[]	rainbow-studios	2021-02-05 16:54:08.368385+00	2021-02-05 16:54:08.368424+00
303	QLOC	\N	[]	qloc	2021-02-05 16:54:09.046561+00	2021-02-05 16:54:09.046594+00
304	THQ Nordic	\N	[]	thq-nordic	2021-02-05 19:17:36.675663+00	2021-02-05 19:17:36.675703+00
305	Unit 2 Games	\N	[]	unit-2-games	2021-02-05 19:17:40.993488+00	2021-02-05 19:17:40.993527+00
306	SNK	\N	[]	snk	2021-02-05 19:17:41.066942+00	2021-02-05 19:17:41.066986+00
307	Square Enix Japan	\N	[]	square-enix-japan	2021-02-05 19:17:42.843395+00	2021-02-05 19:17:42.843419+00
308	Uppercut Games	\N	[]	uppercut-games	2021-02-05 19:17:45.319499+00	2021-02-05 19:17:45.319542+00
309	Zeboyd Digital Entertainment	\N	[]	zeboyd-digital-entertainment	2021-02-05 19:18:03.406083+00	2021-02-05 19:18:03.40611+00
311	Muse Games	\N	[]	muse-games	2021-02-05 19:18:06.411737+00	2021-02-05 19:18:06.411761+00
312	Mighty Polygon	\N	[]	mighty-polygon	2021-02-05 19:18:06.44045+00	2021-02-05 19:18:06.440486+00
313	Necrosoft Games	\N	[]	necrosoft-games	2021-02-05 19:18:06.509863+00	2021-02-05 19:18:06.509931+00
314	Nerial	\N	[]	nerial	2021-02-05 19:18:06.693447+00	2021-02-05 19:18:06.693474+00
315	Nine Dots Studio	\N	[]	nine-dots-studio	2021-02-05 19:18:06.789717+00	2021-02-05 19:18:06.789754+00
316	Machine Games	\N	[]	machine-games	2021-02-05 19:18:06.980802+00	2021-02-05 19:18:06.980834+00
317	KOEI TECMO GAMES CO	\N	[]	koei-tecmo-games-co	2021-02-05 19:18:07.901579+00	2021-02-05 19:18:07.901668+00
318	Kittehface Software	\N	[]	kittehface-software	2021-02-05 19:18:08.38654+00	2021-02-05 19:18:08.386567+00
319	Irregular Corp	\N	[]	irregular-corp	2021-02-05 19:18:09.049167+00	2021-02-05 19:18:09.049192+00
320	Honig Studios	\N	[]	honig-studios	2021-02-05 19:18:09.489502+00	2021-02-05 19:18:09.489527+00
321	High Tea Frog	\N	[]	high-tea-frog	2021-02-05 19:18:09.569361+00	2021-02-05 19:18:09.569385+00
322	Herringbone Games	\N	[]	herringbone-games	2021-02-05 19:18:10.407361+00	2021-02-05 19:18:10.407386+00
323	Hologryph	\N	[]	hologryph	2021-02-05 19:18:11.005079+00	2021-02-05 19:18:11.005105+00
324	Heavy Iron	\N	[]	heavy-iron	2021-02-05 19:18:11.63402+00	2021-02-05 19:18:11.634045+00
325	GIANTS Software	\N	[]	giants-software	2021-02-05 19:18:11.692552+00	2021-02-05 19:18:11.692576+00
326	Handy Games	\N	[]	handy-games	2021-02-05 19:18:11.72616+00	2021-02-05 19:18:11.726189+00
327	Gearbox	\N	[]	gearbox	2021-02-05 19:18:12.491172+00	2021-02-05 19:18:12.491198+00
328	Funktronic Labs	\N	[]	funktronic-labs	2021-02-05 19:18:12.978885+00	2021-02-05 19:18:12.97891+00
329	Giant Monkey Robot	\N	[]	giant-monkey-robot	2021-02-05 19:18:13.556924+00	2021-02-05 19:18:13.556975+00
330	FDG Entertainment	\N	[]	fdg-entertainment	2021-02-05 19:18:13.668956+00	2021-02-05 19:18:13.668981+00
331	Forever Entertainment	\N	[]	forever-entertainment	2021-02-05 19:18:13.6946+00	2021-02-05 19:18:13.694624+00
332	Electronic Arts	\N	[]	electronic-arts	2021-02-05 19:18:14.691407+00	2021-02-05 19:18:14.691447+00
334	Poppy Works	\N	[]	poppy-works	2021-02-05 19:29:11.471179+00	2021-02-05 19:29:11.471226+00
335	PlayEveryWare	\N	[]	playeveryware	2021-02-05 19:29:11.851534+00	2021-02-05 19:29:11.851614+00
338	ACE Team	\N	[]	ace-team	2021-02-05 19:40:56.349296+00	2021-02-05 19:40:56.349338+00
339	TinyBuild	\N	[]	tinybuild	2021-02-05 19:40:56.699809+00	2021-02-05 19:40:56.699859+00
340	5 Lives Studios	\N	[]	5-lives-studios	2021-02-05 19:40:57.150889+00	2021-02-05 19:40:57.150932+00
341	SUPERHOT	\N	[]	superhot	2021-02-05 19:40:57.188538+00	2021-02-05 19:40:57.188565+00
342	Asymmetric	\N	[]	asymmetric	2021-02-05 19:40:57.19053+00	2021-02-05 19:40:57.190549+00
343	Milestone	\N	[]	milestone	2021-02-05 19:40:57.420756+00	2021-02-05 19:40:57.420798+00
345	Massive Miniteam	\N	[]	massive-miniteam	2021-02-05 19:40:57.706745+00	2021-02-05 19:40:57.706768+00
346	Devolver Digital	\N	[]	devolver-digital	2021-02-05 19:40:59.703353+00	2021-02-05 19:40:59.703376+00
350	BHVR	\N	[]	bhvr	2021-02-05 20:17:15.798216+00	2021-02-05 20:17:15.798239+00
351	Berzerk	\N	[]	berzerk	2021-02-05 20:17:16.064166+00	2021-02-05 20:17:16.064194+00
352	Camouflaj Studios	\N	[]	camouflaj-studios	2021-02-05 20:17:16.146082+00	2021-02-05 20:17:16.146126+00
353	Bit Loom Games	\N	[]	bit-loom-games	2021-02-05 20:17:16.85336+00	2021-02-05 20:17:16.853383+00
354	Bedtime Digital Games	\N	[]	bedtime-digital-games	2021-02-05 20:17:16.87868+00	2021-02-05 20:17:16.878725+00
355	ILLOGIKA	\N	[]	illogika	2021-02-05 20:52:04.510909+00	2021-02-05 20:52:04.510935+00
356	Coatsink	\N	[]	coatsink	2021-02-05 20:52:12.1896+00	2021-02-05 20:52:12.189646+00
357	Clever Beans	\N	[]	clever-beans	2021-02-05 20:52:13.369548+00	2021-02-05 20:52:13.369572+00
358	Rebellion	\N	[]	rebellion	2021-02-05 23:20:47.84273+00	2021-02-05 23:20:47.842762+00
359	2K Visual Concepts	\N	[]	2k-visual-concepts	2021-02-05 23:20:48.293709+00	2021-02-05 23:20:48.293732+00
361	Engine Software	\N	[]	engine-software	2021-02-05 23:20:48.805548+00	2021-02-05 23:20:48.805571+00
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-01-13 19:31:09.306095+00	1	xCloud	2	[{"changed": {"fields": ["Pictures"]}}]	10	1
2	2021-01-13 19:31:47.394646+00	3	Stadia	2	[{"changed": {"fields": ["Pictures"]}}]	10	1
3	2021-01-13 19:32:55.476339+00	4	Luna	2	[{"changed": {"fields": ["Pictures"]}}]	10	1
4	2021-01-13 19:33:42.619629+00	1	xCloud	2	[{"changed": {"fields": ["Description"]}}]	10	1
5	2021-01-13 19:34:08.983207+00	3	Stadia	2	[{"changed": {"fields": ["Description"]}}]	10	1
6	2021-01-13 19:34:29.228561+00	4	Luna	2	[{"changed": {"fields": ["Description"]}}]	10	1
7	2021-01-14 19:00:38.163129+00	1	xCloud	2	[{"changed": {"fields": ["Description", "Available countries", "Internet requirements", "Supported devices"]}}]	10	1
8	2021-01-14 19:10:45.462812+00	1	xCloud	2	[{"changed": {"fields": ["Description"]}}]	10	1
9	2021-01-14 19:27:17.419542+00	9	GeForce Now	1	[{"added": {}}]	10	1
10	2021-01-14 19:28:13.690634+00	9	GeForce Now	2	[{"changed": {"fields": ["Description"]}}]	10	1
11	2021-01-14 19:29:56.907001+00	9	GeForce Now	2	[{"changed": {"fields": ["Description"]}}]	10	1
12	2021-01-14 20:15:47.778932+00	9	GeForce Now	2	[{"changed": {"fields": ["Description"]}}]	10	1
13	2021-01-14 20:23:12.520924+00	9	GeForce Now	2	[{"changed": {"fields": ["Description"]}}]	10	1
14	2021-01-14 20:34:21.076374+00	3	Stadia	2	[{"changed": {"fields": ["Description", "Available countries", "Internet requirements", "Supported devices"]}}]	10	1
15	2021-01-14 20:35:14.688746+00	3	Stadia	2	[{"changed": {"fields": ["Description"]}}]	10	1
16	2021-01-14 20:35:50.573305+00	3	Stadia	2	[{"changed": {"fields": ["Description"]}}]	10	1
17	2021-01-15 16:48:24.653449+00	1	xCloud	2	[{"changed": {"fields": ["Description", "Internet requirements"]}}]	10	1
18	2021-01-15 19:09:54.165848+00	4	Luna	2	[{"changed": {"fields": ["Description", "Available countries", "Internet requirements", "Supported devices"]}}]	10	1
19	2021-01-15 21:59:22.75557+00	4	Luna	2	[]	10	1
20	2021-01-15 22:07:34.403607+00	10	PlayStation Now	1	[{"added": {}}]	10	1
21	2021-01-15 22:09:32.93451+00	10	PlayStation Now	2	[{"changed": {"fields": ["Available countries"]}}]	10	1
22	2021-01-15 22:12:42.918822+00	10	PlayStation Now	2	[{"changed": {"fields": ["Internet requirements"]}}]	10	1
23	2021-01-15 22:27:38.911774+00	10	PlayStation Now	2	[{"changed": {"fields": ["Description"]}}]	10	1
24	2021-01-15 22:35:19.416042+00	11	Apple Arcade	1	[{"added": {}}]	10	1
25	2021-01-15 22:50:26.469306+00	11	Apple Arcade	2	[{"changed": {"fields": ["Description"]}}]	10	1
26	2021-01-15 23:16:59.750899+00	11	Apple Arcade	2	[{"changed": {"fields": ["Verdict"]}}]	10	1
27	2021-01-15 23:17:26.719321+00	10	PlayStation Now	2	[{"changed": {"fields": ["Verdict"]}}]	10	1
28	2021-01-15 23:17:53.638579+00	9	GeForce Now	2	[{"changed": {"fields": ["Verdict"]}}]	10	1
29	2021-01-15 23:18:13.999312+00	4	Luna	2	[{"changed": {"fields": ["Description", "Verdict"]}}]	10	1
30	2021-01-15 23:18:44.990118+00	3	Stadia	2	[{"changed": {"fields": ["Verdict"]}}]	10	1
31	2021-01-15 23:19:17.27597+00	1	xCloud	2	[{"changed": {"fields": ["Verdict"]}}]	10	1
32	2021-02-10 03:15:41.684058+00	295	(C64/CPC/ZX)	3		6	1
33	2021-02-10 03:17:58.659415+00	292	[note 1]	3		6	1
34	2021-02-10 03:31:44.433218+00	264	[1]	3		6	1
35	2021-02-10 03:48:37.723301+00	256	(Xbox One PS4 Nintendo Switch Windows Stadia)	3		6	1
36	2021-02-10 04:04:40.70361+00	255	(PS4 Xbox One Windows)	3		6	1
37	2021-02-10 04:05:08.549373+00	251	(XBLA)	3		6	1
38	2021-02-10 04:18:12.845722+00	231	MegaPixel Studios (remake)	3		6	1
39	2021-02-10 04:18:47.44952+00	229	(PS2)	3		6	1
40	2021-02-10 05:01:55.386456+00	227	Square Enix Business Division 11	2	[{"changed": {"fields": ["Name", "Pictures", "Slug"]}}]	6	1
41	2021-02-10 14:43:31.254154+00	213	Engine Software (Switch)	3		6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	cgdb_core	developer
7	cgdb_core	genre
8	cgdb_core	languagecode
9	cgdb_core	mode
10	cgdb_core	platform
11	cgdb_core	publisher
12	cgdb_core	series
13	cgdb_core	tag
14	cgdb_core	game
15	cgdb_core	user
16	cgdb_core	store
17	cgdb_core	gameprice
18	cgdb_core	gamereleasedate
19	cgdb_core	gamefreeonsubscription
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-12-12 21:56:31.662871+00
2	contenttypes	0002_remove_content_type_name	2020-12-12 21:56:31.673842+00
3	auth	0001_initial	2020-12-12 21:56:31.732371+00
4	auth	0002_alter_permission_name_max_length	2020-12-12 21:56:31.793928+00
5	auth	0003_alter_user_email_max_length	2020-12-12 21:56:31.811413+00
6	auth	0004_alter_user_username_opts	2020-12-12 21:56:31.827362+00
7	auth	0005_alter_user_last_login_null	2020-12-12 21:56:31.842552+00
8	auth	0006_require_contenttypes_0002	2020-12-12 21:56:31.848281+00
9	auth	0007_alter_validators_add_error_messages	2020-12-12 21:56:31.864779+00
10	auth	0008_alter_user_username_max_length	2020-12-12 21:56:31.880657+00
11	auth	0009_alter_user_last_name_max_length	2020-12-12 21:56:31.895656+00
12	auth	0010_alter_group_name_max_length	2020-12-12 21:56:31.912311+00
13	auth	0011_update_proxy_permissions	2020-12-12 21:56:31.921193+00
14	auth	0012_alter_user_first_name_max_length	2020-12-12 21:56:31.929233+00
15	cgdb_core	0001_initial	2020-12-12 21:56:32.231303+00
16	admin	0001_initial	2020-12-12 21:56:32.518815+00
17	admin	0002_logentry_remove_auto_add	2020-12-12 21:56:32.544207+00
18	admin	0003_logentry_add_action_flag_choices	2020-12-12 21:56:32.567207+00
19	sessions	0001_initial	2020-12-12 21:56:32.585757+00
20	cgdb_core	0002_auto_20201212_2200	2020-12-12 22:01:03.019724+00
21	cgdb_core	0002_auto_20201213_0329	2020-12-13 03:29:26.89096+00
22	cgdb_core	0002_auto_20201213_0338	2020-12-13 03:38:50.66257+00
23	cgdb_core	0002_auto_20201214_2150	2020-12-14 21:50:55.208301+00
24	cgdb_core	0003_auto_20210114_1829	2021-01-14 18:30:02.07348+00
25	cgdb_core	0004_platform_verdict	2021-01-15 23:14:56.786772+00
26	cgdb_core	0005_auto_20210120_2139	2021-01-20 21:39:39.525623+00
27	cgdb_core	0006_gameprice_price_with_subscription	2021-01-20 21:47:28.335863+00
28	cgdb_core	0007_gamereleasedate	2021-01-20 22:23:50.11167+00
29	cgdb_core	0008_auto_20210122_1957	2021-01-22 19:57:19.819853+00
30	cgdb_core	0009_auto_20210202_2151	2021-02-02 21:51:28.926554+00
31	cgdb_core	0010_auto_20210205_1856	2021-02-05 18:56:52.337909+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0qrhg97qcz4aizwk22q55qla6okd9tlf	.eJxVjDsOwjAQBe_iGln-rT-U9JzBWttrHECOFCcV4u4QKQW0b2bei0Xc1ha3QUucCjszyU6_W8L8oL6Dcsd-m3me-7pMie8KP-jg17nQ83K4fwcNR_vWZAImyMUGRKezVV4TgTfkDMgCNquqPQotXcICsgqFYKSwwjslbA3s_QHl7jc9:1koCxv:LMLn-5WKKa_iomwMa1TBcyFp8elkBvDtlBBHsrGKGIU	2020-12-26 22:02:11.023997+00
95d64vgj79w5dcae929acmgr4d54rom6	.eJxVjDsOwjAQBe_iGln-rT-U9JzBWttrHECOFCcV4u4QKQW0b2bei0Xc1ha3QUucCjszyU6_W8L8oL6Dcsd-m3me-7pMie8KP-jg17nQ83K4fwcNR_vWZAImyMUGRKezVV4TgTfkDMgCNquqPQotXcICsgqFYKSwwjslbA3s_QHl7jc9:1kwRaH:CsIZrnD6tU8YUt4kVV7eCq6TAaE6R_FCQGos_mWpyus	2021-01-18 15:15:49.731938+00
3h3tkd0vakptj6ou41gfsoy8njcfvjce	.eJxVjDsOwjAQBe_iGln-rT-U9JzBWttrHECOFCcV4u4QKQW0b2bei0Xc1ha3QUucCjszyU6_W8L8oL6Dcsd-m3me-7pMie8KP-jg17nQ83K4fwcNR_vWZAImyMUGRKezVV4TgTfkDMgCNquqPQotXcICsgqFYKSwwjslbA3s_QHl7jc9:1l2J8p:NCAOD-lg-gPeJchiRNubevr_lH-tH2qQXMZq-OV0M_o	2021-02-03 19:27:43.916457+00
x29l27maetr23qlkv2bhxqbkym5k0xw3	.eJxVjDsOwjAQBe_iGln-rT-U9JzBWttrHECOFCcV4u4QKQW0b2bei0Xc1ha3QUucCjszyU6_W8L8oL6Dcsd-m3me-7pMie8KP-jg17nQ83K4fwcNR_vWZAImyMUGRKezVV4TgTfkDMgCNquqPQotXcICsgqFYKSwwjslbA3s_QHl7jc9:1l7Nte:jLBsAcUTg0pyfmgPDC49jyEhuN2EhGKxxWbs-zF46S0	2021-02-17 19:33:02.15162+00
dc4h8zjnprcpuvh1zngq7tzh1rbw2dtf	.eJxVjDsOwjAQBe_iGln-rT-U9JzBWttrHECOFCcV4u4QKQW0b2bei0Xc1ha3QUucCjszyU6_W8L8oL6Dcsd-m3me-7pMie8KP-jg17nQ83K4fwcNR_vWZAImyMUGRKezVV4TgTfkDMgCNquqPQotXcICsgqFYKSwwjslbA3s_QHl7jc9:1l9Xgi:kVxqUfC-ZBwo18f-SfTzbvB7d2_BWQq6j9hV97l7arw	2021-02-23 18:24:36.369203+00
\.


--
-- Data for Name: game_free_on_subscriptions; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.game_free_on_subscriptions (id, entered, "left", game_id, platform_id) FROM stdin;
9	2020-03-01	\N	301	3
12	2020-10-01	\N	316	3
18	2020-07-01	\N	225	3
19	2020-03-01	\N	226	3
20	2021-02-01	\N	281	3
21	2021-01-01	\N	173	3
22	2020-05-01	\N	222	3
24	2020-12-01	\N	326	3
1	2019-12-01	2020-01-01	309	3
28	2020-07-01	\N	201	3
29	2021-02-01	\N	42	3
33	2021-01-01	\N	299	3
34	2020-12-01	\N	317	3
37	2020-10-01	\N	44	3
39	2020-11-01	\N	208	3
40	2021-01-01	\N	161	3
3	2020-01-01	2020-05-01	229	3
42	2020-07-01	\N	351	3
43	2020-12-01	\N	327	3
46	2021-01-01	\N	331	3
48	2020-12-01	\N	339	3
7	2020-07-01	2020-11-01	239	3
49	2021-01-01	\N	142	3
6	2020-06-01	2020-07-01	72	3
36	2020-05-01	2020-10-01	138	3
2	2020-04-01	2020-07-01	298	3
13	2020-08-01	2020-11-01	223	3
51	2020-12-01	\N	322	3
16	2020-11-01	2021-01-01	341	3
4	2020-05-01	2020-08-01	243	3
35	2020-07-01	2020-10-01	192	3
11	2020-04-01	2020-07-01	302	3
25	2020-09-01	2020-11-01	303	3
38	2020-08-01	2020-10-01	335	3
26	2020-08-01	2021-01-01	352	3
17	2020-04-01	2020-07-01	290	3
32	2020-11-01	2021-01-01	211	3
50	2020-08-01	2020-11-01	179	3
23	2020-10-01	2021-01-01	184	3
30	2020-10-01	2021-01-01	318	3
31	2020-02-01	2021-01-01	336	3
41	2020-10-01	2021-01-01	14	3
47	2020-10-01	2021-01-01	147	3
52	2019-11-01	2020-02-01	214	3
14	2020-01-01	2020-02-01	308	3
56	2020-09-01	\N	169	3
58	2020-04-01	\N	206	3
60	2021-02-01	\N	141	3
8	2019-12-01	2020-03-01	329	3
10	2020-02-01	2020-04-01	189	3
5	2020-11-01	2021-02-01	71	3
63	2020-09-01	\N	334	3
27	2020-11-01	2021-02-01	69	3
68	2020-12-01	\N	156	3
59	2020-06-01	2021-02-01	343	3
44	2020-08-01	2020-09-01	118	3
69	2020-12-01	\N	286	3
53	2019-11-01	2020-11-01	153	3
65	2020-12-01	2021-02-01	177	3
15	2020-09-01	2020-12-01	342	3
57	2020-03-01	2020-09-01	171	3
67	2020-09-01	2021-01-01	333	3
66	2020-12-01	2021-02-01	172	3
54	2020-06-01	2020-12-01	182	3
64	2020-06-01	2020-09-01	294	3
55	2020-06-01	2020-12-01	63	3
45	2020-11-01	2021-02-01	353	3
62	2020-06-01	2020-12-01	183	3
61	2020-09-01	2020-12-01	39	3
\.


--
-- Data for Name: game_prices; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.game_prices (id, price, created_at, updated_at, game_id, store_id, price_with_subscription) FROM stdin;
\.


--
-- Data for Name: game_release_dates; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.game_release_dates (id, release_date, game_id, platform_id) FROM stdin;
1	2021-02-01	42	3
2	2021-02-02	278	3
3	2021-01-28	186	3
4	2021-01-28	279	3
5	2020-12-22	281	3
6	2020-12-15	151	3
7	2021-01-29	280	3
8	2020-12-15	148	3
9	2021-01-14	285	3
10	2020-12-22	283	3
11	2021-01-26	207	3
12	2020-12-22	286	3
13	2020-04-23	288	3
14	2020-12-15	149	3
15	2020-03-17	289	3
16	2020-04-28	191	3
17	2020-12-09	236	3
18	2020-03-10	225	3
19	2020-12-09	238	3
20	2020-03-25	228	3
21	2020-03-03	290	3
22	2020-04-28	294	3
23	2020-03-27	291	3
24	2020-12-09	292	3
25	2020-11-30	199	3
26	2020-08-18	158	3
27	2020-08-04	297	3
28	2020-12-09	295	3
29	2020-04-01	298	3
30	2020-12-08	299	3
31	2020-03-10	222	3
32	2020-03-01	301	3
33	2020-02-25	302	3
34	2020-03-01	226	3
35	2020-06-23	303	3
36	2019-12-18	304	3
37	2020-02-04	306	3
38	2019-11-19	307	3
39	2019-11-19	229	3
40	2019-11-19	233	3
41	2019-12-05	17	3
42	2019-11-19	308	3
43	2019-11-19	309	3
44	2020-12-08	154	3
45	2019-11-19	209	3
46	2019-11-19	181	3
47	2020-12-03	175	3
48	2019-11-19	241	3
49	2020-06-16	72	3
50	2020-06-23	312	3
51	2019-12-17	150	3
52	2019-11-19	189	3
53	2019-11-19	197	3
54	2020-12-08	232	3
55	2020-10-01	14	3
56	2020-09-22	173	3
57	2020-11-03	164	3
58	2020-11-12	176	3
59	2020-07-01	192	3
60	2020-07-14	201	3
61	2020-11-12	170	3
62	2020-09-18	242	3
63	2020-09-29	211	3
64	2020-10-01	44	3
65	2020-09-15	208	3
66	2020-09-22	178	3
67	2019-11-19	144	3
68	2020-05-01	243	3
69	2020-08-21	70	3
70	2020-09-01	39	3
71	2020-11-01	69	3
72	2020-10-28	217	3
73	2020-09-04	196	3
74	2020-05-01	138	3
75	2020-11-10	145	3
76	2020-06-01	183	3
77	2020-11-05	142	3
78	2020-11-03	162	3
79	2020-09-24	218	3
80	2020-07-15	184	3
81	2019-11-19	165	3
82	2020-07-01	239	3
83	2020-08-01	223	3
84	2020-06-01	63	3
85	2019-11-19	153	3
86	2020-07-28	147	3
87	2020-06-30	179	3
88	2020-09-04	185	3
89	2020-10-29	240	3
90	2020-11-01	71	3
91	2020-07-10	161	3
92	2020-08-01	118	3
93	2020-08-18	316	3
94	2019-11-19	322	3
95	2020-05-26	318	3
96	2019-11-19	325	3
97	2020-12-01	317	3
98	2020-05-26	341	3
99	2020-12-03	327	3
100	2020-10-15	350	3
101	2020-12-03	326	3
102	2020-12-01	339	3
103	2020-06-23	335	3
104	2020-12-03	319	3
105	2020-12-03	331	3
106	2019-11-19	336	3
107	2020-06-01	343	3
108	2020-12-01	344	3
109	2020-09-01	334	3
110	2020-08-14	352	3
111	2019-11-19	329	3
112	2020-07-01	351	3
113	2020-11-19	337	3
114	2020-11-05	338	3
115	2020-08-28	346	3
116	2020-09-01	342	3
117	2020-10-06	349	3
118	2020-05-21	333	3
119	2020-11-17	330	3
120	2020-11-01	353	3
121	2020-07-14	324	3
122	2021-01-28	186	3
123	2020-12-22	286	3
124	2021-01-28	279	3
125	2021-01-14	285	3
126	2021-01-26	207	3
127	2021-02-01	42	3
128	2020-12-09	238	3
129	2021-02-02	278	3
130	2020-12-15	148	3
131	2020-12-22	281	3
132	2020-12-15	149	3
133	2020-12-22	283	3
134	2021-01-29	280	3
135	2020-12-15	151	3
136	2020-12-08	232	3
137	2020-12-09	236	3
138	2020-12-09	295	3
139	2020-12-08	299	3
140	2020-12-09	292	3
141	2020-12-08	154	3
142	2020-11-03	162	3
143	2020-12-03	327	3
144	2020-12-03	326	3
145	2020-10-28	217	3
146	2020-04-01	298	3
147	2020-03-25	228	3
148	2020-08-28	346	3
149	2020-03-17	289	3
150	2020-05-01	243	3
151	2020-04-28	294	3
152	2020-07-28	147	3
153	2020-04-23	288	3
154	2020-07-01	239	3
155	2020-03-10	222	3
156	2020-04-28	191	3
157	2020-03-27	291	3
158	2020-03-10	225	3
159	2020-03-03	290	3
160	2020-03-01	301	3
161	2020-05-21	333	3
162	2020-03-01	226	3
163	2020-02-25	302	3
164	2020-02-04	306	3
165	2019-12-05	17	3
166	2019-12-18	304	3
167	2019-12-17	150	3
168	2020-12-03	331	3
169	2019-11-19	307	3
170	2020-11-30	199	3
171	2019-11-19	233	3
172	2020-12-01	344	3
173	2019-11-19	229	3
174	2019-11-19	209	3
175	2020-12-03	175	3
176	2019-11-19	241	3
177	2019-11-19	309	3
178	2020-12-03	319	3
179	2019-11-19	197	3
180	2020-11-12	170	3
181	2019-11-19	189	3
182	2020-11-19	337	3
183	2020-12-01	339	3
184	2019-11-19	181	3
185	2019-11-19	308	3
186	2020-11-12	176	3
187	2020-11-17	330	3
188	2019-11-19	336	3
189	2019-11-19	325	3
190	2019-11-19	329	3
191	2019-11-19	153	3
192	2020-11-01	71	3
193	2019-11-19	322	3
194	2020-10-29	240	3
195	2020-06-01	63	3
196	2020-06-30	179	3
197	2019-11-19	144	3
198	2020-07-15	184	3
199	2020-12-01	317	3
200	2019-11-19	165	3
201	2020-09-01	342	3
202	2020-08-18	316	3
203	2020-09-18	242	3
204	2020-06-01	183	3
205	2020-05-26	341	3
206	2020-11-03	164	3
207	2020-11-05	142	3
208	2020-11-10	145	3
209	2020-06-23	335	3
210	2020-07-10	161	3
211	2020-07-14	201	3
212	2020-06-23	312	3
213	2020-05-01	138	3
214	2020-09-01	334	3
215	2020-09-29	211	3
216	2020-11-05	338	3
217	2020-06-16	72	3
218	2020-10-15	350	3
219	2020-07-01	192	3
220	2020-05-26	318	3
221	2020-08-01	118	3
222	2020-06-23	303	3
223	2020-09-22	178	3
224	2020-08-01	223	3
225	2020-09-22	173	3
226	2020-08-14	352	3
227	2020-10-01	44	3
228	2020-09-01	39	3
229	2020-09-04	196	3
230	2020-09-24	218	3
231	2020-09-15	208	3
232	2020-09-04	185	3
233	2020-10-01	14	3
234	2020-08-04	297	3
235	2020-06-01	343	3
236	2020-08-21	70	3
237	2020-11-01	353	3
238	2020-11-01	69	3
239	2020-07-14	324	3
240	2020-07-01	351	3
241	2020-10-06	349	3
242	2020-08-18	158	3
243	2021-01-28	279	3
244	2021-02-01	42	3
245	2021-02-02	278	3
246	2021-01-29	280	3
247	2021-01-26	207	3
248	2021-01-14	285	3
249	2020-12-22	283	3
250	2021-01-28	186	3
251	2020-12-22	281	3
252	2020-12-15	149	3
253	2020-12-22	286	3
254	2020-12-09	295	3
255	2020-12-15	151	3
256	2020-12-09	238	3
257	2020-12-15	148	3
258	2020-12-09	236	3
259	2020-12-09	292	3
260	2020-11-10	145	3
261	2020-12-03	175	3
262	2020-09-29	211	3
263	2020-04-28	294	3
264	2020-09-18	242	3
265	2020-11-12	170	3
266	2020-04-28	191	3
267	2020-09-04	185	3
268	2020-04-23	288	3
269	2020-03-27	291	3
270	2020-09-01	342	3
271	2020-04-01	298	3
272	2020-08-01	118	3
273	2020-03-10	222	3
274	2020-03-25	228	3
275	2020-03-17	289	3
276	2020-03-10	225	3
277	2020-02-25	302	3
278	2020-12-01	339	3
279	2020-02-04	306	3
280	2020-12-08	232	3
281	2020-03-03	290	3
282	2019-12-17	150	3
283	2020-12-01	317	3
284	2020-03-01	226	3
285	2020-03-01	301	3
286	2020-12-03	326	3
287	2020-12-03	319	3
288	2020-12-08	154	3
289	2019-11-19	229	3
290	2020-12-08	299	3
291	2020-12-03	327	3
292	2019-11-19	309	3
293	2019-12-05	17	3
294	2019-11-19	241	3
295	2019-12-18	304	3
296	2020-12-03	331	3
297	2020-11-01	71	3
298	2020-10-01	14	3
299	2019-11-19	307	3
300	2019-11-19	308	3
301	2020-09-22	173	3
302	2020-11-12	176	3
303	2019-11-19	197	3
304	2019-11-19	233	3
305	2019-11-19	209	3
306	2020-08-14	352	3
307	2019-11-19	322	3
308	2019-11-19	189	3
309	2020-10-15	350	3
310	2020-10-29	240	3
311	2020-09-01	334	3
312	2019-11-19	181	3
313	2020-06-01	183	3
314	2020-06-16	72	3
315	2020-11-03	164	3
316	2019-11-19	165	3
317	2019-11-19	325	3
318	2020-11-03	162	3
319	2019-11-19	336	3
320	2019-11-19	144	3
321	2020-07-01	351	3
322	2019-11-19	153	3
323	2019-11-19	329	3
324	2020-06-23	335	3
325	2020-11-01	353	3
326	2020-11-05	142	3
327	2020-06-01	63	3
328	2020-10-28	217	3
329	2020-11-01	69	3
330	2020-08-28	346	3
331	2020-11-17	330	3
332	2020-10-06	349	3
333	2020-11-19	337	3
334	2020-08-04	297	3
335	2020-11-05	338	3
336	2020-10-01	44	3
337	2020-11-30	199	3
338	2020-06-23	312	3
339	2020-07-01	192	3
340	2020-07-14	201	3
341	2020-09-15	208	3
342	2020-05-01	138	3
343	2020-09-04	196	3
344	2020-08-01	223	3
345	2020-08-21	70	3
346	2020-08-18	316	3
347	2020-07-28	147	3
348	2020-06-01	343	3
349	2020-08-18	158	3
350	2020-09-22	178	3
351	2020-09-24	218	3
352	2020-12-01	344	3
353	2020-09-01	39	3
354	2020-07-15	184	3
355	2020-07-14	324	3
356	2020-05-26	318	3
357	2020-05-21	333	3
358	2020-07-01	239	3
359	2020-05-01	243	3
360	2020-06-30	179	3
361	2020-05-26	341	3
362	2020-06-23	303	3
363	2020-07-10	161	3
364	2021-02-02	278	3
365	2021-01-29	280	3
366	2021-01-28	279	3
367	2021-01-28	186	3
368	2021-02-01	42	3
369	2021-01-14	285	3
370	2020-12-22	286	3
371	2020-12-22	281	3
372	2020-12-22	283	3
373	2021-01-26	207	3
374	2020-12-15	151	3
375	2020-12-15	148	3
376	2020-12-15	149	3
377	2020-12-09	236	3
378	2020-12-08	232	3
379	2020-12-03	327	3
380	2020-12-09	295	3
381	2020-12-09	238	3
382	2020-04-23	288	3
383	2020-09-29	211	3
384	2020-04-28	191	3
385	2020-04-28	294	3
386	2020-03-27	291	3
387	2020-04-01	298	3
388	2020-12-03	319	3
389	2020-03-25	228	3
390	2020-07-10	161	3
391	2020-09-24	218	3
392	2020-03-17	289	3
393	2020-03-10	225	3
394	2020-03-10	222	3
395	2020-12-09	292	3
396	2020-03-03	290	3
397	2020-03-01	301	3
398	2020-12-03	326	3
399	2020-03-01	226	3
400	2020-11-05	338	3
401	2020-12-08	154	3
402	2019-12-18	304	3
403	2020-02-25	302	3
404	2019-12-17	150	3
405	2020-12-08	299	3
406	2020-11-30	199	3
407	2020-11-19	337	3
408	2020-02-04	306	3
409	2019-12-05	17	3
410	2019-11-19	309	3
411	2020-12-01	317	3
412	2020-12-01	344	3
413	2020-12-01	339	3
414	2019-11-19	229	3
415	2020-11-10	145	3
416	2019-11-19	241	3
417	2019-11-19	197	3
418	2019-11-19	307	3
419	2019-11-19	233	3
420	2020-11-03	162	3
421	2019-11-19	308	3
422	2019-11-19	181	3
423	2019-11-19	209	3
424	2019-11-19	336	3
425	2020-11-01	69	3
426	2020-11-12	176	3
427	2020-09-22	173	3
428	2020-08-04	297	3
429	2020-07-01	192	3
430	2019-11-19	189	3
431	2020-07-01	239	3
432	2020-11-01	353	3
433	2020-11-05	142	3
434	2020-12-03	331	3
435	2020-11-17	330	3
436	2019-11-19	322	3
437	2020-09-15	208	3
438	2020-09-22	178	3
439	2020-07-01	351	3
440	2020-09-01	334	3
441	2020-07-14	324	3
442	2020-05-01	138	3
443	2020-06-23	312	3
444	2020-08-18	316	3
445	2020-09-04	196	3
446	2019-11-19	153	3
447	2020-05-26	318	3
448	2019-11-19	144	3
449	2020-05-01	243	3
450	2020-06-01	183	3
451	2019-11-19	325	3
452	2020-08-01	223	3
453	2020-06-16	72	3
454	2020-10-28	217	3
455	2020-12-03	175	3
456	2020-05-26	341	3
457	2020-10-01	44	3
458	2020-06-23	335	3
459	2020-11-12	170	3
460	2019-11-19	329	3
461	2020-08-21	70	3
462	2020-11-01	71	3
463	2020-09-18	242	3
464	2020-08-28	346	3
465	2020-05-21	333	3
466	2020-11-03	164	3
467	2020-10-01	14	3
468	2020-06-01	63	3
469	2020-09-04	185	3
470	2020-06-23	303	3
471	2020-06-30	179	3
472	2020-10-06	349	3
473	2020-08-14	352	3
474	2020-10-29	240	3
475	2019-11-19	165	3
476	2020-08-01	118	3
477	2020-06-01	343	3
478	2020-10-15	350	3
479	2020-07-14	201	3
480	2020-07-15	184	3
481	2020-09-01	342	3
482	2020-07-28	147	3
483	2020-09-01	39	3
484	2020-08-18	158	3
485	2021-01-28	279	3
486	2021-01-20	168	3
487	2020-12-22	281	3
488	2020-12-22	283	3
489	2021-01-28	186	3
490	2021-02-02	278	3
491	2021-02-01	42	3
492	2021-01-14	285	3
493	2020-12-15	151	3
494	2020-12-15	149	3
495	2020-12-08	154	3
496	2021-01-29	280	3
497	2020-12-22	141	3
498	2021-01-26	207	3
499	2020-12-09	236	3
500	2020-12-03	175	3
501	2020-12-09	238	3
502	2020-12-22	286	3
503	2020-12-09	295	3
504	2020-04-28	195	3
505	2020-04-28	191	3
506	2020-12-03	327	3
507	2020-12-15	148	3
508	2020-03-25	228	3
509	2020-11-10	145	3
510	2020-12-08	299	3
511	2020-12-03	326	3
512	2020-12-03	331	3
513	2020-12-08	232	3
514	2020-12-09	292	3
515	2020-04-01	298	3
516	2020-11-05	338	3
517	2020-11-03	164	3
518	2020-04-28	294	3
519	2020-03-10	225	3
520	2020-11-01	71	3
521	2020-09-01	334	3
522	2020-06-23	312	3
523	2020-03-17	289	3
524	2020-12-01	156	3
525	2020-11-12	170	3
526	2020-04-23	288	3
527	2020-03-27	291	3
528	2020-10-15	350	3
529	2020-11-30	199	3
530	2020-03-10	222	3
531	2020-06-30	179	3
532	2020-12-03	319	3
533	2020-11-24	216	3
534	2020-11-03	162	3
535	2020-03-03	290	3
536	2020-11-12	176	3
537	2020-06-01	182	3
538	2020-07-14	324	3
539	2020-12-01	344	3
540	2020-09-01	169	3
541	2020-03-01	301	3
542	2020-08-21	70	3
543	2020-09-18	242	3
544	2020-06-01	343	3
545	2020-11-05	142	3
546	2020-08-18	158	3
547	2020-08-14	352	3
548	2020-09-04	185	3
549	2020-08-01	118	3
550	2019-12-18	304	3
551	2020-07-01	351	3
552	2020-08-28	346	3
553	2020-12-01	177	3
554	2020-09-15	237	3
555	2020-08-21	203	3
556	2020-09-15	208	3
557	2020-10-01	44	3
558	2020-11-17	330	3
559	2020-07-01	192	3
560	2020-07-01	239	3
561	2020-02-25	302	3
562	2019-12-17	157	3
563	2020-03-01	226	3
564	2020-12-01	339	3
565	2020-09-04	196	3
566	2020-08-04	297	3
567	2020-09-01	39	3
568	2020-09-24	218	3
569	2020-02-04	306	3
570	2020-11-01	69	3
571	2019-11-19	233	3
572	2020-07-14	201	3
573	2020-10-28	217	3
574	2019-12-17	150	3
575	2020-11-19	337	3
576	2019-11-19	307	3
577	2019-11-19	214	3
578	2019-11-19	209	3
579	2019-11-19	171	3
580	2020-05-21	333	3
581	2019-11-19	144	3
582	2019-11-19	197	3
583	2020-08-01	223	3
584	2019-11-19	308	3
585	2020-08-18	316	3
586	2019-11-19	165	3
587	2020-03-20	155	3
588	2019-11-19	329	3
589	2019-11-19	241	3
590	2020-09-01	172	3
591	2019-11-19	189	3
592	2019-11-19	200	3
593	2019-12-05	17	3
594	2020-12-01	317	3
595	2019-11-19	167	3
596	2019-11-19	229	3
597	2020-05-26	318	3
598	2019-11-19	153	3
599	2019-11-19	309	3
600	2019-11-19	325	3
601	2020-09-01	342	3
602	2019-11-19	336	3
603	2020-06-01	63	3
604	2019-11-19	204	3
605	2020-05-01	243	3
606	2019-11-19	181	3
607	2019-11-19	322	3
608	2020-09-22	173	3
609	2020-05-01	138	3
610	2020-09-22	178	3
611	2020-06-16	72	3
612	2020-06-23	335	3
613	2020-07-15	184	3
614	2020-06-23	303	3
615	2020-07-10	161	3
616	2020-04-28	206	3
617	2020-06-01	183	3
618	2020-11-01	353	3
619	2020-09-29	211	3
620	2020-10-06	349	3
621	2020-05-12	152	3
622	2020-10-29	240	3
623	2020-10-01	14	3
624	2020-07-28	147	3
625	2020-05-26	341	3
626	2021-02-01	42	3
627	2021-01-29	280	3
628	2021-01-14	285	3
629	2020-12-22	141	3
630	2020-12-15	151	3
631	2020-12-22	286	3
632	2021-01-28	279	3
633	2020-12-09	236	3
634	2021-01-26	207	3
635	2020-12-09	238	3
636	2020-12-15	149	3
637	2021-01-28	186	3
638	2021-02-02	278	3
639	2021-01-20	168	3
640	2020-12-22	283	3
641	2020-12-22	281	3
642	2020-12-08	299	3
643	2020-12-08	232	3
644	2020-12-15	148	3
645	2020-11-17	330	3
646	2020-12-01	177	3
647	2020-09-04	185	3
648	2020-04-28	294	3
649	2020-12-09	292	3
650	2020-11-03	162	3
651	2020-04-28	195	3
652	2020-12-03	175	3
653	2020-04-28	191	3
654	2020-12-08	154	3
655	2020-12-01	317	3
656	2020-11-10	145	3
657	2020-11-03	164	3
658	2020-08-18	158	3
659	2020-11-01	69	3
660	2020-09-15	237	3
661	2020-11-05	338	3
662	2020-12-03	327	3
663	2020-10-06	349	3
664	2020-09-24	218	3
665	2020-09-01	39	3
666	2020-12-03	319	3
667	2020-03-01	301	3
668	2020-12-03	331	3
669	2020-11-12	176	3
670	2020-05-01	243	3
671	2020-04-23	288	3
672	2020-04-01	298	3
673	2020-11-05	142	3
674	2020-03-03	290	3
675	2020-11-19	337	3
676	2020-07-14	324	3
677	2020-07-14	201	3
678	2020-07-01	239	3
679	2020-10-28	217	3
680	2020-10-15	350	3
681	2020-09-01	169	3
682	2020-05-12	152	3
683	2020-11-01	71	3
684	2020-10-01	44	3
685	2020-12-09	295	3
686	2020-10-29	240	3
687	2020-12-03	326	3
688	2020-10-01	14	3
689	2020-03-10	225	3
690	2020-09-01	342	3
691	2020-03-27	291	3
692	2020-03-10	222	3
693	2020-11-24	216	3
694	2020-03-20	155	3
695	2020-07-28	147	3
696	2020-03-25	228	3
697	2020-08-28	346	3
698	2020-08-21	203	3
699	2020-09-01	172	3
700	2020-02-25	302	3
701	2020-03-01	226	3
702	2020-11-30	199	3
703	2020-09-18	242	3
704	2020-03-17	289	3
705	2020-09-15	208	3
706	2019-12-18	304	3
707	2020-07-01	192	3
708	2020-09-29	211	3
709	2020-06-30	179	3
710	2020-02-04	306	3
711	2019-11-19	209	3
712	2020-06-01	182	3
713	2020-12-01	339	3
714	2020-12-01	344	3
715	2020-12-01	156	3
716	2019-11-19	309	3
717	2019-12-05	17	3
718	2020-08-14	352	3
719	2020-05-26	318	3
720	2020-07-10	161	3
721	2020-11-12	170	3
722	2020-06-23	335	3
723	2020-09-04	196	3
724	2020-08-21	70	3
725	2020-05-01	138	3
726	2020-06-16	72	3
727	2020-07-01	351	3
728	2020-09-22	178	3
729	2020-08-04	297	3
730	2020-06-01	343	3
731	2020-05-26	341	3
732	2020-11-01	353	3
733	2020-06-23	312	3
734	2019-11-19	229	3
735	2019-12-17	150	3
736	2019-11-19	307	3
737	2020-08-01	223	3
738	2019-11-19	233	3
739	2020-09-01	334	3
740	2019-11-19	153	3
741	2020-07-15	184	3
742	2019-12-17	157	3
743	2019-11-19	197	3
744	2020-06-01	183	3
745	2020-08-01	118	3
746	2019-11-19	189	3
747	2019-11-19	336	3
748	2019-11-19	200	3
749	2020-04-28	206	3
750	2019-11-19	171	3
751	2019-11-19	181	3
752	2019-11-19	308	3
753	2019-11-19	165	3
754	2019-11-19	214	3
755	2019-11-19	322	3
756	2019-11-19	204	3
757	2019-11-19	241	3
758	2019-11-19	325	3
759	2019-11-19	329	3
760	2020-08-18	316	3
761	2019-11-19	144	3
762	2020-05-21	333	3
763	2020-06-23	303	3
764	2019-11-19	167	3
765	2020-09-22	173	3
766	2020-06-01	63	3
767	2021-02-02	278	3
768	2020-12-09	295	3
769	2020-12-08	232	3
770	2021-01-28	186	3
771	2021-01-28	279	3
772	2021-01-29	280	3
773	2020-12-09	238	3
774	2021-01-26	207	3
775	2020-12-03	175	3
776	2021-01-20	168	3
777	2021-01-14	285	3
778	2020-12-22	281	3
779	2020-12-08	154	3
780	2020-12-09	236	3
781	2020-12-15	151	3
782	2020-12-03	326	3
783	2020-12-08	299	3
784	2020-12-09	292	3
785	2020-12-15	148	3
786	2020-12-22	283	3
787	2021-02-01	42	3
788	2020-12-22	286	3
789	2020-12-03	319	3
790	2020-12-03	327	3
791	2020-12-15	149	3
792	2020-12-22	141	3
793	2020-12-03	331	3
794	2020-12-01	317	3
795	2020-12-01	339	3
796	2020-12-01	156	3
797	2020-11-05	142	3
798	2020-12-01	177	3
799	2020-06-30	179	3
800	2020-12-01	344	3
801	2020-08-01	223	3
802	2020-04-23	288	3
803	2020-11-30	199	3
804	2020-09-15	208	3
805	2020-04-28	191	3
806	2020-04-28	195	3
807	2020-04-28	294	3
808	2020-04-01	298	3
809	2020-11-24	216	3
810	2020-03-20	155	3
811	2020-03-10	222	3
812	2020-03-17	289	3
813	2020-03-01	301	3
814	2020-11-17	330	3
815	2020-03-27	291	3
816	2020-03-25	228	3
817	2019-12-18	304	3
818	2020-11-19	337	3
819	2020-03-10	225	3
820	2020-02-25	302	3
821	2020-11-12	170	3
822	2020-03-03	290	3
823	2019-11-19	233	3
824	2020-02-04	306	3
825	2020-11-03	164	3
826	2020-03-01	226	3
827	2019-12-05	17	3
828	2019-11-19	241	3
829	2019-11-19	229	3
830	2019-12-17	157	3
831	2020-11-03	162	3
832	2020-11-05	338	3
833	2019-12-17	150	3
834	2019-11-19	307	3
835	2020-11-12	176	3
836	2019-11-19	214	3
837	2020-08-21	70	3
838	2020-11-10	145	3
839	2019-11-19	209	3
840	2019-11-19	308	3
841	2019-11-19	309	3
842	2019-11-19	200	3
843	2019-11-19	189	3
844	2019-11-19	181	3
845	2020-09-01	169	3
846	2020-09-04	196	3
847	2019-11-19	197	3
848	2020-09-01	342	3
849	2019-11-19	165	3
850	2019-11-19	322	3
851	2020-08-28	346	3
852	2020-11-01	71	3
853	2019-11-19	329	3
854	2020-11-01	353	3
855	2020-09-18	242	3
856	2019-11-19	204	3
857	2020-09-01	172	3
858	2019-11-19	153	3
859	2019-11-19	325	3
860	2020-10-29	240	3
861	2020-09-04	185	3
862	2020-09-22	173	3
863	2020-09-22	178	3
864	2020-10-15	350	3
865	2020-09-01	334	3
866	2020-09-01	39	3
867	2019-11-19	171	3
868	2019-11-19	144	3
869	2019-11-19	336	3
870	2020-09-15	237	3
871	2019-11-19	167	3
872	2020-10-06	349	3
873	2020-07-14	201	3
874	2020-05-26	341	3
875	2020-11-01	69	3
876	2020-10-01	44	3
877	2020-07-14	324	3
878	2020-10-28	217	3
879	2020-07-01	192	3
880	2020-09-24	218	3
881	2020-07-10	161	3
882	2020-07-01	351	3
883	2020-10-01	14	3
884	2020-09-29	211	3
885	2020-05-01	138	3
886	2020-07-15	184	3
887	2020-08-14	352	3
888	2020-08-18	316	3
889	2020-06-01	63	3
890	2020-05-21	333	3
891	2020-05-26	318	3
892	2020-08-04	297	3
893	2020-07-28	147	3
894	2020-08-01	118	3
895	2020-05-01	243	3
896	2020-06-01	183	3
897	2020-06-16	72	3
898	2020-06-23	312	3
899	2020-06-01	343	3
900	2020-04-28	206	3
901	2020-05-12	152	3
902	2020-06-01	182	3
903	2020-08-18	158	3
904	2020-08-21	203	3
905	2020-06-23	335	3
906	2020-06-23	303	3
907	2020-07-01	239	3
908	2021-01-14	285	3
909	2021-01-26	207	3
910	2021-01-28	186	3
911	2021-01-29	280	3
912	2020-12-22	281	3
913	2021-01-28	279	3
914	2020-12-15	148	3
915	2020-12-15	149	3
916	2020-12-09	236	3
917	2021-02-01	42	3
918	2021-01-20	168	3
919	2020-12-22	141	3
920	2020-12-22	286	3
921	2021-02-02	278	3
922	2020-12-15	151	3
923	2020-12-09	292	3
924	2020-12-09	238	3
925	2020-12-09	295	3
926	2020-12-22	283	3
927	2020-12-03	326	3
928	2020-12-08	299	3
929	2020-12-08	232	3
930	2020-12-03	319	3
931	2020-12-08	220	3
932	2020-12-08	154	3
933	2020-09-22	178	3
934	2020-11-30	199	3
935	2020-08-28	346	3
936	2020-12-03	327	3
937	2020-11-24	216	3
938	2020-10-15	350	3
939	2020-04-28	191	3
940	2020-06-30	179	3
941	2020-04-28	195	3
942	2020-04-23	288	3
943	2020-04-28	294	3
944	2020-04-01	298	3
945	2020-03-27	291	3
946	2020-03-25	228	3
947	2020-03-10	225	3
948	2020-03-03	290	3
949	2020-03-20	155	3
950	2020-03-10	222	3
951	2020-03-17	289	3
952	2020-03-01	226	3
953	2020-02-25	302	3
954	2020-03-01	301	3
955	2020-11-17	330	3
956	2020-12-03	331	3
957	2019-11-19	241	3
958	2019-12-17	157	3
959	2020-02-04	306	3
960	2020-12-01	344	3
961	2019-11-19	233	3
962	2019-12-17	150	3
963	2019-12-18	304	3
964	2019-12-05	17	3
965	2020-12-03	175	3
966	2019-11-19	308	3
967	2020-12-01	177	3
968	2020-11-19	337	3
969	2020-12-01	156	3
970	2020-12-01	339	3
971	2019-11-19	309	3
972	2019-11-19	307	3
973	2019-11-19	229	3
974	2020-11-01	353	3
975	2019-11-19	214	3
976	2019-11-19	200	3
977	2019-11-19	209	3
978	2019-11-19	189	3
979	2019-11-19	204	3
980	2020-12-01	317	3
981	2019-11-19	197	3
982	2019-11-19	322	3
983	2019-11-19	336	3
984	2020-11-03	162	3
985	2020-11-12	170	3
986	2019-11-19	329	3
987	2019-11-19	171	3
988	2019-11-19	181	3
989	2020-09-29	211	3
990	2020-09-01	334	3
991	2020-10-29	240	3
992	2019-11-19	165	3
993	2020-11-03	164	3
994	2020-09-01	342	3
995	2020-09-24	218	3
996	2020-09-15	208	3
997	2019-11-19	144	3
998	2020-09-01	39	3
999	2019-11-19	153	3
1000	2019-11-19	167	3
1001	2020-09-04	196	3
1002	2020-05-26	318	3
1003	2020-09-18	242	3
1004	2020-05-01	138	3
1005	2020-05-21	333	3
1006	2020-10-28	217	3
1007	2019-11-19	325	3
1008	2020-04-28	206	3
1009	2020-09-01	169	3
1010	2020-09-15	237	3
1011	2020-06-01	183	3
1012	2020-11-10	145	3
1013	2020-05-01	243	3
1014	2020-05-26	341	3
1015	2020-09-01	172	3
1016	2020-10-01	44	3
1017	2020-10-01	14	3
1018	2020-09-04	185	3
1019	2020-09-22	173	3
1020	2020-10-06	349	3
1021	2020-05-12	152	3
1022	2020-11-05	142	3
1023	2020-11-01	71	3
1024	2020-11-01	69	3
1025	2020-11-05	338	3
1026	2020-11-12	176	3
1027	2020-06-23	335	3
1028	2020-07-01	239	3
1029	2020-07-28	147	3
1030	2020-08-14	352	3
1031	2020-07-14	324	3
1032	2020-07-01	192	3
1033	2020-08-01	118	3
1034	2020-08-21	70	3
1035	2020-08-18	316	3
1036	2020-06-23	303	3
1037	2020-06-23	312	3
1038	2020-07-01	351	3
1039	2020-08-01	223	3
1040	2020-07-15	184	3
1041	2020-06-01	182	3
1042	2020-08-04	297	3
1043	2020-06-01	343	3
1044	2020-08-21	203	3
1045	2020-06-01	63	3
1046	2020-07-10	161	3
1047	2020-08-18	158	3
1048	2020-06-16	72	3
1049	2020-07-14	201	3
1050	2021-02-02	278	3
1051	2021-01-14	285	3
1052	2021-01-28	186	3
1053	2021-01-29	280	3
1054	2021-01-20	168	3
1055	2020-12-22	141	3
1056	2021-01-28	279	3
1057	2021-02-01	42	3
1058	2021-01-26	207	3
1059	2020-12-22	281	3
1060	2020-12-22	286	3
1061	2020-12-22	283	3
1062	2020-12-15	151	3
1063	2020-12-09	238	3
1064	2020-12-15	149	3
1065	2020-12-15	148	3
1066	2020-12-09	295	3
1067	2020-12-09	292	3
1068	2020-12-09	236	3
1069	2020-12-08	232	3
1070	2020-04-28	191	3
1071	2020-12-01	177	3
1072	2020-04-23	288	3
1073	2020-04-28	294	3
1074	2020-09-04	196	3
1075	2020-04-01	298	3
1076	2020-12-01	339	3
1077	2020-04-28	195	3
1078	2020-03-27	291	3
1079	2020-09-24	218	3
1080	2020-03-25	228	3
1081	2020-06-23	335	3
1082	2020-03-10	225	3
1083	2020-03-17	289	3
1084	2020-07-15	184	3
1085	2020-03-20	155	3
1086	2020-09-04	185	3
1087	2020-09-15	208	3
1088	2020-03-01	226	3
1089	2020-03-01	301	3
1090	2020-03-03	290	3
1091	2020-03-10	222	3
1092	2020-02-25	302	3
1093	2020-02-04	306	3
1094	2019-11-19	241	3
1095	2019-12-17	150	3
1096	2019-12-05	17	3
1097	2019-12-17	157	3
1098	2019-12-18	304	3
1099	2019-11-19	233	3
1100	2019-11-19	309	3
1101	2019-11-19	229	3
1102	2019-11-19	214	3
1103	2020-12-03	331	3
1104	2019-11-19	307	3
1105	2020-12-03	175	3
1106	2020-12-01	156	3
1107	2019-11-19	204	3
1108	2019-11-19	209	3
1109	2020-11-30	199	3
1110	2020-12-03	319	3
1111	2020-12-03	326	3
1112	2019-11-19	171	3
1113	2020-12-03	327	3
1114	2019-11-19	189	3
1115	2019-11-19	197	3
1116	2020-12-01	344	3
1117	2020-12-01	317	3
1118	2019-11-19	200	3
1119	2019-11-19	322	3
1120	2019-11-19	325	3
1121	2019-11-19	308	3
1122	2020-12-08	154	3
1123	2019-11-19	181	3
1124	2019-11-19	329	3
1125	2019-11-19	336	3
1126	2020-09-22	173	3
1127	2019-11-19	165	3
1128	2019-11-19	167	3
1129	2020-09-01	342	3
1130	2020-12-08	299	3
1131	2020-09-01	172	3
1132	2019-11-19	153	3
1133	2019-11-19	144	3
1134	2020-09-22	178	3
1135	2020-06-01	343	3
1136	2020-11-03	164	3
1137	2020-11-24	216	3
1138	2020-12-08	220	3
1139	2020-10-28	217	3
1140	2020-10-01	44	3
1141	2020-10-29	240	3
1142	2020-09-01	334	3
1143	2020-08-21	203	3
1144	2020-08-01	223	3
1145	2020-11-12	170	3
1146	2020-10-06	349	3
1147	2020-08-28	346	3
1148	2020-09-18	242	3
1149	2020-11-17	330	3
1150	2020-11-12	176	3
1151	2020-09-15	237	3
1152	2020-10-01	14	3
1153	2020-11-19	337	3
1154	2020-09-29	211	3
1155	2020-08-21	70	3
1156	2020-11-01	71	3
1157	2020-11-10	145	3
1158	2020-11-05	142	3
1159	2020-11-01	353	3
1160	2020-10-15	350	3
1161	2020-11-01	69	3
1162	2020-09-01	39	3
1163	2020-07-28	147	3
1164	2020-11-03	162	3
1165	2020-09-01	169	3
1166	2020-11-05	338	3
1167	2020-08-04	297	3
1168	2020-07-14	201	3
1169	2020-07-01	239	3
1170	2020-08-01	118	3
1171	2020-05-26	341	3
1172	2020-08-14	352	3
1173	2020-08-18	158	3
1174	2020-08-18	316	3
1175	2020-05-26	318	3
1176	2020-06-01	183	3
1177	2020-07-01	351	3
1178	2020-06-16	72	3
1179	2020-05-01	243	3
1180	2020-05-21	333	3
1181	2020-06-30	179	3
1182	2020-07-01	192	3
1183	2020-06-01	63	3
1184	2020-06-01	182	3
1185	2020-05-01	138	3
1186	2020-07-10	161	3
1187	2020-05-12	152	3
1188	2020-04-28	206	3
1189	2020-06-23	303	3
1190	2020-07-14	324	3
1191	2020-06-23	312	3
1192	2020-12-22	283	3
1193	2021-01-20	168	3
1194	2020-12-09	295	3
1195	2021-02-01	42	3
1196	2020-12-22	281	3
1197	2020-12-09	238	3
1198	2021-02-02	278	3
1199	2021-01-14	285	3
1200	2021-01-29	280	3
1201	2021-01-28	279	3
1202	2020-12-22	286	3
1203	2020-12-15	148	3
1204	2020-12-22	141	3
1205	2021-01-26	207	3
1206	2021-01-28	186	3
1207	2020-12-15	149	3
1208	2020-12-09	236	3
1209	2020-12-15	151	3
1210	2020-12-08	232	3
1211	2020-03-03	290	3
1212	2020-03-25	228	3
1213	2020-03-10	225	3
1214	2020-04-01	298	3
1215	2020-03-01	226	3
1216	2020-11-12	176	3
1217	2020-12-09	292	3
1218	2020-04-23	288	3
1219	2020-03-27	291	3
1220	2020-10-28	217	3
1221	2019-12-17	157	3
1222	2020-04-28	195	3
1223	2020-11-24	216	3
1224	2020-12-08	154	3
1225	2020-03-20	155	3
1226	2020-02-25	302	3
1227	2020-12-03	331	3
1228	2020-04-28	294	3
1229	2020-12-08	299	3
1230	2020-03-17	289	3
1231	2020-08-28	346	3
1232	2020-09-24	218	3
1233	2020-04-28	191	3
1234	2019-12-18	304	3
1235	2020-03-10	222	3
1236	2020-07-28	147	3
1237	2020-12-08	220	3
1238	2019-12-05	17	3
1239	2020-02-04	306	3
1240	2020-03-01	301	3
1241	2019-11-19	214	3
1242	2020-09-29	211	3
1243	2019-12-17	150	3
1244	2019-11-19	309	3
1245	2019-11-19	204	3
1246	2019-11-19	233	3
1247	2019-11-19	209	3
1248	2019-11-19	165	3
1249	2019-11-19	307	3
1250	2019-11-19	189	3
1251	2019-11-19	241	3
1252	2019-11-19	308	3
1253	2019-11-19	200	3
1254	2019-11-19	197	3
1255	2019-11-19	329	3
1256	2019-11-19	322	3
1257	2019-11-19	144	3
1258	2019-11-19	336	3
1259	2019-11-19	229	3
1260	2019-11-19	181	3
1261	2019-11-19	325	3
1262	2019-11-19	153	3
1263	2020-12-01	344	3
1264	2020-09-22	173	3
1265	2020-11-19	337	3
1266	2020-05-01	243	3
1267	2020-11-30	199	3
1268	2019-11-19	171	3
1269	2019-11-19	167	3
1270	2020-11-17	330	3
1271	2020-12-01	177	3
1272	2020-10-06	349	3
1273	2020-09-01	342	3
1274	2020-11-03	164	3
1275	2020-05-26	341	3
1276	2020-12-01	317	3
1277	2020-10-15	350	3
1278	2020-04-28	206	3
1279	2020-09-01	334	3
1280	2020-08-18	316	3
1281	2020-07-10	161	3
1282	2020-05-26	318	3
1283	2020-09-15	208	3
1284	2020-11-01	69	3
1285	2020-08-14	352	3
1286	2020-12-03	327	3
1287	2020-05-12	152	3
1288	2020-11-01	71	3
1289	2020-11-03	162	3
1290	2020-09-01	169	3
1291	2020-09-01	39	3
1292	2020-12-03	326	3
1293	2020-05-01	138	3
1294	2020-09-01	172	3
1295	2020-06-01	343	3
1296	2020-12-03	319	3
1297	2020-09-18	242	3
1298	2020-09-04	185	3
1299	2020-09-15	237	3
1300	2020-10-01	44	3
1301	2020-12-01	156	3
1302	2020-09-22	178	3
1303	2020-12-01	339	3
1304	2020-11-05	338	3
1305	2020-11-01	353	3
1306	2020-11-12	170	3
1307	2020-12-03	175	3
1308	2020-07-14	324	3
1309	2020-10-29	240	3
1310	2020-09-04	196	3
1311	2020-11-10	145	3
1312	2020-10-01	14	3
1313	2020-11-05	142	3
1314	2020-06-23	303	3
1315	2020-07-01	351	3
1316	2020-08-04	297	3
1317	2020-06-23	335	3
1318	2020-07-01	239	3
1319	2020-05-21	333	3
1320	2020-06-01	63	3
1321	2020-08-01	223	3
1322	2020-07-14	201	3
1323	2020-08-21	70	3
1324	2020-07-01	192	3
1325	2020-06-01	183	3
1326	2020-06-16	72	3
1327	2020-08-21	203	3
1328	2020-08-18	158	3
1329	2020-08-01	118	3
1330	2020-06-30	179	3
1331	2020-06-01	182	3
1332	2020-07-15	184	3
1333	2020-06-23	312	3
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games (id, title, title_lc, description, description_lc, pictures, links, slug, created_at, updated_at, esrb) FROM stdin;
185	Marvel's Avengers	{"en": "Marvel's Avengers"}	Marvel's Avengers is a 2020 action role-playing brawler video game developed by Crystal Dynamics and published by Square Enix. Based on the Marvel Comics superhero team the Avengers, the game is mainly inspired by the Marvel Cinematic Universe's iteration of the group, but also incorporates elements from the team's long-running comic book mythology. The plot follows Inhuman teenager Kamala Khan, who gains superpowers during A-Day, a celebratory day for the Avengers, which ends in tragedy from terrorists; blamed for the disaster, the Avengers disband, and science corporation A.I.M. take their place. Five years later, when A.I.M. threatens to destroy all superpowered individuals, Kamala embarks to reassemble the Avengers to combat this new enemy.	{"en": "Marvel's Avengers is a 2020 action role-playing brawler video game developed by Crystal Dynamics and published by Square Enix. Based on the Marvel Comics superhero team the Avengers, the game is mainly inspired by the Marvel Cinematic Universe's iteration of the group, but also incorporates elements from the team's long-running comic book mythology. The plot follows Inhuman teenager Kamala Khan, who gains superpowers during A-Day, a celebratory day for the Avengers, which ends in tragedy from terrorists; blamed for the disaster, the Avengers disband, and science corporation A.I.M. take their place. Five years later, when A.I.M. threatens to destroy all superpowered individuals, Kamala embarks to reassemble the Avengers to combat this new enemy."}	["https://upload.wikimedia.org/wikipedia/en/c/c0/Avengers_2020_cover_art.png"]	{"stadia": "https://stadia.google.com/store/details/232ff8abc7f74421a477e9e09dbf487drcp1/sku/cfc62fc3307a4ef1930e4644646c8179p"}	marvels-avengers	2020-12-21 16:12:02.740856+00	2021-02-05 23:20:49.152948+00	T
188	Mafia III	{"ar": "مافيا 3", "ca": "Mafia III", "cs": "Mafia III", "de": "Mafia III", "en": "Mafia III", "es": "Mafia III", "et": "Mafia III", "fa": "مافیا ۳", "fi": "Mafia III", "fr": "Mafia III", "hu": "Mafia III", "hy": "Mafia III", "it": "Mafia III", "ja": "マフィア III", "ko": "마피아 III", "lt": "Mafia III", "nl": "Mafia III", "pl": "Mafia III", "pt": "Mafia III", "ro": "Mafia III", "ru": "Mafia III", "sk": "Mafia III", "sr": "Mafia III", "sv": "Mafia III", "tr": "Mafia III", "uk": "Mafia III", "zh": "黑手党III", "arz": "مافيا 3"}	Mafia III is a 2016 action-adventure video game developed by Hangar 13 and published by 2K Games. It was released in October 2016 for PlayStation 4, Xbox One, and Microsoft Windows, and in May 2017 for macOS.[2] It is the sequel to Mafia II and the third installment in the Mafia series. Set within the fictional city of New Bordeaux (based on New Orleans) in 1968, the story follows former criminal and war veteran Lincoln Clay, who is forced to return to a life of crime and aims to build his own organisation while seeking revenge on the Italian mob.	{"en": "Mafia III is a 2016 action-adventure video game developed by Hangar 13 and published by 2K Games. It was released in October 2016 for PlayStation 4, Xbox One, and Microsoft Windows, and in May 2017 for macOS.[2] It is the sequel to Mafia II and the third installment in the Mafia series. Set within the fictional city of New Bordeaux (based on New Orleans) in 1968, the story follows former criminal and war veteran Lincoln Clay, who is forced to return to a life of crime and aims to build his own organisation while seeking revenge on the Italian mob."}	["https://upload.wikimedia.org/wikipedia/en/9/9f/Mafia_III_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D8%A7%D9%81%D9%8A%D8%A7_3", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Mafia_III", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Mafia_III", "wikipedia_de": "https://de.wikipedia.org/wiki/Mafia_III", "wikipedia_en": "https://en.wikipedia.org/wiki/Mafia_III", "wikipedia_es": "https://es.wikipedia.org/wiki/Mafia_III", "wikipedia_et": "https://et.wikipedia.org/wiki/Mafia_III", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%A7%D9%81%DB%8C%D8%A7_%DB%B3", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Mafia_III", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Mafia_III", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Mafia_III", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Mafia_III", "wikipedia_it": "https://it.wikipedia.org/wiki/Mafia_III", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%9E%E3%83%95%E3%82%A3%E3%82%A2_III", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%A7%88%ED%94%BC%EC%95%84_III", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Mafia_III", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Mafia_III", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Mafia_III", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Mafia_III", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Mafia_III", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Mafia_III", "wikipedia_sk": "https://sk.wikipedia.org/wiki/Mafia_III", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Mafia_III", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Mafia_III", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Mafia_III", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Mafia_III", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%BB%91%E6%89%8B%E5%85%9AIII", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%85%D8%A7%D9%81%D9%8A%D8%A7_3"}	mafia-iii	2020-12-21 16:12:02.835674+00	2020-12-21 16:12:02.835695+00	NA
21	De Blob	{"de": "De Blob", "en": "De Blob", "fi": "De Blob", "fr": "De Blob", "hr": "De Blob", "it": "De Blob", "ja": "ブロブ カラフルなきぼう", "ko": "더 블랍: 컬러 레볼루션", "nl": "De Blob", "pt": "De Blob", "arz": "د بلوب"}	De Blob (stylized as de Blob) is a platform-puzzle video game. The game has players explore and liberate an alien city from the evil, monochromatic INKT Corporation that has taken over the city and outlawed all color and fun from daily life. Playing as Blob, players embark on a quest to re-animate the fictional Chroma City and free it from the INKT Corporation by splattering buildings, landmarks, and citizens with color.	{"en": "De Blob (stylized as de Blob) is a platform-puzzle video game. The game has players explore and liberate an alien city from the evil, monochromatic INKT Corporation that has taken over the city and outlawed all color and fun from daily life. Playing as Blob, players embark on a quest to re-animate the fictional Chroma City and free it from the INKT Corporation by splattering buildings, landmarks, and citizens with color."}	["https://upload.wikimedia.org/wikipedia/en/a/a9/De-Blob-US.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/De_Blob", "wikipedia_en": "https://en.wikipedia.org/wiki/De_Blob", "wikipedia_fi": "https://fi.wikipedia.org/wiki/De_Blob", "wikipedia_fr": "https://fr.wikipedia.org/wiki/De_Blob", "wikipedia_hr": "https://hr.wikipedia.org/wiki/De_Blob", "wikipedia_it": "https://it.wikipedia.org/wiki/De_Blob", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%96%E3%83%AD%E3%83%96_%E3%82%AB%E3%83%A9%E3%83%95%E3%83%AB%E3%81%AA%E3%81%8D%E3%81%BC%E3%81%86", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%8D%94_%EB%B8%94%EB%9E%8D:_%EC%BB%AC%EB%9F%AC_%EB%A0%88%EB%B3%BC%EB%A3%A8%EC%85%98", "wikipedia_nl": "https://nl.wikipedia.org/wiki/De_Blob", "wikipedia_pt": "https://pt.wikipedia.org/wiki/De_Blob", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AF_%D8%A8%D9%84%D9%88%D8%A8"}	de-blob	2020-12-17 19:51:04.799486+00	2020-12-17 22:23:20.414639+00	NA
306	Monster Energy Supercross 3	{"en": "Monster Energy Supercross 3"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/d50e1c1b61224bceb65da9406f3f4e8frcp1/sku/3ac3e537019c49028d7bb98e8cd92482"}	monster-energy-supercross-3	2021-02-05 16:52:20.833203+00	2021-02-05 23:20:46.362004+00	E
285	Scott Pilgrim vs. The World	{"en": "Scott Pilgrim vs. The World"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/a3725b4a70aa4447b4c193125f3a2529rcp1/sku/bf065d3d3dca4d0e8d68418f66d3afa1p"}	scott-pilgrim-vs-the-world	2021-02-05 16:52:18.789669+00	2021-02-05 23:20:49.282017+00	T
344	Chronos: Before the Ashes	{"en": "Chronos: Before the Ashes"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/3f94b62fa50c4202be10472947478f8frcp1/sku/c3fcca2c75614bf6b634bedc2f766003p"}	chronos-before-the-ashes	2021-02-05 16:52:23.93289+00	2021-02-05 23:20:45.769191+00	T
104	Carrion	{"en": "Carrion", "fr": "Carrion (jeu vidéo)", "it": "Carrion (videogioco)", "ja": "CARRION", "ru": "Carrion (игра)"}	Carrion is a horror video game developed by Phobia Game Studio and published by Devolver Digital. Described as a "reverse-horror game",[1][2][3] the game allows players to control a tentacled monster whose objective is to make its way through a facility, stalking and killing humans in its path.[1]	{"en": "Carrion is a horror video game developed by Phobia Game Studio and published by Devolver Digital. Described as a \\"reverse-horror game\\",[1][2][3] the game allows players to control a tentacled monster whose objective is to make its way through a facility, stalking and killing humans in its path.[1]"}	["https://upload.wikimedia.org/wikipedia/en/6/63/Carrion_%28video_game%29_Steam_storefront_header.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Carrion_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Carrion_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Carrion_(videogioco)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/CARRION", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Carrion_(%D0%B8%D0%B3%D1%80%D0%B0)"}	carrion	2020-12-18 16:36:42.005092+00	2020-12-18 16:51:23.152563+00	NA
2	A Plague Tale: Innocence	{"ar": "أبليغ تيل: إينوسينس", "de": "A Plague Tale: Innocence", "en": "A Plague Tale: Innocence", "es": "A Plague Tale: Innocence", "fa": "افسانه طاعون: اینسنس", "fi": "A Plague Tale: Innocence", "fr": "A Plague Tale: Innocence", "it": "A Plague Tale: Innocence", "ja": "プレイグ テイル -イノセンス-", "ko": "플래그 테일: 이노센스", "pt": "A Plague Tale: Innocence", "ru": "A Plague Tale: Innocence", "th": "อะเพลกเทลอินโนเซนซ์", "uk": "A Plague Tale: Innocence", "vi": "A Plague Tale: Innocence", "zh": "瘟疫傳說：無罪", "arz": "ابلاجو تايل: اينوسينس", "wuu": "瘟疫传说：无罪"}	A Plague Tale: Innocence is an action-adventure horror stealth game developed by Asobo Studio and published by Focus Home Interactive. It was released for Microsoft Windows, PlayStation 4 and Xbox One in May 2019, and received generally positive reviews from critics.	{"en": "A Plague Tale: Innocence is an action-adventure horror stealth game developed by Asobo Studio and published by Focus Home Interactive. It was released for Microsoft Windows, PlayStation 4 and Xbox One in May 2019, and received generally positive reviews from critics."}	["https://upload.wikimedia.org/wikipedia/en/1/1d/A_Plague_Tale_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D9%84%D9%8A%D8%BA_%D8%AA%D9%8A%D9%84:_%D8%A5%D9%8A%D9%86%D9%88%D8%B3%D9%8A%D9%86%D8%B3", "wikipedia_de": "https://de.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_en": "https://en.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_es": "https://es.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A7%D9%81%D8%B3%D8%A7%D9%86%D9%87_%D8%B7%D8%A7%D8%B9%D9%88%D9%86:_%D8%A7%DB%8C%D9%86%D8%B3%D9%86%D8%B3", "wikipedia_fi": "https://fi.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_fr": "https://fr.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_it": "https://it.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%97%E3%83%AC%E3%82%A4%E3%82%B0_%E3%83%86%E3%82%A4%E3%83%AB_-%E3%82%A4%E3%83%8E%E3%82%BB%E3%83%B3%E3%82%B9-", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%94%8C%EB%9E%98%EA%B7%B8_%ED%85%8C%EC%9D%BC:_%EC%9D%B4%EB%85%B8%EC%84%BC%EC%8A%A4", "wikipedia_pt": "https://pt.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_ru": "https://ru.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%AD%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A5%E0%B8%81%E0%B9%80%E0%B8%97%E0%B8%A5%E0%B8%AD%E0%B8%B4%E0%B8%99%E0%B9%82%E0%B8%99%E0%B9%80%E0%B8%8B%E0%B8%99%E0%B8%8B%E0%B9%8C", "wikipedia_uk": "https://uk.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_vi": "https://vi.wikipedia.org/wiki/A_Plague_Tale:_Innocence", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%98%9F%E7%96%AB%E5%82%B3%E8%AA%AA%EF%BC%9A%E7%84%A1%E7%BD%AA", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D8%A8%D9%84%D8%A7%D8%AC%D9%88_%D8%AA%D8%A7%D9%8A%D9%84:_%D8%A7%D9%8A%D9%86%D9%88%D8%B3%D9%8A%D9%86%D8%B3", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E7%98%9F%E7%96%AB%E4%BC%A0%E8%AF%B4%EF%BC%9A%E6%97%A0%E7%BD%AA"}	a-plague-tale-innocence	2020-12-13 03:40:14.59955+00	2020-12-17 22:23:19.60893+00	NA
38	Hellblade: Senua's Sacrifice	{"ar": "هيل بليد: سنواز سكريفايس", "br": "Hellblade: Senua's Sacrifice", "de": "Hellblade: Senua’s Sacrifice", "en": "Hellblade: Senua's Sacrifice", "es": "Hellblade: Senua's Sacrifice", "fa": "هل‌بلید: پیشکش سنوئا", "fi": "Hellblade: Senua’s Sacrifice", "fr": "Hellblade: Senua's Sacrifice", "gl": "Hellblade: Senua's Sacrifice", "it": "Hellblade: Senua's Sacrifice", "pl": "Hellblade: Senua’s Sacrifice", "pt": "Hellblade: Senua's Sacrifice", "ru": "Hellblade: Senua’s Sacrifice", "sv": "Hellblade: Senua's Sacrifice", "uk": "Hellblade: Senua's Sacrifice", "zh": "地狱之刃：塞娜的献祭", "arz": "هيل بليد: سنواز سكريفايس"}	Hellblade: Senua's Sacrifice is a dark fantasy action-adventure game developed and published by the British video game development studio Ninja Theory. Inspired by Norse mythology and Celtic culture, the game follows Senua, a Pict warrior who must make her way to Helheim by defeating otherworldly entities and facing their challenges, in order to rescue the soul of her dead lover from the goddess Hela. It was released worldwide for Microsoft Windows and PlayStation 4 in August 2017, Xbox One in April 2018, and Nintendo Switch in April 2019. Hellblade features support for virtual reality, which was added in a 2018 update.	{"en": "Hellblade: Senua's Sacrifice is a dark fantasy action-adventure game developed and published by the British video game development studio Ninja Theory. Inspired by Norse mythology and Celtic culture, the game follows Senua, a Pict warrior who must make her way to Helheim by defeating otherworldly entities and facing their challenges, in order to rescue the soul of her dead lover from the goddess Hela. It was released worldwide for Microsoft Windows and PlayStation 4 in August 2017, Xbox One in April 2018, and Nintendo Switch in April 2019. Hellblade features support for virtual reality, which was added in a 2018 update."}	["https://upload.wikimedia.org/wikipedia/en/d/d4/Hellblade_-_Senua%27s_Sacrifice.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%87%D9%8A%D9%84_%D8%A8%D9%84%D9%8A%D8%AF:_%D8%B3%D9%86%D9%88%D8%A7%D8%B2_%D8%B3%D9%83%D8%B1%D9%8A%D9%81%D8%A7%D9%8A%D8%B3", "wikipedia_br": "https://br.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_de": "https://de.wikipedia.org/wiki/Hellblade:_Senua%E2%80%99s_Sacrifice", "wikipedia_en": "https://en.wikipedia.org/wiki/Hellblade:_Senua's_Sacrifice", "wikipedia_es": "https://es.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%87%D9%84%E2%80%8C%D8%A8%D9%84%DB%8C%D8%AF:_%D9%BE%DB%8C%D8%B4%DA%A9%D8%B4_%D8%B3%D9%86%D9%88%D8%A6%D8%A7", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Hellblade:_Senua%E2%80%99s_Sacrifice", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_it": "https://it.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Hellblade:_Senua%E2%80%99s_Sacrifice", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Hellblade:_Senua%E2%80%99s_Sacrifice", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Hellblade:_Senua%27s_Sacrifice", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%9C%B0%E7%8B%B1%E4%B9%8B%E5%88%83%EF%BC%9A%E5%A1%9E%E5%A8%9C%E7%9A%84%E7%8C%AE%E7%A5%AD", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%87%D9%8A%D9%84_%D8%A8%D9%84%D9%8A%D8%AF:_%D8%B3%D9%86%D9%88%D8%A7%D8%B2_%D8%B3%D9%83%D8%B1%D9%8A%D9%81%D8%A7%D9%8A%D8%B3"}	hellblade-senuas-sacrifice	2020-12-17 19:51:06.226532+00	2020-12-17 22:23:21.721961+00	NA
351	Crayta	{"en": "Crayta"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/05f66a46027747a08b930ea70374ac7frcp1/sku/bf97db3ce0644a448815aef1a5c33e0a"}	crayta	2021-02-05 16:52:24.394439+00	2021-02-05 23:20:45.838856+00	T
286	Cthulhu Saves Christmas	{"en": "Cthulhu Saves Christmas"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/769a088b9ef04c04b341911a1ef8b8ecrcp1/sku/5748ef643485495ba71d15041c44f0d4p"}	cthulhu-saves-christmas	2021-02-05 16:52:18.839748+00	2021-02-05 23:20:45.920048+00	T
22	Dirt 4	{"ar": "ديرت 4", "de": "Dirt 4", "en": "Dirt 4", "es": "Dirt 4", "fa": "دیرت ۴", "fi": "Dirt 4", "fr": "Dirt 4", "it": "Dirt 4", "nl": "DiRT 4", "pt": "Dirt 4", "ru": "DiRT 4", "arz": "ديرت 4"}	Dirt 4 (stylised as DiRT4) is a rally-themed racing video game developed by Codemasters. It is the twelfth game in the Colin McRae Rally series and the sixth title to carry the Dirt name. The game was released for Microsoft Windows, PlayStation 4 and Xbox One in June 2017, and for macOS and Linux in March 2019 by Feral Interactive.	{"en": "Dirt 4 (stylised as DiRT4) is a rally-themed racing video game developed by Codemasters. It is the twelfth game in the Colin McRae Rally series and the sixth title to carry the Dirt name. The game was released for Microsoft Windows, PlayStation 4 and Xbox One in June 2017, and for macOS and Linux in March 2019 by Feral Interactive."}	["https://upload.wikimedia.org/wikipedia/en/2/2d/Dirt_4_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AF%D9%8A%D8%B1%D8%AA_4", "wikipedia_de": "https://de.wikipedia.org/wiki/Dirt_4", "wikipedia_en": "https://en.wikipedia.org/wiki/DiRT_4", "wikipedia_es": "https://es.wikipedia.org/wiki/Dirt_4", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AF%DB%8C%D8%B1%D8%AA_%DB%B4", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Dirt_4", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Dirt_4", "wikipedia_it": "https://it.wikipedia.org/wiki/Dirt_4", "wikipedia_nl": "https://nl.wikipedia.org/wiki/DiRT_4", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Dirt_4", "wikipedia_ru": "https://ru.wikipedia.org/wiki/DiRT_4", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AF%D9%8A%D8%B1%D8%AA_4"}	dirt-4	2020-12-17 19:51:04.861975+00	2020-12-17 22:23:20.637138+00	NA
308	Rise of the Tomb Raider: 20 Year Celebration	{"en": "Rise of the Tomb Raider: 20 Year Celebration"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/e5c6ec7bf437491ea4ac0917df8f9640rcp1/sku/f5562aaf93cb46e081d317263bde3013"}	rise-of-the-tomb-raider-20-year-celebration	2021-02-05 16:52:21.094708+00	2021-02-05 23:20:47.271629+00	M17+
246	AO Tennis 2	{"en": "AO Tennis 2"}	AO Tennis 2 is a tennis video game developed and published by Big Ant Studios. It is the sequel to AO Tennis and holds the official license of the tennis Grand Slam Australian Open. The game was initially released on 9 January 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One.	{"en": "AO Tennis 2 is a tennis video game developed and published by Big Ant Studios. It is the sequel to AO Tennis and holds the official license of the tennis Grand Slam Australian Open. The game was initially released on 9 January 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/d/d4/Ao-tennis-2-cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/AO_Tennis_2"}	ao-tennis-2	2020-12-21 19:56:02.085317+00	2020-12-21 19:56:02.085352+00	NA
48	Mudrunner	{"de": "Spintires: MudRunner", "en": "Mudrunner"}	Mudrunner, stylised as  MudRunner (Formerly Spintires: Mudrunner) is an off-roading simulation game developed by Saber Interactive and published by Focus Home Interactive.[1] It was released on October 31, 2017 for Microsoft Windows, PlayStation 4, and Xbox One and is a spin-off/sequel of the 2014 Windows-exclusive Spintires,[2] which was developed by Oovee Game Studios.[3] It was later added to the Xbox Game Pass in December 2018. Similar to Spintires, MudRunner has the player control off-road vehicles as they traverse between locations to complete objectives.[1] The game was released in Japan on Nintendo Switch on June 18, 2020.[4] A sequel to MudRunner was released on April 28, 2020 titled SnowRunner.	{"en": "Mudrunner, stylised as  MudRunner (Formerly Spintires: Mudrunner) is an off-roading simulation game developed by Saber Interactive and published by Focus Home Interactive.[1] It was released on October 31, 2017 for Microsoft Windows, PlayStation 4, and Xbox One and is a spin-off/sequel of the 2014 Windows-exclusive Spintires,[2] which was developed by Oovee Game Studios.[3] It was later added to the Xbox Game Pass in December 2018. Similar to Spintires, MudRunner has the player control off-road vehicles as they traverse between locations to complete objectives.[1] The game was released in Japan on Nintendo Switch on June 18, 2020.[4] A sequel to MudRunner was released on April 28, 2020 titled SnowRunner."}	[]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Spintires:_MudRunner", "wikipedia_en": "https://en.wikipedia.org/wiki/Mudrunner"}	mudrunner	2020-12-17 19:51:06.860807+00	2020-12-17 22:23:22.076258+00	NA
33	Gato Roboto	{"en": "Gato Roboto", "fr": "Gato Roboto", "ja": "Gato Roboto"}	Gato Roboto is a 2D Metroidvania video game developed by American[1] studio doinksoft and published by Devolver Digital on May 30, 2019. The game follows a cat named Kiki attempting to save her owner after they crash land on an alien planet, forcing Kiki to don a mech suit and explore the planet's depths.	{"en": "Gato Roboto is a 2D Metroidvania video game developed by American[1] studio doinksoft and published by Devolver Digital on May 30, 2019. The game follows a cat named Kiki attempting to save her owner after they crash land on an alien planet, forcing Kiki to don a mech suit and explore the planet's depths."}	["https://upload.wikimedia.org/wikipedia/en/0/04/GatoRoboto_Banner.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Gato_Roboto", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Gato_Roboto", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Gato_Roboto"}	gato-roboto	2020-12-17 19:51:05.933219+00	2020-12-17 22:23:21.188415+00	NA
126	ReCore	{"en": "ReCore", "es": "ReCore", "fa": "ریکور (بازی ویدئویی)", "fr": "ReCore", "ja": "ReCore", "pt": "ReCore", "zh": "核心機群", "arz": "ريكور"}	ReCore is an action-adventure and platform video game developed by Comcept and Armature Studio, with assistance from Asobo Studio, and published by Microsoft Studios for Microsoft Windows and Xbox One. The game was released worldwide in September 2016 and re-released in August 2017.	{"en": "ReCore is an action-adventure and platform video game developed by Comcept and Armature Studio, with assistance from Asobo Studio, and published by Microsoft Studios for Microsoft Windows and Xbox One. The game was released worldwide in September 2016 and re-released in August 2017."}	["https://upload.wikimedia.org/wikipedia/en/6/6f/Recore_cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/ReCore", "wikipedia_es": "https://es.wikipedia.org/wiki/ReCore", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B1%DB%8C%DA%A9%D9%88%D8%B1_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/ReCore", "wikipedia_ja": "https://ja.wikipedia.org/wiki/ReCore", "wikipedia_pt": "https://pt.wikipedia.org/wiki/ReCore", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%A0%B8%E5%BF%83%E6%A9%9F%E7%BE%A4", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B1%D9%8A%D9%83%D9%88%D8%B1"}	recore	2020-12-18 16:36:43.139199+00	2020-12-18 16:51:23.84592+00	NA
5	Batman: Arkham Knight	{"ar": "باتمان: أركام نايت", "bg": "Batman: Arkham Knight", "de": "Batman: Arkham Knight", "en": "Batman: Arkham Knight", "es": "Batman: Arkham Knight", "fa": "بتمن: شوالیه آرکهام", "fi": "Batman: Arkham Knight", "fr": "Batman: Arkham Knight", "he": "באטמן: ארקהם נייט", "it": "Batman: Arkham Knight", "ja": "バットマン アーカム・ナイト", "ko": "배트맨: 아캄 나이트", "nl": "Batman: Arkham Knight", "pl": "Batman: Arkham Knight", "pt": "Batman: Arkham Knight", "ru": "Batman: Arkham Knight", "sr": "Batman: Arkham Knight", "sv": "Batman: Arkham Knight", "th": "แบทแมน: อาร์คแฮมไนท์", "tr": "Batman: Arkham Knight", "uk": "Batman: Arkham Knight", "zh": "蝙蝠俠：阿卡漢騎士", "arz": "باتمان: ارخام كنيجت", "wuu": "蝙蝠侠：阿卡姆骑士"}	Batman: Arkham Knight is a 2015 action-adventure game developed by Rocksteady Studios and published by Warner Bros. Interactive Entertainment. Based on the DC Comics superhero Batman, it is the successor to the 2013 video game Batman: Arkham Origins, and the fourth main installment in the Batman: Arkham series. Written by Sefton Hill, Ian Ball and Martin Lancaster, Arkham Knight is inspired by the long-running comic book mythos. Set nine months after the events of 2011's Batman: Arkham City, the game's main storyline follows Batman as he confronts Scarecrow, who has launched an attack on Gotham City, causing a citywide evacuation. Scarecrow, with the help of the mysterious Arkham Knight, is also able to unite Batman's greatest foes in an attempt to finally destroy Batman.	{"en": "Batman: Arkham Knight is a 2015 action-adventure game developed by Rocksteady Studios and published by Warner Bros. Interactive Entertainment. Based on the DC Comics superhero Batman, it is the successor to the 2013 video game Batman: Arkham Origins, and the fourth main installment in the Batman: Arkham series. Written by Sefton Hill, Ian Ball and Martin Lancaster, Arkham Knight is inspired by the long-running comic book mythos. Set nine months after the events of 2011's Batman: Arkham City, the game's main storyline follows Batman as he confronts Scarecrow, who has launched an attack on Gotham City, causing a citywide evacuation. Scarecrow, with the help of the mysterious Arkham Knight, is also able to unite Batman's greatest foes in an attempt to finally destroy Batman."}	["https://upload.wikimedia.org/wikipedia/en/6/6c/Batman_Arkham_Knight_Cover_Art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A8%D8%A7%D8%AA%D9%85%D8%A7%D9%86:_%D8%A3%D8%B1%D9%83%D8%A7%D9%85_%D9%86%D8%A7%D9%8A%D8%AA", "wikipedia_bg": "https://bg.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_de": "https://de.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_en": "https://en.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_es": "https://es.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A8%D8%AA%D9%85%D9%86:_%D8%B4%D9%88%D8%A7%D9%84%DB%8C%D9%87_%D8%A2%D8%B1%DA%A9%D9%87%D8%A7%D9%85", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_he": "https://he.wikipedia.org/wiki/%D7%91%D7%90%D7%98%D7%9E%D7%9F:_%D7%90%D7%A8%D7%A7%D7%94%D7%9D_%D7%A0%D7%99%D7%99%D7%98", "wikipedia_it": "https://it.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%88%E3%83%9E%E3%83%B3_%E3%82%A2%E3%83%BC%E3%82%AB%E3%83%A0%E3%83%BB%E3%83%8A%E3%82%A4%E3%83%88", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%B0%B0%ED%8A%B8%EB%A7%A8:_%EC%95%84%EC%BA%84_%EB%82%98%EC%9D%B4%ED%8A%B8", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%81%E0%B8%9A%E0%B8%97%E0%B9%81%E0%B8%A1%E0%B8%99:_%E0%B8%AD%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%84%E0%B9%81%E0%B8%AE%E0%B8%A1%E0%B9%84%E0%B8%99%E0%B8%97%E0%B9%8C", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Batman:_Arkham_Knight", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%9D%99%E8%9D%A0%E4%BF%A0%EF%BC%9A%E9%98%BF%E5%8D%A1%E6%BC%A2%E9%A8%8E%E5%A3%AB", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A8%D8%A7%D8%AA%D9%85%D8%A7%D9%86:_%D8%A7%D8%B1%D8%AE%D8%A7%D9%85_%D9%83%D9%86%D9%8A%D8%AC%D8%AA", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E8%9D%99%E8%9D%A0%E4%BE%A0%EF%BC%9A%E9%98%BF%E5%8D%A1%E5%A7%86%E9%AA%91%E5%A3%AB"}	batman-arkham-knight	2020-12-14 15:15:18.256427+00	2020-12-17 22:23:19.938628+00	NA
56	Nier: Automata	{"ar": "نير: الآلي", "bn": "নিয়ার: অটোমাটা", "de": "Nier: Automata", "en": "Nier: Automata", "es": "NieR: Automata", "fa": "نیئا: اتوماتا", "fi": "Nier: Automata", "fr": "Nier: Automata", "hu": "Nier: Automata", "it": "Nier: Automata", "ja": "ニーア オートマタ", "ko": "니어: 오토마타", "lt": "Nier: Automata", "ms": "Nier: Automata", "nl": "Nier: Automata", "pl": "Nier: Automata", "pt": "Nier: Automata", "ru": "NieR: Automata", "sv": "Nier: Automata", "uk": "NieR: Automata", "vi": "NieR: Automata", "zh": "尼爾：自動人形", "arz": "نير: اوتوماتا", "wuu": "尼尔：机械纪元"}	Nier: Automata[b] is a 2017 action role-playing game developed by PlatinumGames and published by Square Enix. It is a sequel to the 2010 video game Nier, itself a spin-off and sequel of the Drakengard series. The game originally released for the PlayStation 4 and Windows via Steam, with an Xbox One port being published the following year with the subtitle Become As Gods Edition.	{"en": "Nier: Automata[b] is a 2017 action role-playing game developed by PlatinumGames and published by Square Enix. It is a sequel to the 2010 video game Nier, itself a spin-off and sequel of the Drakengard series. The game originally released for the PlayStation 4 and Windows via Steam, with an Xbox One port being published the following year with the subtitle Become As Gods Edition."}	["https://upload.wikimedia.org/wikipedia/en/2/21/Nier_Automata_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%86%D9%8A%D8%B1:_%D8%A7%D9%84%D8%A2%D9%84%D9%8A", "wikipedia_bn": "https://bn.wikipedia.org/wiki/%E0%A6%A8%E0%A6%BF%E0%A6%AF%E0%A6%BC%E0%A6%BE%E0%A6%B0:_%E0%A6%85%E0%A6%9F%E0%A7%8B%E0%A6%AE%E0%A6%BE%E0%A6%9F%E0%A6%BE", "wikipedia_de": "https://de.wikipedia.org/wiki/Nier:_Automata", "wikipedia_en": "https://en.wikipedia.org/wiki/NieR:Automata", "wikipedia_es": "https://es.wikipedia.org/wiki/NieR:_Automata", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%86%DB%8C%D8%A6%D8%A7:_%D8%A7%D8%AA%D9%88%D9%85%D8%A7%D8%AA%D8%A7", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Nier:_Automata", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Nier:_Automata", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Nier:_Automata", "wikipedia_it": "https://it.wikipedia.org/wiki/Nier:_Automata", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%8B%E3%83%BC%E3%82%A2_%E3%82%AA%E3%83%BC%E3%83%88%E3%83%9E%E3%82%BF", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%8B%88%EC%96%B4:_%EC%98%A4%ED%86%A0%EB%A7%88%ED%83%80", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Nier:_Automata", "wikipedia_ms": "https://ms.wikipedia.org/wiki/Nier:_Automata", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Nier:_Automata", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Nier:_Automata", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Nier:_Automata", "wikipedia_ru": "https://ru.wikipedia.org/wiki/NieR:_Automata", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Nier:_Automata", "wikipedia_uk": "https://uk.wikipedia.org/wiki/NieR:_Automata", "wikipedia_vi": "https://vi.wikipedia.org/wiki/NieR:_Automata", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%B0%BC%E7%88%BE%EF%BC%9A%E8%87%AA%E5%8B%95%E4%BA%BA%E5%BD%A2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%86%D9%8A%D8%B1:_%D8%A7%D9%88%D8%AA%D9%88%D9%85%D8%A7%D8%AA%D8%A7", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E5%B0%BC%E5%B0%94%EF%BC%9A%E6%9C%BA%E6%A2%B0%E7%BA%AA%E5%85%83"}	nier-automata	2020-12-17 19:51:07.694994+00	2020-12-17 22:23:22.361792+00	NA
32	Gears 5	{"ar": "غيرز 5", "de": "Gears 5", "en": "Gears 5", "es": "Gears 5", "fa": "چرخ‌دنده‌های ۵", "fr": "Gears 5", "it": "Gears 5", "ko": "기어스 5", "nl": "Gears 5", "pt": "Gears 5", "ru": "Gears 5", "uk": "Gears 5", "zh": "戰爭機器5", "arz": "جيرز 5"}	Gears 5 is a third-person shooter video game developed by The Coalition and published by Xbox Game Studios for Xbox One, Microsoft Windows and Xbox Series X/S. It is the fifth installment of the Gears of War series and the sequel to Gears of War 4. The ultimate edition was released on September 6, 2019, while the standard edition of the game was released worldwide on September 10, 2019 to generally favorable reviews.	{"en": "Gears 5 is a third-person shooter video game developed by The Coalition and published by Xbox Game Studios for Xbox One, Microsoft Windows and Xbox Series X/S. It is the fifth installment of the Gears of War series and the sequel to Gears of War 4. The ultimate edition was released on September 6, 2019, while the standard edition of the game was released worldwide on September 10, 2019 to generally favorable reviews."}	["https://upload.wikimedia.org/wikipedia/en/e/e4/Gears_5_cover_art.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%BA%D9%8A%D8%B1%D8%B2_5", "wikipedia_de": "https://de.wikipedia.org/wiki/Gears_5", "wikipedia_en": "https://en.wikipedia.org/wiki/Gears_of_War_5", "wikipedia_es": "https://es.wikipedia.org/wiki/Gears_5", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%86%D8%B1%D8%AE%E2%80%8C%D8%AF%D9%86%D8%AF%D9%87%E2%80%8C%D9%87%D8%A7%DB%8C_%DB%B5", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Gears_5", "wikipedia_it": "https://it.wikipedia.org/wiki/Gears_5", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EA%B8%B0%EC%96%B4%EC%8A%A4_5", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Gears_5", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Gears_5", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Gears_5", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Gears_5", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%88%B0%E7%88%AD%E6%A9%9F%E5%99%A85", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AC%D9%8A%D8%B1%D8%B2_5"}	gears-5	2020-12-17 19:51:05.924204+00	2020-12-17 22:23:21.125853+00	NA
53	Mount & Blade: Warband	{"be": "Mount & Blade: Warband", "de": "Mount & Blade: Warband", "en": "Mount & Blade: Warband", "eo": "Mount & Blade: Warband", "es": "Mount and Blade: Warband", "fa": "سواری و شمشیر: اتحاد جنگی", "fi": "Mount&Blade: Warband", "fr": "Mount and Blade: Warband", "id": "Mount&Blade: Warband", "it": "Mount & Blade: Warband", "ka": "Mount & Blade: Warband", "mk": "Mount & Blade: Warband", "pt": "Mount & Blade: Warband", "ro": "Mount and Blade Warband", "ru": "Mount & Blade: Warband", "sr": "Mount and Blade: Warband", "tr": "Mount & Blade: Warband", "uk": "Mount & Blade: Warband", "vi": "Mount&Blade: Warband", "zh": "骑马与砍杀：战团", "szl": "Mount & Blade: Warband", "be-tarask": "Mount & Blade: Warband"}	Mount & Blade: Warband is the stand-alone expansion pack to the strategy action role-playing video game Mount & Blade. Announced in January 2009, the game was developed by the Turkish company TaleWorlds Entertainment and was published by Paradox Interactive on March 30, 2010.[4][5] The game is available as a direct download from the TaleWorlds website, through the Steam digital distribution software, as a DRM-free version from GOG.com, or as a DVD with required online activation. The macOS and Linux versions were released on July 10, 2014 through Steam.[6]	{"en": "Mount & Blade: Warband is the stand-alone expansion pack to the strategy action role-playing video game Mount & Blade. Announced in January 2009, the game was developed by the Turkish company TaleWorlds Entertainment and was published by Paradox Interactive on March 30, 2010.[4][5] The game is available as a direct download from the TaleWorlds website, through the Steam digital distribution software, as a DRM-free version from GOG.com, or as a DVD with required online activation. The macOS and Linux versions were released on July 10, 2014 through Steam.[6]"}	["https://upload.wikimedia.org/wikipedia/en/9/92/Mount_%26_Blade_-_Warband_cover.jpg"]	{"wikipedia_be": "https://be.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_de": "https://de.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_en": "https://en.wikipedia.org/wiki/Mount_&_Blade:_Warband", "wikipedia_eo": "https://eo.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_es": "https://es.wikipedia.org/wiki/Mount_and_Blade:_Warband", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D9%88%D8%A7%D8%B1%DB%8C_%D9%88_%D8%B4%D9%85%D8%B4%DB%8C%D8%B1:_%D8%A7%D8%AA%D8%AD%D8%A7%D8%AF_%D8%AC%D9%86%DA%AF%DB%8C", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Mount%26Blade:_Warband", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Mount_and_Blade:_Warband", "wikipedia_id": "https://id.wikipedia.org/wiki/Mount%26Blade:_Warband", "wikipedia_it": "https://it.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_ka": "https://ka.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_mk": "https://mk.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Mount_and_Blade_Warband", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Mount_and_Blade:_Warband", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Mount%26Blade:_Warband", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%AA%91%E9%A9%AC%E4%B8%8E%E7%A0%8D%E6%9D%80%EF%BC%9A%E6%88%98%E5%9B%A2", "wikipedia_szl": "https://szl.wikipedia.org/wiki/Mount_%26_Blade:_Warband", "wikipedia_be-tarask": "https://be-tarask.wikipedia.org/wiki/Mount_%26_Blade:_Warband"}	mount-blade-warband	2020-12-17 19:51:07.331684+00	2020-12-17 22:23:22.383947+00	NA
7	Astroneer	{"cs": "Astroneer", "da": "Astroneer", "en": "Astroneer", "fr": "Astroneer", "it": "Astroneer", "ko": "아스트로니어", "pl": "Astroneer", "pt": "Astroneer", "ru": "Astroneer", "uk": "Astroneer", "vi": "Astroneer", "zh": "异星探险家", "arz": "استرونير"}	Astroneer is a sandbox adventure game developed by System Era Softworks. The game was released through early access in December 2016 before a full release in 2019. The player is tasked with colonizing planets, creating structures, and collecting resources. Astroneer has no set goal or storyline, though each planet holds challenges for players to complete.	{"en": "Astroneer is a sandbox adventure game developed by System Era Softworks. The game was released through early access in December 2016 before a full release in 2019. The player is tasked with colonizing planets, creating structures, and collecting resources. Astroneer has no set goal or storyline, though each planet holds challenges for players to complete."}	["https://upload.wikimedia.org/wikipedia/en/5/5b/Astroneer_Image1.png"]	{"wikipedia_cs": "https://cs.wikipedia.org/wiki/Astroneer", "wikipedia_da": "https://da.wikipedia.org/wiki/Astroneer", "wikipedia_en": "https://en.wikipedia.org/wiki/Astroneer", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Astroneer", "wikipedia_it": "https://it.wikipedia.org/wiki/Astroneer", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%95%84%EC%8A%A4%ED%8A%B8%EB%A1%9C%EB%8B%88%EC%96%B4", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Astroneer", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Astroneer", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Astroneer", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Astroneer", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Astroneer", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%BC%82%E6%98%9F%E6%8E%A2%E9%99%A9%E5%AE%B6", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D8%B3%D8%AA%D8%B1%D9%88%D9%86%D9%8A%D8%B1"}	astroneer	2020-12-14 19:34:13.739713+00	2020-12-17 22:23:19.828894+00	NA
288	MotoGP20	{"en": "MotoGP20"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/e465c4086aff4884990933d9f119f5f5rcp1/sku/b0c60f8483be419eb2335a79a0783cc5"}	motogp20	2021-02-05 16:52:19.394908+00	2021-02-05 23:20:47.44594+00	E
226	SteamWorld Dig 2	{"en": "SteamWorld Dig 2"}	SteamWorld Dig 2 is a 2D platform action-adventure video game developed and published by Image & Form. It is the fourth installment in the SteamWorld series of games and the direct sequel to 2013's SteamWorld Dig. It was released on 21 September 2017 for Nintendo Switch in the Nintendo eShop,[1] on Steam for Microsoft Windows, macOS, and Linux, on the PlayStation Store for PlayStation 4, and PlayStation Vita,[2] on the Nintendo eShop for Nintendo 3DS,[3] and Stadia.[4]	{"en": "SteamWorld Dig 2 is a 2D platform action-adventure video game developed and published by Image & Form. It is the fourth installment in the SteamWorld series of games and the direct sequel to 2013's SteamWorld Dig. It was released on 21 September 2017 for Nintendo Switch in the Nintendo eShop,[1] on Steam for Microsoft Windows, macOS, and Linux, on the PlayStation Store for PlayStation 4, and PlayStation Vita,[2] on the Nintendo eShop for Nintendo 3DS,[3] and Stadia.[4]"}	["https://upload.wikimedia.org/wikipedia/en/b/b8/SteamWorld_Dig_2_pre-release_Steam_header.jpg"]	{"stadia": "https://stadia.google.com/store/details/b832835182124d4d83cb76a74a76a33frcp1/sku/90f5bd9270024986b26ee8221c1fa2e4"}	steamworld-dig-2	2020-12-21 16:12:06.494652+00	2021-02-05 23:20:46.49705+00	E10+
34	Goat Simulator	{"ar": "غوت سميولايتر", "da": "Goat Simulator", "de": "Goat Simulator", "en": "Goat Simulator", "es": "Goat Simulator", "fi": "Goat Simulator", "fr": "Goat Simulator", "gl": "Goat Simulator", "it": "Goat Simulator", "ja": "Goat Simulator", "ko": "고트 시뮬레이터", "pl": "Symulator kozy", "pt": "Goat Simulator", "ro": "Goat Simulator", "ru": "Goat Simulator", "sv": "Goat Simulator", "zh": "模擬山羊", "arz": "جوت سيموليتر"}	Goat Simulator is a third-person perspective action video game developed and published by Coffee Stain Studios. It was released for Microsoft Windows in April 2014, and ports for Linux and OS X were released in June 2014. Mobile versions for Android and iOS were released in September 2014. Versions for the Xbox 360 and Xbox One were released in April 2015, and for PlayStation 3 and PlayStation 4 in August 2015; these ports were developed by Double Eleven. A Nintendo Switch version containing the game and downloadable content was released in January 2019.	{"en": "Goat Simulator is a third-person perspective action video game developed and published by Coffee Stain Studios. It was released for Microsoft Windows in April 2014, and ports for Linux and OS X were released in June 2014. Mobile versions for Android and iOS were released in September 2014. Versions for the Xbox 360 and Xbox One were released in April 2015, and for PlayStation 3 and PlayStation 4 in August 2015; these ports were developed by Double Eleven. A Nintendo Switch version containing the game and downloadable content was released in January 2019."}	["https://upload.wikimedia.org/wikipedia/en/f/fd/Goat_Simulator_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%BA%D9%88%D8%AA_%D8%B3%D9%85%D9%8A%D9%88%D9%84%D8%A7%D9%8A%D8%AA%D8%B1", "wikipedia_da": "https://da.wikipedia.org/wiki/Goat_Simulator", "wikipedia_de": "https://de.wikipedia.org/wiki/Goat_Simulator", "wikipedia_en": "https://en.wikipedia.org/wiki/Goat_Simulator", "wikipedia_es": "https://es.wikipedia.org/wiki/Goat_Simulator", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Goat_Simulator", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Goat_Simulator", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Goat_Simulator", "wikipedia_it": "https://it.wikipedia.org/wiki/Goat_Simulator", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Goat_Simulator", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EA%B3%A0%ED%8A%B8_%EC%8B%9C%EB%AE%AC%EB%A0%88%EC%9D%B4%ED%84%B0", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Symulator_kozy", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Goat_Simulator", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Goat_Simulator", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Goat_Simulator", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Goat_Simulator", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%A8%A1%E6%93%AC%E5%B1%B1%E7%BE%8A", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AC%D9%88%D8%AA_%D8%B3%D9%8A%D9%85%D9%88%D9%84%D9%8A%D8%AA%D8%B1"}	goat-simulator	2020-12-17 19:51:05.938477+00	2020-12-17 22:23:21.224802+00	NA
36	Halo 5: Guardians	{"ar": "هيلو 5: غارديانز", "de": "Halo 5: Guardians", "en": "Halo 5: Guardians", "es": "Halo 5: Guardians", "fa": "هیلو ۵: نگهبانان", "fi": "Halo 5: Guardians", "fr": "Halo 5: Guardians", "it": "Halo 5: Guardians", "ja": "Halo 5: Guardians", "ko": "헤일로 5: 가디언즈", "nl": "Halo 5: Guardians", "ny": "Halo 5: Guardians", "pl": "Halo 5: Guardians", "pt": "Halo 5: Guardians", "ru": "Halo 5: Guardians", "sv": "Halo 5: Guardians", "th": "เฮโล 5: การ์เดี้ยนส์", "uk": "Halo 5: Guardians", "zh": "最後一戰5：守護者", "arz": "هالو 5: جوارديانس"}	Halo 5: Guardians is a first-person shooter video game developed by 343 Industries and published by Microsoft Studios for the Xbox One. The fifth mainline entry and tenth overall in the Halo series, it was released worldwide on October 27, 2015. The game's plot follows two fireteams of human supersoldiers: Blue Team, led by Master Chief, and Fireteam Osiris, led by  Spartan Locke. When the former goes absent without leave to track down the artificial intelligence construct Cortana, Master Chief's loyalty is called into question, and Fireteam Osiris is sent to retrieve him.	{"en": "Halo 5: Guardians is a first-person shooter video game developed by 343 Industries and published by Microsoft Studios for the Xbox One. The fifth mainline entry and tenth overall in the Halo series, it was released worldwide on October 27, 2015. The game's plot follows two fireteams of human supersoldiers: Blue Team, led by Master Chief, and Fireteam Osiris, led by  Spartan Locke. When the former goes absent without leave to track down the artificial intelligence construct Cortana, Master Chief's loyalty is called into question, and Fireteam Osiris is sent to retrieve him."}	["https://upload.wikimedia.org/wikipedia/en/6/68/Halo_Guardians.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%87%D9%8A%D9%84%D9%88_5:_%D8%BA%D8%A7%D8%B1%D8%AF%D9%8A%D8%A7%D9%86%D8%B2", "wikipedia_de": "https://de.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_en": "https://en.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_es": "https://es.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%87%DB%8C%D9%84%D9%88_%DB%B5:_%D9%86%DA%AF%D9%87%D8%A8%D8%A7%D9%86%D8%A7%D9%86", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_it": "https://it.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%97%A4%EC%9D%BC%EB%A1%9C_5:_%EA%B0%80%EB%94%94%EC%96%B8%EC%A6%88", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_ny": "https://ny.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%80%E0%B8%AE%E0%B9%82%E0%B8%A5_5:_%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B9%89%E0%B8%A2%E0%B8%99%E0%B8%AA%E0%B9%8C", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Halo_5:_Guardians", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%9C%80%E5%BE%8C%E4%B8%80%E6%88%B05%EF%BC%9A%E5%AE%88%E8%AD%B7%E8%80%85", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%87%D8%A7%D9%84%D9%88_5:_%D8%AC%D9%88%D8%A7%D8%B1%D8%AF%D9%8A%D8%A7%D9%86%D8%B3"}	halo-5-guardians	2020-12-17 19:51:05.971499+00	2020-12-17 22:23:21.329468+00	NA
190	Mafia II	{"ar": "مافيا 2", "be": "Mafia II", "bn": "মাফিয়া ২", "ca": "Mafia II", "cs": "Mafia II", "da": "Mafia II", "de": "Mafia II", "el": "Mafia II", "en": "Mafia II", "es": "Mafia II", "fa": "مافیا ۲", "fi": "Mafia II", "fr": "Mafia II", "he": "Mafia II", "hu": "Mafia II", "hy": "Mafia II", "it": "Mafia II", "ja": "Mafia 2", "ka": "Mafia II", "ko": "마피아 II", "lt": "Mafia II", "nb": "Mafia II", "nl": "Mafia II", "pl": "Mafia II", "pt": "Mafia II", "ro": "Mafia II", "ru": "Mafia II", "sk": "Mafia II", "sr": "Mafia II", "sv": "Mafia II", "tr": "Mafia II", "uk": "Mafia II", "vi": "Mafia II", "zh": "黑手党II", "arz": "مافيا 2", "be-tarask": "Мафія 2"}	Mafia II is a 2010 action-adventure game developed by 2K Czech and published by 2K Games. It was released in August 2010 for Microsoft Windows, PlayStation 3, and Xbox 360;[1][2] Mafia II: Director's Cut was released by Feral Interactive in December 2011.[3] The game is a sequel to 2002's Mafia[4] and the second installment in the Mafia series. Set within the fictional city of Empire Bay (loosely based on New York City, with several aspects of Chicago, San Francisco, Los Angeles, Boston and Detroit) during the 1940s and 1950s, the story follows Sicillian-American mobster and war veteran Vito Scaletta, who becomes involved in a power struggle among the city's Mafia crime families while attempting to pay back his father's debts and secure a better lifestyle.	{"en": "Mafia II is a 2010 action-adventure game developed by 2K Czech and published by 2K Games. It was released in August 2010 for Microsoft Windows, PlayStation 3, and Xbox 360;[1][2] Mafia II: Director's Cut was released by Feral Interactive in December 2011.[3] The game is a sequel to 2002's Mafia[4] and the second installment in the Mafia series. Set within the fictional city of Empire Bay (loosely based on New York City, with several aspects of Chicago, San Francisco, Los Angeles, Boston and Detroit) during the 1940s and 1950s, the story follows Sicillian-American mobster and war veteran Vito Scaletta, who becomes involved in a power struggle among the city's Mafia crime families while attempting to pay back his father's debts and secure a better lifestyle."}	["https://upload.wikimedia.org/wikipedia/en/0/0d/Mafia_II_Boxart.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D8%A7%D9%81%D9%8A%D8%A7_2", "wikipedia_be": "https://be.wikipedia.org/wiki/Mafia_II", "wikipedia_bn": "https://bn.wikipedia.org/wiki/%E0%A6%AE%E0%A6%BE%E0%A6%AB%E0%A6%BF%E0%A6%AF%E0%A6%BC%E0%A6%BE_%E0%A7%A8", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Mafia_II", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Mafia_II", "wikipedia_da": "https://da.wikipedia.org/wiki/Mafia_II", "wikipedia_de": "https://de.wikipedia.org/wiki/Mafia_II", "wikipedia_el": "https://el.wikipedia.org/wiki/Mafia_II", "wikipedia_en": "https://en.wikipedia.org/wiki/Mafia_II", "wikipedia_es": "https://es.wikipedia.org/wiki/Mafia_II", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%A7%D9%81%DB%8C%D8%A7_%DB%B2", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Mafia_II", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Mafia_II", "wikipedia_he": "https://he.wikipedia.org/wiki/Mafia_II", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Mafia_II", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Mafia_II", "wikipedia_it": "https://it.wikipedia.org/wiki/Mafia_II", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Mafia_2", "wikipedia_ka": "https://ka.wikipedia.org/wiki/Mafia_II", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%A7%88%ED%94%BC%EC%95%84_II", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Mafia_II", "wikipedia_nb": "https://no.wikipedia.org/wiki/Mafia_II", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Mafia_II", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Mafia_II", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Mafia_II", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Mafia_II", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Mafia_II", "wikipedia_sk": "https://sk.wikipedia.org/wiki/Mafia_II", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Mafia_II", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Mafia_II", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Mafia_II", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Mafia_II", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Mafia_II", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%BB%91%E6%89%8B%E5%85%9AII", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%85%D8%A7%D9%81%D9%8A%D8%A7_2", "wikipedia_be-tarask": "https://be-tarask.wikipedia.org/wiki/%D0%9C%D0%B0%D1%84%D1%96%D1%8F_2"}	mafia-ii	2020-12-21 16:12:02.887595+00	2020-12-21 16:12:02.887611+00	NA
248	Cook, Serve, Delicious! 3	{"en": "Cook, Serve, Delicious! 3", "ru": "Cook, Serve, Delicious! 3"}	Cook, Serve, Delicious! 3 (stylized as 3?!) is a  restaurant simulation game developed by Vertigo Gaming. It was released on Steam early access in January 2020, and was fully released on October 14 2020.[1][2] It is the sequel to Cook, Serve, Delicious! 2.	{"en": "Cook, Serve, Delicious! 3 (stylized as 3?!) is a  restaurant simulation game developed by Vertigo Gaming. It was released on Steam early access in January 2020, and was fully released on October 14 2020.[1][2] It is the sequel to Cook, Serve, Delicious! 2."}	["https://upload.wikimedia.org/wikipedia/en/c/cb/Cook_Serve_Delicious_3.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Cook_Serve_Delicious_3", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Cook,_Serve,_Delicious!_3"}	cook-serve-delicious-3	2020-12-21 19:56:02.134338+00	2020-12-21 19:56:02.13436+00	NA
143	Attack on Titan 2	{"ar": "هجوم العمالقة 2 (لعبة فيديو)", "en": "Attack on Titan 2", "es": "Attack on Titan 2", "it": "A.O.T. 2", "arz": "اتاك اون تايتن 2"}	Attack on Titan 2 (Japanese: 進撃の巨人 2, Hepburn: Shingeki no Kyojin 2), known in PAL regions as A.O.T. 2, is an action hack and slash video game based on Hajime Isayama's manga series of the same name released for Nintendo Switch, PlayStation 4, PlayStation Vita, Xbox One, Microsoft Windows[1][2] and Stadia.	{"en": "Attack on Titan 2 (Japanese: 進撃の巨人 2, Hepburn: Shingeki no Kyojin 2), known in PAL regions as A.O.T. 2, is an action hack and slash video game based on Hajime Isayama's manga series of the same name released for Nintendo Switch, PlayStation 4, PlayStation Vita, Xbox One, Microsoft Windows[1][2] and Stadia."}	["https://upload.wikimedia.org/wikipedia/en/7/70/Attack_on_Titan_2_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%87%D8%AC%D9%88%D9%85_%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D9%84%D9%82%D8%A9_2_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88)", "wikipedia_en": "https://en.wikipedia.org/wiki/Attack_on_Titan_2", "wikipedia_es": "https://es.wikipedia.org/wiki/Attack_on_Titan_2", "wikipedia_it": "https://it.wikipedia.org/wiki/A.O.T._2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D8%AA%D8%A7%D9%83_%D8%A7%D9%88%D9%86_%D8%AA%D8%A7%D9%8A%D8%AA%D9%86_2"}	attack-on-titan-2	2020-12-20 04:10:34.304893+00	2020-12-21 16:11:59.906079+00	NA
174	Humankind	{"en": "Humankind", "fr": "Humankind", "it": "Humankind", "ru": "Humankind", "arz": "هومانكيند"}	Humankind is an upcoming 4X video game being developed by Amplitude Studios and to be published by Sega. The game is scheduled for release for Microsoft Windows, macOS and Stadia on April 22, 2021.[1]	{"en": "Humankind is an upcoming 4X video game being developed by Amplitude Studios and to be published by Sega. The game is scheduled for release for Microsoft Windows, macOS and Stadia on April 22, 2021.[1]"}	["https://upload.wikimedia.org/wikipedia/en/0/0f/Humankind_cover_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Humankind_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Humankind", "wikipedia_it": "https://it.wikipedia.org/wiki/Humankind", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Humankind", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%87%D9%88%D9%85%D8%A7%D9%86%D9%83%D9%8A%D9%86%D8%AF"}	humankind	2020-12-20 04:21:10.038678+00	2020-12-21 16:12:01.076472+00	NA
45	Marvel vs. Capcom: Infinite	{"ar": "مارفل فيرسز كابكوم: إنفنيت", "en": "Marvel vs. Capcom: Infinite", "es": "Marvel vs. Capcom: Infinite", "fa": "مارول در برابر کپ‌کام: بی نهایت", "fr": "Marvel vs. Capcom: Infinite", "it": "Marvel vs. Capcom: Infinite", "ja": "マーベル VS. カプコン:インフィニット", "pt": "Marvel vs. Capcom: Infinite", "ru": "Marvel vs. Capcom: Infinite", "arz": "مارڤيل ڤيرسيس كاپكوم: انفنيت"}	Marvel vs. Capcom: Infinite[a] is a fighting video game developed and published by Capcom. It is the sixth main entry in the Marvel vs. Capcom series of crossover games. Like previous installments, players control characters from both the Marvel Comics and Capcom universes to compete in tag team battles. Infinite features two-on-two fights, as opposed to the three-on-three format used in its preceding titles. The series' character assist moves have been removed; instead, the game incorporates a tag-based combo system, which allows players to instantly switch between their two characters to form continuous combos. It also introduces a new gameplay mechanic in the form of the Infinity Stones, which temporarily bestow players with unique abilities and stat boosts depending on the type of stone selected.	{"en": "Marvel vs. Capcom: Infinite[a] is a fighting video game developed and published by Capcom. It is the sixth main entry in the Marvel vs. Capcom series of crossover games. Like previous installments, players control characters from both the Marvel Comics and Capcom universes to compete in tag team battles. Infinite features two-on-two fights, as opposed to the three-on-three format used in its preceding titles. The series' character assist moves have been removed; instead, the game incorporates a tag-based combo system, which allows players to instantly switch between their two characters to form continuous combos. It also introduces a new gameplay mechanic in the form of the Infinity Stones, which temporarily bestow players with unique abilities and stat boosts depending on the type of stone selected."}	["https://upload.wikimedia.org/wikipedia/en/6/62/MvCI_Cover.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D8%A7%D8%B1%D9%81%D9%84_%D9%81%D9%8A%D8%B1%D8%B3%D8%B2_%D9%83%D8%A7%D8%A8%D9%83%D9%88%D9%85:_%D8%A5%D9%86%D9%81%D9%86%D9%8A%D8%AA", "wikipedia_en": "https://en.wikipedia.org/wiki/Marvel_vs._Capcom:_Infinite", "wikipedia_es": "https://es.wikipedia.org/wiki/Marvel_vs._Capcom:_Infinite", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%A7%D8%B1%D9%88%D9%84_%D8%AF%D8%B1_%D8%A8%D8%B1%D8%A7%D8%A8%D8%B1_%DA%A9%D9%BE%E2%80%8C%DA%A9%D8%A7%D9%85:_%D8%A8%DB%8C_%D9%86%D9%87%D8%A7%DB%8C%D8%AA", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Marvel_vs._Capcom:_Infinite", "wikipedia_it": "https://it.wikipedia.org/wiki/Marvel_vs._Capcom:_Infinite", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%9E%E3%83%BC%E3%83%99%E3%83%AB_VS._%E3%82%AB%E3%83%97%E3%82%B3%E3%83%B3:%E3%82%A4%E3%83%B3%E3%83%95%E3%82%A3%E3%83%8B%E3%83%83%E3%83%88", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Marvel_vs._Capcom:_Infinite", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Marvel_vs._Capcom:_Infinite", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%85%D8%A7%D8%B1%DA%A4%D9%8A%D9%84_%DA%A4%D9%8A%D8%B1%D8%B3%D9%8A%D8%B3_%D9%83%D8%A7%D9%BE%D9%83%D9%88%D9%85:_%D8%A7%D9%86%D9%81%D9%86%D9%8A%D8%AA"}	marvel-vs-capcom-infinite	2020-12-17 19:51:06.610235+00	2020-12-17 22:23:22.022644+00	NA
55	Ori and the Will of the Wisps	{"de": "Ori and the Will of the Wisps", "en": "Ori and the Will of the Wisps", "es": "Ori and the Will of the Wisps", "fa": "اری اند د ویل آو د وسپس", "fr": "Ori and the Will of the Wisps", "it": "Ori and the Will of the Wisps", "ja": "Ori and the Will of the Wisps", "ko": "오리와 도깨비불", "nl": "Ori and the Will of the Wisps", "pt": "Ori and the Will of the Wisps", "ru": "Ori and the Will of the Wisps", "uk": "Ori and the Will of the Wisps", "zh": "精灵与萤火意志"}	Ori and the Will of the Wisps is a platform-adventure Metroidvania video game developed by Moon Studios and published by Xbox Game Studios for Microsoft Windows, Xbox One and Xbox Series X/S, and by Iam8bit for Nintendo Switch.[1] Announced during E3 2017, the title is a direct sequel to 2015's Ori and the Blind Forest, and was released on March 11, 2020 for Xbox One and Microsoft Windows. A Nintendo Switch version was released on September 17, 2020. Xbox Series X and Xbox Series S versions were released on November 10, 2020.[2][3] The game is a 4K UHD, Xbox One X Enhanced, and Xbox Play Anywhere title.[4]	{"en": "Ori and the Will of the Wisps is a platform-adventure Metroidvania video game developed by Moon Studios and published by Xbox Game Studios for Microsoft Windows, Xbox One and Xbox Series X/S, and by Iam8bit for Nintendo Switch.[1] Announced during E3 2017, the title is a direct sequel to 2015's Ori and the Blind Forest, and was released on March 11, 2020 for Xbox One and Microsoft Windows. A Nintendo Switch version was released on September 17, 2020. Xbox Series X and Xbox Series S versions were released on November 10, 2020.[2][3] The game is a 4K UHD, Xbox One X Enhanced, and Xbox Play Anywhere title.[4]"}	["https://upload.wikimedia.org/wikipedia/en/9/94/Ori_and_the_Will_of_the_Wisps.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_en": "https://en.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_es": "https://es.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A7%D8%B1%DB%8C_%D8%A7%D9%86%D8%AF_%D8%AF_%D9%88%DB%8C%D9%84_%D8%A2%D9%88_%D8%AF_%D9%88%D8%B3%D9%BE%D8%B3", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_it": "https://it.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%98%A4%EB%A6%AC%EC%99%80_%EB%8F%84%EA%B9%A8%EB%B9%84%EB%B6%88", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Ori_and_the_Will_of_the_Wisps", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%B2%BE%E7%81%B5%E4%B8%8E%E8%90%A4%E7%81%AB%E6%84%8F%E5%BF%97"}	ori-and-the-will-of-the-wisps	2020-12-17 19:51:07.511592+00	2020-12-17 22:23:22.563291+00	NA
191	Monopoly	{"en": "Monopoly"}	There have been nineteen video game adaptations of Parker Brothers and Hasbro's board game Monopoly.	{"en": "There have been nineteen video game adaptations of Parker Brothers and Hasbro's board game Monopoly."}	["https://upload.wikimedia.org/wikipedia/en/0/0a/Monopoly_ps3.jpg"]	{"stadia": "https://stadia.google.com/store/details/10b8a9cc8ec746f29afc1fc3c3ded28brcp1/sku/256f320f886b4ee68b7980d6fc1bd1b1"}	monopoly	2020-12-21 16:12:03.25291+00	2021-02-05 23:20:47.390508+00	E
290	Serious Sam Collection	{"en": "Serious Sam Collection"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/cabec52b78264dafac69011aeacd5753rcp1/sku/45918155e78145af937b5df1a574afd2"}	serious-sam-collection	2021-02-05 16:52:19.490845+00	2021-02-05 23:20:47.318658+00	M17+
94	Wizard of Legend	{"en": "Wizard of Legend", "fr": "Wizard of Legend", "zh": "傳說法師"}	Wizard of Legend is an indie roguelike video game released by American studio Contingent99 and Humble Bundle in May 2018. Funded through Kickstarter in 2016, players take control of a wizard as they traverse a procedurally generated dungeon, using a wide variety of spells to defeat mobs, three major bosses, and a final boss to earn the title "Wizard of Legend". The game received generally favourable reviews.	{"en": "Wizard of Legend is an indie roguelike video game released by American studio Contingent99 and Humble Bundle in May 2018. Funded through Kickstarter in 2016, players take control of a wizard as they traverse a procedurally generated dungeon, using a wide variety of spells to defeat mobs, three major bosses, and a final boss to earn the title \\"Wizard of Legend\\". The game received generally favourable reviews."}	["https://upload.wikimedia.org/wikipedia/en/6/63/Wizard_of_Legend_logo.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Wizard_of_Legend", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Wizard_of_Legend", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%82%B3%E8%AA%AA%E6%B3%95%E5%B8%AB"}	wizard-of-legend	2020-12-17 19:51:12.860677+00	2020-12-17 22:23:25.172862+00	NA
107	Crackdown 3	{"ar": "كراك داون 3", "de": "Crackdown 3", "en": "Crackdown 3", "es": "Crackdown 3", "fr": "Crackdown 3", "ko": "크랙다운 3", "pt": "Crackdown 3", "ru": "Crackdown 3", "th": "แครกดาวน์ 3", "zh": "除暴戰警3", "arz": "كراك داون 3"}	Crackdown 3 is an action-adventure video game developed by Sumo Digital and published by Microsoft Studios for Microsoft Windows and Xbox One. It continues the series nine years after the release of 2010's Xbox 360 video game Crackdown 2. Originally set to be released in 2016, the game was delayed a number of times.[2] The game was released on 15 February 2019 and received mixed reviews from critics, who praised the return of its core features from its predecessors and level of enjoyment, but was also criticized for a lack of innovation and dated design.	{"en": "Crackdown 3 is an action-adventure video game developed by Sumo Digital and published by Microsoft Studios for Microsoft Windows and Xbox One. It continues the series nine years after the release of 2010's Xbox 360 video game Crackdown 2. Originally set to be released in 2016, the game was delayed a number of times.[2] The game was released on 15 February 2019 and received mixed reviews from critics, who praised the return of its core features from its predecessors and level of enjoyment, but was also criticized for a lack of innovation and dated design."}	["https://upload.wikimedia.org/wikipedia/en/0/02/Crackdown_3_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%83%D8%B1%D8%A7%D9%83_%D8%AF%D8%A7%D9%88%D9%86_3", "wikipedia_de": "https://de.wikipedia.org/wiki/Crackdown_3", "wikipedia_en": "https://en.wikipedia.org/wiki/Crackdown_3", "wikipedia_es": "https://es.wikipedia.org/wiki/Crackdown_3", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Crackdown_3", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%81%AC%EB%9E%99%EB%8B%A4%EC%9A%B4_3", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Crackdown_3", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Crackdown_3", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%81%E0%B8%84%E0%B8%A3%E0%B8%81%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C_3", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%99%A4%E6%9A%B4%E6%88%B0%E8%AD%A63", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%83%D8%B1%D8%A7%D9%83_%D8%AF%D8%A7%D9%88%D9%86_3"}	crackdown-3	2020-12-18 16:36:42.430233+00	2020-12-18 16:51:23.047823+00	NA
127	Pillars of Eternity	{"cs": "Pillars of Eternity", "de": "Pillars of Eternity", "en": "Pillars of Eternity", "es": "Pillars of Eternity", "fi": "Pillars of Eternity", "fr": "Pillars of Eternity", "it": "Pillars of Eternity", "nb": "Pillars of Eternity", "pl": "Pillars of Eternity", "pt": "Pillars of Eternity", "ru": "Pillars of Eternity", "sl": "Pillars of Eternity", "sr": "Pillars of Eternity", "sv": "Pillars of Eternity", "tr": "Pillars of Eternity", "uk": "Pillars of Eternity", "zh": "永恒之柱", "arz": "پيلارس اوف اتيرنيتى"}	Pillars of Eternity is a role-playing video game developed by Obsidian Entertainment and published by Paradox Interactive. It was released for Microsoft Windows, OS X, and Linux on March 26, 2015. The game is a spiritual successor to the Baldur's Gate and Icewind Dale series, along with Planescape: Torment. Obsidian started a crowdfunding campaign on Kickstarter for it in September 2012. The campaign raised over US$4 million, which was the highest funded video game at the time. The game uses the Unity engine.	{"en": "Pillars of Eternity is a role-playing video game developed by Obsidian Entertainment and published by Paradox Interactive. It was released for Microsoft Windows, OS X, and Linux on March 26, 2015. The game is a spiritual successor to the Baldur's Gate and Icewind Dale series, along with Planescape: Torment. Obsidian started a crowdfunding campaign on Kickstarter for it in September 2012. The campaign raised over US$4 million, which was the highest funded video game at the time. The game uses the Unity engine."}	["https://upload.wikimedia.org/wikipedia/en/c/ca/Pillars_of_Eternity.jpg"]	{"wikipedia_cs": "https://cs.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_de": "https://de.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_en": "https://en.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_es": "https://es.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_it": "https://it.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_nb": "https://no.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_sl": "https://sl.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Pillars_of_Eternity", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%B0%B8%E6%81%92%E4%B9%8B%E6%9F%B1", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%BE%D9%8A%D9%84%D8%A7%D8%B1%D8%B3_%D8%A7%D9%88%D9%81_%D8%A7%D8%AA%D9%8A%D8%B1%D9%86%D9%8A%D8%AA%D9%89"}	pillars-of-eternity	2020-12-18 16:36:43.187523+00	2020-12-18 16:51:24.112718+00	NA
8	Battletoads	{"en": "Battletoads", "es": "Battletoads (franquicia)", "fr": "Battletoads", "pt": "Battletoads", "ru": "Battletoads (серия игр)", "sv": "Battletoads"}	Battletoads is a video game media franchise by Rare that began with the original beat 'em up game Battletoads in 1991. Starring three anthropomorphic toads named after skin conditions, Rash, Zitz, and Pimple, the series was created to rival the Teenage Mutant Ninja Turtles games series.[1] The series as a whole has been quite popular with five installments up to this date and at its apex spawned an animated television pilot.	{"en": "Battletoads is a video game media franchise by Rare that began with the original beat 'em up game Battletoads in 1991. Starring three anthropomorphic toads named after skin conditions, Rash, Zitz, and Pimple, the series was created to rival the Teenage Mutant Ninja Turtles games series.[1] The series as a whole has been quite popular with five installments up to this date and at its apex spawned an animated television pilot."}	["https://upload.wikimedia.org/wikipedia/en/2/28/Battletoads_logo.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Battletoads", "wikipedia_es": "https://es.wikipedia.org/wiki/Battletoads_(franquicia)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Battletoads", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Battletoads", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Battletoads_(%D1%81%D0%B5%D1%80%D0%B8%D1%8F_%D0%B8%D0%B3%D1%80)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Battletoads"}	battletoads	2020-12-14 19:34:13.855666+00	2020-12-17 22:23:20.038521+00	NA
289	The Division 2	{"en": "The Division 2"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/d43cd46c81734ca48e1a615310d0237crcp1/sku/bed63eac149542078fa5b9d6f20f5f2f"}	the-division-2	2021-02-05 16:52:19.41584+00	2021-02-05 23:20:48.188833+00	M17+
51	Minecraft Dungeons	{"ar": "ماينكرافت دونجنس", "cs": "Minecraft Dungeons", "de": "Minecraft Dungeons", "en": "Minecraft Dungeons", "es": "Minecraft Dungeons", "fa": "ماینکرفت دانجنز", "fi": "Minecraft Dungeons", "fr": "Minecraft: Dungeons", "he": "מיינקראפט דאנג'נס", "id": "Minecraft Dungeons", "it": "Minecraft: Dungeons", "ja": "Minecraft Dungeons", "ko": "마인크래프트 던전스", "ms": "Minecraft Dungeons", "nl": "Minecraft: Dungeons", "pl": "Minecraft Dungeons", "pt": "Minecraft Dungeons", "ro": "Minecraft: Dungeons", "ru": "Minecraft Dungeons", "tr": "Minecraft: Dungeons", "uk": "Minecraft: Dungeons", "vi": "Minecraft Dungeons", "zh": "我的世界 地下城", "arz": "ماينكرافت دونچنس"}	Minecraft Dungeons is a dungeon crawler video game developed by Mojang Studios and Double Eleven and published by Xbox Game Studios. It is a spin-off of the sandbox video game Minecraft and was released for Nintendo Switch, PlayStation 4, Windows, and Xbox One on May 26, 2020. The game received mixed reviews; many deemed the game fun and charming, with praise for its visuals and music. However, its simple gameplay and use of procedural generation were met with a more mixed reception, with its short story and lack of depth criticized.	{"en": "Minecraft Dungeons is a dungeon crawler video game developed by Mojang Studios and Double Eleven and published by Xbox Game Studios. It is a spin-off of the sandbox video game Minecraft and was released for Nintendo Switch, PlayStation 4, Windows, and Xbox One on May 26, 2020. The game received mixed reviews; many deemed the game fun and charming, with praise for its visuals and music. However, its simple gameplay and use of procedural generation were met with a more mixed reception, with its short story and lack of depth criticized."}	["https://upload.wikimedia.org/wikipedia/en/7/73/Minecraft_Dungeons_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D8%A7%D9%8A%D9%86%D9%83%D8%B1%D8%A7%D9%81%D8%AA_%D8%AF%D9%88%D9%86%D8%AC%D9%86%D8%B3", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_de": "https://de.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_en": "https://en.wikipedia.org/wiki/Minecraft:_Dungeons", "wikipedia_es": "https://es.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%A7%DB%8C%D9%86%DA%A9%D8%B1%D9%81%D8%AA_%D8%AF%D8%A7%D9%86%D8%AC%D9%86%D8%B2", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Minecraft:_Dungeons", "wikipedia_he": "https://he.wikipedia.org/wiki/%D7%9E%D7%99%D7%99%D7%A0%D7%A7%D7%A8%D7%90%D7%A4%D7%98_%D7%93%D7%90%D7%A0%D7%92%27%D7%A0%D7%A1", "wikipedia_id": "https://id.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_it": "https://it.wikipedia.org/wiki/Minecraft:_Dungeons", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%A7%88%EC%9D%B8%ED%81%AC%EB%9E%98%ED%94%84%ED%8A%B8_%EB%8D%98%EC%A0%84%EC%8A%A4", "wikipedia_ms": "https://ms.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Minecraft:_Dungeons", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Minecraft:_Dungeons", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Minecraft:_Dungeons", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Minecraft:_Dungeons", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Minecraft_Dungeons", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%88%91%E7%9A%84%E4%B8%96%E7%95%8C_%E5%9C%B0%E4%B8%8B%E5%9F%8E", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%85%D8%A7%D9%8A%D9%86%D9%83%D8%B1%D8%A7%D9%81%D8%AA_%D8%AF%D9%88%D9%86%DA%86%D9%86%D8%B3"}	minecraft-dungeons	2020-12-17 19:51:07.009726+00	2020-12-17 22:23:22.110737+00	NA
10	Black Desert Online	{"ar": "بلاك دزرت", "bg": "Black Desert Online", "ca": "Black Desert Online", "da": "Black Desert Online", "de": "Black Desert", "en": "Black Desert Online", "es": "Black Desert Online", "fi": "Black Desert Online", "fr": "Black Desert Online", "ja": "黒い砂漠 (オンラインゲーム)", "ko": "검은사막", "pt": "Black Desert Online", "ru": "Black Desert", "uk": "Black Desert", "zh": "黑色沙漠"}	Black Desert Online (Korean: 검은사막) is a sandbox-oriented fantasy massively multiplayer online role-playing game (MMORPG) developed by Korean video game developer Pearl Abyss and originally published for Microsoft Windows in 2015. A mobile version titled Black Desert Mobile was initially released in Asia by early 2019,[1] and worldwide in December 2019. The Xbox One and PlayStation 4 versions, known simply as Black Desert, were released in 2019. The game is free-to-play in some parts of the world, but follows a buy-to-play business model in other editions, including the English-language editions.[2]	{"en": "Black Desert Online (Korean: 검은사막) is a sandbox-oriented fantasy massively multiplayer online role-playing game (MMORPG) developed by Korean video game developer Pearl Abyss and originally published for Microsoft Windows in 2015. A mobile version titled Black Desert Mobile was initially released in Asia by early 2019,[1] and worldwide in December 2019. The Xbox One and PlayStation 4 versions, known simply as Black Desert, were released in 2019. The game is free-to-play in some parts of the world, but follows a buy-to-play business model in other editions, including the English-language editions.[2]"}	["https://upload.wikimedia.org/wikipedia/en/8/85/Black_Desert_Online_Logo_%28En%29.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A8%D9%84%D8%A7%D9%83_%D8%AF%D8%B2%D8%B1%D8%AA", "wikipedia_bg": "https://bg.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_da": "https://da.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_de": "https://de.wikipedia.org/wiki/Black_Desert", "wikipedia_en": "https://en.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_es": "https://es.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E9%BB%92%E3%81%84%E7%A0%82%E6%BC%A0_(%E3%82%AA%E3%83%B3%E3%83%A9%E3%82%A4%E3%83%B3%E3%82%B2%E3%83%BC%E3%83%A0)", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EA%B2%80%EC%9D%80%EC%82%AC%EB%A7%89", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Black_Desert_Online", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Black_Desert", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Black_Desert", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%BB%91%E8%89%B2%E6%B2%99%E6%BC%A0"}	black-desert-online	2020-12-14 19:38:23.074715+00	2020-12-18 16:51:23.058777+00	NA
123	My Time at Portia	{"de": "My Time At Portia", "en": "My Time at Portia", "he": "My Time At Portia", "zh": "波西亚时光"}	My Time at Portia is a video game developed by Chinese[1] studio Pathea Games and published by Team17 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One in 2019. It combines aspects of role-playing video games and simulation games.	{"en": "My Time at Portia is a video game developed by Chinese[1] studio Pathea Games and published by Team17 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One in 2019. It combines aspects of role-playing video games and simulation games."}	[]	{"wikipedia_de": "https://de.wikipedia.org/wiki/My_Time_At_Portia", "wikipedia_en": "https://en.wikipedia.org/wiki/My_Time_at_Portia", "wikipedia_he": "https://he.wikipedia.org/wiki/My_Time_At_Portia", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%B3%A2%E8%A5%BF%E4%BA%9A%E6%97%B6%E5%85%89"}	my-time-at-portia	2020-12-18 16:36:43.10021+00	2020-12-18 16:51:23.401649+00	NA
140	World War Z	{"en": "World War Z", "es": "World War Z (videojuego)", "fa": "جنگ جهانی زد (بازی ویدئویی ۲۰۱۹)", "fr": "World War Z (jeu vidéo, 2019)", "id": "World War Z (permainan video 2019)", "it": "World War Z (videogioco 2019)", "ko": "월드워Z (2019년 비디오 게임)", "ru": "World War Z (игра, 2019)", "tl": "World War Z (larong bidyo ng 2019)", "vi": "World War Z (trò chơi điện tử)", "zh": "僵尸世界大战（2019年游戏）", "arz": "ورلد وار زى"}	World War Z is a third-person shooter video game developed by Saber Interactive and published by Mad Dog Games. It was released for Microsoft Windows, PlayStation 4, and Xbox One on April 16, 2019, and will be released for Nintendo Switch at an unspecified date in the future. Loosely based on the 2006 book of the same name, and set in the same universe as the 2013 film adaptation, the game follows groups of survivors of a zombie apocalypse in the cities of Moscow, New York, Jerusalem, Tokyo, and Marseille.	{"en": "World War Z is a third-person shooter video game developed by Saber Interactive and published by Mad Dog Games. It was released for Microsoft Windows, PlayStation 4, and Xbox One on April 16, 2019, and will be released for Nintendo Switch at an unspecified date in the future. Loosely based on the 2006 book of the same name, and set in the same universe as the 2013 film adaptation, the game follows groups of survivors of a zombie apocalypse in the cities of Moscow, New York, Jerusalem, Tokyo, and Marseille."}	["https://upload.wikimedia.org/wikipedia/en/4/44/World_War_Z_cover_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/World_War_Z_(2019_video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/World_War_Z_(videojuego)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AC%D9%86%DA%AF_%D8%AC%D9%87%D8%A7%D9%86%DB%8C_%D8%B2%D8%AF_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C_%DB%B2%DB%B0%DB%B1%DB%B9)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/World_War_Z_(jeu_vid%C3%A9o,_2019)", "wikipedia_id": "https://id.wikipedia.org/wiki/World_War_Z_(permainan_video_2019)", "wikipedia_it": "https://it.wikipedia.org/wiki/World_War_Z_(videogioco_2019)", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9B%94%EB%93%9C%EC%9B%8CZ_(2019%EB%85%84_%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/World_War_Z_(%D0%B8%D0%B3%D1%80%D0%B0,_2019)", "wikipedia_tl": "https://tl.wikipedia.org/wiki/World_War_Z_(larong_bidyo_ng_2019)", "wikipedia_vi": "https://vi.wikipedia.org/wiki/World_War_Z_(tr%C3%B2_ch%C6%A1i_%C4%91i%E1%BB%87n_t%E1%BB%AD)", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%83%B5%E5%B0%B8%E4%B8%96%E7%95%8C%E5%A4%A7%E6%88%98%EF%BC%882019%E5%B9%B4%E6%B8%B8%E6%88%8F%EF%BC%89", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%88%D8%B1%D9%84%D8%AF_%D9%88%D8%A7%D8%B1_%D8%B2%D9%89"}	world-war-z	2020-12-18 16:36:43.784042+00	2020-12-18 16:51:24.615652+00	NA
309	Tomb Raider: Definitive Edition	{"en": "Tomb Raider: Definitive Edition"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/42503ac2cfcf40018c15c86b86a5508drcp1/sku/c86bd12f279741a8b8c9c522845c7fa9"}	tomb-raider-definitive-edition	2021-02-05 16:52:21.11994+00	2021-02-05 23:20:48.241047+00	M17+
105	CrossCode	{"ar": "كروسكود", "de": "CrossCode", "en": "CrossCode", "fi": "CrossCode", "ko": "크로스코드", "zh": "遠星物語"}	CrossCode is an action role-playing game developed by Radical Fish Games and published by Deck13. The game's development began in 2012, and was later introduced as a crowdfunded project on Indiegogo. Following a three-year long early access beta phase, CrossCode was released for Linux, macOS, and Windows in September 2018, for PlayStation 4, Xbox One and Nintendo Switch in July 2020, and for the Xbox Series X/S as one of its launch titles in November 2020.[1] It received generally positive reviews from critics.	{"en": "CrossCode is an action role-playing game developed by Radical Fish Games and published by Deck13. The game's development began in 2012, and was later introduced as a crowdfunded project on Indiegogo. Following a three-year long early access beta phase, CrossCode was released for Linux, macOS, and Windows in September 2018, for PlayStation 4, Xbox One and Nintendo Switch in July 2020, and for the Xbox Series X/S as one of its launch titles in November 2020.[1] It received generally positive reviews from critics."}	["https://upload.wikimedia.org/wikipedia/en/d/d4/CrossCode%2C_cover_art%2C_Feb_2017.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%83%D8%B1%D9%88%D8%B3%D9%83%D9%88%D8%AF", "wikipedia_de": "https://de.wikipedia.org/wiki/CrossCode", "wikipedia_en": "https://en.wikipedia.org/wiki/CrossCode", "wikipedia_fi": "https://fi.wikipedia.org/wiki/CrossCode", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%81%AC%EB%A1%9C%EC%8A%A4%EC%BD%94%EB%93%9C", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%81%A0%E6%98%9F%E7%89%A9%E8%AA%9E"}	crosscode	2020-12-18 16:36:42.232114+00	2020-12-18 16:51:23.161233+00	NA
108	Forager	{"ar": "فورجير (لعبة فيديو)", "en": "Forager", "fr": "Forager", "it": "Forager"}	Forager is an open-world adventure game developed by Argentine studio HopFrog[1] and published by Humble Bundle. The game was officially released for Microsoft Windows and Linux in April 2019, later becoming available for PlayStation 4, Nintendo Switch, Xbox One, and mobile.	{"en": "Forager is an open-world adventure game developed by Argentine studio HopFrog[1] and published by Humble Bundle. The game was officially released for Microsoft Windows and Linux in April 2019, later becoming available for PlayStation 4, Nintendo Switch, Xbox One, and mobile."}	[]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%81%D9%88%D8%B1%D8%AC%D9%8A%D8%B1_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88)", "wikipedia_en": "https://en.wikipedia.org/wiki/Forager_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Forager", "wikipedia_it": "https://it.wikipedia.org/wiki/Forager"}	forager	2020-12-18 16:36:42.449545+00	2020-12-18 16:51:23.486294+00	NA
129	Sea of Thieves	{"ar": "سي أوف ثيفز", "ca": "Sea of Thieves", "de": "Sea of Thieves", "en": "Sea of Thieves", "es": "Sea of Thieves", "et": "Sea of Thieves", "fi": "Sea of Thieves", "fr": "Sea of Thieves", "it": "Sea of Thieves", "ko": "씨 오브 시브즈", "pl": "Sea of Thieves", "pt": "Sea of Thieves", "ru": "Sea of Thieves", "tr": "Sea of Thieves", "uk": "Sea of ​​Thieves", "zh": "盗贼之海", "arz": "سى اف ثيفيز"}	Sea of Thieves is a 2018 action-adventure game developed by Rare and published by Xbox Game Studios. The player assumes the role of a pirate who completes voyages from different trading companies in order to become the ultimate pirate legend. Sea of Thieves is a first-person multiplayer video game in which players cooperate with each other to explore an open world via a pirate ship. The game is described as a "shared world adventure game", which means groups of players will encounter each other regularly during their adventures, sometimes forming alliances, sometimes going head-to-head.	{"en": "Sea of Thieves is a 2018 action-adventure game developed by Rare and published by Xbox Game Studios. The player assumes the role of a pirate who completes voyages from different trading companies in order to become the ultimate pirate legend. Sea of Thieves is a first-person multiplayer video game in which players cooperate with each other to explore an open world via a pirate ship. The game is described as a \\"shared world adventure game\\", which means groups of players will encounter each other regularly during their adventures, sometimes forming alliances, sometimes going head-to-head."}	["https://upload.wikimedia.org/wikipedia/en/7/77/Sea_of_thieves_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D9%8A_%D8%A3%D9%88%D9%81_%D8%AB%D9%8A%D9%81%D8%B2", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_de": "https://de.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_en": "https://en.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_es": "https://es.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_et": "https://et.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_it": "https://it.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%94%A8_%EC%98%A4%EB%B8%8C_%EC%8B%9C%EB%B8%8C%EC%A6%88", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Sea_of_Thieves", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Sea_of_%E2%80%8B%E2%80%8BThieves", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%9B%97%E8%B4%BC%E4%B9%8B%E6%B5%B7", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D9%89_%D8%A7%D9%81_%D8%AB%D9%8A%D9%81%D9%8A%D8%B2"}	sea-of-thieves	2020-12-18 16:36:43.357209+00	2020-12-18 16:51:24.13179+00	NA
41	Halo: The Master Chief Collection	{"en": "Halo: The Master Chief Collection", "es": "Halo: The Master Chief Collection", "fa": "هیلو: مجموعه مستر چیف", "fi": "Halo: The Master Chief Collection", "fr": "Halo: The Master Chief Collection", "ko": "헤일로: 마스터 치프 콜렉션", "pl": "Halo: The Master Chief Collection", "pt": "Halo: The Master Chief Collection", "ru": "Halo: The Master Chief Collection", "sv": "Halo: The Master Chief Collection", "th": "เฮโล: เดอะมาสเตอร์ชีฟคอลเลกชัน", "zh": "光环：士官长合集"}	Halo: The Master Chief Collection is a compilation of first-person shooter video games in the Halo series, originally released in November 2014 for the Xbox One, and later on Microsoft Windows through 2019 and 2020. The enhanced version was released for the Xbox Series X|S in November 2020. The collection was developed by 343 Industries in partnership with other studios and was published by Xbox Game Studios. The collection consists of Halo: Combat Evolved Anniversary, Halo 2: Anniversary, Halo 3, Halo 3: ODST, Halo: Reach, and Halo 4, which were originally released on earlier Xbox platforms. A "living" anthology of past Halo games, it continues to receive regular updates and new content as more games age-out of being commonly offered in the retail setting.	{"en": "Halo: The Master Chief Collection is a compilation of first-person shooter video games in the Halo series, originally released in November 2014 for the Xbox One, and later on Microsoft Windows through 2019 and 2020. The enhanced version was released for the Xbox Series X|S in November 2020. The collection was developed by 343 Industries in partnership with other studios and was published by Xbox Game Studios. The collection consists of Halo: Combat Evolved Anniversary, Halo 2: Anniversary, Halo 3, Halo 3: ODST, Halo: Reach, and Halo 4, which were originally released on earlier Xbox platforms. A \\"living\\" anthology of past Halo games, it continues to receive regular updates and new content as more games age-out of being commonly offered in the retail setting."}	["https://upload.wikimedia.org/wikipedia/en/a/a3/Halo_TMCC_KeyArt_Vert_2019.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_es": "https://es.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%87%DB%8C%D9%84%D9%88:_%D9%85%D8%AC%D9%85%D9%88%D8%B9%D9%87_%D9%85%D8%B3%D8%AA%D8%B1_%DA%86%DB%8C%D9%81", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%97%A4%EC%9D%BC%EB%A1%9C:_%EB%A7%88%EC%8A%A4%ED%84%B0_%EC%B9%98%ED%94%84_%EC%BD%9C%EB%A0%89%EC%85%98", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Halo:_The_Master_Chief_Collection", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%80%E0%B8%AE%E0%B9%82%E0%B8%A5:_%E0%B9%80%E0%B8%94%E0%B8%AD%E0%B8%B0%E0%B8%A1%E0%B8%B2%E0%B8%AA%E0%B9%80%E0%B8%95%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%8A%E0%B8%B5%E0%B8%9F%E0%B8%84%E0%B8%AD%E0%B8%A5%E0%B9%80%E0%B8%A5%E0%B8%81%E0%B8%8A%E0%B8%B1%E0%B8%99", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%85%89%E7%8E%AF%EF%BC%9A%E5%A3%AB%E5%AE%98%E9%95%BF%E5%90%88%E9%9B%86"}	halo-the-master-chief-collection	2020-12-17 19:51:06.381775+00	2020-12-17 22:23:21.527124+00	NA
109	F1 2019	{"de": "F1 2019", "en": "F1 2019", "es": "F1 2019 (videojuego)", "fi": "F1 2019", "fr": "F1 2019 (jeu vidéo)", "it": "F1 2019", "ko": "F1 2019 (비디오 게임)", "lt": "F1 2019", "nl": "F1 2019 (computerspel)", "pt": "F1 2019 (jogo eletrônico)", "tr": "F1 2019 (video oyunu)"}	F1 2019 is the official video game of the 2019 Formula One and Formula 2 Championships developed and published by Codemasters. It is the twelfth title in the Formula One series developed by the studio. The game was announced by Codemasters on 28 March 2019. The video game is the eleventh installment of the franchise, and it features all twenty-one circuits, twenty drivers and ten teams present in the 2019 Formula One World Championship. Codemasters has stated that the game was in development for nearly two years, and described it as "the most ambitious release in franchise history".[1]	{"en": "F1 2019 is the official video game of the 2019 Formula One and Formula 2 Championships developed and published by Codemasters. It is the twelfth title in the Formula One series developed by the studio. The game was announced by Codemasters on 28 March 2019. The video game is the eleventh installment of the franchise, and it features all twenty-one circuits, twenty drivers and ten teams present in the 2019 Formula One World Championship. Codemasters has stated that the game was in development for nearly two years, and described it as \\"the most ambitious release in franchise history\\".[1]"}	["https://upload.wikimedia.org/wikipedia/en/2/2c/F1_2019_cover_art.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/F1_2019", "wikipedia_en": "https://en.wikipedia.org/wiki/F1_2019_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/F1_2019_(videojuego)", "wikipedia_fi": "https://fi.wikipedia.org/wiki/F1_2019", "wikipedia_fr": "https://fr.wikipedia.org/wiki/F1_2019_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/F1_2019", "wikipedia_ko": "https://ko.wikipedia.org/wiki/F1_2019_(%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_lt": "https://lt.wikipedia.org/wiki/F1_2019", "wikipedia_nl": "https://nl.wikipedia.org/wiki/F1_2019_(computerspel)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/F1_2019_(jogo_eletr%C3%B4nico)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/F1_2019_(video_oyunu)"}	f1-2019	2020-12-18 16:36:42.451997+00	2020-12-18 16:51:23.453497+00	NA
9	Afterparty	{"en": "Afterparty", "ru": "Afterparty (игра)", "arz": "افتيرپارتى"}	Afterparty is an adventure video game by Night School Studio for macOS, PlayStation 4, Windows, and Xbox One platforms in October 2019 and Nintendo Switch in March 2020. Set in Hell, themed as a college town, the player navigates conversations, outdrinks Satan, and returns two best friends from the afterlife.	{"en": "Afterparty is an adventure video game by Night School Studio for macOS, PlayStation 4, Windows, and Xbox One platforms in October 2019 and Nintendo Switch in March 2020. Set in Hell, themed as a college town, the player navigates conversations, outdrinks Satan, and returns two best friends from the afterlife."}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Afterparty_(video_game)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Afterparty_(%D0%B8%D0%B3%D1%80%D0%B0)", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D9%81%D8%AA%D9%8A%D8%B1%D9%BE%D8%A7%D8%B1%D8%AA%D9%89"}	afterparty	2020-12-14 19:38:22.983948+00	2020-12-18 16:51:23.035553+00	NA
291	Lost Words: Beyond the Page	{"en": "Lost Words: Beyond the Page"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/d334bea27ee64ef5a3a9bb14b1d6a88ercp1/sku/ab6a5a0d448d4c7aaed8dfa91ad6f4b9"}	lost-words-beyond-the-page	2021-02-05 16:52:19.551768+00	2021-02-05 23:20:47.468319+00	E
207	Phoenix Point	{"en": "Phoenix Point"}	Phoenix Point is a strategy video game featuring a turn-based tactics system that is developed by Bulgaria-based independent developer Snapshot Games. It was released on December 3, 2019 for macOS and Microsoft Windows, with Xbox One and PlayStation 4 ports are set to released in 2020[1] and for Stadia in 2021.[2] Phoenix Point is intended to be a spiritual successor to the X-COM series that had been originally created by Snapshot Games head Julian Gollop during the 1990s.	{"en": "Phoenix Point is a strategy video game featuring a turn-based tactics system that is developed by Bulgaria-based independent developer Snapshot Games. It was released on December 3, 2019 for macOS and Microsoft Windows, with Xbox One and PlayStation 4 ports are set to released in 2020[1] and for Stadia in 2021.[2] Phoenix Point is intended to be a spiritual successor to the X-COM series that had been originally created by Snapshot Games head Julian Gollop during the 1990s."}	["https://upload.wikimedia.org/wikipedia/en/1/14/Phoenix_Point_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/18ea8c5d2f7e4f40ad783a512da8ef91rcp1/sku/27099d8546ee4bcfbd172b5a4071c399p"}	phoenix-point	2020-12-21 16:12:04.13354+00	2021-02-05 23:20:49.185427+00	T
57	Pikuniku	{"de": "Pikuniku", "en": "Pikuniku", "fr": "Pikuniku", "ja": "Pikuniku", "arz": "پيكونيكو"}	Pikuniku is a puzzle adventure video game developed by French-British indie collective Sectordub and published by Devolver Digital, that was released on January 24, 2019 for Linux, macOS, Nintendo Switch and Microsoft Windows. It was later released on March 12, 2020 for Xbox One. The player controls the titular red creature, Piku, through a colorful world, to put an end to a plot to harvest the entirety of the land's resources.[1][2]	{"en": "Pikuniku is a puzzle adventure video game developed by French-British indie collective Sectordub and published by Devolver Digital, that was released on January 24, 2019 for Linux, macOS, Nintendo Switch and Microsoft Windows. It was later released on March 12, 2020 for Xbox One. The player controls the titular red creature, Piku, through a colorful world, to put an end to a plot to harvest the entirety of the land's resources.[1][2]"}	["https://upload.wikimedia.org/wikipedia/en/0/01/Pikuniku.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Pikuniku", "wikipedia_en": "https://en.wikipedia.org/wiki/Pikuniku", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Pikuniku", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Pikuniku", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%BE%D9%8A%D9%83%D9%88%D9%86%D9%8A%D9%83%D9%88"}	pikuniku	2020-12-17 19:51:07.702001+00	2020-12-17 22:23:22.926789+00	NA
59	Ori and the Blind Forest	{"ar": "أوري أند ذا بلايند فورست", "de": "Ori and the Blind Forest", "en": "Ori and the Blind Forest", "es": "Ori and the Blind Forest", "fa": "اوری و جنگل کور", "fi": "Ori and the Blind Forest", "fr": "Ori and the Blind Forest", "it": "Ori and the Blind Forest", "ja": "オリとくらやみの森", "ko": "오리와 눈먼 숲", "nl": "Ori and the Blind Forest", "pl": "Ori and the Blind Forest", "pt": "Ori and the Blind Forest", "ru": "Ori and the Blind Forest", "sv": "Ori and the Blind Forest", "tr": "Ori and the Blind Forest", "uk": "Ori and the Blind Forest", "zh": "奧里與迷失森林", "arz": "اورى اند ث بليند فوريست"}	Ori and the Blind Forest is a platform-adventure Metroidvania video game developed by Moon Studios and published by Microsoft Studios. The game was released for Xbox One and Microsoft Windows on March 11, 2015 and for Nintendo Switch on September 27, 2019. Players assume control of Ori, a small white guardian spirit, and Sein, the "light and eyes" of the Forest's Spirit Tree. Players are tasked to move between platforms and solve puzzles. The game features a save system called "Soul Links", which allows players to save their progress at will with limited resources, and an upgrade system that gives players the ability to strengthen Ori's skills and abilities.	{"en": "Ori and the Blind Forest is a platform-adventure Metroidvania video game developed by Moon Studios and published by Microsoft Studios. The game was released for Xbox One and Microsoft Windows on March 11, 2015 and for Nintendo Switch on September 27, 2019. Players assume control of Ori, a small white guardian spirit, and Sein, the \\"light and eyes\\" of the Forest's Spirit Tree. Players are tasked to move between platforms and solve puzzles. The game features a save system called \\"Soul Links\\", which allows players to save their progress at will with limited resources, and an upgrade system that gives players the ability to strengthen Ori's skills and abilities."}	["https://upload.wikimedia.org/wikipedia/en/b/b2/Ori_and_the_Blind_Forest_Logo.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A3%D9%88%D8%B1%D9%8A_%D8%A3%D9%86%D8%AF_%D8%B0%D8%A7_%D8%A8%D9%84%D8%A7%D9%8A%D9%86%D8%AF_%D9%81%D9%88%D8%B1%D8%B3%D8%AA", "wikipedia_de": "https://de.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_en": "https://en.wikipedia.org/wiki/Ori_and_the_Blind_Forest:_Definitive_Edition", "wikipedia_es": "https://es.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A7%D9%88%D8%B1%DB%8C_%D9%88_%D8%AC%D9%86%DA%AF%D9%84_%DA%A9%D9%88%D8%B1", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_it": "https://it.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%AA%E3%83%AA%E3%81%A8%E3%81%8F%E3%82%89%E3%82%84%E3%81%BF%E3%81%AE%E6%A3%AE", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%98%A4%EB%A6%AC%EC%99%80_%EB%88%88%EB%A8%BC_%EC%88%B2", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Ori_and_the_Blind_Forest", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%A5%A7%E9%87%8C%E8%88%87%E8%BF%B7%E5%A4%B1%E6%A3%AE%E6%9E%97", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D9%88%D8%B1%D9%89_%D8%A7%D9%86%D8%AF_%D8%AB_%D8%A8%D9%84%D9%8A%D9%86%D8%AF_%D9%81%D9%88%D8%B1%D9%8A%D8%B3%D8%AA"}	ori-and-the-blind-forest	2020-12-17 19:51:07.810038+00	2020-12-17 22:23:22.929287+00	NA
86	Tracks – The Train Set Game	{"en": "Tracks – The Train Set Game"}	Tracks – The Train Set Game,[a] commonly referred to as Tracks, is an indie simulation video game developed by British indie studio Whoop Games and published by Excalibur Publishing for Microsoft Windows. Originally released onto Itch.io in February 2017, the game was added to Steam's Early Access program in September. Tracks – The Train Set Game sees the player build a wooden toy train track. The video game was fully released on 11 October 2019.[1]	{"en": "Tracks – The Train Set Game,[a] commonly referred to as Tracks, is an indie simulation video game developed by British indie studio Whoop Games and published by Excalibur Publishing for Microsoft Windows. Originally released onto Itch.io in February 2017, the game was added to Steam's Early Access program in September. Tracks – The Train Set Game sees the player build a wooden toy train track. The video game was fully released on 11 October 2019.[1]"}	["https://upload.wikimedia.org/wikipedia/en/8/8b/Tracks_game_logo.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Tracks_%E2%80%93_The_Train_Set_Game"}	tracks-the-train-set-game	2020-12-17 19:51:11.798688+00	2020-12-17 22:23:24.97378+00	NA
160	Dirt 5	{"ar": "ديرت 5", "de": "Dirt 5", "en": "Dirt 5", "es": "DiRT 5", "fa": "دیرت ۵", "fi": "Dirt 5", "fr": "DiRT 5", "nl": "Dirt 5", "ru": "Dirt 5", "arz": "ديرت 5"}	Dirt 5 (stylised as DIRT5) is a racing video game developed and published by Codemasters. It is the fourteenth game in the Colin McRae Rally series and the eighth game to carry the Dirt title. The game was released for Microsoft Windows, PlayStation 4 and Xbox One on 6 November 2020, is scheduled to be released for Xbox Series X/S on 10 November 2020, and for PlayStation 5 on 12 November 2020 (for North America, Oceania, Japan, and South Korea) and 19 November 2020 (for most other regions), and for Stadia in 2021.	{"en": "Dirt 5 (stylised as DIRT5) is a racing video game developed and published by Codemasters. It is the fourteenth game in the Colin McRae Rally series and the eighth game to carry the Dirt title. The game was released for Microsoft Windows, PlayStation 4 and Xbox One on 6 November 2020, is scheduled to be released for Xbox Series X/S on 10 November 2020, and for PlayStation 5 on 12 November 2020 (for North America, Oceania, Japan, and South Korea) and 19 November 2020 (for most other regions), and for Stadia in 2021."}	["https://upload.wikimedia.org/wikipedia/en/2/2d/Dirt_5_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AF%D9%8A%D8%B1%D8%AA_5", "wikipedia_de": "https://de.wikipedia.org/wiki/Dirt_5", "wikipedia_en": "https://en.wikipedia.org/wiki/Dirt_5", "wikipedia_es": "https://es.wikipedia.org/wiki/DiRT_5", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AF%DB%8C%D8%B1%D8%AA_%DB%B5", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Dirt_5", "wikipedia_fr": "https://fr.wikipedia.org/wiki/DiRT_5", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Dirt_5", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Dirt_5", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AF%D9%8A%D8%B1%D8%AA_5"}	dirt-5	2020-12-20 04:21:08.388063+00	2020-12-21 16:12:00.178233+00	NA
128	Resident Evil 7: Biohazard	{"ar": "ريزدنت إيفل 7: بايوهازرد", "ca": "Resident Evil 7: Biohazard", "de": "Resident Evil 7: Biohazard", "el": "Resident Evil 7: Biohazard", "en": "Resident Evil 7: Biohazard", "es": "Resident Evil 7: Biohazard", "fa": "رزیدنت ایول ۷: بایوهازارد", "fi": "Resident Evil 7: Biohazard", "fr": "Resident Evil 7: Biohazard", "hu": "Resident Evil 7: Biohazard", "it": "Resident Evil 7: Biohazard", "ja": "バイオハザード7 レジデント イービル", "ka": "Resident Evil 7: Biohazard", "ko": "바이오하자드 7 레지던트 이블", "lt": "Resident Evil 7: Biohazard", "nl": "Resident Evil 7: Biohazard", "pl": "Resident Evil 7: Biohazard", "pt": "Resident Evil 7: Biohazard", "ru": "Resident Evil 7: Biohazard", "sv": "Resident Evil 7: Biohazard", "th": "เรซิเดนต์อีวิล 7: ไบโอฮาซาร์ด", "tr": "Resident Evil 7: Biohazard", "uk": "Resident Evil 7: Biohazard", "zh": "生化危機7 惡靈古堡", "arz": "ريزدنت ايفل 7:بايوهازرد", "ckb": "ڕێزدێنت ئیڤڵ ٧: بایۆھازارد", "wuu": "生化危机7 恶灵古堡"}	Resident Evil 7: Biohazard[a] is a survival horror video game developed and published by Capcom, released in January 2017 for Microsoft Windows, PlayStation 4 (also supports PlayStation VR headset), Xbox One and in May 2018 for the Nintendo Switch in Japan. The ninth major installment in the Resident Evil series, Resident Evil 7 diverges from the more action-oriented Resident Evil 5 and Resident Evil 6, returning to the franchise's survival horror roots, emphasizing exploration. The player controls Ethan Winters as he searches for his wife in a derelict plantation occupied by an infected family, solving puzzles and fighting enemies. It's the first main series game to use a first-person view.	{"en": "Resident Evil 7: Biohazard[a] is a survival horror video game developed and published by Capcom, released in January 2017 for Microsoft Windows, PlayStation 4 (also supports PlayStation VR headset), Xbox One and in May 2018 for the Nintendo Switch in Japan. The ninth major installment in the Resident Evil series, Resident Evil 7 diverges from the more action-oriented Resident Evil 5 and Resident Evil 6, returning to the franchise's survival horror roots, emphasizing exploration. The player controls Ethan Winters as he searches for his wife in a derelict plantation occupied by an infected family, solving puzzles and fighting enemies. It's the first main series game to use a first-person view."}	["https://upload.wikimedia.org/wikipedia/en/f/fd/Resident_Evil_7_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B1%D9%8A%D8%B2%D8%AF%D9%86%D8%AA_%D8%A5%D9%8A%D9%81%D9%84_7:_%D8%A8%D8%A7%D9%8A%D9%88%D9%87%D8%A7%D8%B2%D8%B1%D8%AF", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_de": "https://de.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_el": "https://el.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_en": "https://en.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_es": "https://es.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B1%D8%B2%DB%8C%D8%AF%D9%86%D8%AA_%D8%A7%DB%8C%D9%88%D9%84_%DB%B7:_%D8%A8%D8%A7%DB%8C%D9%88%D9%87%D8%A7%D8%B2%D8%A7%D8%B1%D8%AF", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_it": "https://it.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%90%E3%82%A4%E3%82%AA%E3%83%8F%E3%82%B6%E3%83%BC%E3%83%897_%E3%83%AC%E3%82%B8%E3%83%87%E3%83%B3%E3%83%88_%E3%82%A4%E3%83%BC%E3%83%93%E3%83%AB", "wikipedia_ka": "https://ka.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%B0%94%EC%9D%B4%EC%98%A4%ED%95%98%EC%9E%90%EB%93%9C_7_%EB%A0%88%EC%A7%80%EB%8D%98%ED%8A%B8_%EC%9D%B4%EB%B8%94", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%80%E0%B8%A3%E0%B8%8B%E0%B8%B4%E0%B9%80%E0%B8%94%E0%B8%99%E0%B8%95%E0%B9%8C%E0%B8%AD%E0%B8%B5%E0%B8%A7%E0%B8%B4%E0%B8%A5_7:_%E0%B9%84%E0%B8%9A%E0%B9%82%E0%B8%AD%E0%B8%AE%E0%B8%B2%E0%B8%8B%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%94", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Resident_Evil_7:_Biohazard", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%94%9F%E5%8C%96%E5%8D%B1%E6%A9%9F7_%E6%83%A1%E9%9D%88%E5%8F%A4%E5%A0%A1", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B1%D9%8A%D8%B2%D8%AF%D9%86%D8%AA_%D8%A7%D9%8A%D9%81%D9%84_7:%D8%A8%D8%A7%D9%8A%D9%88%D9%87%D8%A7%D8%B2%D8%B1%D8%AF", "wikipedia_ckb": "https://ckb.wikipedia.org/wiki/%DA%95%DB%8E%D8%B2%D8%AF%DB%8E%D9%86%D8%AA_%D8%A6%DB%8C%DA%A4%DA%B5_%D9%A7:_%D8%A8%D8%A7%DB%8C%DB%86%DA%BE%D8%A7%D8%B2%D8%A7%D8%B1%D8%AF", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E7%94%9F%E5%8C%96%E5%8D%B1%E6%9C%BA7_%E6%81%B6%E7%81%B5%E5%8F%A4%E5%A0%A1"}	resident-evil-7-biohazard	2020-12-18 16:36:43.290705+00	2020-12-18 16:51:24.30948+00	NA
67	Shadow Warrior 2	{"en": "Shadow Warrior 2", "es": "Shadow Warrior 2", "fi": "Shadow Warrior 2", "fr": "Shadow Warrior 2", "ru": "Shadow Warrior 2", "uk": "Shadow Warrior 2", "zh": "影武者2"}	Shadow Warrior 2 is a first-person shooter video game developed by Flying Wild Hog and published by Devolver Digital. It is the sequel to the 2013 Shadow Warrior, the reboot of the 1997 original. The game was released for Microsoft Windows in October 2016, and for PlayStation 4, Xbox One in May 2017 and Xbox Game Pass in December 2018. A sequel, Shadow Warrior 3, was revealed on July 6, 2020.	{"en": "Shadow Warrior 2 is a first-person shooter video game developed by Flying Wild Hog and published by Devolver Digital. It is the sequel to the 2013 Shadow Warrior, the reboot of the 1997 original. The game was released for Microsoft Windows in October 2016, and for PlayStation 4, Xbox One in May 2017 and Xbox Game Pass in December 2018. A sequel, Shadow Warrior 3, was revealed on July 6, 2020."}	["https://upload.wikimedia.org/wikipedia/en/9/9a/Shadow_Warrior_2_cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Shadow_Warrior_2", "wikipedia_es": "https://es.wikipedia.org/wiki/Shadow_Warrior_2", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Shadow_Warrior_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Shadow_Warrior_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Shadow_Warrior_2", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Shadow_Warrior_2", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%BD%B1%E6%AD%A6%E8%80%852"}	shadow-warrior-2	2020-12-17 19:51:10.518313+00	2020-12-17 22:23:23.467537+00	NA
15	Darksiders III	{"en": "Darksiders III", "es": "Darksiders III", "fa": "دارکسایدرز ۳", "fr": "Darksiders III", "it": "Darksiders III", "pt": "Darksiders III", "ru": "Darksiders III", "uk": "Darksiders III", "zh": "末世騎士III", "arz": "داركسيديرس اى (فيديو لعب)"}	Darksiders III is a video game developed by Gunfire Games and published by THQ Nordic for Microsoft Windows, PlayStation 4 and Xbox One in 2018. It is a sequel to Darksiders II and the third entry in the Darksiders series.	{"en": "Darksiders III is a video game developed by Gunfire Games and published by THQ Nordic for Microsoft Windows, PlayStation 4 and Xbox One in 2018. It is a sequel to Darksiders II and the third entry in the Darksiders series."}	["https://upload.wikimedia.org/wikipedia/en/b/b6/Darksiders_3_Box_Art.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Darksiders_III", "wikipedia_es": "https://es.wikipedia.org/wiki/Darksiders_III", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AF%D8%A7%D8%B1%DA%A9%D8%B3%D8%A7%DB%8C%D8%AF%D8%B1%D8%B2_%DB%B3", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Darksiders_III", "wikipedia_it": "https://it.wikipedia.org/wiki/Darksiders_III", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Darksiders_III", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Darksiders_III", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Darksiders_III", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%9C%AB%E4%B8%96%E9%A8%8E%E5%A3%ABIII", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AF%D8%A7%D8%B1%D9%83%D8%B3%D9%8A%D8%AF%D9%8A%D8%B1%D8%B3_%D8%A7%D9%89_(%D9%81%D9%8A%D8%AF%D9%8A%D9%88_%D9%84%D8%B9%D8%A8)"}	darksiders-iii	2020-12-17 19:51:04.624644+00	2020-12-17 22:23:20.248979+00	NA
292	Cyberpunk	{"en": "Cyberpunk"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/49697e672bc34e7d8a5f73f78cb580d0rcp1/sku/a4d44ee20c90481c86163a5d7b7b9d97p"}	cyberpunk	2021-02-05 16:52:19.573529+00	2021-02-05 23:20:47.050436+00	M17+
111	Gears of War	{"ar": "غيرز أوف وور", "ca": "Gears of War", "da": "Gears of War", "de": "Gears of War", "en": "Gears of War", "es": "Gears of War", "fa": "چرخ‌دنده‌های جنگ", "fi": "Gears of War", "fr": "Gears of War (jeu vidéo)", "hu": "Gears of War", "it": "Gears of War", "ja": "Gears of War", "ko": "기어스 오브 워 (비디오 게임)", "lt": "Gears of War", "mn": "Gears of War", "nb": "Gears of War", "nl": "Gears of War", "pl": "Gears of War", "pt": "Gears of War (jogo eletrônico)", "ro": "Gears of War", "ru": "Gears of War", "sv": "Gears of War", "tr": "Gears of War", "uk": "Gears of War", "vi": "Gears of War", "zh": "戰爭機器 (遊戲)", "ckb": "کەرستەکانی جەنگ (یاری ڤیدیۆیی)", "hif": "Gears of War", "wuu": "战争机器 (游戏)"}	Gears of War is a 2006 third-person shooter video game, the first installment of the Gears of War series. It was developed by Epic Games and published by Microsoft Game Studios, initially as an exclusive title for the Xbox 360 in November 2006, before a Microsoft Windows version of the game, developed in conjunction with People Can Fly, was released in 2007. The game's main story, which can be played in single or co-operative play, focuses on a squad of troops who assist in completing a desperate, last-ditch attempt to end a war against a genocidal subterranean enemy, the Locust, and save the remaining human inhabitants of their planet Sera. The game's multiplayer mode allows up to eight players to control characters from one of the two factions in a variety of online game modes. Gameplay features players using cover and strategic fire in order to win battles.	{"en": "Gears of War is a 2006 third-person shooter video game, the first installment of the Gears of War series. It was developed by Epic Games and published by Microsoft Game Studios, initially as an exclusive title for the Xbox 360 in November 2006, before a Microsoft Windows version of the game, developed in conjunction with People Can Fly, was released in 2007. The game's main story, which can be played in single or co-operative play, focuses on a squad of troops who assist in completing a desperate, last-ditch attempt to end a war against a genocidal subterranean enemy, the Locust, and save the remaining human inhabitants of their planet Sera. The game's multiplayer mode allows up to eight players to control characters from one of the two factions in a variety of online game modes. Gameplay features players using cover and strategic fire in order to win battles."}	["https://upload.wikimedia.org/wikipedia/en/8/82/Gears_of_war_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%BA%D9%8A%D8%B1%D8%B2_%D8%A3%D9%88%D9%81_%D9%88%D9%88%D8%B1", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Gears_of_War", "wikipedia_da": "https://da.wikipedia.org/wiki/Gears_of_War", "wikipedia_de": "https://de.wikipedia.org/wiki/Gears_of_War", "wikipedia_en": "https://en.wikipedia.org/wiki/Gears_of_War_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Gears_of_War", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%86%D8%B1%D8%AE%E2%80%8C%D8%AF%D9%86%D8%AF%D9%87%E2%80%8C%D9%87%D8%A7%DB%8C_%D8%AC%D9%86%DA%AF", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Gears_of_War", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Gears_of_War_(jeu_vid%C3%A9o)", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Gears_of_War", "wikipedia_it": "https://it.wikipedia.org/wiki/Gears_of_War", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Gears_of_War", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EA%B8%B0%EC%96%B4%EC%8A%A4_%EC%98%A4%EB%B8%8C_%EC%9B%8C_(%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Gears_of_War", "wikipedia_mn": "https://mn.wikipedia.org/wiki/Gears_of_War", "wikipedia_nb": "https://no.wikipedia.org/wiki/Gears_of_War", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Gears_of_War", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Gears_of_War", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Gears_of_War_(jogo_eletr%C3%B4nico)", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Gears_of_War", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Gears_of_War", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Gears_of_War", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Gears_of_War", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Gears_of_War", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Gears_of_War", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%88%B0%E7%88%AD%E6%A9%9F%E5%99%A8_(%E9%81%8A%E6%88%B2)", "wikipedia_ckb": "https://ckb.wikipedia.org/wiki/%DA%A9%DB%95%D8%B1%D8%B3%D8%AA%DB%95%DA%A9%D8%A7%D9%86%DB%8C_%D8%AC%DB%95%D9%86%DA%AF_(%DB%8C%D8%A7%D8%B1%DB%8C_%DA%A4%DB%8C%D8%AF%DB%8C%DB%86%DB%8C%DB%8C)", "wikipedia_hif": "https://hif.wikipedia.org/wiki/Gears_of_War", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E6%88%98%E4%BA%89%E6%9C%BA%E5%99%A8_(%E6%B8%B8%E6%88%8F)"}	gears-of-war	2020-12-18 16:36:42.553863+00	2020-12-18 16:51:23.501725+00	NA
312	Wave Break	{"en": "Wave Break"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/3e7b24085e704c10ab03f93a19947c14rcp1/sku/599a08652fad4a41baad8591e18e83e2"}	wave-break	2021-02-05 16:52:21.46671+00	2021-02-05 23:20:47.310082+00	M17+
54	Oxenfree	{"de": "Oxenfree", "en": "Oxenfree", "es": "Oxenfree", "fr": "Oxenfree", "hy": "Oxenfree", "ko": "옥센프리", "pl": "Oxenfree", "pt": "Oxenfree", "ru": "Oxenfree", "zh": "Oxenfree", "arz": "اوكسينفرى"}	Oxenfree is a supernatural mystery graphic adventure game developed and published by Night School Studio. The game was released for Microsoft Windows, OS X and Xbox One in January 2016. PlayStation 4 and Linux versions were released later in 2016, followed by iOS, Android, and Nintendo Switch versions in 2017. In Oxenfree, players assume the role of teenage girl Alex on a weekend trip to a local island. After seemingly supernatural events occur, Alex and her friends must unravel the secrets of the island.	{"en": "Oxenfree is a supernatural mystery graphic adventure game developed and published by Night School Studio. The game was released for Microsoft Windows, OS X and Xbox One in January 2016. PlayStation 4 and Linux versions were released later in 2016, followed by iOS, Android, and Nintendo Switch versions in 2017. In Oxenfree, players assume the role of teenage girl Alex on a weekend trip to a local island. After seemingly supernatural events occur, Alex and her friends must unravel the secrets of the island."}	[]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Oxenfree", "wikipedia_en": "https://en.wikipedia.org/wiki/Oxenfree", "wikipedia_es": "https://es.wikipedia.org/wiki/Oxenfree", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Oxenfree", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Oxenfree", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%98%A5%EC%84%BC%ED%94%84%EB%A6%AC", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Oxenfree", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Oxenfree", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Oxenfree", "wikipedia_zh": "https://zh.wikipedia.org/wiki/Oxenfree", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D9%88%D9%83%D8%B3%D9%8A%D9%86%D9%81%D8%B1%D9%89"}	oxenfree	2020-12-17 19:51:07.393598+00	2020-12-17 22:23:22.867569+00	NA
20	Death Squared	{"en": "Death Squared", "hu": "Death Squared", "ja": "ロロロロ", "zh": "㗊"}	Death Squared is a puzzle video game developed and published by SMG Studio. It was released in 2017 for Microsoft Windows, macOS and Nintendo Switch, PS4 And Xbox One\n, and in 2018 for iOS and Android And \nHuawei.	{"en": "Death Squared is a puzzle video game developed and published by SMG Studio. It was released in 2017 for Microsoft Windows, macOS and Nintendo Switch, PS4 And Xbox One\\n, and in 2018 for iOS and Android And \\nHuawei."}	["https://upload.wikimedia.org/wikipedia/en/2/26/Death_Squared_cover.jpeg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Death_Squared", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Death_Squared", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%AD%E3%83%AD%E3%83%AD%E3%83%AD", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E3%97%8A"}	death-squared	2020-12-17 19:51:04.773633+00	2020-12-17 22:23:20.333418+00	NA
64	Slay the Spire	{"en": "Slay the Spire", "es": "Slay the Spire", "fr": "Slay the Spire", "ja": "Slay the Spire", "pt": "Slay the Spire", "zh": "杀戮尖塔"}	Slay the Spire is a roguelike video game developed by American studio MegaCrit and published by Humble Bundle. The game was first released in early access for Microsoft Windows, macOS, and Linux in late 2017, with an official release in January 2019. It was released for PlayStation 4 in May 2019, for Nintendo Switch in June 2019 and for Xbox One in August 2019. An iOS version was released in June 2020 with an Android version planned later in the year.	{"en": "Slay the Spire is a roguelike video game developed by American studio MegaCrit and published by Humble Bundle. The game was first released in early access for Microsoft Windows, macOS, and Linux in late 2017, with an official release in January 2019. It was released for PlayStation 4 in May 2019, for Nintendo Switch in June 2019 and for Xbox One in August 2019. An iOS version was released in June 2020 with an Android version planned later in the year."}	["https://upload.wikimedia.org/wikipedia/en/b/b7/Slay_the_spire_cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Slay_the_Spire", "wikipedia_es": "https://es.wikipedia.org/wiki/Slay_the_Spire", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Slay_the_Spire", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Slay_the_Spire", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Slay_the_Spire", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%9D%80%E6%88%AE%E5%B0%96%E5%A1%94"}	slay-the-spire	2020-12-17 19:51:10.305167+00	2020-12-17 22:23:23.526995+00	NA
193	MotoGP 20	{"en": "MotoGP 20", "it": "MotoGP 20"}	MotoGP 20 is a video game developed by Milestone srl. 	{"en": "MotoGP 20 is a video game developed by Milestone srl. "}	["https://upload.wikimedia.org/wikipedia/en/e/ed/MotoGp20.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/MotoGP_20", "wikipedia_it": "https://it.wikipedia.org/wiki/MotoGP_20"}	motogp-20	2020-12-21 16:12:03.482041+00	2020-12-21 16:12:03.482079+00	NA
19	Dead Cells	{"en": "Dead Cells", "es": "Dead Cells", "fa": "سلول‌های مرده", "fr": "Dead Cells", "it": "Dead Cells", "pt": "Dead Cells", "ru": "Dead Cells", "zh": "死亡細胞", "arz": "دايد سيلس"}	Dead Cells is a roguelike action platformer video game inspired by Metroidvania-style games, developed and published by Motion Twin. Following about a year in early access, Dead Cells was released for Linux, macOS, Microsoft Windows, Nintendo Switch, PlayStation 4, and Xbox One on August 7, 2018. A mobile port for iOS was released on August 28, 2019[1] and an Android port was released on June 3, 2020.[2][3]	{"en": "Dead Cells is a roguelike action platformer video game inspired by Metroidvania-style games, developed and published by Motion Twin. Following about a year in early access, Dead Cells was released for Linux, macOS, Microsoft Windows, Nintendo Switch, PlayStation 4, and Xbox One on August 7, 2018. A mobile port for iOS was released on August 28, 2019[1] and an Android port was released on June 3, 2020.[2][3]"}	["https://upload.wikimedia.org/wikipedia/en/1/1f/Dead_cells_cover_art.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Dead_Cells", "wikipedia_es": "https://es.wikipedia.org/wiki/Dead_Cells", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D9%84%D9%88%D9%84%E2%80%8C%D9%87%D8%A7%DB%8C_%D9%85%D8%B1%D8%AF%D9%87", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Dead_Cells", "wikipedia_it": "https://it.wikipedia.org/wiki/Dead_Cells", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Dead_Cells", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Dead_Cells", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%AD%BB%E4%BA%A1%E7%B4%B0%E8%83%9E", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AF%D8%A7%D9%8A%D8%AF_%D8%B3%D9%8A%D9%84%D8%B3"}	dead-cells	2020-12-17 19:51:04.75735+00	2020-12-17 22:23:20.265633+00	NA
52	Super Lucky's Tale	{"da": "Super Lucky's Tale", "en": "Super Lucky's Tale", "it": "Super Lucky's Tale", "pt": "Super Lucky's Tale", "zh": "超級拉奇傳說"}	Super Lucky's Tale is a 3D platformer video game developed by Playful Studios and published by Microsoft Studios for Microsoft Windows and Xbox One. It is the sequel to Lucky's Tale, a virtual reality 3D platformer for the Oculus Rift. The game was released as a launch title for the Xbox One X on November 7, 2017. The game is featured as part of the Play Anywhere program. It was announced during the Xbox presentation at E3 2017. In March 2018, the game became part of Xbox Game Pass.[1]	{"en": "Super Lucky's Tale is a 3D platformer video game developed by Playful Studios and published by Microsoft Studios for Microsoft Windows and Xbox One. It is the sequel to Lucky's Tale, a virtual reality 3D platformer for the Oculus Rift. The game was released as a launch title for the Xbox One X on November 7, 2017. The game is featured as part of the Play Anywhere program. It was announced during the Xbox presentation at E3 2017. In March 2018, the game became part of Xbox Game Pass.[1]"}	["https://upload.wikimedia.org/wikipedia/en/b/b1/Super_Lucky%27s_Tale.jpg"]	{"wikipedia_da": "https://da.wikipedia.org/wiki/Super_Lucky%27s_Tale", "wikipedia_en": "https://en.wikipedia.org/wiki/New_Super_Lucky's_Tale", "wikipedia_it": "https://it.wikipedia.org/wiki/Super_Lucky%27s_Tale", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Super_Lucky%27s_Tale", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%B6%85%E7%B4%9A%E6%8B%89%E5%A5%87%E5%82%B3%E8%AA%AA"}	super-luckys-tale	2020-12-17 19:51:07.244142+00	2020-12-17 22:23:22.291973+00	NA
163	Far Cry 6	{"ar": "فار كراي 6", "bn": "ফার ক্রাই ৬", "ca": "Far Cry 6", "de": "Far Cry 6", "el": "Far Cry 6", "en": "Far Cry 6", "es": "Far Cry 6", "fa": "فار کرای ۶", "fi": "Far Cry 6", "fr": "Far Cry 6", "it": "Far Cry 6", "nl": "Far Cry 6", "pt": "Far Cry 6", "ru": "Far Cry 6", "sv": "Far Cry 6", "uk": "Far Cry 6", "zh": "孤岛惊魂6", "arz": "فار كراى 6"}	Far Cry 6 is an upcoming first-person shooter game developed by Ubisoft Toronto and published by Ubisoft. It is the sixth main installment of the Far Cry series for Amazon Luna, Microsoft Windows, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S, and Stadia.	{"en": "Far Cry 6 is an upcoming first-person shooter game developed by Ubisoft Toronto and published by Ubisoft. It is the sixth main installment of the Far Cry series for Amazon Luna, Microsoft Windows, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S, and Stadia."}	["https://upload.wikimedia.org/wikipedia/en/3/35/Far_cry_6_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%81%D8%A7%D8%B1_%D9%83%D8%B1%D8%A7%D9%8A_6", "wikipedia_bn": "https://bn.wikipedia.org/wiki/%E0%A6%AB%E0%A6%BE%E0%A6%B0_%E0%A6%95%E0%A7%8D%E0%A6%B0%E0%A6%BE%E0%A6%87_%E0%A7%AC", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Far_Cry_6", "wikipedia_de": "https://de.wikipedia.org/wiki/Far_Cry_6", "wikipedia_el": "https://el.wikipedia.org/wiki/Far_Cry_6", "wikipedia_en": "https://en.wikipedia.org/wiki/Far_Cry_6", "wikipedia_es": "https://es.wikipedia.org/wiki/Far_Cry_6", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%81%D8%A7%D8%B1_%DA%A9%D8%B1%D8%A7%DB%8C_%DB%B6", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Far_Cry_6", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Far_Cry_6", "wikipedia_it": "https://it.wikipedia.org/wiki/Far_Cry_6", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Far_Cry_6", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Far_Cry_6", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Far_Cry_6", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Far_Cry_6", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Far_Cry_6", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%AD%A4%E5%B2%9B%E6%83%8A%E9%AD%826", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%81%D8%A7%D8%B1_%D9%83%D8%B1%D8%A7%D9%89_6"}	far-cry-6	2020-12-20 04:21:08.686837+00	2020-12-21 16:12:00.47888+00	NA
114	Hollow Knight	{"de": "Hollow Knight", "en": "Hollow Knight", "es": "Hollow Knight", "et": "Hollow Knight", "fi": "Hollow Knight", "fr": "Hollow Knight", "he": "Hollow Knight", "it": "Hollow Knight", "ja": "Hollow Knight", "ko": "할로 나이트", "nl": "Hollow Knight", "pt": "Hollow Knight", "ru": "Hollow Knight", "sr": "Hollow Knight", "sv": "Hollow Knight", "uk": "Hollow Knight", "zh": "空洞騎士", "arz": "هولو كنيجت"}	Hollow Knight is a 2017 action-adventure game developed and published by Team Cherry, and was released for Microsoft Windows, macOS, and Linux in 2017, and for the Nintendo Switch, PlayStation 4, and Xbox One in 2018.[1] Development was partially funded through a Kickstarter crowdfunding campaign, raising over A$57,000 by the end of 2014.[2]	{"en": "Hollow Knight is a 2017 action-adventure game developed and published by Team Cherry, and was released for Microsoft Windows, macOS, and Linux in 2017, and for the Nintendo Switch, PlayStation 4, and Xbox One in 2018.[1] Development was partially funded through a Kickstarter crowdfunding campaign, raising over A$57,000 by the end of 2014.[2]"}	["https://upload.wikimedia.org/wikipedia/en/c/c0/Hollow_Knight_cover.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Hollow_Knight", "wikipedia_en": "https://en.wikipedia.org/wiki/Hollow_Knight", "wikipedia_es": "https://es.wikipedia.org/wiki/Hollow_Knight", "wikipedia_et": "https://et.wikipedia.org/wiki/Hollow_Knight", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Hollow_Knight", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Hollow_Knight", "wikipedia_he": "https://he.wikipedia.org/wiki/Hollow_Knight", "wikipedia_it": "https://it.wikipedia.org/wiki/Hollow_Knight", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Hollow_Knight", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%95%A0%EB%A1%9C_%EB%82%98%EC%9D%B4%ED%8A%B8", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Hollow_Knight", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Hollow_Knight", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Hollow_Knight", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Hollow_Knight", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Hollow_Knight", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Hollow_Knight", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%A9%BA%E6%B4%9E%E9%A8%8E%E5%A3%AB", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%87%D9%88%D9%84%D9%88_%D9%83%D9%86%D9%8A%D8%AC%D8%AA"}	hollow-knight	2020-12-18 16:36:42.648645+00	2020-12-18 16:51:23.17867+00	NA
26	Fallout 76	{"ar": "فول أوت 76", "az": "Fallout 76", "br": "Fallout 76", "cy": "Fallout76", "da": "Fallout 76", "de": "Fallout 76", "en": "Fallout 76", "es": "Fallout 76", "et": "Fallout 76", "fa": "فال‌اوت ۷۶", "fi": "Fallout 76", "fr": "Fallout 76", "hu": "Fallout 76", "it": "Fallout 76", "ja": "Fallout 76", "ko": "폴아웃 76", "nb": "Fallout 76", "nl": "Fallout 76", "pl": "Fallout 76", "pt": "Fallout 76", "ru": "Fallout 76", "sv": "Fallout 76", "uk": "Fallout 76", "zh": "辐射76", "arz": "فول اوت 76"}	Fallout 76 is an online action role-playing game developed by Bethesda Game Studios and published by Bethesda Softworks. Released for Microsoft Windows, PlayStation 4, and Xbox One on November 14, 2018, it is an installment in the Fallout series and a prequel to previous entries.[b] Fallout 76 is Bethesda Game Studios's first multiplayer game; players explore the open world, which has been torn apart by nuclear war, with others. Bethesda developed the game using a modified version of its Creation Engine, which allowed the accommodation of multiplayer gameplay and a more detailed game world than in previous games.	{"en": "Fallout 76 is an online action role-playing game developed by Bethesda Game Studios and published by Bethesda Softworks. Released for Microsoft Windows, PlayStation 4, and Xbox One on November 14, 2018, it is an installment in the Fallout series and a prequel to previous entries.[b] Fallout 76 is Bethesda Game Studios's first multiplayer game; players explore the open world, which has been torn apart by nuclear war, with others. Bethesda developed the game using a modified version of its Creation Engine, which allowed the accommodation of multiplayer gameplay and a more detailed game world than in previous games."}	["https://upload.wikimedia.org/wikipedia/en/0/06/Fallout_76_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%81%D9%88%D9%84_%D8%A3%D9%88%D8%AA_76", "wikipedia_az": "https://az.wikipedia.org/wiki/Fallout_76", "wikipedia_br": "https://br.wikipedia.org/wiki/Fallout_76", "wikipedia_cy": "https://cy.wikipedia.org/wiki/Fallout76", "wikipedia_da": "https://da.wikipedia.org/wiki/Fallout_76", "wikipedia_de": "https://de.wikipedia.org/wiki/Fallout_76", "wikipedia_en": "https://en.wikipedia.org/wiki/Fallout_76", "wikipedia_es": "https://es.wikipedia.org/wiki/Fallout_76", "wikipedia_et": "https://et.wikipedia.org/wiki/Fallout_76", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%81%D8%A7%D9%84%E2%80%8C%D8%A7%D9%88%D8%AA_%DB%B7%DB%B6", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Fallout_76", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Fallout_76", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Fallout_76", "wikipedia_it": "https://it.wikipedia.org/wiki/Fallout_76", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Fallout_76", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%8F%B4%EC%95%84%EC%9B%83_76", "wikipedia_nb": "https://no.wikipedia.org/wiki/Fallout_76", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Fallout_76", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Fallout_76", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Fallout_76", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Fallout_76", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Fallout_76", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Fallout_76", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%BE%90%E5%B0%8476", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%81%D9%88%D9%84_%D8%A7%D9%88%D8%AA_76"}	fallout-76	2020-12-17 19:51:05.533943+00	2020-12-17 22:23:20.994257+00	NA
80	The Escapists 2	{"cs": "The Escapists 2", "en": "The Escapists 2", "fi": "The Escapists 2", "fr": "The Escapists 2", "ru": "The Escapists 2", "uk": "The Escapists 2", "zh": "逃脱者2"}	The Escapists 2 is a strategy role-playing video game developed by Mouldy Toof Studios  and published by Team17. It is the sequel to The Escapists (2015) and it was released worldwide for Microsoft Windows, macOS, Linux, PlayStation 4 and Xbox One in August 2017. Nintendo Switch and mobile phones versions were released in 2018 and 2019 respectively.	{"en": "The Escapists 2 is a strategy role-playing video game developed by Mouldy Toof Studios  and published by Team17. It is the sequel to The Escapists (2015) and it was released worldwide for Microsoft Windows, macOS, Linux, PlayStation 4 and Xbox One in August 2017. Nintendo Switch and mobile phones versions were released in 2018 and 2019 respectively."}	["https://upload.wikimedia.org/wikipedia/en/9/91/The_Escapists_2_cover_art.png"]	{"wikipedia_cs": "https://cs.wikipedia.org/wiki/The_Escapists_2", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Escapists_2", "wikipedia_fi": "https://fi.wikipedia.org/wiki/The_Escapists_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Escapists_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Escapists_2", "wikipedia_uk": "https://uk.wikipedia.org/wiki/The_Escapists_2", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%80%83%E8%84%B1%E8%80%852"}	the-escapists-2	2020-12-17 19:51:11.302685+00	2020-12-17 22:23:24.375926+00	NA
175	Immortals Fenyx Rising	{"en": "Immortals Fenyx Rising"}	Immortals Fenyx Rising (originally known as Gods and Monsters) is an action-adventure video game developed by Ubisoft Quebec and published by Ubisoft. The game was released for Amazon Luna, Windows, Nintendo Switch, PlayStation 4, PlayStation 5, Stadia, Xbox One and Xbox Series X and S on December 3, 2020.	{"en": "Immortals Fenyx Rising (originally known as Gods and Monsters) is an action-adventure video game developed by Ubisoft Quebec and published by Ubisoft. The game was released for Amazon Luna, Windows, Nintendo Switch, PlayStation 4, PlayStation 5, Stadia, Xbox One and Xbox Series X and S on December 3, 2020."}	["https://upload.wikimedia.org/wikipedia/en/5/5f/Immortals_Fenyx_Rising_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/161f276db10947a199cd0260ed4dc248rcp1/sku/e08ea1952a294f24b9ba58478f69a5ddp"}	immortals-fenyx-rising	2020-12-20 04:21:10.094261+00	2021-02-05 23:20:46.078691+00	T
24	Don't Starve	{"ar": "دونت ستارف", "az": "Don't Starve", "cs": "Don't Starve", "de": "Don’t Starve", "en": "Don't Starve", "es": "Don't Starve", "fi": "Don’t Starve", "fr": "Don't Starve", "it": "Don't Starve", "ko": "돈 스타브", "pl": "Don’t Starve", "pt": "Don't Starve", "ru": "Don’t Starve", "sv": "Don't starve", "tr": "Don't Starve", "uk": "Don't Starve", "zh": "饥荒 (游戏)"}	Don't Starve is a survival video game developed by the Canadian indie video game developer Klei Entertainment. The game was initially released for Microsoft Windows, OS X, and Linux on April 23, 2013.[1] A PlayStation 4 port, renamed Don't Starve: Giant Edition, became available the following year (with PlayStation Vita and PlayStation 3 versions released on September 2014 and June 2015 respectively, and an Xbox One version released in August 2015).[2][3] Don't Starve for iOS, renamed Don't Starve: Pocket Edition was released on July 9, 2015.[4] An Android version was released on October 20, 2016. Downloadable content titled Reign of Giants was released on April 30, 2014, and a multiplayer expansion called Don't Starve Together became free for existing users on June 3, 2015.[5] On Steam, this game is able to be purchased with a free copy for a friend.[6] A Nintendo Switch port came out on April 12, 2018.	{"en": "Don't Starve is a survival video game developed by the Canadian indie video game developer Klei Entertainment. The game was initially released for Microsoft Windows, OS X, and Linux on April 23, 2013.[1] A PlayStation 4 port, renamed Don't Starve: Giant Edition, became available the following year (with PlayStation Vita and PlayStation 3 versions released on September 2014 and June 2015 respectively, and an Xbox One version released in August 2015).[2][3] Don't Starve for iOS, renamed Don't Starve: Pocket Edition was released on July 9, 2015.[4] An Android version was released on October 20, 2016. Downloadable content titled Reign of Giants was released on April 30, 2014, and a multiplayer expansion called Don't Starve Together became free for existing users on June 3, 2015.[5] On Steam, this game is able to be purchased with a free copy for a friend.[6] A Nintendo Switch port came out on April 12, 2018."}	["https://upload.wikimedia.org/wikipedia/en/d/d2/Don%27t_Starve_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AF%D9%88%D9%86%D8%AA_%D8%B3%D8%AA%D8%A7%D8%B1%D9%81", "wikipedia_az": "https://az.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_de": "https://de.wikipedia.org/wiki/Don%E2%80%99t_Starve", "wikipedia_en": "https://en.wikipedia.org/wiki/Don't_Starve", "wikipedia_es": "https://es.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Don%E2%80%99t_Starve", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_it": "https://it.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%8F%88_%EC%8A%A4%ED%83%80%EB%B8%8C", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Don%E2%80%99t_Starve", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Don%E2%80%99t_Starve", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Don%27t_starve", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Don%27t_Starve", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%A5%A5%E8%8D%92_(%E6%B8%B8%E6%88%8F)"}	dont-starve	2020-12-17 19:51:04.949685+00	2020-12-17 22:23:21.179806+00	NA
82	Totally Accurate Battle Simulator	{"ar": "توتالي أكورايت باتل سيمولاتور", "de": "Totally Accurate Battle Simulator", "en": "Totally Accurate Battle Simulator", "fr": "Totally Accurate Battle Simulator", "ru": "Totally Accurate Battle Simulator", "vi": "Totally Accurate Battle Simulator"}	Totally Accurate Battle Simulator (TABS) is a ragdoll physics battle simulation video game developed by Landfall Games. The game is a satire of the battle simulator genre. The alpha version of the game was initially released in 2016 to a small audience. The full version was released in early access on Steam on 1 April 2019, for Microsoft Windows and macOS,[1] and December 2019 for Xbox One, receiving several content updates and bug fixes throughout both 2019 and 2020. Two spin-offs, Totally Accurate Battle Zombielator, which is a satire of the survival horror genre, and Totally Accurate Battlegrounds, which is a satire of the battle royale genre, were released on 1 April 2017 and 5 June 2018, respectively.	{"en": "Totally Accurate Battle Simulator (TABS) is a ragdoll physics battle simulation video game developed by Landfall Games. The game is a satire of the battle simulator genre. The alpha version of the game was initially released in 2016 to a small audience. The full version was released in early access on Steam on 1 April 2019, for Microsoft Windows and macOS,[1] and December 2019 for Xbox One, receiving several content updates and bug fixes throughout both 2019 and 2020. Two spin-offs, Totally Accurate Battle Zombielator, which is a satire of the survival horror genre, and Totally Accurate Battlegrounds, which is a satire of the battle royale genre, were released on 1 April 2017 and 5 June 2018, respectively."}	["https://upload.wikimedia.org/wikipedia/en/9/99/Totally_Accurate_Battle_Simulator_logo.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AA%D9%88%D8%AA%D8%A7%D9%84%D9%8A_%D8%A3%D9%83%D9%88%D8%B1%D8%A7%D9%8A%D8%AA_%D8%A8%D8%A7%D8%AA%D9%84_%D8%B3%D9%8A%D9%85%D9%88%D9%84%D8%A7%D8%AA%D9%88%D8%B1", "wikipedia_de": "https://de.wikipedia.org/wiki/Totally_Accurate_Battle_Simulator", "wikipedia_en": "https://en.wikipedia.org/wiki/Totally_Accurate_Battle_Simulator", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Totally_Accurate_Battle_Simulator", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Totally_Accurate_Battle_Simulator", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Totally_Accurate_Battle_Simulator"}	totally-accurate-battle-simulator	2020-12-17 19:51:11.627374+00	2020-12-17 22:23:24.825721+00	NA
65	Subnautica	{"ar": "سابنوتيكا", "bg": "Субнавтика", "cs": "Subnautica", "de": "Subnautica", "en": "Subnautica", "es": "Subnautica", "fi": "Subnautica", "fr": "Subnautica", "hu": "Subnautica", "it": "Subnautica", "ja": "サブノーティカ", "ko": "서브노티카", "lt": "Subnautica", "ru": "Subnautica", "sk": "Subnautica", "uk": "Subnautica", "zh": "深海迷航", "arz": "سابنوتيكا"}	Subnautica is an open world survival action-adventure video game developed and published by Unknown Worlds Entertainment. In it, players are free to explore the ocean on an alien planet, known as planet 4546B, after their spaceship, the Aurora, crashes on the planet's surface. The player must collect resources and face creatures to survive.[2][3]	{"en": "Subnautica is an open world survival action-adventure video game developed and published by Unknown Worlds Entertainment. In it, players are free to explore the ocean on an alien planet, known as planet 4546B, after their spaceship, the Aurora, crashes on the planet's surface. The player must collect resources and face creatures to survive.[2][3]"}	["https://upload.wikimedia.org/wikipedia/en/6/6d/Subnautica_cover_art.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D8%A7%D8%A8%D9%86%D9%88%D8%AA%D9%8A%D9%83%D8%A7", "wikipedia_bg": "https://bg.wikipedia.org/wiki/%D0%A1%D1%83%D0%B1%D0%BD%D0%B0%D0%B2%D1%82%D0%B8%D0%BA%D0%B0", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Subnautica", "wikipedia_de": "https://de.wikipedia.org/wiki/Subnautica", "wikipedia_en": "https://en.wikipedia.org/wiki/Subnautica", "wikipedia_es": "https://es.wikipedia.org/wiki/Subnautica", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Subnautica", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Subnautica", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Subnautica", "wikipedia_it": "https://it.wikipedia.org/wiki/Subnautica", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%96%E3%83%8E%E3%83%BC%E3%83%86%E3%82%A3%E3%82%AB", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%84%9C%EB%B8%8C%EB%85%B8%ED%8B%B0%EC%B9%B4", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Subnautica", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Subnautica", "wikipedia_sk": "https://sk.wikipedia.org/wiki/Subnautica", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Subnautica", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%B7%B1%E6%B5%B7%E8%BF%B7%E8%88%AA", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D8%A7%D8%A8%D9%86%D9%88%D8%AA%D9%8A%D9%83%D8%A7"}	subnautica	2020-12-17 19:51:10.40658+00	2020-12-17 22:23:24.018981+00	NA
115	Minit	{"de": "Minit (Computerspiel)", "en": "Minit", "fr": "Minit", "ja": "Minit"}	Minit is an adventure video game developed by Jan Willem Nijman, co-founder and one-half of Vlambeer; Kitty Calis, who contributed to Horizon Zero Dawn; Jukio Kallio, a freelance composer; and Dominik Johann, art director of Crows Crows Crows.[1] The game is published by Devolver Digital and was released on April 3, 2018 for Windows, macOS, Linux, Xbox One, and PlayStation 4. On May 11, 2018, a Nintendo Switch version was announced on the first episode of Indie World, a web series from Nintendo of Japan that showcases indie games coming to the Japanese Nintendo eShop.[2] It was released for the Nintendo Switch August 9, 2018.[3] It also came out for mobile devices in June 2019.[4] The game's premise is that each of the player's lives only lasts for one minute, resulting in "a peculiar little adventure played sixty seconds at a time".[5] With each interval, the player will learn more about the environment.[6] A demo for the game was presented at E3 2017.[1]	{"en": "Minit is an adventure video game developed by Jan Willem Nijman, co-founder and one-half of Vlambeer; Kitty Calis, who contributed to Horizon Zero Dawn; Jukio Kallio, a freelance composer; and Dominik Johann, art director of Crows Crows Crows.[1] The game is published by Devolver Digital and was released on April 3, 2018 for Windows, macOS, Linux, Xbox One, and PlayStation 4. On May 11, 2018, a Nintendo Switch version was announced on the first episode of Indie World, a web series from Nintendo of Japan that showcases indie games coming to the Japanese Nintendo eShop.[2] It was released for the Nintendo Switch August 9, 2018.[3] It also came out for mobile devices in June 2019.[4] The game's premise is that each of the player's lives only lasts for one minute, resulting in \\"a peculiar little adventure played sixty seconds at a time\\".[5] With each interval, the player will learn more about the environment.[6] A demo for the game was presented at E3 2017.[1]"}	["https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Minit_logo.png/1200px-Minit_logo.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Minit_(Computerspiel)", "wikipedia_en": "https://en.wikipedia.org/wiki/Minit", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Minit", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Minit"}	minit	2020-12-18 16:36:42.826996+00	2020-12-18 16:51:23.420247+00	NA
28	Fractured Minds	{"en": "Fractured Minds"}	Fractured Minds  is a puzzle role-playing video game developed by British game designer Emily Mitchell and published by Wired Productions for PlayStation 4, Xbox One, Microsoft Windows, iOS, and Nintendo Switch. It was released worldwide in November 14, 2017. Mitchell won a 2017 British Academy of Film and Television Arts (BAFTA) Award for Game Making for Fractured Minds.[1][2]	{"en": "Fractured Minds  is a puzzle role-playing video game developed by British game designer Emily Mitchell and published by Wired Productions for PlayStation 4, Xbox One, Microsoft Windows, iOS, and Nintendo Switch. It was released worldwide in November 14, 2017. Mitchell won a 2017 British Academy of Film and Television Arts (BAFTA) Award for Game Making for Fractured Minds.[1][2]"}	["https://upload.wikimedia.org/wikipedia/en/7/78/Fractured_Minds_cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Fractured_Minds"}	fractured-minds	2020-12-17 19:51:05.680205+00	2020-12-17 22:23:20.912502+00	NA
79	The Talos Principle	{"de": "The Talos Principle", "en": "The Talos Principle", "es": "The Talos Principle", "et": "The Talos Principle", "fr": "The Talos Principle", "it": "The Talos Principle", "nl": "The Talos Principle", "pt": "The Talos Principle", "ru": "The Talos Principle", "tr": "The Talos Principle", "uk": "The Talos Principle", "arz": "ث تالوس پرينسيپل"}	The Talos Principle is a 2014 puzzle video game developed by Croteam and published by Devolver Digital. It was simultaneously released on Linux, OS X and Windows in December 2014. It was released for Android in May 2015, for PlayStation 4 in October 2015, for iOS in October 2017, for Xbox One in August 2018, and Nintendo Switch in December 2019. Virtual reality-enabled versions for the Oculus Rift and HTC Vive were released on 18 October 2017.	{"en": "The Talos Principle is a 2014 puzzle video game developed by Croteam and published by Devolver Digital. It was simultaneously released on Linux, OS X and Windows in December 2014. It was released for Android in May 2015, for PlayStation 4 in October 2015, for iOS in October 2017, for Xbox One in August 2018, and Nintendo Switch in December 2019. Virtual reality-enabled versions for the Oculus Rift and HTC Vive were released on 18 October 2017."}	["https://upload.wikimedia.org/wikipedia/en/a/ac/The_Talos_Principle.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_et": "https://et.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_it": "https://it.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_nl": "https://nl.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_tr": "https://tr.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_uk": "https://uk.wikipedia.org/wiki/The_Talos_Principle", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AB_%D8%AA%D8%A7%D9%84%D9%88%D8%B3_%D9%BE%D8%B1%D9%8A%D9%86%D8%B3%D9%8A%D9%BE%D9%84"}	the-talos-principle	2020-12-17 19:51:11.212963+00	2020-12-17 22:23:24.394812+00	NA
35	Golf with Your Friends	{"en": "Golf with Your Friends"}	Golf with Your Friends is a golf video game by Australian developer Blacklight Interactive and published by Team17. The game started in early access on Steam on 30 January 2016 and fully released on 24 May 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One.	{"en": "Golf with Your Friends is a golf video game by Australian developer Blacklight Interactive and published by Team17. The game started in early access on Steam on 30 January 2016 and fully released on 24 May 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/2/21/GWF_header.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Golf_with_Your_Friends"}	golf-with-your-friends	2020-12-17 19:51:05.948029+00	2020-12-17 22:23:21.246585+00	NA
37	Halo Wars 2	{"ar": "هالو وارز 2", "de": "Halo Wars 2", "en": "Halo Wars 2", "es": "Halo Wars 2", "fa": "نبردهای هیلو ۲", "fi": "Halo Wars 2", "fr": "Halo Wars 2", "it": "Halo Wars 2", "ja": "Halo Wars 2", "ko": "헤일로 워즈 2", "pt": "Halo Wars 2", "ru": "Halo Wars 2", "uk": "Halo Wars 2", "vi": "Halo Wars 2", "zh": "星環戰役2", "wuu": "光环战争2"}	Halo Wars 2 is a real-time strategy video game developed by 343 Industries and Creative Assembly. It was published by Microsoft Studios and released in February 2017 on Windows and Xbox One. The game is set in the science fiction universe of the Halo franchise in 2559. It is a sequel to Halo Wars (2009). The story follows the crew of Spirit of Fire, a United Nations Space Command (UNSC) ship. Spirit of Fire arrives at the Ark, a Forerunner installation responsible for constructing and remotely controlling the titular Halo rings. Conflict breaks out between the UNSC forces and an alien faction known as the Banished over control of the Ark.	{"en": "Halo Wars 2 is a real-time strategy video game developed by 343 Industries and Creative Assembly. It was published by Microsoft Studios and released in February 2017 on Windows and Xbox One. The game is set in the science fiction universe of the Halo franchise in 2559. It is a sequel to Halo Wars (2009). The story follows the crew of Spirit of Fire, a United Nations Space Command (UNSC) ship. Spirit of Fire arrives at the Ark, a Forerunner installation responsible for constructing and remotely controlling the titular Halo rings. Conflict breaks out between the UNSC forces and an alien faction known as the Banished over control of the Ark."}	["https://upload.wikimedia.org/wikipedia/en/f/f6/Hw2_coverart.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%87%D8%A7%D9%84%D9%88_%D9%88%D8%A7%D8%B1%D8%B2_2", "wikipedia_de": "https://de.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_en": "https://en.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_es": "https://es.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%86%D8%A8%D8%B1%D8%AF%D9%87%D8%A7%DB%8C_%D9%87%DB%8C%D9%84%D9%88_%DB%B2", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_it": "https://it.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%97%A4%EC%9D%BC%EB%A1%9C_%EC%9B%8C%EC%A6%88_2", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Halo_Wars_2", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%98%9F%E7%92%B0%E6%88%B0%E5%BD%B92", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E5%85%89%E7%8E%AF%E6%88%98%E4%BA%892"}	halo-wars-2	2020-12-17 19:51:06.151511+00	2020-12-17 22:23:21.509192+00	NA
73	Surviving Mars	{"ar": "سورفايفين مارس", "de": "Surviving Mars", "en": "Surviving Mars", "fi": "Surviving Mars", "fr": "Surviving Mars", "it": "Surviving Mars", "mk": "Surviving Mars", "nl": "Surviving Mars", "pt": "Surviving Mars", "ru": "Surviving Mars", "uk": "Surviving Mars", "vi": "Surviving Mars", "zh": "火星求生", "arz": "سورڤايڤين مارش"}	Surviving Mars is a city building simulation video game developed by the Bulgarian studio Haemimont Games and published by Paradox Interactive. It was released on Microsoft Windows, macOS, Linux, PlayStation 4 and Xbox One on March 15, 2018. The player serves as an overseer who must build a colony on Mars and ensure the survival of the colonists.	{"en": "Surviving Mars is a city building simulation video game developed by the Bulgarian studio Haemimont Games and published by Paradox Interactive. It was released on Microsoft Windows, macOS, Linux, PlayStation 4 and Xbox One on March 15, 2018. The player serves as an overseer who must build a colony on Mars and ensure the survival of the colonists."}	["https://upload.wikimedia.org/wikipedia/en/1/10/Surviving_Mars_cover_art.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D9%88%D8%B1%D9%81%D8%A7%D9%8A%D9%81%D9%8A%D9%86_%D9%85%D8%A7%D8%B1%D8%B3", "wikipedia_de": "https://de.wikipedia.org/wiki/Surviving_Mars", "wikipedia_en": "https://en.wikipedia.org/wiki/Surviving_Mars", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Surviving_Mars", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Surviving_Mars", "wikipedia_it": "https://it.wikipedia.org/wiki/Surviving_Mars", "wikipedia_mk": "https://mk.wikipedia.org/wiki/Surviving_Mars", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Surviving_Mars", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Surviving_Mars", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Surviving_Mars", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Surviving_Mars", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Surviving_Mars", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%81%AB%E6%98%9F%E6%B1%82%E7%94%9F", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D9%88%D8%B1%DA%A4%D8%A7%D9%8A%DA%A4%D9%8A%D9%86_%D9%85%D8%A7%D8%B1%D8%B4"}	surviving-mars	2020-12-17 19:51:10.769033+00	2020-12-17 22:23:23.916029+00	NA
40	Halo: Spartan Assault	{"ar": "هيلو: سبارتن أسلت", "en": "Halo: Spartan Assault", "es": "Halo: Spartan Assault", "fa": "هیلو: حمله اسپارتان", "fi": "Halo: Spartan Assault", "fr": "Halo: Spartan Assault", "it": "Halo: Spartan Assault", "ko": "헤일로: 스파르탄 어썰트", "nl": "Halo: Spartan Assault", "pt": "Halo: Spartan Assault", "ru": "Halo: Spartan Assault", "arz": "هالو: سپارتان اساولت"}	Halo: Spartan Assault is a twin stick shooter video game developed by 343 Industries and Vanguard Games. Part of the Halo media franchise, the game was released on July 18, 2013, for Microsoft's Windows 8 and Windows Phone 8 platforms. The game subsequently released on Xbox 360, Xbox One, Steam, and iOS. Halo: Spartan Assault is set between the events of Halo 3 and Halo 4. Players control the human soldiers Sarah Palmer and Edward Davis as they fight a new splinter faction of the alien Covenant. The game launched with 25 single-player missions; an additional campaign released as downloadable content. The console versions also feature an exclusive cooperative horde mode.	{"en": "Halo: Spartan Assault is a twin stick shooter video game developed by 343 Industries and Vanguard Games. Part of the Halo media franchise, the game was released on July 18, 2013, for Microsoft's Windows 8 and Windows Phone 8 platforms. The game subsequently released on Xbox 360, Xbox One, Steam, and iOS. Halo: Spartan Assault is set between the events of Halo 3 and Halo 4. Players control the human soldiers Sarah Palmer and Edward Davis as they fight a new splinter faction of the alien Covenant. The game launched with 25 single-player missions; an additional campaign released as downloadable content. The console versions also feature an exclusive cooperative horde mode."}	["https://upload.wikimedia.org/wikipedia/en/6/6d/Halo-spartan-assault-boxart.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%87%D9%8A%D9%84%D9%88:_%D8%B3%D8%A8%D8%A7%D8%B1%D8%AA%D9%86_%D8%A3%D8%B3%D9%84%D8%AA", "wikipedia_en": "https://en.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_es": "https://es.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%87%DB%8C%D9%84%D9%88:_%D8%AD%D9%85%D9%84%D9%87_%D8%A7%D8%B3%D9%BE%D8%A7%D8%B1%D8%AA%D8%A7%D9%86", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_it": "https://it.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%97%A4%EC%9D%BC%EB%A1%9C:_%EC%8A%A4%ED%8C%8C%EB%A5%B4%ED%83%84_%EC%96%B4%EC%8D%B0%ED%8A%B8", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Halo:_Spartan_Assault", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%87%D8%A7%D9%84%D9%88:_%D8%B3%D9%BE%D8%A7%D8%B1%D8%AA%D8%A7%D9%86_%D8%A7%D8%B3%D8%A7%D9%88%D9%84%D8%AA"}	halo-spartan-assault	2020-12-17 19:51:06.301205+00	2020-12-17 22:23:21.718872+00	NA
29	Gears of War 4	{"ar": "جيرز أوف وور 4", "ca": "Gears of War 4", "de": "Gears of War 4", "en": "Gears of War 4", "es": "Gears of War 4", "fa": "چرخ‌دنده‌های جنگ ۴", "fr": "Gears of War 4", "it": "Gears of War 4", "ja": "Gears of War 4", "nl": "Gears of War 4", "pt": "Gears of War 4", "ru": "Gears of War 4", "uk": "Gears of War 4", "zh": "戰爭機器4"}	Gears of War 4 is a third-person shooter video game developed by The Coalition and published by Microsoft Studios for Microsoft Windows and Xbox One.[2] It is the fourth main installment in the Gears of War series, and the first mainline entry not to be developed by Epic Games. The game was released worldwide on October 11, 2016. The sequel, Gears 5, was released on September 10, 2019.[3][4]	{"en": "Gears of War 4 is a third-person shooter video game developed by The Coalition and published by Microsoft Studios for Microsoft Windows and Xbox One.[2] It is the fourth main installment in the Gears of War series, and the first mainline entry not to be developed by Epic Games. The game was released worldwide on October 11, 2016. The sequel, Gears 5, was released on September 10, 2019.[3][4]"}	["https://upload.wikimedia.org/wikipedia/en/f/ff/Gears_of_War_4.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AC%D9%8A%D8%B1%D8%B2_%D8%A3%D9%88%D9%81_%D9%88%D9%88%D8%B1_4", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_de": "https://de.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_en": "https://en.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_es": "https://es.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%86%D8%B1%D8%AE%E2%80%8C%D8%AF%D9%86%D8%AF%D9%87%E2%80%8C%D9%87%D8%A7%DB%8C_%D8%AC%D9%86%DA%AF_%DB%B4", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_it": "https://it.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Gears_of_War_4", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%88%B0%E7%88%AD%E6%A9%9F%E5%99%A84"}	gears-of-war-4	2020-12-17 19:51:05.721907+00	2020-12-17 22:23:21.14414+00	NA
27	Farming Simulator	{"cs": "Farming Simulator", "da": "Farming Simulator", "de": "Landwirtschafts-Simulator", "en": "Farming Simulator", "es": "Farming Simulator", "fi": "Farming Simulator", "fr": "Farming Simulator", "ga": "Farming Simulator", "hy": "Farming Simulator", "it": "Farming Simulator", "ko": "파밍 시뮬레이터", "nb": "Farming Simulator", "nl": "Farming Simulator", "pl": "Farming Simulator", "pt": "Farming Simulator", "ro": "Farming Simulator", "ru": "Farming Simulator (серия игр)", "sv": "Farming Simulator", "tr": "Farming Simulator", "uk": "Farming Simulator (серія ігор)"}	Farming Simulator is a farming simulation video game series developed by Giants Software and published by Focus Home Interactive. The locations are based on American and European environments. Players are able to farm, breed livestock, grow crops and sell assets created from farming.	{"en": "Farming Simulator is a farming simulation video game series developed by Giants Software and published by Focus Home Interactive. The locations are based on American and European environments. Players are able to farm, breed livestock, grow crops and sell assets created from farming."}	["https://upload.wikimedia.org/wikipedia/commons/1/11/Farming_Simulator_Logo.png"]	{"wikipedia_cs": "https://cs.wikipedia.org/wiki/Farming_Simulator", "wikipedia_da": "https://da.wikipedia.org/wiki/Farming_Simulator", "wikipedia_de": "https://de.wikipedia.org/wiki/Landwirtschafts-Simulator", "wikipedia_en": "https://en.wikipedia.org/wiki/Farming_Simulator", "wikipedia_es": "https://es.wikipedia.org/wiki/Farming_Simulator", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Farming_Simulator", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Farming_Simulator", "wikipedia_ga": "https://ga.wikipedia.org/wiki/Farming_Simulator", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Farming_Simulator", "wikipedia_it": "https://it.wikipedia.org/wiki/Farming_Simulator", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%8C%8C%EB%B0%8D_%EC%8B%9C%EB%AE%AC%EB%A0%88%EC%9D%B4%ED%84%B0", "wikipedia_nb": "https://no.wikipedia.org/wiki/Farming_Simulator", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Farming_Simulator", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Farming_Simulator", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Farming_Simulator", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Farming_Simulator", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Farming_Simulator_(%D1%81%D0%B5%D1%80%D0%B8%D1%8F_%D0%B8%D0%B3%D1%80)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Farming_Simulator", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Farming_Simulator", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Farming_Simulator_(%D1%81%D0%B5%D1%80%D1%96%D1%8F_%D1%96%D0%B3%D0%BE%D1%80)"}	farming-simulator	2020-12-17 19:51:05.582191+00	2020-12-21 16:12:00.61705+00	NA
294	Get Packed	{"en": "Get Packed"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/73182869b2a644bdbef46984b96e1721rcp1/sku/a6ffc113bea9495b84581796893ebf50"}	get-packed	2021-02-05 16:52:19.614448+00	2021-02-05 23:20:49.166321+00	E10+
113	Grounded	{"de": "Grounded", "en": "Grounded", "fa": "گراندد (بازی ویدئویی)", "fr": "Grounded", "it": "Grounded", "ms": "Grounded (permainan video)", "pt": "Grounded"}	Grounded is a survival game developed by Obsidian Entertainment and published by Xbox Game Studios. It was released for Windows and Xbox One in early access on July 28, 2020, with the full release expected in 2021. An enhanced version for the Xbox Series X/S was released on November 10, 2020. In the game, players are shrunk to the size of an ant and attempt to survive in a backyard filled with dangers.	{"en": "Grounded is a survival game developed by Obsidian Entertainment and published by Xbox Game Studios. It was released for Windows and Xbox One in early access on July 28, 2020, with the full release expected in 2021. An enhanced version for the Xbox Series X/S was released on November 10, 2020. In the game, players are shrunk to the size of an ant and attempt to survive in a backyard filled with dangers."}	["https://upload.wikimedia.org/wikipedia/en/a/ab/Grounded_game_cover_art.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Grounded", "wikipedia_en": "https://en.wikipedia.org/wiki/Grounded_(video_game)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%AF%D8%B1%D8%A7%D9%86%D8%AF%D8%AF_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Grounded", "wikipedia_it": "https://it.wikipedia.org/wiki/Grounded", "wikipedia_ms": "https://ms.wikipedia.org/wiki/Grounded_(permainan_video)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Grounded"}	grounded	2020-12-18 16:36:42.634904+00	2020-12-18 16:51:23.42477+00	NA
135	Tell Me Why	{"de": "Tell Me Why (Computerspiel)", "en": "Tell Me Why", "es": "Tell Me Why (videojuego)", "fa": "تل می وای (بازی ویدئویی)", "fr": "Tell Me Why (jeu vidéo)", "it": "Tell Me Why (videogioco)", "pt": "Tell Me Why (jogo eletrônico)", "ru": "Tell Me Why (игра)", "tr": "Tell Me Why (video oyunu)", "vi": "Tell Me Why (trò chơi video)"}	Tell Me Why is an episodic narrative adventure game developed by Dontnod Entertainment and published by Xbox Game Studios. The game was released in three episodes for Microsoft Windows and Xbox One between August and September 2020.	{"en": "Tell Me Why is an episodic narrative adventure game developed by Dontnod Entertainment and published by Xbox Game Studios. The game was released in three episodes for Microsoft Windows and Xbox One between August and September 2020."}	["https://upload.wikimedia.org/wikipedia/en/d/d5/TellMeWhy.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Tell_Me_Why_(Computerspiel)", "wikipedia_en": "https://en.wikipedia.org/wiki/Tell_Me_Why_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Tell_Me_Why_(videojuego)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AA%D9%84_%D9%85%DB%8C_%D9%88%D8%A7%DB%8C_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Tell_Me_Why_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Tell_Me_Why_(videogioco)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Tell_Me_Why_(jogo_eletr%C3%B4nico)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Tell_Me_Why_(%D0%B8%D0%B3%D1%80%D0%B0)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Tell_Me_Why_(video_oyunu)", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Tell_Me_Why_(tr%C3%B2_ch%C6%A1i_video)"}	tell-me-why	2020-12-18 16:36:43.592476+00	2020-12-18 16:51:24.417476+00	NA
50	Mutant Year Zero: Road to Eden	{"en": "Mutant Year Zero: Road to Eden", "fr": "Mutant Year Zero: Road to Eden", "it": "Mutant Year Zero: Road to Eden", "ru": "Mutant Year Zero: Road to Eden", "sl": "Mutant Year Zero: Road to Eden", "tr": "Mutant Year Zero: Road to Eden", "zh": "突變元年：伊甸園之路"}	Mutant Year Zero: Road to Eden is a turn-based tactical role-playing video game developed by Swedish studio The Bearded Ladies and published by Funcom. Based on the tabletop role-playing game Mutant Year Zero, the game was released for Microsoft Windows, PlayStation 4 and Xbox One in December 2018. A Nintendo Switch version of the game was released on July 30, 2019.	{"en": "Mutant Year Zero: Road to Eden is a turn-based tactical role-playing video game developed by Swedish studio The Bearded Ladies and published by Funcom. Based on the tabletop role-playing game Mutant Year Zero, the game was released for Microsoft Windows, PlayStation 4 and Xbox One in December 2018. A Nintendo Switch version of the game was released on July 30, 2019."}	["https://upload.wikimedia.org/wikipedia/en/4/4d/Mutant_Year_Zero_Road_to_Eden_cover_art.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Mutant_Year_Zero:_Road_to_Eden", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Mutant_Year_Zero:_Road_to_Eden", "wikipedia_it": "https://it.wikipedia.org/wiki/Mutant_Year_Zero:_Road_to_Eden", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Mutant_Year_Zero:_Road_to_Eden", "wikipedia_sl": "https://sl.wikipedia.org/wiki/Mutant_Year_Zero:_Road_to_Eden", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Mutant_Year_Zero:_Road_to_Eden", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%AA%81%E8%AE%8A%E5%85%83%E5%B9%B4%EF%BC%9A%E4%BC%8A%E7%94%B8%E5%9C%92%E4%B9%8B%E8%B7%AF"}	mutant-year-zero-road-to-eden	2020-12-17 19:51:06.995941+00	2020-12-17 22:23:22.220096+00	NA
195	OCTOPATH TRAVELER	{"en": "OCTOPATH TRAVELER"}	Octopath Traveler[b] is a turn-based role-playing video game developed by Square Enix, in collaboration with Acquire. The game was released for the Nintendo Switch in July 2018, for Microsoft Windows in June 2019, and for Stadia in April 2020. The game has sold over two million copies.	{"en": "Octopath Traveler[b] is a turn-based role-playing video game developed by Square Enix, in collaboration with Acquire. The game was released for the Nintendo Switch in July 2018, for Microsoft Windows in June 2019, and for Stadia in April 2020. The game has sold over two million copies."}	["https://upload.wikimedia.org/wikipedia/en/3/34/Octopath_Traveler.jpg"]	{"stadia": "https://stadia.google.com/store/details/48ead86182b14fe0afcc5f2927dbed51rcp1/sku/a6c13e6aa796439295774eb0e8cd3f8b"}	octopath-traveler	2020-12-21 16:12:03.505421+00	2021-02-05 23:20:49.190103+00	T
117	Katana Zero	{"en": "Katana Zero", "es": "Katana Zero", "fr": "Katana Zero", "it": "Katana Zero", "ja": "Katana ZERO", "pt": "Katana Zero", "ro": "Katana Zero", "ru": "Katana Zero", "tr": "Katana Zero", "arz": "كاتانا زيرو"}	Katana Zero is a 2D action platform video game developed by Askiisoft and published by Devolver Digital for Microsoft Windows, macOS and Nintendo Switch in 2019. The game was also released on Xbox One on October 15, 2020.	{"en": "Katana Zero is a 2D action platform video game developed by Askiisoft and published by Devolver Digital for Microsoft Windows, macOS and Nintendo Switch in 2019. The game was also released on Xbox One on October 15, 2020."}	["https://upload.wikimedia.org/wikipedia/en/1/12/Katana_Zero_pre-release_Steam_header.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Katana_Zero", "wikipedia_es": "https://es.wikipedia.org/wiki/Katana_Zero", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Katana_Zero", "wikipedia_it": "https://it.wikipedia.org/wiki/Katana_Zero", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Katana_ZERO", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Katana_Zero", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Katana_Zero", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Katana_Zero", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Katana_Zero", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%83%D8%A7%D8%AA%D8%A7%D9%86%D8%A7_%D8%B2%D9%8A%D8%B1%D9%88"}	katana-zero	2020-12-18 16:36:42.897522+00	2020-12-18 16:51:23.46101+00	NA
194	Monster Energy Supercross: The Official Videogame	{"en": "Monster Energy Supercross: The Official Videogame"}	Monster Energy Supercross: The Official Videogame is a motocross video game series developed and published by Milestone srl for various platforms. The series has been released annually since early 2018, with the third installment launching in North America on February 4, 2020.[1] Moving away from the international locations of Milestones' sibling motocross title MXGP, Monster Energy Supercross uses officially licensed locales and tracks of the North American-based titular series. The first game featured 17 tracks, which has increased by one in its latest incarnation.[2]	{"en": "Monster Energy Supercross: The Official Videogame is a motocross video game series developed and published by Milestone srl for various platforms. The series has been released annually since early 2018, with the third installment launching in North America on February 4, 2020.[1] Moving away from the international locations of Milestones' sibling motocross title MXGP, Monster Energy Supercross uses officially licensed locales and tracks of the North American-based titular series. The first game featured 17 tracks, which has increased by one in its latest incarnation.[2]"}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Monster_Energy_Supercross:_The_Official_Videogame"}	monster-energy-supercross-the-official-videogame	2020-12-21 16:12:03.491664+00	2020-12-21 16:12:03.491686+00	NA
139	The Walking Dead: A New Frontier	{"ar": "الموتى السائرون: ثغرة جديدة", "en": "The Walking Dead: A New Frontier", "es": "The Walking Dead: A New Frontier", "fa": "مردگان متحرک: مرز جدید", "fr": "The Walking Dead: A New Frontier", "ja": "ウォーキング・デッド シーズン3", "ru": "The Walking Dead: A New Frontier", "arz": "ذا والكينج ديد: ذا نيو فرونتر"}	The Walking Dead: A New Frontier is an episodic adventure video game based on The Walking Dead comic book series developed by Telltale Games. It is Telltale's third season of its The Walking Dead series, with the first two episodes released on December 20, 2016, and a retail season pass disc edition released on February 7, 2017.[5][6][7] The game employs the same narrative structure as the past seasons, where player choice in one episode will have a permanent impact on future story elements. The player choices recorded in save files from the first two seasons and the additional episode "400 Days" carry over into the third season.[8] Clementine (voiced by Melissa Hutchison), who was the player's companion during the first season and the player-character in season two[9] returns as a player-character along with another player-character, Javier "Javi" Garcia (voiced by Jeff Schine).[10][11]	{"en": "The Walking Dead: A New Frontier is an episodic adventure video game based on The Walking Dead comic book series developed by Telltale Games. It is Telltale's third season of its The Walking Dead series, with the first two episodes released on December 20, 2016, and a retail season pass disc edition released on February 7, 2017.[5][6][7] The game employs the same narrative structure as the past seasons, where player choice in one episode will have a permanent impact on future story elements. The player choices recorded in save files from the first two seasons and the additional episode \\"400 Days\\" carry over into the third season.[8] Clementine (voiced by Melissa Hutchison), who was the player's companion during the first season and the player-character in season two[9] returns as a player-character along with another player-character, Javier \\"Javi\\" Garcia (voiced by Jeff Schine).[10][11]"}	["https://upload.wikimedia.org/wikipedia/en/7/7b/The_Walking_Dead_A_New_Frontier_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%85%D9%88%D8%AA%D9%89_%D8%A7%D9%84%D8%B3%D8%A7%D8%A6%D8%B1%D9%88%D9%86:_%D8%AB%D8%BA%D8%B1%D8%A9_%D8%AC%D8%AF%D9%8A%D8%AF%D8%A9", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Walking_Dead:_A_New_Frontier", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Walking_Dead:_A_New_Frontier", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%B1%D8%AF%DA%AF%D8%A7%D9%86_%D9%85%D8%AA%D8%AD%D8%B1%DA%A9:_%D9%85%D8%B1%D8%B2_%D8%AC%D8%AF%DB%8C%D8%AF", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Walking_Dead:_A_New_Frontier", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A9%E3%83%BC%E3%82%AD%E3%83%B3%E3%82%B0%E3%83%BB%E3%83%87%E3%83%83%E3%83%89_%E3%82%B7%E3%83%BC%E3%82%BA%E3%83%B33", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Walking_Dead:_A_New_Frontier", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B0%D8%A7_%D9%88%D8%A7%D9%84%D9%83%D9%8A%D9%86%D8%AC_%D8%AF%D9%8A%D8%AF:_%D8%B0%D8%A7_%D9%86%D9%8A%D9%88_%D9%81%D8%B1%D9%88%D9%86%D8%AA%D8%B1"}	the-walking-dead-a-new-frontier	2020-12-18 16:36:43.706878+00	2020-12-18 16:51:24.41943+00	NA
156	EVERSPACE	{"en": "EVERSPACE"}	Everspace is a single-player 3D space shooter with roguelike elements and non-linear storytelling developed and published by Rockfish Games. It was released in 2017. A sequel, Everspace 2 is set to be released in 2021.	{"en": "Everspace is a single-player 3D space shooter with roguelike elements and non-linear storytelling developed and published by Rockfish Games. It was released in 2017. A sequel, Everspace 2 is set to be released in 2021."}	["https://upload.wikimedia.org/wikipedia/en/c/c0/Everspace_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/44752f1774ca4508a2c45e57121d7e8frcp1/sku/dfda545ac2e94885a13b1434d370d4b0"}	everspace	2020-12-20 04:21:08.296449+00	2021-02-05 23:20:46.002378+00	T
223	Strange Brigade	{"en": "Strange Brigade"}	Strange Brigade is a cooperative third-person shooter video game developed and published by Rebellion Developments. It was released for Microsoft Windows, PlayStation 4 and Xbox One on August 28, 2018, and August 1, 2020 for Stadia. In the game, the player fights against different mythological enemies and solves puzzles.	{"en": "Strange Brigade is a cooperative third-person shooter video game developed and published by Rebellion Developments. It was released for Microsoft Windows, PlayStation 4 and Xbox One on August 28, 2018, and August 1, 2020 for Stadia. In the game, the player fights against different mythological enemies and solves puzzles."}	["https://upload.wikimedia.org/wikipedia/en/5/5e/Strange_Brigade_cover_art.png"]	{"stadia": "https://stadia.google.com/store/details/8e77c7a4368944589b4c9d8179d2eb4crcp1/sku/2d155b69c4af46078db2d96a8b0e6883"}	strange-brigade	2020-12-21 16:12:06.35443+00	2021-02-05 23:20:49.266145+00	T
60	No Man's Sky	{"an": "No Man's Sky", "ar": "نو مانز سكاي", "ca": "No Man's Sky", "da": "No Man's Sky", "de": "No Man’s Sky", "en": "No Man's Sky", "es": "No Man's Sky", "fa": "آسمان هیچ‌کس", "fi": "No Man’s Sky", "fr": "No Man's Sky", "gl": "No Man's Sky", "he": "No Man's Sky", "it": "No Man's Sky", "ja": "No Man's Sky", "ko": "노 맨즈 스카이", "la": "No Man's Sky", "lt": "No Man's Sky", "nl": "No Man's Sky", "pl": "No Man’s Sky", "pt": "No Man's Sky", "ru": "No Man’s Sky", "sv": "No Man's Sky", "tr": "No Man's Sky", "uk": "No Man's Sky", "zh": "无人深空", "arz": "نو مانز سكاى", "yue": "無人深空"}	No Man's Sky[b] is an exploration survival game developed and published by the English indie studio Hello Games. It was released worldwide for the PlayStation 4 and Microsoft Windows in August 2016, for Xbox One in July 2018, and for the PlayStation 5 and Xbox Series X and Series S consoles in November 2020. The game is built around four pillars: exploration, survival, combat, and trading. Players are free to perform within the entirety of a procedurally generated deterministic open world universe, which includes over 18 quintillion planets. Through the game's procedural generation system, planets have their own ecosystems with unique forms of flora and fauna, and various sentient alien species may engage the player in combat or trade within planetary systems. Players advance in the game by mining for resources to power and improve their equipment, buying and selling resources using credits earned by documenting flora and fauna, or otherwise seeking out the mystery around the Atlas, an entity at the center of the galaxy which serves the game's overarching plot (see § Plot).	{"en": "No Man's Sky[b] is an exploration survival game developed and published by the English indie studio Hello Games. It was released worldwide for the PlayStation 4 and Microsoft Windows in August 2016, for Xbox One in July 2018, and for the PlayStation 5 and Xbox Series X and Series S consoles in November 2020. The game is built around four pillars: exploration, survival, combat, and trading. Players are free to perform within the entirety of a procedurally generated deterministic open world universe, which includes over 18 quintillion planets. Through the game's procedural generation system, planets have their own ecosystems with unique forms of flora and fauna, and various sentient alien species may engage the player in combat or trade within planetary systems. Players advance in the game by mining for resources to power and improve their equipment, buying and selling resources using credits earned by documenting flora and fauna, or otherwise seeking out the mystery around the Atlas, an entity at the center of the galaxy which serves the game's overarching plot (see § Plot)."}	["https://upload.wikimedia.org/wikipedia/en/6/67/No_Man%27s_Sky.jpg"]	{"wikipedia_an": "https://an.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%86%D9%88_%D9%85%D8%A7%D9%86%D8%B2_%D8%B3%D9%83%D8%A7%D9%8A", "wikipedia_ca": "https://ca.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_da": "https://da.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_de": "https://de.wikipedia.org/wiki/No_Man%E2%80%99s_Sky", "wikipedia_en": "https://en.wikipedia.org/wiki/No_Man's_Sky", "wikipedia_es": "https://es.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A2%D8%B3%D9%85%D8%A7%D9%86_%D9%87%DB%8C%DA%86%E2%80%8C%DA%A9%D8%B3", "wikipedia_fi": "https://fi.wikipedia.org/wiki/No_Man%E2%80%99s_Sky", "wikipedia_fr": "https://fr.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_gl": "https://gl.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_he": "https://he.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_it": "https://it.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_ja": "https://ja.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%85%B8_%EB%A7%A8%EC%A6%88_%EC%8A%A4%EC%B9%B4%EC%9D%B4", "wikipedia_la": "https://la.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_lt": "https://lt.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_nl": "https://nl.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_pl": "https://pl.wikipedia.org/wiki/No_Man%E2%80%99s_Sky", "wikipedia_pt": "https://pt.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_ru": "https://ru.wikipedia.org/wiki/No_Man%E2%80%99s_Sky", "wikipedia_sv": "https://sv.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_tr": "https://tr.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_uk": "https://uk.wikipedia.org/wiki/No_Man%27s_Sky", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%97%A0%E4%BA%BA%E6%B7%B1%E7%A9%BA", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%86%D9%88_%D9%85%D8%A7%D9%86%D8%B2_%D8%B3%D9%83%D8%A7%D9%89", "wikipedia_yue": "https://zh-yue.wikipedia.org/wiki/%E7%84%A1%E4%BA%BA%E6%B7%B1%E7%A9%BA"}	no-mans-sky	2020-12-17 19:51:07.86492+00	2020-12-17 22:23:22.940733+00	NA
92	Wandersong	{"en": "Wandersong", "pt": "Wandersong"}	Wandersong is a puzzle adventure video game developed by American-Canadian indie developer Greg Lobanov. A music-themed game, it follows The Bard, a wandering singer, as they go on a quest to gather pieces of a song that will save their world from destruction. In the game, the player uses The Bard's singing to affect the environment, solve puzzles, and defend against enemies. Developed in GameMaker Studio, the game was inspired by Lobanov's experiences on a cross-country bike trip across the United States and juxtaposes a positive atmosphere and protagonist with an apocalyptic setting. Games such as Kirby's Epic Yarn and animated cartoons such as Over the Garden Wall and Steven Universe inspired the game's tone, pace, and art style. The game's audio was co-produced with A Shell in the Pit; Gordon McGladdery, who worked on Duelyst, Parkitect, and Rogue Legacy, composed the game's music and Em Halberstadt, who worked on Night in the Woods, directed the game's sound design. Wandersong was released on macOS, Microsoft Windows, and Nintendo Switch in September 2018, PlayStation 4 in January 2019, and Xbox One in December 2019.	{"en": "Wandersong is a puzzle adventure video game developed by American-Canadian indie developer Greg Lobanov. A music-themed game, it follows The Bard, a wandering singer, as they go on a quest to gather pieces of a song that will save their world from destruction. In the game, the player uses The Bard's singing to affect the environment, solve puzzles, and defend against enemies. Developed in GameMaker Studio, the game was inspired by Lobanov's experiences on a cross-country bike trip across the United States and juxtaposes a positive atmosphere and protagonist with an apocalyptic setting. Games such as Kirby's Epic Yarn and animated cartoons such as Over the Garden Wall and Steven Universe inspired the game's tone, pace, and art style. The game's audio was co-produced with A Shell in the Pit; Gordon McGladdery, who worked on Duelyst, Parkitect, and Rogue Legacy, composed the game's music and Em Halberstadt, who worked on Night in the Woods, directed the game's sound design. Wandersong was released on macOS, Microsoft Windows, and Nintendo Switch in September 2018, PlayStation 4 in January 2019, and Xbox One in December 2019."}	["https://upload.wikimedia.org/wikipedia/en/6/64/Wandersong.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Wandersong", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Wandersong"}	wandersong	2020-12-17 19:51:12.110825+00	2020-12-17 22:23:25.181607+00	NA
295	Unto The End	{"en": "Unto The End"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/a089691b36254f77bc66a75052fc7cf6rcp1/sku/9e7a4e4a25cf45bc81367d8087df7f3bp"}	unto-the-end	2021-02-05 16:52:19.662141+00	2021-02-05 23:20:46.553923+00	T
224	SteamWorld Quest	{"de": "SteamWorld Quest", "en": "SteamWorld Quest", "ja": "スチームワールドクエスト"}	SteamWorld Quest: Hand of Gilgamech is a turn-based role-playing game and deck-building game hybrid that is part of the SteamWorld series of video games. It was developed by Image & Form and published by Thunderful Publishing. The game was released for Nintendo Switch on April 25, 2019, released for PC on May 31, 2019, and Stadia on March 3, 2020.[1]	{"en": "SteamWorld Quest: Hand of Gilgamech is a turn-based role-playing game and deck-building game hybrid that is part of the SteamWorld series of video games. It was developed by Image & Form and published by Thunderful Publishing. The game was released for Nintendo Switch on April 25, 2019, released for PC on May 31, 2019, and Stadia on March 3, 2020.[1]"}	["https://upload.wikimedia.org/wikipedia/en/6/65/SteamWorld_Quest_Cover.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/SteamWorld_Quest", "wikipedia_en": "https://en.wikipedia.org/wiki/SteamWorld_Quest", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B9%E3%83%81%E3%83%BC%E3%83%A0%E3%83%AF%E3%83%BC%E3%83%AB%E3%83%89%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88"}	steamworld-quest	2020-12-21 16:12:06.449043+00	2020-12-21 16:12:06.449064+00	NA
58	Remnant: From the Ashes	{"en": "Remnant: From the Ashes"}	Remnant: From the Ashes is an action role-playing third person shooter developed by Gunfire Games and published by Perfect World Entertainment. It was released for Microsoft Windows, PlayStation 4 and Xbox One on August 20, 2019. The game received generally positive reviews upon release and more than 1 million units have been sold.	{"en": "Remnant: From the Ashes is an action role-playing third person shooter developed by Gunfire Games and published by Perfect World Entertainment. It was released for Microsoft Windows, PlayStation 4 and Xbox One on August 20, 2019. The game received generally positive reviews upon release and more than 1 million units have been sold."}	["https://upload.wikimedia.org/wikipedia/en/a/a7/Remnant_From_the_Ashes_cover_art.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Remnant:_From_the_Ashes"}	remnant-from-the-ashes	2020-12-17 19:51:07.716988+00	2020-12-17 22:23:22.935422+00	NA
75	The Outer Worlds	{"ar": "ذا أوتر ورلدز", "de": "The Outer Worlds", "en": "The Outer Worlds", "es": "The Outer Worlds", "fa": "جهان‌های بیرونی", "fi": "The Outer Worlds", "fr": "The Outer Worlds", "it": "The Outer Worlds", "ja": "The Outer Worlds", "ko": "아우터 월드", "nl": "The Outer Worlds", "pt": "The Outer Worlds", "ru": "The Outer Worlds", "sv": "The Outer Worlds", "tr": "The Outer Worlds", "uk": "The Outer Worlds", "zh": "外圍世界", "arz": "ذا اوتر ورلدز"}	The Outer Worlds is an action role-playing game developed by Obsidian Entertainment and published by Private Division. The game was released for PlayStation 4, Xbox One, and Microsoft Windows in October 2019, with a Nintendo Switch version released in June 2020. The game received generally favorable reviews from critics.	{"en": "The Outer Worlds is an action role-playing game developed by Obsidian Entertainment and published by Private Division. The game was released for PlayStation 4, Xbox One, and Microsoft Windows in October 2019, with a Nintendo Switch version released in June 2020. The game received generally favorable reviews from critics."}	["https://upload.wikimedia.org/wikipedia/en/e/e7/The_Outer_Worlds_cover_art.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B0%D8%A7_%D8%A3%D9%88%D8%AA%D8%B1_%D9%88%D8%B1%D9%84%D8%AF%D8%B2", "wikipedia_de": "https://de.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AC%D9%87%D8%A7%D9%86%E2%80%8C%D9%87%D8%A7%DB%8C_%D8%A8%DB%8C%D8%B1%D9%88%D9%86%DB%8C", "wikipedia_fi": "https://fi.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_it": "https://it.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_ja": "https://ja.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%95%84%EC%9A%B0%ED%84%B0_%EC%9B%94%EB%93%9C", "wikipedia_nl": "https://nl.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_sv": "https://sv.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_tr": "https://tr.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_uk": "https://uk.wikipedia.org/wiki/The_Outer_Worlds", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%A4%96%E5%9C%8D%E4%B8%96%E7%95%8C", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B0%D8%A7_%D8%A7%D9%88%D8%AA%D8%B1_%D9%88%D8%B1%D9%84%D8%AF%D8%B2"}	the-outer-worlds	2020-12-17 19:51:10.957961+00	2020-12-17 22:23:24.280966+00	NA
47	Momodora: Reverie Under the Moonlight	{"en": "Momodora: Reverie Under the Moonlight", "nl": "Momodora: Reverie Under the Moonlight", "zh": "莫莫多拉：月下遐想"}	Momodora: Reverie Under the Moonlight is an indie Metroidvania video game developed by Brazilian[1] studio Bombservice and published by Playism.[2] The game was originally released on March 4, 2016 for Microsoft Windows.[3] It is the fourth installment of the Momodora series that began in 2010 with Momodora I.	{"en": "Momodora: Reverie Under the Moonlight is an indie Metroidvania video game developed by Brazilian[1] studio Bombservice and published by Playism.[2] The game was originally released on March 4, 2016 for Microsoft Windows.[3] It is the fourth installment of the Momodora series that began in 2010 with Momodora I."}	["https://upload.wikimedia.org/wikipedia/en/8/89/MomodoraIV.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Momodora:_Reverie_Under_the_Moonlight", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Momodora:_Reverie_Under_the_Moonlight", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%8E%AB%E8%8E%AB%E5%A4%9A%E6%8B%89%EF%BC%9A%E6%9C%88%E4%B8%8B%E9%81%90%E6%83%B3"}	momodora-reverie-under-the-moonlight	2020-12-17 19:51:06.836916+00	2020-12-17 22:23:22.19171+00	NA
145	Assassin's Creed Valhalla	{"en": "Assassin's Creed Valhalla"}	Assassin's Creed Valhalla is an action role-playing video game developed by Ubisoft Montreal and published by Ubisoft. It is the twelfth major installment and the twenty-second release in the Assassin's Creed series, and a successor to the 2018's Assassin's Creed Odyssey. Set in 873 AD, the game recounts a fictional story during the Viking invasion of Britain. The player controls Eivor, a Viking raider who becomes embroiled in the conflict between the Brotherhood of Assassins and the Templar Order.[c]	{"en": "Assassin's Creed Valhalla is an action role-playing video game developed by Ubisoft Montreal and published by Ubisoft. It is the twelfth major installment and the twenty-second release in the Assassin's Creed series, and a successor to the 2018's Assassin's Creed Odyssey. Set in 873 AD, the game recounts a fictional story during the Viking invasion of Britain. The player controls Eivor, a Viking raider who becomes embroiled in the conflict between the Brotherhood of Assassins and the Templar Order.[c]"}	["https://upload.wikimedia.org/wikipedia/en/f/f8/ACValhalla.jpg"]	{"stadia": "https://stadia.google.com/store/details/377f50584071472096bcda89b0839bc3rcp1/sku/eefdc4164b384e39a68c67be30220410"}	assassins-creed-valhalla	2020-12-20 04:10:34.584494+00	2021-02-05 23:20:47.083491+00	M17+
66	Streets of Rogue	{"en": "Streets of Rogue", "es": "Streets of Rogue", "uk": "Streets of Rogue"}	Streets of Rogue is a rogue-like video game developed by Matt Dabrowski and published by tinyBuild for Microsoft Windows, Xbox One, PlayStation 4, Nintendo Switch, MacOS and Linux. It was initially launched in Early Access during 2017, and was fully released on July 12, 2019.[1]	{"en": "Streets of Rogue is a rogue-like video game developed by Matt Dabrowski and published by tinyBuild for Microsoft Windows, Xbox One, PlayStation 4, Nintendo Switch, MacOS and Linux. It was initially launched in Early Access during 2017, and was fully released on July 12, 2019.[1]"}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Streets_of_Rogue", "wikipedia_es": "https://es.wikipedia.org/wiki/Streets_of_Rogue", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Streets_of_Rogue"}	streets-of-rogue	2020-12-17 19:51:10.464547+00	2020-12-17 22:23:23.804107+00	NA
6	Battle Chasers: Nightwar	{"en": "Battle Chasers: Nightwar", "ru": "Battle Chasers: Nightwar"}	Battle Chasers: Nightwar is a turn-based role-playing video game developed by Airship Syndicate and published by THQ Nordic. It was released in October 2017 for Microsoft Windows, macOS, PlayStation 4 and Xbox One,[1] and in May 2018 for Nintendo Switch and Linux.[2][3] Based on the Battle Chasers fantasy comic book series by Joe Madureira, the game involves the cast of that series being marooned on an island and being forced to stop the plans of an evil sorceress in order to escape.	{"en": "Battle Chasers: Nightwar is a turn-based role-playing video game developed by Airship Syndicate and published by THQ Nordic. It was released in October 2017 for Microsoft Windows, macOS, PlayStation 4 and Xbox One,[1] and in May 2018 for Nintendo Switch and Linux.[2][3] Based on the Battle Chasers fantasy comic book series by Joe Madureira, the game involves the cast of that series being marooned on an island and being forced to stop the plans of an evil sorceress in order to escape."}	["https://upload.wikimedia.org/wikipedia/en/4/44/Battle_Chasers_Nightwar_cover_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Battle_Chasers:_Nightwar", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Battle_Chasers:_Nightwar"}	battle-chasers-nightwar	2020-12-14 15:16:09.393303+00	2020-12-17 22:23:19.623548+00	NA
46	Middle-earth: Shadow of War	{"ar": "ميدل إيرث: شادو أوف وور", "de": "Mittelerde: Schatten des Krieges", "en": "Middle-earth: Shadow of War", "es": "La Tierra Media: Sombras de guerra", "fa": "سرزمین میانه: سایه جنگ", "fi": "Middle-earth: Shadow of War", "fr": "La Terre du Milieu : L'Ombre de la guerre", "he": "Middle-earth: Shadow of War", "it": "La Terra di Mezzo: L'ombra della guerra", "nl": "Middle-earth: Shadow of War", "pl": "Śródziemie: Cień wojny", "pt": "Middle-earth: Shadow of War", "ru": "Middle-earth: Shadow of War", "tr": "Middle-earth: Shadow of War", "uk": "Middle-earth: Shadow of War", "zh": "中土世界：戰爭之影", "arz": "ميدل ايرث: شادو اف وور", "wuu": "中土世界：战争之影"}	Middle-earth: Shadow of War is an action role-playing video game developed by Monolith Productions and published by Warner Bros. Interactive Entertainment. It is the sequel to 2014's Middle-earth: Shadow of Mordor, and was released worldwide for Microsoft Windows, PlayStation 4, and Xbox One on October 10, 2017.	{"en": "Middle-earth: Shadow of War is an action role-playing video game developed by Monolith Productions and published by Warner Bros. Interactive Entertainment. It is the sequel to 2014's Middle-earth: Shadow of Mordor, and was released worldwide for Microsoft Windows, PlayStation 4, and Xbox One on October 10, 2017."}	["https://upload.wikimedia.org/wikipedia/en/8/8f/MiddleEarthShadowOfWar.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D9%8A%D8%AF%D9%84_%D8%A5%D9%8A%D8%B1%D8%AB:_%D8%B4%D8%A7%D8%AF%D9%88_%D8%A3%D9%88%D9%81_%D9%88%D9%88%D8%B1", "wikipedia_de": "https://de.wikipedia.org/wiki/Mittelerde:_Schatten_des_Krieges", "wikipedia_en": "https://en.wikipedia.org/wiki/Middle_Earth:_Shadow_of_War", "wikipedia_es": "https://es.wikipedia.org/wiki/La_Tierra_Media:_Sombras_de_guerra", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D8%B1%D8%B2%D9%85%DB%8C%D9%86_%D9%85%DB%8C%D8%A7%D9%86%D9%87:_%D8%B3%D8%A7%DB%8C%D9%87_%D8%AC%D9%86%DA%AF", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Middle-earth:_Shadow_of_War", "wikipedia_fr": "https://fr.wikipedia.org/wiki/La_Terre_du_Milieu_:_L%27Ombre_de_la_guerre", "wikipedia_he": "https://he.wikipedia.org/wiki/Middle-earth:_Shadow_of_War", "wikipedia_it": "https://it.wikipedia.org/wiki/La_Terra_di_Mezzo:_L%27ombra_della_guerra", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Middle-earth:_Shadow_of_War", "wikipedia_pl": "https://pl.wikipedia.org/wiki/%C5%9Ar%C3%B3dziemie:_Cie%C5%84_wojny", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Middle-earth:_Shadow_of_War", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Middle-earth:_Shadow_of_War", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Middle-earth:_Shadow_of_War", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Middle-earth:_Shadow_of_War", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9C%9F%E4%B8%96%E7%95%8C%EF%BC%9A%E6%88%B0%E7%88%AD%E4%B9%8B%E5%BD%B1", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%85%D9%8A%D8%AF%D9%84_%D8%A7%D9%8A%D8%B1%D8%AB:_%D8%B4%D8%A7%D8%AF%D9%88_%D8%A7%D9%81_%D9%88%D9%88%D8%B1", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E4%B8%AD%E5%9C%9F%E4%B8%96%E7%95%8C%EF%BC%9A%E6%88%98%E4%BA%89%E4%B9%8B%E5%BD%B1"}	middle-earth-shadow-of-war	2020-12-17 19:51:06.815485+00	2020-12-17 22:23:22.069437+00	NA
121	Night in the Woods	{"cs": "Night in the Woods", "el": "Night in the Woods", "en": "Night in the Woods", "es": "Night in the Woods", "fr": "Night in the Woods", "it": "Night in the Woods", "ja": "Night in the Woods", "ko": "나이트 인 더 우즈", "ru": "Night in the Woods", "sr": "Night in the Woods", "sv": "Night in the Woods", "tl": "Night in the Woods", "uk": "Night in the Woods", "zh": "林中之夜", "arz": "نيجت اين ث ودس"}	Night in the Woods (abbreviated as NITW) is a single-player adventure game. It was developed by Infinite Fall, a studio founded by game designer Alec Holowka and animator/artist Scott Benson, and published by Finji.	{"en": "Night in the Woods (abbreviated as NITW) is a single-player adventure game. It was developed by Infinite Fall, a studio founded by game designer Alec Holowka and animator/artist Scott Benson, and published by Finji."}	["https://upload.wikimedia.org/wikipedia/en/3/36/Night_in_the_Woods.jpg"]	{"wikipedia_cs": "https://cs.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_el": "https://el.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_en": "https://en.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_es": "https://es.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_it": "https://it.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%82%98%EC%9D%B4%ED%8A%B8_%EC%9D%B8_%EB%8D%94_%EC%9A%B0%EC%A6%88", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_tl": "https://tl.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Night_in_the_Woods", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%9E%97%E4%B8%AD%E4%B9%8B%E5%A4%9C", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%86%D9%8A%D8%AC%D8%AA_%D8%A7%D9%8A%D9%86_%D8%AB_%D9%88%D8%AF%D8%B3"}	night-in-the-woods	2020-12-18 16:36:43.005383+00	2020-12-18 16:51:23.619534+00	NA
183	Little Nightmares	{"en": "Little Nightmares"}	Little Nightmares is a puzzle-platformer horror adventure game developed by Tarsier Studios and published by Bandai Namco Entertainment for Microsoft Windows, PlayStation 4, Nintendo Switch, Xbox One, and Stadia. The game received positive reviews upon release with critics praising the atmosphere, graphics, and sound, while criticizing the game's checkpoint system and short length. A sequel, Little Nightmares 2, will be released in February 2021.	{"en": "Little Nightmares is a puzzle-platformer horror adventure game developed by Tarsier Studios and published by Bandai Namco Entertainment for Microsoft Windows, PlayStation 4, Nintendo Switch, Xbox One, and Stadia. The game received positive reviews upon release with critics praising the atmosphere, graphics, and sound, while criticizing the game's checkpoint system and short length. A sequel, Little Nightmares 2, will be released in February 2021."}	["https://upload.wikimedia.org/wikipedia/en/d/d8/Little_Nightmares_Box_Art.png"]	{"stadia": "https://stadia.google.com/store/details/3aed855f10b34f618e5f6c6f5467bcf9rcp1/sku/77ab8b1807a849e3991826d8d7a9e3e0"}	little-nightmares	2020-12-21 16:12:02.016012+00	2021-02-05 23:20:46.946226+00	T
74	The Jackbox Party Pack	{"en": "The Jackbox Party Pack", "fr": "The Jackbox Party Pack"}	The Jackbox Party Pack is a series of party video games developed by Jackbox Games for many different platforms on a near-annual release schedule since 2014. Each installation contains five games that are designed to be played in large groups, including in conjunction with streaming services like Twitch which provide a means for audiences to participate.	{"en": "The Jackbox Party Pack is a series of party video games developed by Jackbox Games for many different platforms on a near-annual release schedule since 2014. Each installation contains five games that are designed to be played in large groups, including in conjunction with streaming services like Twitch which provide a means for audiences to participate."}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/The_Jackbox_Party_Pack_4", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Jackbox_Party_Pack"}	the-jackbox-party-pack	2020-12-17 19:51:10.922052+00	2020-12-17 22:23:24.231047+00	NA
85	Thronebreaker: The Witcher Tales	{"de": "Thronebreaker: The Witcher Tales", "en": "Thronebreaker: The Witcher Tales", "es": "Thronebreaker: The Witcher Tales", "fa": "سلطنت‌شکن: افسانه ویچر", "fr": "Thronebreaker: The Witcher Tales", "ja": "奪われし玉座:ウィッチャーテイルズ", "ru": "Кровная вражда: Ведьмак. Истории", "tr": "Thronebreaker: The Witcher Tales", "uk": "Thronebreaker: The Witcher Tales", "arz": "ثرونيبرايكير: ث ويتشير تاليس"}	Thronebreaker: The Witcher Tales is a role-playing video game developed by CD Projekt Red. It is a spin-off of The Witcher video game franchise, and acts as the standalone single-player component for Gwent: The Witcher Card Game. Thronebreaker was released in October 2018 for Microsoft Windows, on 4 December 2018 for PlayStation 4 and Xbox One, in January 2020 for Nintendo Switch, and in July 2020 for iOS, with an Android version scheduled for release later in 2020.	{"en": "Thronebreaker: The Witcher Tales is a role-playing video game developed by CD Projekt Red. It is a spin-off of The Witcher video game franchise, and acts as the standalone single-player component for Gwent: The Witcher Card Game. Thronebreaker was released in October 2018 for Microsoft Windows, on 4 December 2018 for PlayStation 4 and Xbox One, in January 2020 for Nintendo Switch, and in July 2020 for iOS, with an Android version scheduled for release later in 2020."}	["https://upload.wikimedia.org/wikipedia/en/5/5a/Thronebreaker_The_Witcher_Tales_cover_art.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Thronebreaker:_The_Witcher_Tales", "wikipedia_en": "https://en.wikipedia.org/wiki/Thronebreaker:_The_Witcher_Tales", "wikipedia_es": "https://es.wikipedia.org/wiki/Thronebreaker:_The_Witcher_Tales", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D9%84%D8%B7%D9%86%D8%AA%E2%80%8C%D8%B4%DA%A9%D9%86:_%D8%A7%D9%81%D8%B3%D8%A7%D9%86%D9%87_%D9%88%DB%8C%DA%86%D8%B1", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Thronebreaker:_The_Witcher_Tales", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E5%A5%AA%E3%82%8F%E3%82%8C%E3%81%97%E7%8E%89%E5%BA%A7:%E3%82%A6%E3%82%A3%E3%83%83%E3%83%81%E3%83%A3%E3%83%BC%E3%83%86%E3%82%A4%E3%83%AB%E3%82%BA", "wikipedia_ru": "https://ru.wikipedia.org/wiki/%D0%9A%D1%80%D0%BE%D0%B2%D0%BD%D0%B0%D1%8F_%D0%B2%D1%80%D0%B0%D0%B6%D0%B4%D0%B0:_%D0%92%D0%B5%D0%B4%D1%8C%D0%BC%D0%B0%D0%BA._%D0%98%D1%81%D1%82%D0%BE%D1%80%D0%B8%D0%B8", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Thronebreaker:_The_Witcher_Tales", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Thronebreaker:_The_Witcher_Tales", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AB%D8%B1%D9%88%D9%86%D9%8A%D8%A8%D8%B1%D8%A7%D9%8A%D9%83%D9%8A%D8%B1:_%D8%AB_%D9%88%D9%8A%D8%AA%D8%B4%D9%8A%D8%B1_%D8%AA%D8%A7%D9%84%D9%8A%D8%B3"}	thronebreaker-the-witcher-tales	2020-12-17 19:51:11.75876+00	2020-12-17 22:23:24.627059+00	NA
118	Kona	{"en": "Kona"}	Kona is an adventure video game developed by Canadian[2] studio Parabole and published by Ravenscourt. Set in the 1970s, the game centers around Carl Faubert, a private investigator, who arrives at a snowy town in Nord-du-Québec, only to find the place deserted with something that's lurking around.[3]	{"en": "Kona is an adventure video game developed by Canadian[2] studio Parabole and published by Ravenscourt. Set in the 1970s, the game centers around Carl Faubert, a private investigator, who arrives at a snowy town in Nord-du-Québec, only to find the place deserted with something that's lurking around.[3]"}	["https://upload.wikimedia.org/wikipedia/en/3/3c/Konacovergame.jpg"]	{"stadia": "https://stadia.google.com/store/details/f5f9708a422a44cc876c240cfa07221drcp1/sku/12f3e5611c34478fb0285c6de4f2a8aa"}	kona	2020-12-18 16:36:42.907043+00	2021-02-05 23:20:46.14924+00	T
316	SUPERHOT: MIND CONTROL DELETE	{"en": "SUPERHOT: MIND CONTROL DELETE"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/382fe14629e148449e7b8f94e8aecb38rcp1/sku/f491723b366248d18843107689f3ead6"}	superhot-mind-control-delete	2021-02-05 16:52:21.810329+00	2021-02-05 23:20:49.326781+00	T
122	Moonlighter	{"en": "Moonlighter", "es": "Moonlighter", "pt": "Moonlighter", "ru": "Moonlighter"}	Moonlighter is an action RPG indie game developed by Spanish indie studio Digital Sun and released for Microsoft Windows, macOS, Linux, PlayStation 4, and Xbox One on May 29, 2018.[1][2][3][4] A Nintendo Switch version was released on November 5, 2018.[5]	{"en": "Moonlighter is an action RPG indie game developed by Spanish indie studio Digital Sun and released for Microsoft Windows, macOS, Linux, PlayStation 4, and Xbox One on May 29, 2018.[1][2][3][4] A Nintendo Switch version was released on November 5, 2018.[5]"}	["https://upload.wikimedia.org/wikipedia/en/9/98/Moonlighter.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Moonlighter_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Moonlighter", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Moonlighter", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Moonlighter"}	moonlighter	2020-12-18 16:36:43.08656+00	2020-12-18 16:51:23.405483+00	NA
76	The Touryst	{"en": "The Touryst"}	The Touryst is an action-adventure puzzle game developed and published by Shin'en Multimedia for Nintendo Switch, Xbox One, Microsoft Windows and Xbox Series X/S.[1] It was announced during Nintendo's Indie World stream on August 19, 2019 and was released on November 21, 2019 for Nintendo Switch and July 30, 2020 for Xbox One and Microsoft Windows.[2] An enhanced version of the game released for Xbox Series X/S as a launch title on November 10, 2020. The art style is blocky and makes use of voxel art techniques.[3] The game uses a custom engine developed by Shin'en, which allows the game to deliver high-fidelity graphical effects while still maintaining a smooth framerate.[4] The game was voted as one of the four most loved eShop games of 2019. [5]	{"en": "The Touryst is an action-adventure puzzle game developed and published by Shin'en Multimedia for Nintendo Switch, Xbox One, Microsoft Windows and Xbox Series X/S.[1] It was announced during Nintendo's Indie World stream on August 19, 2019 and was released on November 21, 2019 for Nintendo Switch and July 30, 2020 for Xbox One and Microsoft Windows.[2] An enhanced version of the game released for Xbox Series X/S as a launch title on November 10, 2020. The art style is blocky and makes use of voxel art techniques.[3] The game uses a custom engine developed by Shin'en, which allows the game to deliver high-fidelity graphical effects while still maintaining a smooth framerate.[4] The game was voted as one of the four most loved eShop games of 2019. [5]"}	["https://upload.wikimedia.org/wikipedia/en/f/fb/The_Touryst_icon.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/The_Touryst"}	the-touryst	2020-12-17 19:51:10.992263+00	2020-12-17 22:23:24.414637+00	NA
297	Relicta	{"en": "Relicta"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/ed05d9df2ec4452594b07336e360a1aarcp1/sku/f139cbd41135461a83da504824a5d382"}	relicta	2021-02-05 16:52:19.678595+00	2021-02-05 23:20:48.119966+00	M17+
1	Absolver	{"ar": "أبسولفر", "br": "Absolver", "el": "Absolver", "en": "Absolver", "fr": "Absolver", "ru": "Absolver", "arz": "ابسولڤير"}	Absolver is a martial arts-themed action role-playing video game developed by Sloclap and published by Devolver Digital for PlayStation 4, Windows, and Xbox One. In the game, players control warrior characters who fight other players and computer-controlled characters across the fictional land of Adal to prove their worthiness of joining the Absolver peacekeepers. The game's story is focused on the human development of the characters as they fight to find their place in the collapsed empire.[1] The character's fighting moves are customized in a "combat deck" of cards, with each card assigned to a move. Players earn cards, equipment, and weapons by progressing through the game.	{"en": "Absolver is a martial arts-themed action role-playing video game developed by Sloclap and published by Devolver Digital for PlayStation 4, Windows, and Xbox One. In the game, players control warrior characters who fight other players and computer-controlled characters across the fictional land of Adal to prove their worthiness of joining the Absolver peacekeepers. The game's story is focused on the human development of the characters as they fight to find their place in the collapsed empire.[1] The character's fighting moves are customized in a \\"combat deck\\" of cards, with each card assigned to a move. Players earn cards, equipment, and weapons by progressing through the game."}	["https://upload.wikimedia.org/wikipedia/en/c/c9/Absolver_logo.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D8%B3%D9%88%D9%84%D9%81%D8%B1", "wikipedia_br": "https://br.wikipedia.org/wiki/Absolver", "wikipedia_el": "https://el.wikipedia.org/wiki/Absolver", "wikipedia_en": "https://en.wikipedia.org/wiki/Absolver", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Absolver", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Absolver", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D8%A8%D8%B3%D9%88%D9%84%DA%A4%D9%8A%D8%B1"}	absolver	2020-12-13 02:53:58.855141+00	2020-12-17 22:23:19.822195+00	NA
72	The Elder Scrolls Online	{"en": "The Elder Scrolls Online"}	The Elder Scrolls Online is a massively multiplayer online role-playing game (MMORPG) developed by ZeniMax Online Studios and published by Bethesda Softworks.[2][3] It was released for Microsoft Windows and OS X in April 2014[4], with versions for PlayStation 5 and Xbox Series X/S planned.[5] It is a part of the Elder Scrolls series.	{"en": "The Elder Scrolls Online is a massively multiplayer online role-playing game (MMORPG) developed by ZeniMax Online Studios and published by Bethesda Softworks.[2][3] It was released for Microsoft Windows and OS X in April 2014[4], with versions for PlayStation 5 and Xbox Series X/S planned.[5] It is a part of the Elder Scrolls series."}	["https://upload.wikimedia.org/wikipedia/en/f/fa/Elder_Scrolls_Online_cover.png"]	{"stadia": "https://stadia.google.com/store/details/b17f16d4a4f94c0a85e07f54dbdedbb6rcp1/sku/dad1cc5c8c1e45c38a83d125e59ea4b9"}	the-elder-scrolls-online	2020-12-17 19:51:10.730298+00	2021-02-05 23:20:48.190359+00	M17+
91	Two Point Hospital	{"en": "Two Point Hospital", "fr": "Two Point Hospital", "it": "Two Point Hospital", "ja": "Two Point Hospital", "nl": "Two Point Hospital", "ru": "Two Point Hospital", "zh": "双点医院", "arz": "تو پوينت هوسپيتال"}	Two Point Hospital is a 2018 business simulation game developed by Two Point Studios and published by Sega for Linux, MacOS, and Microsoft Windows. Console versions for the PlayStation 4, Xbox One, and Nintendo Switch were released in February 2020. A spiritual successor to Bullfrog Productions' 1997 game Theme Hospital, players are tasked with constructing and operating an empire of hospitals in the fictional Two Point County, with the goal of curing patients of fictitious, comical ailments. Because visiting real hospitals is unpopular, the emphasis on humour to lighten the mood was deemed important by the developers. The game was designed and developed by some of the creators of Theme Hospital, including Mark Webley and Gary Carr.	{"en": "Two Point Hospital is a 2018 business simulation game developed by Two Point Studios and published by Sega for Linux, MacOS, and Microsoft Windows. Console versions for the PlayStation 4, Xbox One, and Nintendo Switch were released in February 2020. A spiritual successor to Bullfrog Productions' 1997 game Theme Hospital, players are tasked with constructing and operating an empire of hospitals in the fictional Two Point County, with the goal of curing patients of fictitious, comical ailments. Because visiting real hospitals is unpopular, the emphasis on humour to lighten the mood was deemed important by the developers. The game was designed and developed by some of the creators of Theme Hospital, including Mark Webley and Gary Carr."}	["https://upload.wikimedia.org/wikipedia/en/d/d1/Two_Point_Hospital_-_Cover_Art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Two_Point_Hospital", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Two_Point_Hospital", "wikipedia_it": "https://it.wikipedia.org/wiki/Two_Point_Hospital", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Two_Point_Hospital", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Two_Point_Hospital", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Two_Point_Hospital", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%8F%8C%E7%82%B9%E5%8C%BB%E9%99%A2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AA%D9%88_%D9%BE%D9%88%D9%8A%D9%86%D8%AA_%D9%87%D9%88%D8%B3%D9%BE%D9%8A%D8%AA%D8%A7%D9%84"}	two-point-hospital	2020-12-17 19:51:12.085098+00	2020-12-17 22:23:25.326378+00	NA
317	Secret Neighbor	{"en": "Secret Neighbor"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/8f8d583a2ae843e0b31fa653cea5d27drcp1/sku/5f1dfba8e3d64b3bbd4979c504cea096p"}	secret-neighbor	2021-02-05 16:52:21.82165+00	2021-02-05 23:20:49.325155+00	T
198	Outriders	{"de": "Outriders", "en": "Outriders", "fa": "اوت‌رایدرز (بازی ویدئویی)", "fr": "Outriders", "uk": "Outriders"}	Outriders is an upcoming third-person shooter developed by People Can Fly and published by Square Enix. It is set to be released on February 2, 2021 for Microsoft Windows, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S. It will also release on Stadia later in 2021.[1]	{"en": "Outriders is an upcoming third-person shooter developed by People Can Fly and published by Square Enix. It is set to be released on February 2, 2021 for Microsoft Windows, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S. It will also release on Stadia later in 2021.[1]"}	["https://upload.wikimedia.org/wikipedia/en/d/de/Outriders_cover_art.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Outriders", "wikipedia_en": "https://en.wikipedia.org/wiki/Outriders_(video_game)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A7%D9%88%D8%AA%E2%80%8C%D8%B1%D8%A7%DB%8C%D8%AF%D8%B1%D8%B2_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Outriders", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Outriders"}	outriders	2020-12-21 16:12:03.647132+00	2020-12-21 16:12:03.647153+00	NA
83	The Walking Dead: Season Two	{"ar": "الموتى السائرون: الموسم الثاني", "cs": "The Walking Dead: Season Two", "en": "The Walking Dead: Season Two", "es": "The Walking Dead: Season Two", "fa": "مردگان متحرک: فصل دوم", "fi": "The Walking Dead: Season Two", "fr": "The Walking Dead : Saison 2", "ja": "ウォーキング・デッド シーズン2", "ko": "워킹 데드: 시즌 투", "nl": "The Walking Dead: Season Two", "pl": "The Walking Dead: Season Two", "pt": "The Walking Dead: Season Two", "ru": "The Walking Dead: Season Two", "sv": "The Walking Dead: Season Two", "tr": "The Walking Dead: Season Two", "zh": "行屍：第二季", "arz": "ث والكينج دايد: سايسون تو"}	The Walking Dead: Season Two is an episodic adventure video game based on The Walking Dead comic book series developed by Telltale Games. It is the sequel to The Walking Dead, with the episodes released between December 2013 and August 2014. There was a retail collector's disc edition released after the conclusion of the season.[14][15][16] The game employs the same narrative structure as the first season, where player choice in one episode will have a permanent impact on future story elements. The player choices recorded in save files from the first season and the additional episode 400 Days carry over into the second season.[17] Clementine, who was the player's main companion during the first season, is the playable character in Season Two.[18]	{"en": "The Walking Dead: Season Two is an episodic adventure video game based on The Walking Dead comic book series developed by Telltale Games. It is the sequel to The Walking Dead, with the episodes released between December 2013 and August 2014. There was a retail collector's disc edition released after the conclusion of the season.[14][15][16] The game employs the same narrative structure as the first season, where player choice in one episode will have a permanent impact on future story elements. The player choices recorded in save files from the first season and the additional episode 400 Days carry over into the second season.[17] Clementine, who was the player's main companion during the first season, is the playable character in Season Two.[18]"}	["https://upload.wikimedia.org/wikipedia/en/0/09/The_walking_dead_video_game_season_two_promo.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%85%D9%88%D8%AA%D9%89_%D8%A7%D9%84%D8%B3%D8%A7%D8%A6%D8%B1%D9%88%D9%86:_%D8%A7%D9%84%D9%85%D9%88%D8%B3%D9%85_%D8%A7%D9%84%D8%AB%D8%A7%D9%86%D9%8A", "wikipedia_cs": "https://cs.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%B1%D8%AF%DA%AF%D8%A7%D9%86_%D9%85%D8%AA%D8%AD%D8%B1%DA%A9:_%D9%81%D8%B5%D9%84_%D8%AF%D9%88%D9%85", "wikipedia_fi": "https://fi.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Walking_Dead_:_Saison_2", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A9%E3%83%BC%E3%82%AD%E3%83%B3%E3%82%B0%E3%83%BB%E3%83%87%E3%83%83%E3%83%89_%E3%82%B7%E3%83%BC%E3%82%BA%E3%83%B32", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9B%8C%ED%82%B9_%EB%8D%B0%EB%93%9C:_%EC%8B%9C%EC%A6%8C_%ED%88%AC", "wikipedia_nl": "https://nl.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_pl": "https://pl.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_sv": "https://sv.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_tr": "https://tr.wikipedia.org/wiki/The_Walking_Dead:_Season_Two", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%A1%8C%E5%B1%8D%EF%BC%9A%E7%AC%AC%E4%BA%8C%E5%AD%A3", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AB_%D9%88%D8%A7%D9%84%D9%83%D9%8A%D9%86%D8%AC_%D8%AF%D8%A7%D9%8A%D8%AF:_%D8%B3%D8%A7%D9%8A%D8%B3%D9%88%D9%86_%D8%AA%D9%88"}	the-walking-dead-season-two	2020-12-17 19:51:11.668756+00	2020-12-17 22:23:24.504057+00	NA
96	Wasteland 2	{"de": "Wasteland 2", "en": "Wasteland 2", "es": "Wasteland 2", "fa": "ویست‌لند ۲", "fi": "Wasteland 2", "fr": "Wasteland 2", "it": "Wasteland 2", "ja": "Wasteland 2", "pl": "Wasteland 2", "ru": "Wasteland 2", "tr": "Wasteland 2", "arz": "واستيلاند 2"}	Wasteland 2 is a post-apocalyptic role-playing video game developed by inXile Entertainment and published by Deep Silver. It is the sequel to 1988's Wasteland, and was successfully crowdfunded through Kickstarter. After the postponement of the original release date from October 2013, it was released for Microsoft Windows, OS X, and Linux in September 2014. An enhanced version of the game, named Wasteland 2: Director's Cut, was released in October 2015, including versions for PlayStation 4, Xbox One, and Nintendo Switch.	{"en": "Wasteland 2 is a post-apocalyptic role-playing video game developed by inXile Entertainment and published by Deep Silver. It is the sequel to 1988's Wasteland, and was successfully crowdfunded through Kickstarter. After the postponement of the original release date from October 2013, it was released for Microsoft Windows, OS X, and Linux in September 2014. An enhanced version of the game, named Wasteland 2: Director's Cut, was released in October 2015, including versions for PlayStation 4, Xbox One, and Nintendo Switch."}	["https://upload.wikimedia.org/wikipedia/en/7/7e/Wasteland2art.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Wasteland_2", "wikipedia_en": "https://en.wikipedia.org/wiki/Wasteland_2:_Director's_Cut", "wikipedia_es": "https://es.wikipedia.org/wiki/Wasteland_2", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%88%DB%8C%D8%B3%D8%AA%E2%80%8C%D9%84%D9%86%D8%AF_%DB%B2", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Wasteland_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Wasteland_2", "wikipedia_it": "https://it.wikipedia.org/wiki/Wasteland_2", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Wasteland_2", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Wasteland_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Wasteland_2", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Wasteland_2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%88%D8%A7%D8%B3%D8%AA%D9%8A%D9%84%D8%A7%D9%86%D8%AF_2"}	wasteland-2	2020-12-17 19:51:13.067056+00	2020-12-17 22:23:25.315284+00	NA
16	Clustertruck	{"de": "Clustertruck", "en": "Clustertruck", "fr": "Clustertruck", "ja": "Clustertruck"}	Clustertruck is a platform indie game developed by Swedish[1] studio Landfall Games and published by tinyBuild. The game was released for Microsoft Windows, OS X, Linux, PlayStation 4, and Xbox One on 27 September 2016.  It was released for Nintendo Switch on 15 March 2018.[2][3]  The game's name is a play on the word "clusterfuck", describing "a chaotic situation where everything seems to go wrong".	{"en": "Clustertruck is a platform indie game developed by Swedish[1] studio Landfall Games and published by tinyBuild. The game was released for Microsoft Windows, OS X, Linux, PlayStation 4, and Xbox One on 27 September 2016.  It was released for Nintendo Switch on 15 March 2018.[2][3]  The game's name is a play on the word \\"clusterfuck\\", describing \\"a chaotic situation where everything seems to go wrong\\"."}	["https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Clustertruck.svg/1200px-Clustertruck.svg.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Clustertruck", "wikipedia_en": "https://en.wikipedia.org/wiki/ClusterTruck", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Clustertruck", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Clustertruck"}	clustertruck	2020-12-17 19:51:04.658566+00	2020-12-17 22:23:20.208674+00	NA
17	Darksiders Genesis	{"en": "Darksiders Genesis"}	Darksiders Genesis is a top-down hack and slash action role-playing video game developed by American studio Airship Syndicate and published by THQ Nordic. The game was released for Stadia and Microsoft Windows on December 5, 2019, and was released on the Nintendo Switch, PlayStation 4, and Xbox One on February 14, 2020.[1][2] It is considered a spin-off prequel game in the Darksiders series and introduces the fourth Horseman of the Apocalypse, Strife, as the protagonist. Strife can also team up with his brother, War. Upon release, the game received positive reviews, with many reviewers praising the combat.	{"en": "Darksiders Genesis is a top-down hack and slash action role-playing video game developed by American studio Airship Syndicate and published by THQ Nordic. The game was released for Stadia and Microsoft Windows on December 5, 2019, and was released on the Nintendo Switch, PlayStation 4, and Xbox One on February 14, 2020.[1][2] It is considered a spin-off prequel game in the Darksiders series and introduces the fourth Horseman of the Apocalypse, Strife, as the protagonist. Strife can also team up with his brother, War. Upon release, the game received positive reviews, with many reviewers praising the combat."}	["https://upload.wikimedia.org/wikipedia/en/5/56/Darksiders_Genesis_Box_Art_RP.png"]	{"stadia": "https://stadia.google.com/store/details/f39390395ed5444d8e9b23460c8f9152rcp1/sku/6c8ae46efebc4bd1a7de725bc630ce65"}	darksiders-genesis	2020-12-17 19:51:04.671135+00	2021-02-05 23:20:45.89756+00	T
136	Warhammer: Vermintide 2	{"ar": "وارهيمر: فيرمنتايد 2", "de": "Warhammer: Vermintide 2", "en": "Warhammer: Vermintide 2", "ru": "Warhammer: Vermintide 2", "arz": "وارهيمر: ڤيرمنتايد 2"}	Warhammer: Vermintide 2 is a first-person action video game developed and published by Fatshark. It is the sequel to 2015's Warhammer: End Times – Vermintide. Vermintide 2 was released for Windows on 8 March 2018. It was released for Xbox One on 11 July 2018, free for members of the Xbox Game Pass. It was released for the PlayStation 4 on 18 December 2018.	{"en": "Warhammer: Vermintide 2 is a first-person action video game developed and published by Fatshark. It is the sequel to 2015's Warhammer: End Times – Vermintide. Vermintide 2 was released for Windows on 8 March 2018. It was released for Xbox One on 11 July 2018, free for members of the Xbox Game Pass. It was released for the PlayStation 4 on 18 December 2018."}	["https://upload.wikimedia.org/wikipedia/en/d/de/Vermintide_2_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%88%D8%A7%D8%B1%D9%87%D9%8A%D9%85%D8%B1:_%D9%81%D9%8A%D8%B1%D9%85%D9%86%D8%AA%D8%A7%D9%8A%D8%AF_2", "wikipedia_de": "https://de.wikipedia.org/wiki/Warhammer:_Vermintide_2", "wikipedia_en": "https://en.wikipedia.org/wiki/Warhammer:_Vermintide_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Warhammer:_Vermintide_2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%88%D8%A7%D8%B1%D9%87%D9%8A%D9%85%D8%B1:_%DA%A4%D9%8A%D8%B1%D9%85%D9%86%D8%AA%D8%A7%D9%8A%D8%AF_2"}	warhammer-vermintide-2	2020-12-18 16:36:43.62206+00	2020-12-18 16:51:24.561992+00	NA
154	Destroy All Humans!	{"en": "Destroy All Humans!"}	Destroy All Humans! is an open world action-adventure video game developed by Black Forest Games and published by THQ Nordic. It is the fifth installment in the Destroy All Humans! franchise, and a remake of Destroy All Humans! (2005). This remake has been the first entry in the franchise since Path of the Furon (2008).	{"en": "Destroy All Humans! is an open world action-adventure video game developed by Black Forest Games and published by THQ Nordic. It is the fifth installment in the Destroy All Humans! franchise, and a remake of Destroy All Humans! (2005). This remake has been the first entry in the franchise since Path of the Furon (2008)."}	["https://upload.wikimedia.org/wikipedia/en/d/de/Destroy_All_Humans_remake_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/0fd3103549b54c7e89afd6eed83672cercp1/sku/fae281d43a044453a5ad2e1a1961625a"}	destroy-all-humans	2020-12-20 04:21:08.276477+00	2021-02-05 23:20:45.972584+00	T
78	The Witcher 3: Wild Hunt	{"ar": "ذا ويتشر 3: وايلد هانت", "ca": "The Witcher 3: Wild Hunt", "cs": "Zaklínač 3: Divoký hon", "de": "The Witcher 3: Wild Hunt", "en": "The Witcher 3: Wild Hunt", "es": "The Witcher 3: Wild Hunt", "et": "The Witcher 3: Wild Hunt", "eu": "The Witcher 3: Wild Hunt", "fa": "ویچر ۳: شکار وحشیانه", "fi": "The Witcher 3: Wild Hunt", "fr": "The Witcher 3: Wild Hunt", "gl": "The Witcher 3: Wild Hunt", "he": "The Witcher 3: Wild Hunt", "hu": "The Witcher 3: Wild Hunt", "id": "The Witcher 3: Wild Hunt", "it": "The Witcher 3: Wild Hunt", "ja": "ウィッチャー3 ワイルドハント", "ka": "The Witcher 3: Wild Hunt", "ko": "더 위쳐 3: 와일드 헌트", "lt": "The Witcher 3: Wild Hunt", "mk": "The Witcher 3: Wild Hunt", "ms": "The Witcher 3: Wild Hunt", "nb": "The Witcher 3: Wild Hunt", "nl": "The Witcher 3: Wild Hunt", "pl": "Wiedźmin 3: Dziki Gon", "pt": "The Witcher 3: Wild Hunt", "ro": "The Witcher 3: Wild Hunt", "ru": "Ведьмак 3: Дикая Охота", "sc": "The Witcher 3: Wild Hunt", "sh": "The Witcher 3: Wild Hunt", "sr": "The Witcher 3: Wild Hunt", "sv": "The Witcher 3: Wild Hunt", "th": "เดอะวิตเชอร์ 3: ไวลด์ฮันต์", "tr": "The Witcher 3: Wild Hunt", "uk": "The Witcher 3: Wild Hunt", "vi": "The Witcher 3: Wild Hunt", "zh": "巫师3：狂猎", "arz": "ذا ويتشر 3: وايلد هانت", "wuu": "巫师3：狂猎", "be-tarask": "Вядзьмар 3"}	The Witcher 3: Wild Hunt[b] is a 2015 action role-playing game developed and published by Polish developer CD Projekt Red and is based on The Witcher series of fantasy novels written by Andrzej Sapkowski. It is the sequel to the 2011 game The Witcher 2: Assassins of Kings and the third main installment in The Witcher's video game series, played in an open world with a third-person perspective.	{"en": "The Witcher 3: Wild Hunt[b] is a 2015 action role-playing game developed and published by Polish developer CD Projekt Red and is based on The Witcher series of fantasy novels written by Andrzej Sapkowski. It is the sequel to the 2011 game The Witcher 2: Assassins of Kings and the third main installment in The Witcher's video game series, played in an open world with a third-person perspective."}	["https://upload.wikimedia.org/wikipedia/en/0/0c/Witcher_3_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B0%D8%A7_%D9%88%D9%8A%D8%AA%D8%B4%D8%B1_3:_%D9%88%D8%A7%D9%8A%D9%84%D8%AF_%D9%87%D8%A7%D9%86%D8%AA", "wikipedia_ca": "https://ca.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Zakl%C3%ADna%C4%8D_3:_Divok%C3%BD_hon", "wikipedia_de": "https://de.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_et": "https://et.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_eu": "https://eu.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%88%DB%8C%DA%86%D8%B1_%DB%B3:_%D8%B4%DA%A9%D8%A7%D8%B1_%D9%88%D8%AD%D8%B4%DB%8C%D8%A7%D9%86%D9%87", "wikipedia_fi": "https://fi.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_gl": "https://gl.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_he": "https://he.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_hu": "https://hu.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_id": "https://id.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_it": "https://it.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A3%E3%83%83%E3%83%81%E3%83%A3%E3%83%BC3_%E3%83%AF%E3%82%A4%E3%83%AB%E3%83%89%E3%83%8F%E3%83%B3%E3%83%88", "wikipedia_ka": "https://ka.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%8D%94_%EC%9C%84%EC%B3%90_3:_%EC%99%80%EC%9D%BC%EB%93%9C_%ED%97%8C%ED%8A%B8", "wikipedia_lt": "https://lt.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_mk": "https://mk.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_ms": "https://ms.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_nb": "https://no.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_nl": "https://nl.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Wied%C5%BAmin_3:_Dziki_Gon", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_ro": "https://ro.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_ru": "https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%B4%D1%8C%D0%BC%D0%B0%D0%BA_3:_%D0%94%D0%B8%D0%BA%D0%B0%D1%8F_%D0%9E%D1%85%D0%BE%D1%82%D0%B0", "wikipedia_sc": "https://sc.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_sh": "https://sh.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_sr": "https://sr.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_sv": "https://sv.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%80%E0%B8%94%E0%B8%AD%E0%B8%B0%E0%B8%A7%E0%B8%B4%E0%B8%95%E0%B9%80%E0%B8%8A%E0%B8%AD%E0%B8%A3%E0%B9%8C_3:_%E0%B9%84%E0%B8%A7%E0%B8%A5%E0%B8%94%E0%B9%8C%E0%B8%AE%E0%B8%B1%E0%B8%99%E0%B8%95%E0%B9%8C", "wikipedia_tr": "https://tr.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_uk": "https://uk.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_vi": "https://vi.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%B7%AB%E5%B8%883%EF%BC%9A%E7%8B%82%E7%8C%8E", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B0%D8%A7_%D9%88%D9%8A%D8%AA%D8%B4%D8%B1_3:_%D9%88%D8%A7%D9%8A%D9%84%D8%AF_%D9%87%D8%A7%D9%86%D8%AA", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E5%B7%AB%E5%B8%883%EF%BC%9A%E7%8B%82%E7%8C%8E", "wikipedia_be-tarask": "https://be-tarask.wikipedia.org/wiki/%D0%92%D1%8F%D0%B4%D0%B7%D1%8C%D0%BC%D0%B0%D1%80_3"}	the-witcher-3-wild-hunt	2020-12-17 19:51:11.189031+00	2020-12-17 22:23:24.515281+00	NA
93	Wasteland	{"en": "Wasteland", "pt": "Wasteland (série)"}	Wasteland is an open-world post-apocalyptic RPG video game series. The first game, Wasteland, was developed by Interplay in 1988, and was the predecessor to the Fallout games.[1] InXile Entertainment developed the two sequels, Wasteland 2 (2014) and Wasteland 3 (2020), based on crowdfunding.	{"en": "Wasteland is an open-world post-apocalyptic RPG video game series. The first game, Wasteland, was developed by Interplay in 1988, and was the predecessor to the Fallout games.[1] InXile Entertainment developed the two sequels, Wasteland 2 (2014) and Wasteland 3 (2020), based on crowdfunding."}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Wasteland_Remastered", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Wasteland_(s%C3%A9rie)"}	wasteland	2020-12-17 19:51:12.5622+00	2020-12-17 22:23:25.085072+00	NA
203	PGA TOUR 2K21	{"en": "PGA TOUR 2K21"}	PGA Tour 2K21 is a sports video game developed by HB Studios and published by 2K Sports for Stadia, Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One. It's a continuation of The Golf Club franchise integrated with 2K Sports and the second game in the franchise to include a PGA Tour license (effectively succeeding EA Sports' Tiger Woods PGA Tour franchise).	{"en": "PGA Tour 2K21 is a sports video game developed by HB Studios and published by 2K Sports for Stadia, Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One. It's a continuation of The Golf Club franchise integrated with 2K Sports and the second game in the franchise to include a PGA Tour license (effectively succeeding EA Sports' Tiger Woods PGA Tour franchise)."}	["https://upload.wikimedia.org/wikipedia/en/d/de/PGA_Tour_2K21_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/6a2ac2fc8e684c41b5c14981dcb454fdrcp1/sku/9c7fd0f16817482c9e0b311a8340cb0b"}	pga-tour-2k21	2020-12-21 16:12:04.009408+00	2021-02-05 23:20:47.508697+00	E
101	Yakuza 0	{"ar": "ياكوزا 0", "de": "Yakuza 0", "en": "Yakuza 0", "es": "Yakuza 0", "fa": "یاکوزا ۰", "fi": "Yakuza 0", "fr": "Yakuza Zero", "it": "Yakuza 0", "ja": "龍が如く0 誓いの場所", "ko": "용과 같이 0: 맹세의 장소", "ru": "Yakuza 0", "th": "ยากูซ่า 0", "zh": "人中之龍0 誓約的場所", "arz": "ياكوزا 0"}	Yakuza 0[b] is an action-adventure video game developed and published by Sega. It is the sixth main entry in the Yakuza series and a prequel to the original game. It was released for PlayStation 3 and PlayStation 4 in Japan in March 2015,[2][3] and in North America and Europe for PlayStation 4 in January 2017.[4] It was released on Microsoft Windows on 1 August 2018[5] and was released on Xbox One on 26 February 2020.[6] A free accompanying game application for PlayStation Vita, titled Ryū ga Gotoku 0: Free to Play Application for PlayStation Vita,[c] was released in Japan in February 2015.[3] 	{"en": "Yakuza 0[b] is an action-adventure video game developed and published by Sega. It is the sixth main entry in the Yakuza series and a prequel to the original game. It was released for PlayStation 3 and PlayStation 4 in Japan in March 2015,[2][3] and in North America and Europe for PlayStation 4 in January 2017.[4] It was released on Microsoft Windows on 1 August 2018[5] and was released on Xbox One on 26 February 2020.[6] A free accompanying game application for PlayStation Vita, titled Ryū ga Gotoku 0: Free to Play Application for PlayStation Vita,[c] was released in Japan in February 2015.[3] "}	["https://upload.wikimedia.org/wikipedia/en/b/ba/Yakuza0.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%8A%D8%A7%D9%83%D9%88%D8%B2%D8%A7_0", "wikipedia_de": "https://de.wikipedia.org/wiki/Yakuza_0", "wikipedia_en": "https://en.wikipedia.org/wiki/Yakuza_0", "wikipedia_es": "https://es.wikipedia.org/wiki/Yakuza_0", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DB%8C%D8%A7%DA%A9%D9%88%D8%B2%D8%A7_%DB%B0", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Yakuza_0", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Yakuza_Zero", "wikipedia_it": "https://it.wikipedia.org/wiki/Yakuza_0", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E9%BE%8D%E3%81%8C%E5%A6%82%E3%81%8F0_%E8%AA%93%E3%81%84%E3%81%AE%E5%A0%B4%E6%89%80", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9A%A9%EA%B3%BC_%EA%B0%99%EC%9D%B4_0:_%EB%A7%B9%EC%84%B8%EC%9D%98_%EC%9E%A5%EC%86%8C", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Yakuza_0", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%A2%E0%B8%B2%E0%B8%81%E0%B8%B9%E0%B8%8B%E0%B9%88%E0%B8%B2_0", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E4%BA%BA%E4%B8%AD%E4%B9%8B%E9%BE%8D0_%E8%AA%93%E7%B4%84%E7%9A%84%E5%A0%B4%E6%89%80", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%8A%D8%A7%D9%83%D9%88%D8%B2%D8%A7_0"}	yakuza-0	2020-12-17 19:51:13.214563+00	2020-12-17 22:23:25.737882+00	NA
318	Jotun: Valhalla Edition	{"en": "Jotun: Valhalla Edition"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/c727a9083ce649e5b1cc6999c4fa2e5frcp1/sku/43fb9c029d0641e290fdbaedea1c3a40"}	jotun-valhalla-edition	2021-02-05 16:52:21.833758+00	2021-02-05 23:20:46.199995+00	T
133	Stellaris	{"da": "Stellaris", "de": "Stellaris", "en": "Stellaris", "es": "Stellaris", "fa": "استلاریس", "fi": "Stellaris (videopeli)", "fr": "Stellaris", "gl": "Stellaris", "it": "Stellaris (videogioco 2016)", "ja": "Stellaris", "ka": "Stellaris", "ko": "스텔라리스", "nn": "Stellaris", "pl": "Stellaris", "pt": "Stellaris (jogo eletrônico)", "ru": "Stellaris", "sv": "Stellaris (spel)", "tr": "Stellaris", "uk": "Stellaris", "vi": "Stellaris", "zh": "群星 (游戏)"}	Stellaris is a 4X grand strategy video game developed and published by Paradox Interactive. Stellaris's gameplay revolves around space exploration, managing an empire, diplomacy, and space warfare with other spacefaring civilizations. It was released worldwide for Windows, macOS, and Linux on May 9, 2016,[1] and was released on February 26, 2019 for PlayStation 4 and Xbox One.	{"en": "Stellaris is a 4X grand strategy video game developed and published by Paradox Interactive. Stellaris's gameplay revolves around space exploration, managing an empire, diplomacy, and space warfare with other spacefaring civilizations. It was released worldwide for Windows, macOS, and Linux on May 9, 2016,[1] and was released on February 26, 2019 for PlayStation 4 and Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/e/e7/Stellaris_cover_art.jpg"]	{"wikipedia_da": "https://da.wikipedia.org/wiki/Stellaris", "wikipedia_de": "https://de.wikipedia.org/wiki/Stellaris", "wikipedia_en": "https://en.wikipedia.org/wiki/Stellaris_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Stellaris", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A7%D8%B3%D8%AA%D9%84%D8%A7%D8%B1%DB%8C%D8%B3", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Stellaris_(videopeli)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Stellaris", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Stellaris", "wikipedia_it": "https://it.wikipedia.org/wiki/Stellaris_(videogioco_2016)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Stellaris", "wikipedia_ka": "https://ka.wikipedia.org/wiki/Stellaris", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%8A%A4%ED%85%94%EB%9D%BC%EB%A6%AC%EC%8A%A4", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Stellaris", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Stellaris", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Stellaris_(jogo_eletr%C3%B4nico)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Stellaris", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Stellaris_(spel)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Stellaris", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Stellaris", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Stellaris", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%BE%A4%E6%98%9F_(%E6%B8%B8%E6%88%8F)"}	stellaris	2020-12-18 16:36:43.483253+00	2020-12-18 16:51:24.55791+00	NA
205	Panzer Dragoon	{"de": "Panzer Dragoon", "en": "Panzer Dragoon", "fr": "Panzer Dragoon (jeu vidéo)", "it": "Panzer Dragoon", "nl": "Panzer Dragoon", "pl": "Panzer Dragoon", "ru": "Panzer Dragoon", "sv": "Panzer Dragoon", "zh": "飛龍騎士 (遊戲)"}	Panzer Dragoon (Japanese: パンツァードラグーン, Hepburn: Pantsā Doragūn) is a 1995 rail shooter video game for the Sega Saturn, published by Sega and developed by Sega's Team Andromeda studio. It is the first game in the Panzer Dragoon series. The game follows hunter Keil Fluge, who becomes the rider of a powerful dragon. The player moves an aiming reticle (representing the dragon's laser and Kyle's gun) and shoots enemies while the dragon flies through 3D environments on a predetermined track.	{"en": "Panzer Dragoon (Japanese: パンツァードラグーン, Hepburn: Pantsā Doragūn) is a 1995 rail shooter video game for the Sega Saturn, published by Sega and developed by Sega's Team Andromeda studio. It is the first game in the Panzer Dragoon series. The game follows hunter Keil Fluge, who becomes the rider of a powerful dragon. The player moves an aiming reticle (representing the dragon's laser and Kyle's gun) and shoots enemies while the dragon flies through 3D environments on a predetermined track."}	["https://upload.wikimedia.org/wikipedia/en/3/3c/PanzerDragoon_JeanGiraud.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Panzer_Dragoon", "wikipedia_en": "https://en.wikipedia.org/wiki/Panzer_Dragoon_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Panzer_Dragoon_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Panzer_Dragoon", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Panzer_Dragoon", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Panzer_Dragoon", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Panzer_Dragoon", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Panzer_Dragoon", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%A3%9B%E9%BE%8D%E9%A8%8E%E5%A3%AB_(%E9%81%8A%E6%88%B2)"}	panzer-dragoon	2020-12-21 16:12:04.099493+00	2020-12-21 16:12:04.099508+00	NA
167	FINAL FANTASY XV	{"en": "FINAL FANTASY XV"}	Final Fantasy XV[b] is an action role-playing game developed and published by Square Enix. The fifteenth main installment of the Final Fantasy series, it was released for the PlayStation 4 and Xbox One in 2016,  Microsoft Windows in 2018, and Stadia as a launch title in 2019. The game features an open world environment and action-based battle system, incorporating quick-switching weapons, elemental magic, and other features such as vehicle travel and camping. The base campaign was later expanded with downloadable content (DLC), adding further gameplay options such as additional playable characters and multiplayer.	{"en": "Final Fantasy XV[b] is an action role-playing game developed and published by Square Enix. The fifteenth main installment of the Final Fantasy series, it was released for the PlayStation 4 and Xbox One in 2016,  Microsoft Windows in 2018, and Stadia as a launch title in 2019. The game features an open world environment and action-based battle system, incorporating quick-switching weapons, elemental magic, and other features such as vehicle travel and camping. The base campaign was later expanded with downloadable content (DLC), adding further gameplay options such as additional playable characters and multiplayer."}	["https://upload.wikimedia.org/wikipedia/en/5/5a/FF_XV_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/a447622dbe084c3e9ace4f913a939afarcp1/sku/1611bf48ac784869bcbd1ce85bc71add"}	final-fantasy-xv	2020-12-20 04:21:08.988112+00	2021-02-05 23:20:46.063578+00	T
68	Streets of Rage 4	{"ar": "ستريتز أوف ريج 4", "en": "Streets of Rage 4", "es": "Streets of Rage 4", "fa": "شورش در شهر ۴", "fr": "Streets of Rage 4", "it": "Streets of Rage 4", "ja": "ベア・ナックルIV", "ko": "베어 너클 IV", "nl": "Streets of Rage 4", "pt": "Streets of Rage 4", "ru": "Streets of Rage 4", "vi": "Streets of Rage 4", "arz": "ستريتس اوف راج 4"}	Streets of Rage 4[a] is a beat 'em up game developed by Dotemu, Lizardcube, and Guard Crush Games. It is a continuation of Sega's Streets of Rage series, and was released in 2020 for Windows, Nintendo Switch, PlayStation 4, Xbox One, macOS, and Linux. It received generally positive reviews from critics.	{"en": "Streets of Rage 4[a] is a beat 'em up game developed by Dotemu, Lizardcube, and Guard Crush Games. It is a continuation of Sega's Streets of Rage series, and was released in 2020 for Windows, Nintendo Switch, PlayStation 4, Xbox One, macOS, and Linux. It received generally positive reviews from critics."}	["https://upload.wikimedia.org/wikipedia/en/d/d2/Streets_of_Rage_4.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D8%AA%D8%B1%D9%8A%D8%AA%D8%B2_%D8%A3%D9%88%D9%81_%D8%B1%D9%8A%D8%AC_4", "wikipedia_en": "https://en.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_es": "https://es.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B4%D9%88%D8%B1%D8%B4_%D8%AF%D8%B1_%D8%B4%D9%87%D8%B1_%DB%B4", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_it": "https://it.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%99%E3%82%A2%E3%83%BB%E3%83%8A%E3%83%83%E3%82%AF%E3%83%ABIV", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%B2%A0%EC%96%B4_%EB%84%88%ED%81%B4_IV", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Streets_of_Rage_4", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D8%AA%D8%B1%D9%8A%D8%AA%D8%B3_%D8%A7%D9%88%D9%81_%D8%B1%D8%A7%D8%AC_4"}	streets-of-rage-4	2020-12-17 19:51:10.555378+00	2020-12-17 22:23:23.929123+00	NA
159	Cyberpunk 2077	{"ar": "سايبر بانك 2077", "bn": "সাইবারপাঙ্ক ২০৭৭", "ca": "Cyberpunk 2077", "cs": "Cyberpunk 2077", "da": "Cyberpunk 2077", "de": "Cyberpunk 2077", "el": "Cyberpunk 2077", "en": "Cyberpunk 2077", "es": "Cyberpunk 2077", "eu": "Cyberpunk 2077", "fa": "سایبرپانک ۲۰۷۷", "fi": "Cyberpunk 2077", "fr": "Cyberpunk 2077", "he": "Cyberpunk 2077", "hi": "सायबरपंक 2077", "hy": "Cyberpunk 2077", "id": "Cyberpunk 2077", "it": "Cyberpunk 2077", "ja": "サイバーパンク2077", "ka": "Cyberpunk 2077", "ko": "사이버펑크 2077", "lt": "Cyberpunk 2077", "ms": "Cyberpunk 2077", "nb": "Cyberpunk 2077", "nl": "Cyberpunk 2077", "pl": "Cyberpunk 2077", "pt": "Cyberpunk 2077", "ru": "Cyberpunk 2077", "sv": "Cyberpunk 2077", "th": "ไซเบอร์พังก์ 2077", "tr": "Cyberpunk 2077", "uk": "Cyberpunk 2077", "vi": "Cyberpunk 2077", "zh": "赛博朋克2077", "arz": "سايبربونك 2077", "nan": "Cyberpunk 2077", "sah": "Cyberpunk 2077", "wuu": "赛博朋克2077", "yue": "數碼鬅客 2077"}	Cyberpunk 2077 is a 2020 action role-playing video game developed and published by CD Projekt. The story takes place in Night City, an open world set in the Cyberpunk universe. Players assume the first-person perspective of a customisable mercenary known as V, who can acquire skills in hacking and machinery with options for melee and ranged combat.	{"en": "Cyberpunk 2077 is a 2020 action role-playing video game developed and published by CD Projekt. The story takes place in Night City, an open world set in the Cyberpunk universe. Players assume the first-person perspective of a customisable mercenary known as V, who can acquire skills in hacking and machinery with options for melee and ranged combat."}	["https://upload.wikimedia.org/wikipedia/en/9/9f/Cyberpunk_2077_box_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D8%A7%D9%8A%D8%A8%D8%B1_%D8%A8%D8%A7%D9%86%D9%83_2077", "wikipedia_bn": "https://bn.wikipedia.org/wiki/%E0%A6%B8%E0%A6%BE%E0%A6%87%E0%A6%AC%E0%A6%BE%E0%A6%B0%E0%A6%AA%E0%A6%BE%E0%A6%99%E0%A7%8D%E0%A6%95_%E0%A7%A8%E0%A7%A6%E0%A7%AD%E0%A7%AD", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_da": "https://da.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_de": "https://de.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_el": "https://el.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_en": "https://en.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_es": "https://es.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_eu": "https://eu.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D8%A7%DB%8C%D8%A8%D8%B1%D9%BE%D8%A7%D9%86%DA%A9_%DB%B2%DB%B0%DB%B7%DB%B7", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_he": "https://he.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_hi": "https://hi.wikipedia.org/wiki/%E0%A4%B8%E0%A4%BE%E0%A4%AF%E0%A4%AC%E0%A4%B0%E0%A4%AA%E0%A4%82%E0%A4%95_2077", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_id": "https://id.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_it": "https://it.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B5%E3%82%A4%E3%83%90%E3%83%BC%E3%83%91%E3%83%B3%E3%82%AF2077", "wikipedia_ka": "https://ka.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%82%AC%EC%9D%B4%EB%B2%84%ED%8E%91%ED%81%AC_2077", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_ms": "https://ms.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_nb": "https://no.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%84%E0%B8%8B%E0%B9%80%E0%B8%9A%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%9E%E0%B8%B1%E0%B8%87%E0%B8%81%E0%B9%8C_2077", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%B5%9B%E5%8D%9A%E6%9C%8B%E5%85%8B2077", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D8%A7%D9%8A%D8%A8%D8%B1%D8%A8%D9%88%D9%86%D9%83_2077", "wikipedia_nan": "https://zh-min-nan.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_sah": "https://sah.wikipedia.org/wiki/Cyberpunk_2077", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E8%B5%9B%E5%8D%9A%E6%9C%8B%E5%85%8B2077", "wikipedia_yue": "https://zh-yue.wikipedia.org/wiki/%E6%95%B8%E7%A2%BC%E9%AC%85%E5%AE%A2_2077"}	cyberpunk-2077	2020-12-20 04:21:08.375009+00	2020-12-21 16:12:00.544536+00	NA
222	SteamWorld Heist	{"en": "SteamWorld Heist"}	SteamWorld Heist is a 2D turn-based tactics shooter developed by Swedish video game developer Image & Form. The third installment of the SteamWorld series and the sequel to SteamWorld Dig,[1] SteamWorld Heist has the player control Captain Piper Faraday, a smuggler and occasional pirate, as she recruits a ragtag team of robots and sets out on a space adventure. The objective of the game is for players to board, loot, and shoot their way through enemy spaceships.	{"en": "SteamWorld Heist is a 2D turn-based tactics shooter developed by Swedish video game developer Image & Form. The third installment of the SteamWorld series and the sequel to SteamWorld Dig,[1] SteamWorld Heist has the player control Captain Piper Faraday, a smuggler and occasional pirate, as she recruits a ragtag team of robots and sets out on a space adventure. The objective of the game is for players to board, loot, and shoot their way through enemy spaceships."}	["https://upload.wikimedia.org/wikipedia/en/1/12/SteamWorld_Heist_logo.jpg"]	{"stadia": "https://stadia.google.com/store/details/819cdf4b7ff94947941106571ccf41e5rcp1/sku/f47a1e1e9f0b43078e0a80c57068b085"}	steamworld-heist	2020-12-21 16:12:06.340227+00	2021-02-05 23:20:46.155502+00	E10+
110	Frostpunk	{"ca": "Frostpunk", "cs": "Frostpunk", "de": "Frostpunk", "en": "Frostpunk", "fa": "فراست‌پانک", "fi": "Frostpunk", "fr": "Frostpunk", "hu": "Frostpunk", "ja": "Frostpunk", "ka": "Frostpunk", "ko": "프로스트펑크", "pl": "Frostpunk", "ro": "Frostpunk", "ru": "Frostpunk", "uk": "Frostpunk", "zh": "冰汽时代", "arz": "فروستپونك", "lzh": "冰汽之世"}	Frostpunk is a city-building survival game developed and published by 11 bit studios. Players take on the role of a leader in an alternate-history late 19th century, in which they must build and maintain a city during a worldwide volcanic winter, managing resources, making choices on how to survive, and exploring the area outside their city for survivors, resources, or other useful items. The game features several scenarios to undertake, each with their own stories and different challenges.	{"en": "Frostpunk is a city-building survival game developed and published by 11 bit studios. Players take on the role of a leader in an alternate-history late 19th century, in which they must build and maintain a city during a worldwide volcanic winter, managing resources, making choices on how to survive, and exploring the area outside their city for survivors, resources, or other useful items. The game features several scenarios to undertake, each with their own stories and different challenges."}	["https://upload.wikimedia.org/wikipedia/en/a/a3/Frostpunk_cover_art.jpg"]	{"wikipedia_ca": "https://ca.wikipedia.org/wiki/Frostpunk", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Frostpunk", "wikipedia_de": "https://de.wikipedia.org/wiki/Frostpunk", "wikipedia_en": "https://en.wikipedia.org/wiki/Frostpunk", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%81%D8%B1%D8%A7%D8%B3%D8%AA%E2%80%8C%D9%BE%D8%A7%D9%86%DA%A9", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Frostpunk", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Frostpunk", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Frostpunk", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Frostpunk", "wikipedia_ka": "https://ka.wikipedia.org/wiki/Frostpunk", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%94%84%EB%A1%9C%EC%8A%A4%ED%8A%B8%ED%8E%91%ED%81%AC", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Frostpunk", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Frostpunk", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Frostpunk", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Frostpunk", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%86%B0%E6%B1%BD%E6%97%B6%E4%BB%A3", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%81%D8%B1%D9%88%D8%B3%D8%AA%D9%BE%D9%88%D9%86%D9%83", "wikipedia_lzh": "https://zh-classical.wikipedia.org/wiki/%E5%86%B0%E6%B1%BD%E4%B9%8B%E4%B8%96"}	frostpunk	2020-12-18 16:36:42.467725+00	2020-12-18 16:51:23.482559+00	NA
125	Observation	{"en": "Observation", "fr": "Observation (jeu vidéo)", "arz": "اوبسيرڤاتيون"}	Observation is an adventure-puzzle video game developed by Scottish[1] studio No Code and published by Devolver Digital.  The game, described as sci-fi thriller, puts the player in control of a space station AI in order to recover from the sudden, mysterious loss of its crew.[2]  Observation was released for Microsoft Windows and PlayStation 4 on May 21, 2019 and for Xbox One on June 25, 2020.[3][4]	{"en": "Observation is an adventure-puzzle video game developed by Scottish[1] studio No Code and published by Devolver Digital.  The game, described as sci-fi thriller, puts the player in control of a space station AI in order to recover from the sudden, mysterious loss of its crew.[2]  Observation was released for Microsoft Windows and PlayStation 4 on May 21, 2019 and for Xbox One on June 25, 2020.[3][4]"}	["https://upload.wikimedia.org/wikipedia/en/e/ea/Observation_Key_Art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Observation_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Observation_(jeu_vid%C3%A9o)", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D9%88%D8%A8%D8%B3%D9%8A%D8%B1%DA%A4%D8%A7%D8%AA%D9%8A%D9%88%D9%86"}	observation	2020-12-18 16:36:43.12232+00	2020-12-18 16:51:23.851394+00	NA
25	Dungeon of the Endless	{"en": "Dungeon of the Endless", "fr": "Dungeon of the Endless", "it": "Dungeon of the Endless"}	Dungeon of the Endless is a roguelike tower defense game developed by Amplitude Studios and released in October 2014 for Microsoft Windows and Mac OS X systems, August 2015 for iOS devices, and for Xbox One in March 2016. The PlayStation 4 and Nintendo Switch ports released in May 2020. It is the third game of their loosely connected Endless series, which includes Endless Space and Endless Legend.	{"en": "Dungeon of the Endless is a roguelike tower defense game developed by Amplitude Studios and released in October 2014 for Microsoft Windows and Mac OS X systems, August 2015 for iOS devices, and for Xbox One in March 2016. The PlayStation 4 and Nintendo Switch ports released in May 2020. It is the third game of their loosely connected Endless series, which includes Endless Space and Endless Legend."}	["https://upload.wikimedia.org/wikipedia/en/f/fb/Dungeon_of_the_Endless_Logo.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Dungeon_of_the_Endless", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Dungeon_of_the_Endless", "wikipedia_it": "https://it.wikipedia.org/wiki/Dungeon_of_the_Endless"}	dungeon-of-the-endless	2020-12-17 19:51:04.959111+00	2020-12-17 22:23:20.675924+00	NA
112	Halo Wars	{"ar": "هيلو وورز", "ca": "Halo Wars", "de": "Halo Wars", "en": "Halo Wars", "es": "Halo Wars", "fa": "نبردهای هیلو", "fi": "Halo Wars", "fr": "Halo Wars", "hi": "हेलो वॉर्स", "hu": "Halo Wars", "it": "Halo Wars", "ja": "Halo Wars", "ko": "헤일로 워즈", "mn": "Halo Wars", "nb": "Halo Wars", "nl": "Halo Wars", "pl": "Halo Wars", "pt": "Halo Wars", "ru": "Halo Wars", "sv": "Halo Wars", "uk": "Halo Wars", "zh": "星環戰役", "arz": "هالو وارس"}	Halo Wars is a real-time strategy (RTS) video game developed by Ensemble Studios and published by Microsoft Game Studios for the Xbox 360 video game console. It was released in Australia on February 26, 2009; in Europe on February 27; and in North America on March 3. The game is set in the science fiction universe of the Halo series in the year 2531, 21 years before the events of Halo: Combat Evolved. The player leads human soldiers aboard the warship Spirit of Fire in an effort to stop an ancient fleet of ships from falling into the hands of the genocidal alien Covenant.	{"en": "Halo Wars is a real-time strategy (RTS) video game developed by Ensemble Studios and published by Microsoft Game Studios for the Xbox 360 video game console. It was released in Australia on February 26, 2009; in Europe on February 27; and in North America on March 3. The game is set in the science fiction universe of the Halo series in the year 2531, 21 years before the events of Halo: Combat Evolved. The player leads human soldiers aboard the warship Spirit of Fire in an effort to stop an ancient fleet of ships from falling into the hands of the genocidal alien Covenant."}	["https://upload.wikimedia.org/wikipedia/en/f/f2/Halo_wars.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%87%D9%8A%D9%84%D9%88_%D9%88%D9%88%D8%B1%D8%B2", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Halo_Wars", "wikipedia_de": "https://de.wikipedia.org/wiki/Halo_Wars", "wikipedia_en": "https://en.wikipedia.org/wiki/Halo_Wars", "wikipedia_es": "https://es.wikipedia.org/wiki/Halo_Wars", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%86%D8%A8%D8%B1%D8%AF%D9%87%D8%A7%DB%8C_%D9%87%DB%8C%D9%84%D9%88", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Halo_Wars", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Halo_Wars", "wikipedia_hi": "https://hi.wikipedia.org/wiki/%E0%A4%B9%E0%A5%87%E0%A4%B2%E0%A5%8B_%E0%A4%B5%E0%A5%89%E0%A4%B0%E0%A5%8D%E0%A4%B8", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Halo_Wars", "wikipedia_it": "https://it.wikipedia.org/wiki/Halo_Wars", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Halo_Wars", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%97%A4%EC%9D%BC%EB%A1%9C_%EC%9B%8C%EC%A6%88", "wikipedia_mn": "https://mn.wikipedia.org/wiki/Halo_Wars", "wikipedia_nb": "https://no.wikipedia.org/wiki/Halo_Wars", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Halo_Wars", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Halo_Wars", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Halo_Wars", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Halo_Wars", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Halo_Wars", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Halo_Wars", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%98%9F%E7%92%B0%E6%88%B0%E5%BD%B9", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%87%D8%A7%D9%84%D9%88_%D9%88%D8%A7%D8%B1%D8%B3"}	halo-wars	2020-12-18 16:36:42.629543+00	2020-12-18 16:51:23.583071+00	NA
77	The Long Dark	{"br": "The Long Dark", "de": "The Long Dark", "en": "The Long Dark", "fa": "تاریکی طولانی", "fi": "The Long Dark", "fr": "The Long Dark", "gl": "The Long Dark", "hy": "The long dark", "it": "The Long Dark", "ko": "더 롱 다크", "ms": "The Long Dark", "nb": "The Long Dark", "pl": "The Long Dark", "pt": "The Long Dark", "ru": "The Long Dark", "sv": "The Long Dark", "tr": "The Long Dark", "uk": "The Long Dark", "zh": "漫漫長夜", "arz": "ث لونج دارك"}	The Long Dark is a first-person survival video game developed and published by Hinterland Studio. The player assumes the role of a crash-landed bush pilot who must survive the frigid Canadian wilderness after a geomagnetic regional storm disaster. The game received seed financing from the Canada Media Fund, and further funding was secured through a successful Kickstarter campaign in October 2013.[1][2]	{"en": "The Long Dark is a first-person survival video game developed and published by Hinterland Studio. The player assumes the role of a crash-landed bush pilot who must survive the frigid Canadian wilderness after a geomagnetic regional storm disaster. The game received seed financing from the Canada Media Fund, and further funding was secured through a successful Kickstarter campaign in October 2013.[1][2]"}	["https://upload.wikimedia.org/wikipedia/en/6/68/The_Long_Dark_Key_Art.jpg"]	{"wikipedia_br": "https://br.wikipedia.org/wiki/The_Long_Dark", "wikipedia_de": "https://de.wikipedia.org/wiki/The_Long_Dark", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Long_Dark", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AA%D8%A7%D8%B1%DB%8C%DA%A9%DB%8C_%D8%B7%D9%88%D9%84%D8%A7%D9%86%DB%8C", "wikipedia_fi": "https://fi.wikipedia.org/wiki/The_Long_Dark", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Long_Dark", "wikipedia_gl": "https://gl.wikipedia.org/wiki/The_Long_Dark", "wikipedia_hy": "https://hy.wikipedia.org/wiki/The_long_dark", "wikipedia_it": "https://it.wikipedia.org/wiki/The_Long_Dark", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%8D%94_%EB%A1%B1_%EB%8B%A4%ED%81%AC", "wikipedia_ms": "https://ms.wikipedia.org/wiki/The_Long_Dark", "wikipedia_nb": "https://no.wikipedia.org/wiki/The_Long_Dark", "wikipedia_pl": "https://pl.wikipedia.org/wiki/The_Long_Dark", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Long_Dark", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Long_Dark", "wikipedia_sv": "https://sv.wikipedia.org/wiki/The_Long_Dark", "wikipedia_tr": "https://tr.wikipedia.org/wiki/The_Long_Dark", "wikipedia_uk": "https://uk.wikipedia.org/wiki/The_Long_Dark", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%BC%AB%E6%BC%AB%E9%95%B7%E5%A4%9C", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AB_%D9%84%D9%88%D9%86%D8%AC_%D8%AF%D8%A7%D8%B1%D9%83"}	the-long-dark	2020-12-17 19:51:11.014653+00	2020-12-17 22:23:24.226397+00	NA
130	State of Decay 2	{"ar": "ستيت أف ديكاي 2", "br": "State of Decay 2", "de": "State of Decay 2", "en": "State of Decay 2", "es": "State of Decay 2", "fr": "State of Decay 2", "it": "State of Decay 2", "pt": "State of Decay 2", "ru": "State of Decay 2", "uk": "State of Decay 2", "arz": "ستيت اف ديكاى 2"}	State of Decay 2 is an open world zombie survival video game developed by Undead Labs and published by Xbox Game Studios. It is a sequel to the 2013 video game State of Decay. The game was released on May 22, 2018 for Microsoft Windows and Xbox One. An optimized version was also released for Xbox Series X/S on December 2, 2020. Like its predecessor, players are required to build a community, manage resources and survive against the horde of zombies. The game received mixed reviews from critics, who praised its difficulty, musical score and combat, but criticized the technical issues and the lack of depth in the survival and management mechanics.	{"en": "State of Decay 2 is an open world zombie survival video game developed by Undead Labs and published by Xbox Game Studios. It is a sequel to the 2013 video game State of Decay. The game was released on May 22, 2018 for Microsoft Windows and Xbox One. An optimized version was also released for Xbox Series X/S on December 2, 2020. Like its predecessor, players are required to build a community, manage resources and survive against the horde of zombies. The game received mixed reviews from critics, who praised its difficulty, musical score and combat, but criticized the technical issues and the lack of depth in the survival and management mechanics."}	["https://upload.wikimedia.org/wikipedia/en/9/9d/State_of_Decay_2_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D8%AA%D9%8A%D8%AA_%D8%A3%D9%81_%D8%AF%D9%8A%D9%83%D8%A7%D9%8A_2", "wikipedia_br": "https://br.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_de": "https://de.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_en": "https://en.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_es": "https://es.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_it": "https://it.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_pt": "https://pt.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_uk": "https://uk.wikipedia.org/wiki/State_of_Decay_2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D8%AA%D9%8A%D8%AA_%D8%A7%D9%81_%D8%AF%D9%8A%D9%83%D8%A7%D9%89_2"}	state-of-decay-2	2020-12-18 16:36:43.397034+00	2020-12-18 16:51:24.512402+00	NA
3	Age of Wonders: Planetfall	{"en": "Age of Wonders: Planetfall", "fr": "Age of Wonders: Planetfall", "ru": "Age of Wonders: Planetfall"}	Age of Wonders: Planetfall is a 4X turn-based strategy video game developed by Triumph Studios and published by Paradox Interactive. The game is the fifth installment in the Age of Wonders series and features a sci-fi setting. It released for Microsoft Windows, PlayStation 4 and Xbox One in August 2019.	{"en": "Age of Wonders: Planetfall is a 4X turn-based strategy video game developed by Triumph Studios and published by Paradox Interactive. The game is the fifth installment in the Age of Wonders series and features a sci-fi setting. It released for Microsoft Windows, PlayStation 4 and Xbox One in August 2019."}	["https://upload.wikimedia.org/wikipedia/en/3/3d/Age_of_Wonders_Planetfall_cover_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Age_of_Wonders:_Planetfall", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Age_of_Wonders:_Planetfall", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Age_of_Wonders:_Planetfall"}	age-of-wonders-planetfall	2020-12-13 04:35:52.862532+00	2020-12-17 22:23:19.826953+00	NA
18	Children of Morta	{"en": "Children of Morta", "fa": "فرزندان مورتا", "fr": "Children of Morta", "ru": "Children of Morta", "uk": "Children of Morta", "arz": "كيلدرين اوف مورتا"}	Children of Morta is an action role-playing video game with roguelike elements, released in September 2019. Developed by studio Dead Mage, it follows the story of the Bergson family, custodians of Mount Morta, who must defend it from an evil called the Corruption.[1][2][3][4]	{"en": "Children of Morta is an action role-playing video game with roguelike elements, released in September 2019. Developed by studio Dead Mage, it follows the story of the Bergson family, custodians of Mount Morta, who must defend it from an evil called the Corruption.[1][2][3][4]"}	["https://upload.wikimedia.org/wikipedia/en/a/ae/Children_of_Morta.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Children_of_Morta", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%81%D8%B1%D8%B2%D9%86%D8%AF%D8%A7%D9%86_%D9%85%D9%88%D8%B1%D8%AA%D8%A7", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Children_of_Morta", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Children_of_Morta", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Children_of_Morta", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%83%D9%8A%D9%84%D8%AF%D8%B1%D9%8A%D9%86_%D8%A7%D9%88%D9%81_%D9%85%D9%88%D8%B1%D8%AA%D8%A7"}	children-of-morta	2020-12-17 19:51:04.67579+00	2020-12-17 22:23:20.276763+00	NA
166	FIFA 21	{"ar": "فيفا 21", "de": "FIFA 21", "en": "FIFA 21", "es": "FIFA 21", "fa": "فیفا ۲۱", "fi": "FIFA 21", "fr": "FIFA 21", "it": "FIFA 21", "ja": "FIFA 21", "ko": "FIFA 21", "nl": "FIFA 21", "pt": "FIFA 21", "ro": "FIFA 21", "ru": "FIFA 21", "sv": "FIFA 21", "tr": "FIFA 21", "zh": "FIFA 21", "arz": "فيفا 21"}	FIFA 21 is a football simulation video game published by Electronic Arts as part of the FIFA series.[1] It is the 28th installment in the FIFA series, and was released 9 October 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One. Enhanced versions for the PlayStation 5 and Xbox Series X and Series S were released on 3 December 2020, in addition to a version for Stadia.	{"en": "FIFA 21 is a football simulation video game published by Electronic Arts as part of the FIFA series.[1] It is the 28th installment in the FIFA series, and was released 9 October 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One. Enhanced versions for the PlayStation 5 and Xbox Series X and Series S were released on 3 December 2020, in addition to a version for Stadia."}	["https://upload.wikimedia.org/wikipedia/en/b/bb/FIFA_21_Standard_Edition_Cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%81%D9%8A%D9%81%D8%A7_21", "wikipedia_de": "https://de.wikipedia.org/wiki/FIFA_21", "wikipedia_en": "https://en.wikipedia.org/wiki/FIFA_21", "wikipedia_es": "https://es.wikipedia.org/wiki/FIFA_21", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%81%DB%8C%D9%81%D8%A7_%DB%B2%DB%B1", "wikipedia_fi": "https://fi.wikipedia.org/wiki/FIFA_21", "wikipedia_fr": "https://fr.wikipedia.org/wiki/FIFA_21", "wikipedia_it": "https://it.wikipedia.org/wiki/FIFA_21", "wikipedia_ja": "https://ja.wikipedia.org/wiki/FIFA_21", "wikipedia_ko": "https://ko.wikipedia.org/wiki/FIFA_21", "wikipedia_nl": "https://nl.wikipedia.org/wiki/FIFA_21", "wikipedia_pt": "https://pt.wikipedia.org/wiki/FIFA_21", "wikipedia_ro": "https://ro.wikipedia.org/wiki/FIFA_21", "wikipedia_ru": "https://ru.wikipedia.org/wiki/FIFA_21", "wikipedia_sv": "https://sv.wikipedia.org/wiki/FIFA_21", "wikipedia_tr": "https://tr.wikipedia.org/wiki/FIFA_21", "wikipedia_zh": "https://zh.wikipedia.org/wiki/FIFA_21", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%81%D9%8A%D9%81%D8%A7_21"}	fifa-21	2020-12-20 04:21:08.900364+00	2020-12-21 16:12:00.991659+00	NA
258	The Sexy Brutale	{"en": "The Sexy Brutale", "es": "The Sexy Brutale", "fr": "The Sexy Brutale", "zh": "性感的殘酷", "arz": "ث سيكسى بروتال"}	The Sexy Brutale is an adventure puzzle video game developed by Cavalier Game Studios and Tequila Works. The game was released for PlayStation 4, Windows, and Xbox One in April 2017. A Nintendo Switch version was released in December 2017.	{"en": "The Sexy Brutale is an adventure puzzle video game developed by Cavalier Game Studios and Tequila Works. The game was released for PlayStation 4, Windows, and Xbox One in April 2017. A Nintendo Switch version was released in December 2017."}	["https://upload.wikimedia.org/wikipedia/en/9/9f/Sexy_Brutale_cover.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/The_Sexy_Brutale", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Sexy_Brutale", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Sexy_Brutale", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%80%A7%E6%84%9F%E7%9A%84%E6%AE%98%E9%85%B7", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AB_%D8%B3%D9%8A%D9%83%D8%B3%D9%89_%D8%A8%D8%B1%D9%88%D8%AA%D8%A7%D9%84"}	the-sexy-brutale	2020-12-21 19:56:03.4125+00	2020-12-21 19:56:03.412523+00	NA
23	Dead Island: Riptide	{"ar": "ديد آيلاند: ريبتايد", "az": "Dead Island: Riptide", "de": "Dead Island: Riptide", "en": "Dead Island: Riptide", "es": "Dead Island: Riptide", "fa": "جزیره مرده: آب‌های خروشان", "fi": "Dead Island: Riptide", "fr": "Dead Island: Riptide", "it": "Dead Island Riptide", "ko": "데드 아일랜드 립타이드", "nl": "Dead Island: Riptide", "pl": "Dead Island Riptide", "pt": "Dead Island: Riptide", "ru": "Dead Island: Riptide", "sv": "Dead Island: Riptide", "tr": "Dead Island: Riptide", "uk": "Dead Island: Riptide"}	Dead Island: Riptide is a survival horror video game and sequel to Dead Island developed by Techland and published by Deep Silver, released in April 2013 for Microsoft Windows, PlayStation 3 and Xbox 360. Riptide serves as a continuation of the story to 2011's Dead Island, with the original four survivors, plus a new survivor, arriving on another island in the Banoi archipelago, which has also been overrun by zombies.	{"en": "Dead Island: Riptide is a survival horror video game and sequel to Dead Island developed by Techland and published by Deep Silver, released in April 2013 for Microsoft Windows, PlayStation 3 and Xbox 360. Riptide serves as a continuation of the story to 2011's Dead Island, with the original four survivors, plus a new survivor, arriving on another island in the Banoi archipelago, which has also been overrun by zombies."}	["https://upload.wikimedia.org/wikipedia/en/f/fa/DeadIslandRiptide.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AF%D9%8A%D8%AF_%D8%A2%D9%8A%D9%84%D8%A7%D9%86%D8%AF:_%D8%B1%D9%8A%D8%A8%D8%AA%D8%A7%D9%8A%D8%AF", "wikipedia_az": "https://az.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_de": "https://de.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_en": "https://en.wikipedia.org/wiki/Dead_Island_Definitive_Edition", "wikipedia_es": "https://es.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AC%D8%B2%DB%8C%D8%B1%D9%87_%D9%85%D8%B1%D8%AF%D9%87:_%D8%A2%D8%A8%E2%80%8C%D9%87%D8%A7%DB%8C_%D8%AE%D8%B1%D9%88%D8%B4%D8%A7%D9%86", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_it": "https://it.wikipedia.org/wiki/Dead_Island_Riptide", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%8D%B0%EB%93%9C_%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C_%EB%A6%BD%ED%83%80%EC%9D%B4%EB%93%9C", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Dead_Island_Riptide", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Dead_Island:_Riptide", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Dead_Island:_Riptide"}	dead-island-riptide	2020-12-17 19:51:04.876678+00	2020-12-17 22:23:20.320392+00	NA
43	Hypnospace Outlaw	{"en": "Hypnospace Outlaw", "fr": "Hypnospace Outlaw"}	Hypnospace Outlaw is a simulation video game developed by Tendershoot and published by No More Robots.[4] Set in an alternate-history 1999, the game takes place inside a parody of the early Internet that users visit in their sleep called Hypnospace.[5] The player assumes the role of an "Enforcer" for the company "Merchantsoft"—creator of Hypnospace—and seeks to police illegal content, copyright violations, viruses, and cyberbullying by users on the service. In the process, the player engages in detective work and puzzle-solving.[6] It was released for Microsoft Windows, macOS, and Linux in March 2019, and for Nintendo Switch, PlayStation 4, and Xbox One in August 2020.	{"en": "Hypnospace Outlaw is a simulation video game developed by Tendershoot and published by No More Robots.[4] Set in an alternate-history 1999, the game takes place inside a parody of the early Internet that users visit in their sleep called Hypnospace.[5] The player assumes the role of an \\"Enforcer\\" for the company \\"Merchantsoft\\"—creator of Hypnospace—and seeks to police illegal content, copyright violations, viruses, and cyberbullying by users on the service. In the process, the player engages in detective work and puzzle-solving.[6] It was released for Microsoft Windows, macOS, and Linux in March 2019, and for Nintendo Switch, PlayStation 4, and Xbox One in August 2020."}	["https://upload.wikimedia.org/wikipedia/en/7/77/Hypnospace_Outlaw.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Hypnospace_Outlaw", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Hypnospace_Outlaw"}	hypnospace-outlaw	2020-12-17 19:51:06.475542+00	2020-12-17 22:23:21.673995+00	NA
322	Kine	{"en": "Kine"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/da94f3aa88b24eb6ae6fdff798f73355rcp1/sku/8d3124a81f6444219acd3d99c90a5658"}	kine	2021-02-05 16:52:21.90602+00	2021-02-05 23:20:47.612299+00	E
184	Lara Croft and the Temple of Osiris	{"en": "Lara Croft and the Temple of Osiris"}	Lara Croft and the Temple of Osiris is an action-adventure game developed by Crystal Dynamics and published by Square Enix for Windows, PlayStation 4, Xbox One and Stadia.  It is the sequel to the 2010 video game Lara Croft and the Guardian of Light, and the second installment in Lara Croft spin-off series of the Tomb Raider franchise.  The video game was announced at E3 2014 on 9 June. This game marks the last time  English actress Keeley Hawes provides the voice for Lara Croft.[1]	{"en": "Lara Croft and the Temple of Osiris is an action-adventure game developed by Crystal Dynamics and published by Square Enix for Windows, PlayStation 4, Xbox One and Stadia.  It is the sequel to the 2010 video game Lara Croft and the Guardian of Light, and the second installment in Lara Croft spin-off series of the Tomb Raider franchise.  The video game was announced at E3 2014 on 9 June. This game marks the last time  English actress Keeley Hawes provides the voice for Lara Croft.[1]"}	["https://upload.wikimedia.org/wikipedia/en/1/11/Lara_croft_and_the_temple_of_osiris_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/6d0d865669774338b3ce888a84da6cdercp1/sku/163efc95783a4c39839c218b75e36127"}	lara-croft-and-the-temple-of-osiris	2020-12-21 16:12:02.073183+00	2021-02-05 23:20:46.320316+00	T
200	NBA 2k20	{"en": "NBA 2k20"}	NBA 2K20 is a basketball simulation video game developed by Visual Concepts and published by 2K Sports, based on the National Basketball Association (NBA). It is the 21st installment in the NBA 2K franchise, the successor to NBA 2K19, and the predecessor to NBA 2K21. Anthony Davis of the Los Angeles Lakers is the cover athlete for the regular edition of the game, while Dwyane Wade is the cover athlete for the 'Legend Edition'.	{"en": "NBA 2K20 is a basketball simulation video game developed by Visual Concepts and published by 2K Sports, based on the National Basketball Association (NBA). It is the 21st installment in the NBA 2K franchise, the successor to NBA 2K19, and the predecessor to NBA 2K21. Anthony Davis of the Los Angeles Lakers is the cover athlete for the regular edition of the game, while Dwyane Wade is the cover athlete for the 'Legend Edition'."}	["https://upload.wikimedia.org/wikipedia/en/e/e9/NBA_2K20_cover.png"]	{"stadia": "https://stadia.google.com/store/details/2afad3696b394f669b49e4c0b6016958rcp1/sku/b6d1b295ed0d4f1080576ac5d51df6d0"}	nba-2k20	2020-12-21 16:12:03.704133+00	2021-02-05 23:20:47.397495+00	E
97	Wasteland 3	{"de": "Wasteland 3", "en": "Wasteland 3", "es": "Wasteland 3", "fa": "ویست‌لند ۳", "fr": "Wasteland 3", "pt": "Wasteland 3", "ru": "Wasteland 3", "tr": "Wasteland 3", "uk": "Wasteland 3", "zh": "废土3", "arz": "واستيلاند 3"}	Wasteland 3 is a role-playing video game developed by inXile Entertainment and published by Deep Silver. It is a sequel to Wasteland 2 (2014) and was released for Microsoft Windows, PlayStation 4 and Xbox One on August 28, 2020. It was ported to Linux and macOS on December 17, 2020.[1]	{"en": "Wasteland 3 is a role-playing video game developed by inXile Entertainment and published by Deep Silver. It is a sequel to Wasteland 2 (2014) and was released for Microsoft Windows, PlayStation 4 and Xbox One on August 28, 2020. It was ported to Linux and macOS on December 17, 2020.[1]"}	["https://upload.wikimedia.org/wikipedia/en/4/45/Wasteland_3_cover_art.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Wasteland_3", "wikipedia_en": "https://en.wikipedia.org/wiki/Wasteland_3", "wikipedia_es": "https://es.wikipedia.org/wiki/Wasteland_3", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%88%DB%8C%D8%B3%D8%AA%E2%80%8C%D9%84%D9%86%D8%AF_%DB%B3", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Wasteland_3", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Wasteland_3", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Wasteland_3", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Wasteland_3", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Wasteland_3", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%BA%9F%E5%9C%9F3", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%88%D8%A7%D8%B3%D8%AA%D9%8A%D9%84%D8%A7%D9%86%D8%AF_3"}	wasteland-3	2020-12-17 19:51:13.081406+00	2020-12-17 22:23:24.929132+00	NA
87	Train Sim World	{"de": "Train Sim World", "en": "Train Sim World", "ru": "Train Sim World", "vi": "Train Sim World", "zh": "模拟火车世界", "wuu": "模拟火车世界"}	Train Sim World (abbreviated to TSW) is a train simulation game developed by Dovetail Games. It was released on 24 July 2018.[1] For the first time, Train Sim World allows players to walk around the game world in first-person mode. This mode is utilised in tutorials, scenarios and services where the first-person mode is required to complete tasks such as refuelling or changing switches.[1]	{"en": "Train Sim World (abbreviated to TSW) is a train simulation game developed by Dovetail Games. It was released on 24 July 2018.[1] For the first time, Train Sim World allows players to walk around the game world in first-person mode. This mode is utilised in tutorials, scenarios and services where the first-person mode is required to complete tasks such as refuelling or changing switches.[1]"}	["https://upload.wikimedia.org/wikipedia/en/4/44/Train_Sim_World_Cover.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Train_Sim_World", "wikipedia_en": "https://en.wikipedia.org/wiki/Train_Sim_World_2020", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Train_Sim_World", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Train_Sim_World", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%A8%A1%E6%8B%9F%E7%81%AB%E8%BD%A6%E4%B8%96%E7%95%8C", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E6%A8%A1%E6%8B%9F%E7%81%AB%E8%BD%A6%E4%B8%96%E7%95%8C"}	train-sim-world	2020-12-17 19:51:11.851386+00	2020-12-17 22:23:24.979443+00	NA
61	Pathologic 2	{"en": "Pathologic 2", "eo": "Pathologic 2", "fr": "Pathologic 2", "ru": "Мор (игра)"}	Pathologic 2 (Russian: Мор, tr. Mor, IPA: [mˈor], lit. 'Pestilence') is an adventure game by Ice-Pick Lodge and published by tinyBuild. Originally planned as a remake of the 2005 video game Pathologic, it has been set to be a complete reimagining of the original game. The game is planned to be released in three parts, each one dedicated to the story of one of the three main characters. The first part telling the story of the Haruspex was released 23 May 2019.[1]	{"en": "Pathologic 2 (Russian: Мор, tr. Mor, IPA: [mˈor], lit. 'Pestilence') is an adventure game by Ice-Pick Lodge and published by tinyBuild. Originally planned as a remake of the 2005 video game Pathologic, it has been set to be a complete reimagining of the original game. The game is planned to be released in three parts, each one dedicated to the story of one of the three main characters. The first part telling the story of the Haruspex was released 23 May 2019.[1]"}	["https://upload.wikimedia.org/wikipedia/en/d/d7/Pathologic_2_Logo.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Pathologic_2", "wikipedia_eo": "https://eo.wikipedia.org/wiki/Pathologic_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Pathologic_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/%D0%9C%D0%BE%D1%80_(%D0%B8%D0%B3%D1%80%D0%B0)"}	pathologic-2	2020-12-17 19:51:07.97408+00	2020-12-17 22:23:22.92009+00	NA
103	DayZ	{"ar": "داي زي", "br": "DayZ (c'hoari video)", "cs": "DayZ", "da": "DayZ", "de": "DayZ", "en": "DayZ", "es": "DayZ", "fi": "DayZ (videopeli)", "fr": "DayZ", "it": "DayZ Standalone", "ja": "DayZ (ゲーム)", "ka": "DayZ", "ko": "데이즈 (비디오 게임)", "pl": "DayZ (gra komputerowa)", "pt": "DayZ", "ru": "DayZ (игра)", "sv": "DayZ (datorspel)", "tr": "DayZ", "uk": "DayZ (гра)", "arz": "داى زى"}	DayZ is a survival video game developed and published by Bohemia Interactive. It is the standalone successor of the mod of the same name. Following a five-year long early access period for Windows, the game was officially released in December 2018, and was released for the Xbox One and PlayStation 4 in 2019.	{"en": "DayZ is a survival video game developed and published by Bohemia Interactive. It is the standalone successor of the mod of the same name. Following a five-year long early access period for Windows, the game was officially released in December 2018, and was released for the Xbox One and PlayStation 4 in 2019."}	["https://upload.wikimedia.org/wikipedia/en/9/90/DayZ_Standalone_Logo.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AF%D8%A7%D9%8A_%D8%B2%D9%8A", "wikipedia_br": "https://br.wikipedia.org/wiki/DayZ_(c%27hoari_video)", "wikipedia_cs": "https://cs.wikipedia.org/wiki/DayZ", "wikipedia_da": "https://da.wikipedia.org/wiki/DayZ", "wikipedia_de": "https://de.wikipedia.org/wiki/DayZ", "wikipedia_en": "https://en.wikipedia.org/wiki/DayZ_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/DayZ", "wikipedia_fi": "https://fi.wikipedia.org/wiki/DayZ_(videopeli)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/DayZ", "wikipedia_it": "https://it.wikipedia.org/wiki/DayZ_Standalone", "wikipedia_ja": "https://ja.wikipedia.org/wiki/DayZ_(%E3%82%B2%E3%83%BC%E3%83%A0)", "wikipedia_ka": "https://ka.wikipedia.org/wiki/DayZ", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%8D%B0%EC%9D%B4%EC%A6%88_(%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_pl": "https://pl.wikipedia.org/wiki/DayZ_(gra_komputerowa)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/DayZ", "wikipedia_ru": "https://ru.wikipedia.org/wiki/DayZ_(%D0%B8%D0%B3%D1%80%D0%B0)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/DayZ_(datorspel)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/DayZ", "wikipedia_uk": "https://uk.wikipedia.org/wiki/DayZ_(%D0%B3%D1%80%D0%B0)", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AF%D8%A7%D9%89_%D8%B2%D9%89"}	dayz	2020-12-18 16:36:41.927944+00	2020-12-18 16:51:22.691897+00	NA
88	Untitled Goose Game	{"en": "Untitled Goose Game", "es": "Untitled Goose Game", "fr": "Untitled Goose Game", "hu": "Untitled Goose Game", "it": "Untitled Goose Game", "ja": "Untitled Goose Game 〜いたずらガチョウがやって来た!〜", "ko": "Untitled Goose Game", "ms": "Untitled Goose Game", "nl": "Untitled Goose Game", "pt": "Untitled Goose Game", "ru": "Untitled Goose Game", "tl": "Untitled Goose Game", "tr": "Untitled Goose Game", "vi": "Untitled Goose Game", "zh": "鹅作剧", "arz": "انتيتليد جوس جام"}	Untitled Goose Game[a] is a 2019 puzzle stealth video game developed by House House and published by Panic. In the game, players control a goose who bothers the inhabitants of an English village. The player must use the goose's abilities to manipulate objects and non-player characters in order to complete specific objectives and progress through the game. It was released for Microsoft Windows, macOS, Nintendo Switch, PlayStation 4, and Xbox One.	{"en": "Untitled Goose Game[a] is a 2019 puzzle stealth video game developed by House House and published by Panic. In the game, players control a goose who bothers the inhabitants of an English village. The player must use the goose's abilities to manipulate objects and non-player characters in order to complete specific objectives and progress through the game. It was released for Microsoft Windows, macOS, Nintendo Switch, PlayStation 4, and Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/d/db/Untitled_Goose_Game_video_game_cover_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_es": "https://es.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_it": "https://it.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Untitled_Goose_Game_%E3%80%9C%E3%81%84%E3%81%9F%E3%81%9A%E3%82%89%E3%82%AC%E3%83%81%E3%83%A7%E3%82%A6%E3%81%8C%E3%82%84%E3%81%A3%E3%81%A6%E6%9D%A5%E3%81%9F!%E3%80%9C", "wikipedia_ko": "https://ko.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_ms": "https://ms.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_tl": "https://tl.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Untitled_Goose_Game", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%B9%85%E4%BD%9C%E5%89%A7", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D9%86%D8%AA%D9%8A%D8%AA%D9%84%D9%8A%D8%AF_%D8%AC%D9%88%D8%B3_%D8%AC%D8%A7%D9%85"}	untitled-goose-game	2020-12-17 19:51:11.870022+00	2020-12-17 22:23:25.168008+00	NA
90	theHunter	{"en": "theHunter", "fi": "The Hunter (videopeli)", "fr": "The Hunter (jeu vidéo)", "pt": "The Hunter (jogo eletrônico)", "sv": "TheHunter", "tr": "TheHunter", "uk": "TheHunter"}	theHunter is a series of simulation video games developed by Expansive Worlds and published by its parent company, Avalanche Studios. The first game in the series, known as theHunter, was developed and published by Emote Games, in association with Avalanche Studios, and released in April 2009. Subsequently, Avalanche Studios bought the rights to the franchise and opened Expansive Worlds as a subsidiary that would exclusively focus on theHunter development. A standalone expansion, theHunter: Primal, was developed and published by Expansive Worlds and Avalanche Studios, and released in March 2015. The most recent entry in the series, theHunter: Call of the Wild, was developed by Expansive Worlds and published by Avalanche Studios in February 2017.	{"en": "theHunter is a series of simulation video games developed by Expansive Worlds and published by its parent company, Avalanche Studios. The first game in the series, known as theHunter, was developed and published by Emote Games, in association with Avalanche Studios, and released in April 2009. Subsequently, Avalanche Studios bought the rights to the franchise and opened Expansive Worlds as a subsidiary that would exclusively focus on theHunter development. A standalone expansion, theHunter: Primal, was developed and published by Expansive Worlds and Avalanche Studios, and released in March 2015. The most recent entry in the series, theHunter: Call of the Wild, was developed by Expansive Worlds and published by Avalanche Studios in February 2017."}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/TheHunter:_Call_of_the_Wild", "wikipedia_fi": "https://fi.wikipedia.org/wiki/The_Hunter_(videopeli)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Hunter_(jeu_vid%C3%A9o)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Hunter_(jogo_eletr%C3%B4nico)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/TheHunter", "wikipedia_tr": "https://tr.wikipedia.org/wiki/TheHunter", "wikipedia_uk": "https://uk.wikipedia.org/wiki/TheHunter"}	thehunter	2020-12-17 19:51:12.034599+00	2020-12-17 22:23:24.750659+00	NA
12	Bridge Constructor Portal	{"en": "Bridge Constructor Portal", "es": "Bridge Constructor: Portal", "fr": "Bridge Constructor Portal", "pt": "Bridge Constructor Portal", "ru": "Bridge Constructor Portal", "arz": "بريدج كونستروكتور پورتال"}	Bridge Constructor Portal is an engineering simulation and puzzle video game developed by ClockStone and published by Headup Games. The game is part of the Bridge Constructor series, and incorporates elements of Valve's Portal series, taking place in Aperture Laboratories. The game was released on Android, iOS, Linux, macOS and Windows in December 2017, and for the Nintendo Switch, PlayStation 4, and Xbox One in February 2018. By August 2018, the game had sold over 500,000 copies.	{"en": "Bridge Constructor Portal is an engineering simulation and puzzle video game developed by ClockStone and published by Headup Games. The game is part of the Bridge Constructor series, and incorporates elements of Valve's Portal series, taking place in Aperture Laboratories. The game was released on Android, iOS, Linux, macOS and Windows in December 2017, and for the Nintendo Switch, PlayStation 4, and Xbox One in February 2018. By August 2018, the game had sold over 500,000 copies."}	["https://upload.wikimedia.org/wikipedia/en/1/1d/Bridge_constructor_portal_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Bridge_Constructor_Portal", "wikipedia_es": "https://es.wikipedia.org/wiki/Bridge_Constructor:_Portal", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Bridge_Constructor_Portal", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Bridge_Constructor_Portal", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Bridge_Constructor_Portal", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A8%D8%B1%D9%8A%D8%AF%D8%AC_%D9%83%D9%88%D9%86%D8%B3%D8%AA%D8%B1%D9%88%D9%83%D8%AA%D9%88%D8%B1_%D9%BE%D9%88%D8%B1%D8%AA%D8%A7%D9%84"}	bridge-constructor-portal	2020-12-17 19:51:04.347361+00	2020-12-17 22:23:20.405837+00	NA
84	Touhou Luna Nights	{"en": "Touhou Luna Nights", "zh": "東方月神夜"}	Touhou Luna Nights is a Metroidvania Touhou Project fangame released by Team Ladybug in 2018 for Microsoft Windows and Xbox One.	{"en": "Touhou Luna Nights is a Metroidvania Touhou Project fangame released by Team Ladybug in 2018 for Microsoft Windows and Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/1/17/Touhou_Luna_Nights_banner.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Touhou_Luna_Nights", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%9D%B1%E6%96%B9%E6%9C%88%E7%A5%9E%E5%A4%9C"}	touhou-luna-nights	2020-12-17 19:51:11.718145+00	2020-12-17 22:23:24.898303+00	NA
99	Yakuza Kiwami	{"ar": "ياكوزا كيوامي", "br": "Yakuza Kiwami", "en": "Yakuza Kiwami", "it": "Yakuza Kiwami", "ko": "용과 같이 극", "ru": "Yakuza Kiwami", "th": "ยากูซ่าคิวามิ", "arz": "ياكوزا كيوامى"}	Yakuza Kiwami[a] is an action-adventure video game developed by Sega. It is a remake of Yakuza, the first game in the Yakuza series, originally released on Sony's PlayStation 2. Yakuza Kiwami was released on PlayStation 3 and PlayStation 4 in Japan on January 21, 2016, and on PlayStation 4 in Europe and North America on August 29, 2017.[1][2] It was also ported for Microsoft Windows worldwide on Steam on February 19, 2019,[3] and was released on Xbox One on April 21, 2020.[4]	{"en": "Yakuza Kiwami[a] is an action-adventure video game developed by Sega. It is a remake of Yakuza, the first game in the Yakuza series, originally released on Sony's PlayStation 2. Yakuza Kiwami was released on PlayStation 3 and PlayStation 4 in Japan on January 21, 2016, and on PlayStation 4 in Europe and North America on August 29, 2017.[1][2] It was also ported for Microsoft Windows worldwide on Steam on February 19, 2019,[3] and was released on Xbox One on April 21, 2020.[4]"}	["https://upload.wikimedia.org/wikipedia/en/0/02/Yakuza_Kiwami_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%8A%D8%A7%D9%83%D9%88%D8%B2%D8%A7_%D9%83%D9%8A%D9%88%D8%A7%D9%85%D9%8A", "wikipedia_br": "https://br.wikipedia.org/wiki/Yakuza_Kiwami", "wikipedia_en": "https://en.wikipedia.org/wiki/Yakuza_Kiwami", "wikipedia_it": "https://it.wikipedia.org/wiki/Yakuza_Kiwami", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9A%A9%EA%B3%BC_%EA%B0%99%EC%9D%B4_%EA%B7%B9", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Yakuza_Kiwami", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%A2%E0%B8%B2%E0%B8%81%E0%B8%B9%E0%B8%8B%E0%B9%88%E0%B8%B2%E0%B8%84%E0%B8%B4%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%B4", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%8A%D8%A7%D9%83%D9%88%D8%B2%D8%A7_%D9%83%D9%8A%D9%88%D8%A7%D9%85%D9%89"}	yakuza-kiwami	2020-12-17 19:51:13.106094+00	2020-12-17 22:23:25.659711+00	NA
141	Enter The Gungeon	{"en": "Enter The Gungeon"}	Enter the Gungeon is a bullet hell roguelike video game developed by Dodge Roll and published by Devolver Digital. The game was released worldwide for Microsoft Windows, OS X, Linux, and PlayStation 4 on April 5, 2016, on Xbox One on April 5, 2017, as well as on Nintendo Switch on December 14, 2017.	{"en": "Enter the Gungeon is a bullet hell roguelike video game developed by Dodge Roll and published by Devolver Digital. The game was released worldwide for Microsoft Windows, OS X, Linux, and PlayStation 4 on April 5, 2016, on Xbox One on April 5, 2017, as well as on Nintendo Switch on December 14, 2017."}	[]	{"stadia": "https://stadia.google.com/store/details/8f0addba5d3d4c05b07d7b59481e0171rcp1/sku/de13900e4bc8442b9f1ddead7baaec6dp"}	enter-the-gungeon	2020-12-18 16:41:43.888765+00	2021-02-05 23:20:45.872922+00	T
132	The Messenger	{"en": "The Messenger", "fr": "The Messenger (jeu vidéo, 2018)", "pt": "The Messenger (jogo eletrônico)", "tr": "The Messenger (2018 video oyunu)"}	The Messenger is an action-platform video game developed by Sabotage Studio and published by Devolver Digital for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One.[1][2][3]	{"en": "The Messenger is an action-platform video game developed by Sabotage Studio and published by Devolver Digital for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One.[1][2][3]"}	["https://upload.wikimedia.org/wikipedia/en/4/4f/The_Messenger_cover_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/The_Messenger_(2018_video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Messenger_(jeu_vid%C3%A9o,_2018)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Messenger_(jogo_eletr%C3%B4nico)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/The_Messenger_(2018_video_oyunu)"}	the-messenger	2020-12-18 16:36:43.476705+00	2020-12-18 16:51:24.461048+00	NA
319	PHOGS!	{"en": "PHOGS!"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/05b9db9b9b5b489995568afd930a9db3rcp1/sku/6efd691ecc1c4c50a1a314bb085fb2d7p"}	phogs	2021-02-05 16:52:21.860475+00	2021-02-05 23:20:46.612639+00	E
243	Zombie Army 4: Dead War	{"en": "Zombie Army 4: Dead War"}	Zombie Army 4: Dead War is a third-person video game developed and published by Rebellion Developments.  It is a sequel to the 2015 compilation game Zombie Army Trilogy, itself a spin-off to the Sniper Elite series. It was released on 4 February 2020 for PlayStation 4, Xbox One, and Microsoft Windows, and 1 May 2020 for Stadia.	{"en": "Zombie Army 4: Dead War is a third-person video game developed and published by Rebellion Developments.  It is a sequel to the 2015 compilation game Zombie Army Trilogy, itself a spin-off to the Sniper Elite series. It was released on 4 February 2020 for PlayStation 4, Xbox One, and Microsoft Windows, and 1 May 2020 for Stadia."}	["https://upload.wikimedia.org/wikipedia/commons/1/14/Zombie_Army_4-_Dead_War.png"]	{"stadia": "https://stadia.google.com/store/details/cba537cccfe3470b8784f88660ea5f09rcp1/sku/a7b1581491ea4b7c9fcc89710561f5f7"}	zombie-army-4-dead-war	2020-12-21 16:12:08.7441+00	2021-02-05 23:20:48.243939+00	M17+
30	Forza Horizon 4	{"ar": "فورزا هوريزون 4", "cs": "Forza Horizon 4", "de": "Forza Horizon 4", "en": "Forza Horizon 4", "es": "Forza Horizon 4", "fa": "فورتزا هورایزن ۴", "fi": "Forza Horizon 4", "fr": "Forza Horizon 4", "it": "Forza Horizon 4", "ja": "Forza Horizon 4", "ko": "포르자 호라이즌 4", "la": "Forza Horizon 4", "nl": "Forza Horizon 4", "pl": "Forza Horizon 4", "pt": "Forza Horizon 4", "ru": "Forza Horizon 4", "tr": "Forza Horizon 4", "uk": "Forza Horizon 4", "zh": "极限竞速 地平线4", "arz": "فورزا هوريزون 4", "ckb": "فۆرزا ھۆرایزن ٤"}	Forza Horizon 4 is a 2018 racing video game developed by Playground Games and published by Microsoft Studios.[2] It was released on 2 October 2018 on Xbox One and Microsoft Windows after being announced at Xbox's E3 2018 conference.[3][4] An enhanced version of the game was released on Xbox Series X/S on 10 November 2020. The game is set in a fictionalised representation of areas of Great Britain.[2][3][4] It is the fourth Forza Horizon title and eleventh  instalment  in the Forza series. The game is noted for its introduction of changing seasons to the series, as well as featuring several content-expanding updates which have included new game modes.	{"en": "Forza Horizon 4 is a 2018 racing video game developed by Playground Games and published by Microsoft Studios.[2] It was released on 2 October 2018 on Xbox One and Microsoft Windows after being announced at Xbox's E3 2018 conference.[3][4] An enhanced version of the game was released on Xbox Series X/S on 10 November 2020. The game is set in a fictionalised representation of areas of Great Britain.[2][3][4] It is the fourth Forza Horizon title and eleventh  instalment  in the Forza series. The game is noted for its introduction of changing seasons to the series, as well as featuring several content-expanding updates which have included new game modes."}	["https://upload.wikimedia.org/wikipedia/en/8/87/Forza_Horizon_4_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%81%D9%88%D8%B1%D8%B2%D8%A7_%D9%87%D9%88%D8%B1%D9%8A%D8%B2%D9%88%D9%86_4", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_de": "https://de.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_en": "https://en.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_es": "https://es.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%81%D9%88%D8%B1%D8%AA%D8%B2%D8%A7_%D9%87%D9%88%D8%B1%D8%A7%DB%8C%D8%B2%D9%86_%DB%B4", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_it": "https://it.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%8F%AC%EB%A5%B4%EC%9E%90_%ED%98%B8%EB%9D%BC%EC%9D%B4%EC%A6%8C_4", "wikipedia_la": "https://la.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Forza_Horizon_4", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%9E%81%E9%99%90%E7%AB%9E%E9%80%9F_%E5%9C%B0%E5%B9%B3%E7%BA%BF4", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%81%D9%88%D8%B1%D8%B2%D8%A7_%D9%87%D9%88%D8%B1%D9%8A%D8%B2%D9%88%D9%86_4", "wikipedia_ckb": "https://ckb.wikipedia.org/wiki/%D9%81%DB%86%D8%B1%D8%B2%D8%A7_%DA%BE%DB%86%D8%B1%D8%A7%DB%8C%D8%B2%D9%86_%D9%A4"}	forza-horizon-4	2020-12-17 19:51:05.793178+00	2020-12-17 22:23:21.046147+00	NA
89	Void Bastards	{"en": "Void Bastards"}	Void Bastards is a science-fiction first-person shooter and roguelike video game developed by Australian studio Blue Manchu[1] and published by Humble Bundle. It was released on May 28, 2019, for Microsoft Windows and Xbox One.[2] Ports of the game for Nintendo Switch and PlayStation 4 were released on May 7, 2020.[3] The game revolves around surviving in the dangerous Sargasso Nebula by boarding and salvaging materials from spaceships.[4] It received mostly positive reviews from critics, who praised its comic-book art style, dark humor, and gameplay, but criticized its lackluster story and replay value.	{"en": "Void Bastards is a science-fiction first-person shooter and roguelike video game developed by Australian studio Blue Manchu[1] and published by Humble Bundle. It was released on May 28, 2019, for Microsoft Windows and Xbox One.[2] Ports of the game for Nintendo Switch and PlayStation 4 were released on May 7, 2020.[3] The game revolves around surviving in the dangerous Sargasso Nebula by boarding and salvaging materials from spaceships.[4] It received mostly positive reviews from critics, who praised its comic-book art style, dark humor, and gameplay, but criticized its lackluster story and replay value."}	["https://upload.wikimedia.org/wikipedia/en/2/21/Void_Bastards_cover_art.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Void_Bastards"}	void-bastards	2020-12-17 19:51:11.939041+00	2020-12-17 22:23:25.122397+00	NA
106	Bleeding Edge	{"de": "Bleeding Edge", "en": "Bleeding Edge", "fr": "Bleeding Edge", "he": "Bleeding Edge", "pt": "Bleeding Edge", "zh": "尖峰战队"}	Bleeding Edge is a multiplayer online combat video game being developed by British developer Ninja Theory and published by Xbox Game Studios for Xbox One and Microsoft Windows. The game launched on 24 March 2020.[1] 	{"en": "Bleeding Edge is a multiplayer online combat video game being developed by British developer Ninja Theory and published by Xbox Game Studios for Xbox One and Microsoft Windows. The game launched on 24 March 2020.[1] "}	["https://upload.wikimedia.org/wikipedia/en/f/f5/Bleeding_Edge_game_cover.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Bleeding_Edge", "wikipedia_en": "https://en.wikipedia.org/wiki/Bleeding_Edge_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Bleeding_Edge", "wikipedia_he": "https://he.wikipedia.org/wiki/Bleeding_Edge", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Bleeding_Edge", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%B0%96%E5%B3%B0%E6%88%98%E9%98%9F"}	bleeding-edge	2020-12-18 16:36:42.416933+00	2020-12-18 16:51:22.879276+00	NA
95	Xeno Crisis	{"en": "Xeno Crisis"}	Xeno Crisis is a 2019 twin-stick shooter developed by indie game studio Bitmap Bureau for the Sega Mega Drive, with releases for the Nintendo Switch, PlayStation 4, PlayStation Vita, Microsoft Xbox One, Microsoft Windows, macOS, Linux, Sega Dreamcast, Evercade, and Neo Geo. The game was fully funded on Kickstarter on January 10, 2018,[2] with a release on October 28, 2019.	{"en": "Xeno Crisis is a 2019 twin-stick shooter developed by indie game studio Bitmap Bureau for the Sega Mega Drive, with releases for the Nintendo Switch, PlayStation 4, PlayStation Vita, Microsoft Xbox One, Microsoft Windows, macOS, Linux, Sega Dreamcast, Evercade, and Neo Geo. The game was fully funded on Kickstarter on January 10, 2018,[2] with a release on October 28, 2019."}	["https://upload.wikimedia.org/wikipedia/en/2/29/XenoCrisis_logo.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Xeno_Crisis"}	xeno-crisis	2020-12-17 19:51:13.034197+00	2020-12-17 22:23:25.746569+00	NA
124	Mortal Kombat X	{"ar": "مورتال كومبات إكس", "az": "Mortal Kombat X (oyun, 2015)", "de": "Mortal Kombat X", "en": "Mortal Kombat X", "es": "Mortal Kombat X", "fa": "مورتال کامبت اکس", "fi": "Mortal Kombat X", "fr": "Mortal Kombat X", "gl": "Mortal Kombat X", "hu": "Mortal Kombat X", "id": "Mortal Kombat X", "it": "Mortal Kombat X", "ko": "모탈 컴뱃 X", "la": "Mortal Kombat X", "nl": "Mortal Kombat X", "pl": "Mortal Kombat X", "pt": "Mortal Kombat X", "ru": "Mortal Kombat X", "sv": "Mortal Kombat X", "tr": "Mortal Kombat X", "uk": "Mortal Kombat X", "vi": "Mortal Kombat X", "zh": "真人快打X", "arz": "مورتال كومبات اكس", "ckb": "مۆڕتاڵ کۆمبات ئێکس", "wuu": "真人快打X"}	Mortal Kombat X[c] is a fighting video game developed by NetherRealm Studios and published by Warner Bros. Interactive Entertainment. Running on the Unreal Engine 3, it is the tenth main installment in the Mortal Kombat video game series and a sequel to the 2011 game Mortal Kombat. It was released on April 14, 2015 for Microsoft Windows, PlayStation 4, and Xbox One. NetherRealm Studios' mobile team developed a version for iOS and Android devices. High Voltage Software developed the PC version of the game, with Polish studio QLOC taking over the work on it shortly after the release of Kombat Pack 1.	{"en": "Mortal Kombat X[c] is a fighting video game developed by NetherRealm Studios and published by Warner Bros. Interactive Entertainment. Running on the Unreal Engine 3, it is the tenth main installment in the Mortal Kombat video game series and a sequel to the 2011 game Mortal Kombat. It was released on April 14, 2015 for Microsoft Windows, PlayStation 4, and Xbox One. NetherRealm Studios' mobile team developed a version for iOS and Android devices. High Voltage Software developed the PC version of the game, with Polish studio QLOC taking over the work on it shortly after the release of Kombat Pack 1."}	["https://upload.wikimedia.org/wikipedia/en/d/d0/Mortal_Kombat_X_Cover_Art.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D8%AA%D8%A7%D9%84_%D9%83%D9%88%D9%85%D8%A8%D8%A7%D8%AA_%D8%A5%D9%83%D8%B3", "wikipedia_az": "https://az.wikipedia.org/wiki/Mortal_Kombat_X_(oyun,_2015)", "wikipedia_de": "https://de.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_en": "https://en.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_es": "https://es.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D8%AA%D8%A7%D9%84_%DA%A9%D8%A7%D9%85%D8%A8%D8%AA_%D8%A7%DA%A9%D8%B3", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_id": "https://id.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_it": "https://it.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%AA%A8%ED%83%88_%EC%BB%B4%EB%B1%83_X", "wikipedia_la": "https://la.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Mortal_Kombat_X", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%9C%9F%E4%BA%BA%E5%BF%AB%E6%89%93X", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%85%D9%88%D8%B1%D8%AA%D8%A7%D9%84_%D9%83%D9%88%D9%85%D8%A8%D8%A7%D8%AA_%D8%A7%D9%83%D8%B3", "wikipedia_ckb": "https://ckb.wikipedia.org/wiki/%D9%85%DB%86%DA%95%D8%AA%D8%A7%DA%B5_%DA%A9%DB%86%D9%85%D8%A8%D8%A7%D8%AA_%D8%A6%DB%8E%DA%A9%D8%B3", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E7%9C%9F%E4%BA%BA%E5%BF%AB%E6%89%93X"}	mortal-kombat-x	2020-12-18 16:36:43.108148+00	2020-12-18 16:51:23.602816+00	NA
98	Yakuza Kiwami 2	{"ar": "ياكوزا كيوامي 2", "en": "Yakuza Kiwami 2", "it": "Yakuza Kiwami 2", "ko": "용과 같이 극 2", "th": "ยากูซ่าคิวามิ 2", "arz": "ياكوزا كيوامى 2"}	Yakuza Kiwami 2[a] is an action-adventure video game developed and published by Sega. It is a remake of the 2006 video game Yakuza 2 for the PlayStation 2, and is the series' second remake title following 2016's Yakuza Kiwami. It was developed using the Dragon game engine from Yakuza 6. The game was released for PlayStation 4 on December 7, 2017 in Japan, and worldwide on August 28, 2018.[1] It was released for Microsoft Windows worldwide on Steam on May 9, 2019[2] and released for Xbox One on July 30, 2020.[3]	{"en": "Yakuza Kiwami 2[a] is an action-adventure video game developed and published by Sega. It is a remake of the 2006 video game Yakuza 2 for the PlayStation 2, and is the series' second remake title following 2016's Yakuza Kiwami. It was developed using the Dragon game engine from Yakuza 6. The game was released for PlayStation 4 on December 7, 2017 in Japan, and worldwide on August 28, 2018.[1] It was released for Microsoft Windows worldwide on Steam on May 9, 2019[2] and released for Xbox One on July 30, 2020.[3]"}	["https://upload.wikimedia.org/wikipedia/en/7/7f/Yakuza_Kiwami_2.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%8A%D8%A7%D9%83%D9%88%D8%B2%D8%A7_%D9%83%D9%8A%D9%88%D8%A7%D9%85%D9%8A_2", "wikipedia_en": "https://en.wikipedia.org/wiki/Yakuza_Kiwami_2", "wikipedia_it": "https://it.wikipedia.org/wiki/Yakuza_Kiwami_2", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9A%A9%EA%B3%BC_%EA%B0%99%EC%9D%B4_%EA%B7%B9_2", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%A2%E0%B8%B2%E0%B8%81%E0%B8%B9%E0%B8%8B%E0%B9%88%E0%B8%B2%E0%B8%84%E0%B8%B4%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%B4_2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%8A%D8%A7%D9%83%D9%88%D8%B2%D8%A7_%D9%83%D9%8A%D9%88%D8%A7%D9%85%D9%89_2"}	yakuza-kiwami-2	2020-12-17 19:51:13.085528+00	2020-12-17 22:23:25.773542+00	NA
119	Moving Out	{"en": "Moving Out"}	Moving Out is a 2020 cooperative moving simulation game developed by Swedish[1] studio DevM Games and Australian[2] developer SMG Studio. In a local cooperative experience, players move objects from houses into a moving van while coping with exaggerated physics.[3][4][5] The game was released for Microsoft Windows, Xbox One, Playstation 4, and Nintendo Switch on April 28, 2020.	{"en": "Moving Out is a 2020 cooperative moving simulation game developed by Swedish[1] studio DevM Games and Australian[2] developer SMG Studio. In a local cooperative experience, players move objects from houses into a moving van while coping with exaggerated physics.[3][4][5] The game was released for Microsoft Windows, Xbox One, Playstation 4, and Nintendo Switch on April 28, 2020."}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Moving_Out_(video_game)"}	moving-out	2020-12-18 16:36:42.916611+00	2020-12-18 16:51:23.62247+00	NA
31	Guacamelee! 2	{"en": "Guacamelee! 2", "es": "Guacamelee! 2", "th": "กัวกาเมเลเอ! 2"}	Guacamelee! 2 is a Metroidvania platform video game developed and published by DrinkBox Studios. A sequel to Guacamelee!, the game was released for Microsoft Windows and PlayStation 4 in August 2018 while the Nintendo Switch version was released on December 10, 2018. The Xbox One version was released on January 18, 2019. The game received generally positive reviews upon release.	{"en": "Guacamelee! 2 is a Metroidvania platform video game developed and published by DrinkBox Studios. A sequel to Guacamelee!, the game was released for Microsoft Windows and PlayStation 4 in August 2018 while the Nintendo Switch version was released on December 10, 2018. The Xbox One version was released on January 18, 2019. The game received generally positive reviews upon release."}	["https://upload.wikimedia.org/wikipedia/en/b/b7/Guacamelee_2_logo.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Guacamelee!_2", "wikipedia_es": "https://es.wikipedia.org/wiki/Guacamelee!_2", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%81%E0%B8%B1%E0%B8%A7%E0%B8%81%E0%B8%B2%E0%B9%80%E0%B8%A1%E0%B9%80%E0%B8%A5%E0%B9%80%E0%B8%AD!_2"}	guacamelee-2	2020-12-17 19:51:05.890133+00	2020-12-17 22:23:21.15433+00	NA
102	We Happy Few	{"ar": "وي هابي فيو", "de": "We Happy Few", "en": "We Happy Few", "fa": "وی هپی فیو", "fi": "We Happy Few", "fr": "We Happy Few", "it": "We Happy Few", "pt": "We Happy Few (jogo eletrônico)", "ru": "We Happy Few", "tr": "We Happy Few", "uk": "We Happy Few", "arz": "وى هاپى فيو"}	We Happy Few is an action-adventure survival horror video game developed by Compulsion Games and published by Gearbox Publishing. In 2016, an early access version was released for Microsoft Windows, with the full game seeing wide release for PlayStation 4, Windows, and Xbox One in August 2018.	{"en": "We Happy Few is an action-adventure survival horror video game developed by Compulsion Games and published by Gearbox Publishing. In 2016, an early access version was released for Microsoft Windows, with the full game seeing wide release for PlayStation 4, Windows, and Xbox One in August 2018."}	["https://upload.wikimedia.org/wikipedia/en/7/76/WeHappyFew.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%88%D9%8A_%D9%87%D8%A7%D8%A8%D9%8A_%D9%81%D9%8A%D9%88", "wikipedia_de": "https://de.wikipedia.org/wiki/We_Happy_Few", "wikipedia_en": "https://en.wikipedia.org/wiki/We_Happy_Few", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%88%DB%8C_%D9%87%D9%BE%DB%8C_%D9%81%DB%8C%D9%88", "wikipedia_fi": "https://fi.wikipedia.org/wiki/We_Happy_Few", "wikipedia_fr": "https://fr.wikipedia.org/wiki/We_Happy_Few", "wikipedia_it": "https://it.wikipedia.org/wiki/We_Happy_Few", "wikipedia_pt": "https://pt.wikipedia.org/wiki/We_Happy_Few_(jogo_eletr%C3%B4nico)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/We_Happy_Few", "wikipedia_tr": "https://tr.wikipedia.org/wiki/We_Happy_Few", "wikipedia_uk": "https://uk.wikipedia.org/wiki/We_Happy_Few", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%88%D9%89_%D9%87%D8%A7%D9%BE%D9%89_%D9%81%D9%8A%D9%88"}	we-happy-few	2020-12-17 19:51:13.291843+00	2020-12-17 22:23:25.025384+00	NA
237	UNO	{"en": "UNO"}	Uno is the video game adaptation of the card game of the same name. It has been released for a number of platforms. The Xbox 360 version by Carbonated Games and Microsoft Game Studios was released on May 9, 2006, as a digital download via Xbox Live Arcade. A version for iPhone OS devices was released in 2008 by Gameloft. Gameloft released the PlayStation 3 version on October 1, 2009, and also released a version for iPod, WiiWare, Nintendo DSi via DSiWare, and PlayStation Portable.[1] An updated version developed and published by Ubisoft was released for Xbox One and PlayStation 4 in August 2016, with a Steam version to follow later in the year.[2] On November 7, 2017, Uno was released for the Nintendo Switch.[3] The game was also released for the Stadia cloud gaming service, operated by Google, on September 15, 2020.[4]	{"en": "Uno is the video game adaptation of the card game of the same name. It has been released for a number of platforms. The Xbox 360 version by Carbonated Games and Microsoft Game Studios was released on May 9, 2006, as a digital download via Xbox Live Arcade. A version for iPhone OS devices was released in 2008 by Gameloft. Gameloft released the PlayStation 3 version on October 1, 2009, and also released a version for iPod, WiiWare, Nintendo DSi via DSiWare, and PlayStation Portable.[1] An updated version developed and published by Ubisoft was released for Xbox One and PlayStation 4 in August 2016, with a Steam version to follow later in the year.[2] On November 7, 2017, Uno was released for the Nintendo Switch.[3] The game was also released for the Stadia cloud gaming service, operated by Google, on September 15, 2020.[4]"}	["https://upload.wikimedia.org/wikipedia/en/f/f1/Cboxuno.jpg"]	{"stadia": "https://stadia.google.com/store/details/1694aaa3968344228424092f180a3e0ercp1/sku/c147fbe82f394c11bbe41ee134d4f350"}	uno	2020-12-21 16:12:07.960697+00	2021-02-05 23:20:46.64046+00	E
49	Metro 2033	{"ar": "مترو 2033 (لعبة فيديو)", "az": "Metro 2033 (video oyun)", "ca": "Metro 2033 (videojoc)", "cs": "Metro 2033 (počítačová hra)", "de": "Metro 2033 (Computerspiel)", "en": "Metro 2033", "es": "Metro 2033 (videojuego)", "fa": "مترو ۲۰۳۳", "fi": "Metro 2033 (videopeli)", "fr": "Metro 2033", "gl": "Metro 2033", "hu": "Metro 2033 (videójáték)", "hy": "Metro 2033 (համակարգչային խաղ)", "it": "Metro 2033", "ja": "メトロ2033", "ko": "메트로 2033 (비디오 게임)", "mk": "Metro 2033", "nb": "Metro 2033", "nl": "Metro 2033 (computerspel)", "nn": "Metro 2033", "pl": "Metro 2033 (gra komputerowa)", "pt": "Metro 2033", "ro": "Metro 2033 (joc video)", "ru": "Метро 2033 (игра)", "sv": "Metro 2033 (spel)", "tr": "Metro 2033 (video oyunu)", "uk": "Metro 2033 (відеогра)", "vi": "Metro 2033", "zh": "地铁2033 (游戏)"}	Metro 2033 is a first-person shooter survival horror video game developed by 4A Games and published by THQ. It was released in 2010 for the Xbox 360 and Microsoft Windows. The story is based on Dmitry Glukhovsky's novel of the same name, and is set in the ruins of Moscow following a nuclear war, where the survivors are forced to live in underground Metro tunnels. Players control Artyom, a man who must save his home station from the dangers lurking within the Metro.	{"en": "Metro 2033 is a first-person shooter survival horror video game developed by 4A Games and published by THQ. It was released in 2010 for the Xbox 360 and Microsoft Windows. The story is based on Dmitry Glukhovsky's novel of the same name, and is set in the ruins of Moscow following a nuclear war, where the survivors are forced to live in underground Metro tunnels. Players control Artyom, a man who must save his home station from the dangers lurking within the Metro."}	["https://upload.wikimedia.org/wikipedia/en/0/07/Metro_2033_Game_Cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D8%AA%D8%B1%D9%88_2033_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88)", "wikipedia_az": "https://az.wikipedia.org/wiki/Metro_2033_(video_oyun)", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Metro_2033_(videojoc)", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Metro_2033_(po%C4%8D%C3%ADta%C4%8Dov%C3%A1_hra)", "wikipedia_de": "https://de.wikipedia.org/wiki/Metro_2033_(Computerspiel)", "wikipedia_en": "https://en.wikipedia.org/wiki/Metro_2033_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Metro_2033_(videojuego)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%AA%D8%B1%D9%88_%DB%B2%DB%B0%DB%B3%DB%B3", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Metro_2033_(videopeli)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Metro_2033", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Metro_2033", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Metro_2033_(vide%C3%B3j%C3%A1t%C3%A9k)", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Metro_2033_(%D5%B0%D5%A1%D5%B4%D5%A1%D5%AF%D5%A1%D6%80%D5%A3%D5%B9%D5%A1%D5%B5%D5%AB%D5%B6_%D5%AD%D5%A1%D5%B2)", "wikipedia_it": "https://it.wikipedia.org/wiki/Metro_2033", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%A1%E3%83%88%E3%83%AD2033", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%A9%94%ED%8A%B8%EB%A1%9C_2033_(%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_mk": "https://mk.wikipedia.org/wiki/Metro_2033", "wikipedia_nb": "https://no.wikipedia.org/wiki/Metro_2033", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Metro_2033_(computerspel)", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Metro_2033", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Metro_2033_(gra_komputerowa)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Metro_2033", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Metro_2033_(joc_video)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/%D0%9C%D0%B5%D1%82%D1%80%D0%BE_2033_(%D0%B8%D0%B3%D1%80%D0%B0)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Metro_2033_(spel)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Metro_2033_(video_oyunu)", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Metro_2033_(%D0%B2%D1%96%D0%B4%D0%B5%D0%BE%D0%B3%D1%80%D0%B0)", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Metro_2033", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%9C%B0%E9%93%812033_(%E6%B8%B8%E6%88%8F)"}	metro-2033	2020-12-17 19:51:06.864294+00	2020-12-21 16:12:02.767601+00	NA
11	Blair Witch	{"ar": "بلير ويتش", "en": "Blair Witch", "es": "Blair Witch (videojuego de 2019)", "fr": "Blair Witch (jeu vidéo)", "pl": "Blair Witch (gra komputerowa 2019)", "ru": "Blair Witch"}	Blair Witch is a psychological survival horror video game developed by Bloober Team based on the Blair Witch series of horror films. It was published by Lionsgate Games for Microsoft Windows, Xbox One and Xbox Game Pass on August 30, 2019. The game is set two years after the events of the 1999 film The Blair Witch Project,  which takes place in 1994. The game follows former police officer Ellis Lynch as he joins the search in Black Hills Forest for a missing boy. The game was later ported to PlayStation 4 on December 3, 2019, Nintendo Switch on June 25, 2020 and Oculus Quest & Quest 2 on October 29, 2020.	{"en": "Blair Witch is a psychological survival horror video game developed by Bloober Team based on the Blair Witch series of horror films. It was published by Lionsgate Games for Microsoft Windows, Xbox One and Xbox Game Pass on August 30, 2019. The game is set two years after the events of the 1999 film The Blair Witch Project,  which takes place in 1994. The game follows former police officer Ellis Lynch as he joins the search in Black Hills Forest for a missing boy. The game was later ported to PlayStation 4 on December 3, 2019, Nintendo Switch on June 25, 2020 and Oculus Quest & Quest 2 on October 29, 2020."}	["https://upload.wikimedia.org/wikipedia/en/c/c7/Blair_Witch_video_game_poster.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A8%D9%84%D9%8A%D8%B1_%D9%88%D9%8A%D8%AA%D8%B4", "wikipedia_en": "https://en.wikipedia.org/wiki/Blair_Witch_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Blair_Witch_(videojuego_de_2019)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Blair_Witch_(jeu_vid%C3%A9o)", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Blair_Witch_(gra_komputerowa_2019)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Blair_Witch"}	blair-witch	2020-12-14 19:38:23.102257+00	2020-12-18 16:51:22.884812+00	NA
168	HITMAN 3	{"en": "HITMAN 3"}	Hitman 3 (stylized as HITMAN III) is an upcoming stealth game developed and published by IO Interactive. The game will be the eighth main installment in the Hitman series and the third and final installment of the World of Assassination trilogy, following Hitman (2016) and Hitman 2 (2018).[2] It is set to be released for Windows, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S, Stadia, and Nintendo Switch[3] on 20 January 2021.[4]	{"en": "Hitman 3 (stylized as HITMAN III) is an upcoming stealth game developed and published by IO Interactive. The game will be the eighth main installment in the Hitman series and the third and final installment of the World of Assassination trilogy, following Hitman (2016) and Hitman 2 (2018).[2] It is set to be released for Windows, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S, Stadia, and Nintendo Switch[3] on 20 January 2021.[4]"}	["https://upload.wikimedia.org/wikipedia/en/4/4b/Hitman_3_Packart.jpg"]	{"stadia": "https://stadia.google.com/store/details/990ec302c2cd4ba7817cedcf633ab20frcp1/sku/a31dabb87e2441978da11fd60f3197dfp"}	hitman-3	2020-12-20 04:21:09.080532+00	2021-02-05 23:20:46.749437+00	N/A
100	Worms W.M.D	{"en": "Worms W.M.D", "es": "Worms W.M.D", "fr": "Worms W.M.D", "pl": "Worms W.M.D", "ru": "Worms W.M.D", "arz": "ورمس دبليو.ام.دى"}	Worms W.M.D is a 2D artillery turn-based tactics video game in the Worms series, released on 23 August 2016. Its gameplay resembles that of Worms Armageddon more than subsequent installments,[3] while adding new features that range from interactive vehicles such as tanks, to buildings that the worms can enter for protection.[4] It is also notable for being the first major redesign the worm characters have received since Worms 3D.	{"en": "Worms W.M.D is a 2D artillery turn-based tactics video game in the Worms series, released on 23 August 2016. Its gameplay resembles that of Worms Armageddon more than subsequent installments,[3] while adding new features that range from interactive vehicles such as tanks, to buildings that the worms can enter for protection.[4] It is also notable for being the first major redesign the worm characters have received since Worms 3D."}	["https://upload.wikimedia.org/wikipedia/en/c/c7/Worms_W.M.D_logo.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Worms_W.M.D", "wikipedia_es": "https://es.wikipedia.org/wiki/Worms_W.M.D", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Worms_W.M.D", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Worms_W.M.D", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Worms_W.M.D", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%88%D8%B1%D9%85%D8%B3_%D8%AF%D8%A8%D9%84%D9%8A%D9%88.%D8%A7%D9%85.%D8%AF%D9%89"}	worms-wmd	2020-12-17 19:51:13.136045+00	2020-12-17 22:23:25.565099+00	NA
120	Killer Instinct	{"de": "Killer Instinct (Spieleserie)", "en": "Killer Instinct", "es": "Killer Instinct (serie)", "fi": "Killer Instinct", "fr": "Killer Instinct (série de jeux vidéo)", "ja": "キラーインスティンクト", "nl": "Killer Instinct (computerspelserie)", "ru": "Killer Instinct (серия игр)"}	Killer Instinct is a series of fighting video games originally created by Rare and published by Midway, Nintendo, and Microsoft Studios. The original Killer Instinct was released for arcades in 1994; the game was then released for the Super Nintendo and Game Boy in 1995. Its popularity led to a sequel, Killer Instinct 2, which was released for arcades in 1996; the game was then released as Killer Instinct Gold for the Nintendo 64.	{"en": "Killer Instinct is a series of fighting video games originally created by Rare and published by Midway, Nintendo, and Microsoft Studios. The original Killer Instinct was released for arcades in 1994; the game was then released for the Super Nintendo and Game Boy in 1995. Its popularity led to a sequel, Killer Instinct 2, which was released for arcades in 1996; the game was then released as Killer Instinct Gold for the Nintendo 64."}	["https://upload.wikimedia.org/wikipedia/en/9/9a/Killer_Instinct_Logo.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Killer_Instinct_(Spieleserie)", "wikipedia_en": "https://en.wikipedia.org/wiki/Killer_Instinct", "wikipedia_es": "https://es.wikipedia.org/wiki/Killer_Instinct_(serie)", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Killer_Instinct", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Killer_Instinct_(s%C3%A9rie_de_jeux_vid%C3%A9o)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%A9%E3%83%BC%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%86%E3%82%A3%E3%83%B3%E3%82%AF%E3%83%88", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Killer_Instinct_(computerspelserie)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Killer_Instinct_(%D1%81%D0%B5%D1%80%D0%B8%D1%8F_%D0%B8%D0%B3%D1%80)"}	killer-instinct	2020-12-18 16:36:42.928945+00	2020-12-18 16:51:23.637243+00	NA
137	The Walking Dead: Michonne	{"en": "The Walking Dead: Michonne", "fa": "مردگان متحرک (میشون)", "fr": "The Walking Dead: Michonne", "it": "The Walking Dead: Michonne", "pt": "The Walking Dead: Michonne", "ru": "The Walking Dead: Michonne", "sv": "The Walking Dead: Michonne", "arz": "ث والكينج دايد: ميتشون"}	The Walking Dead: Michonne is an episodic adventure video game by Telltale Games.[1], based on The Walking Dead comic book series.Taking place between issues 126 and 139 of the comic series, the game shows events of what Michonne was up to during her temporary departure from the group of survivors led by Rick Grimes in the midst of a zombie apocalypse.[2] Samira Wiley voiced Michonne in the game.[3] The three-episode series was released between February and April 2016 for Microsoft Windows personal computers, the PlayStation 3 and 4 consoles, the Xbox 360 and One consoles, and mobile devices.	{"en": "The Walking Dead: Michonne is an episodic adventure video game by Telltale Games.[1], based on The Walking Dead comic book series.Taking place between issues 126 and 139 of the comic series, the game shows events of what Michonne was up to during her temporary departure from the group of survivors led by Rick Grimes in the midst of a zombie apocalypse.[2] Samira Wiley voiced Michonne in the game.[3] The three-episode series was released between February and April 2016 for Microsoft Windows personal computers, the PlayStation 3 and 4 consoles, the Xbox 360 and One consoles, and mobile devices."}	["https://upload.wikimedia.org/wikipedia/en/7/7e/The_walking_dead_michonne_cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/The_Walking_Dead:_Michonne", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%B1%D8%AF%DA%AF%D8%A7%D9%86_%D9%85%D8%AA%D8%AD%D8%B1%DA%A9_(%D9%85%DB%8C%D8%B4%D9%88%D9%86)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Walking_Dead:_Michonne", "wikipedia_it": "https://it.wikipedia.org/wiki/The_Walking_Dead:_Michonne", "wikipedia_pt": "https://pt.wikipedia.org/wiki/The_Walking_Dead:_Michonne", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Walking_Dead:_Michonne", "wikipedia_sv": "https://sv.wikipedia.org/wiki/The_Walking_Dead:_Michonne", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AB_%D9%88%D8%A7%D9%84%D9%83%D9%8A%D9%86%D8%AC_%D8%AF%D8%A7%D9%8A%D8%AF:_%D9%85%D9%8A%D8%AA%D8%B4%D9%88%D9%86"}	the-walking-dead-michonne	2020-12-18 16:36:43.644604+00	2020-12-18 16:51:24.550666+00	NA
325	Attack on Titan 2: Final Battle	{"en": "Attack on Titan 2: Final Battle"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/a38d988fb142400c947bf0a7b37fd404rcp1/sku/f879d932d28c4104958c7976f201ba38"}	attack-on-titan-2-final-battle	2021-02-05 16:52:22.21302+00	2021-02-05 23:20:46.748174+00	N/A
202	Pac-Man	{"am": "ፓክ-ማን", "an": "Pac-Man", "ar": "باك مان", "az": "Pac-Man", "br": "Pac-Man", "ca": "Pac-Man", "cs": "Pac-Man", "da": "Pac-Man", "de": "Pac-Man", "el": "Pac-Man", "en": "Pac-Man", "es": "Pac-Man", "eu": "Pac-Man", "fa": "پک-من", "fi": "Pac-Man", "fr": "Pac-Man", "gl": "Pac-Man", "he": "פק-מן", "hr": "Pac-Man", "hu": "Pac-Man", "hy": "Pac-Man", "id": "Pac-Man", "is": "Pac-Man", "it": "Pac-Man", "ja": "パックマン", "ka": "Pac-Man", "ko": "팩맨", "la": "Pac-Man", "lt": "Pac-Man", "lv": "Pac-Man", "mk": "Пак-Ман", "ml": "പാക്-മാൻ", "nb": "Pac-Man", "nl": "Pac-Man", "nn": "Pac-Man", "pl": "Pac-Man", "pt": "Pac-Man", "ro": "Pac-Man", "ru": "Pac-Man", "sk": "Pac-Man", "sl": "Pac-Man", "sq": "Pac-Man", "sr": "Pac-Man", "sv": "Pac-Man", "th": "แพ็ก-แมน", "tl": "Pac-Man (laro)", "tr": "Pac-Man", "uk": "Pac-Man", "ur": "پیک مین", "uz": "Pac-Man", "vi": "Pac-Man", "zh": "吃豆人", "arz": "باك مان", "ast": "Pac-Man", "egl": "Pac-Man", "lmo": "Pac-Man", "scn": "Pac-Man", "sco": "Pac-Man", "war": "Pac-Man", "wuu": "吃豆人", "yue": "食鬼", "be-tarask": "Pac-Man"}	Pac-Man[a] is a maze arcade game developed and released by Namco in 1980. The original Japanese title of Puck Man was changed to Pac-Man for international releases as a preventative measure against defacement of the arcade machines by changing the P to an F.[1] Outside Japan, the game was published by Midway Games as part of its licensing agreement with Namco America. The player controls Pac-Man, who must eat all the dots inside an enclosed maze while avoiding four colored ghosts. Eating large flashing dots called "energizers" causes the ghosts to turn blue, allowing Pac-Man to eat them for bonus points.	{"en": "Pac-Man[a] is a maze arcade game developed and released by Namco in 1980. The original Japanese title of Puck Man was changed to Pac-Man for international releases as a preventative measure against defacement of the arcade machines by changing the P to an F.[1] Outside Japan, the game was published by Midway Games as part of its licensing agreement with Namco America. The player controls Pac-Man, who must eat all the dots inside an enclosed maze while avoiding four colored ghosts. Eating large flashing dots called \\"energizers\\" causes the ghosts to turn blue, allowing Pac-Man to eat them for bonus points."}	["https://upload.wikimedia.org/wikipedia/en/1/16/Pac_flyer.png"]	{"wikipedia_am": "https://am.wikipedia.org/wiki/%E1%8D%93%E1%8A%AD-%E1%88%9B%E1%8A%95", "wikipedia_an": "https://an.wikipedia.org/wiki/Pac-Man", "wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A8%D8%A7%D9%83_%D9%85%D8%A7%D9%86", "wikipedia_az": "https://az.wikipedia.org/wiki/Pac-Man", "wikipedia_br": "https://br.wikipedia.org/wiki/Pac-Man", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Pac-Man", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Pac-Man", "wikipedia_da": "https://da.wikipedia.org/wiki/Pac-Man", "wikipedia_de": "https://de.wikipedia.org/wiki/Pac-Man", "wikipedia_el": "https://el.wikipedia.org/wiki/Pac-Man", "wikipedia_en": "https://en.wikipedia.org/wiki/Pac-Man", "wikipedia_es": "https://es.wikipedia.org/wiki/Pac-Man", "wikipedia_eu": "https://eu.wikipedia.org/wiki/Pac-Man", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%BE%DA%A9-%D9%85%D9%86", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Pac-Man", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Pac-Man", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Pac-Man", "wikipedia_he": "https://he.wikipedia.org/wiki/%D7%A4%D7%A7-%D7%9E%D7%9F", "wikipedia_hr": "https://hr.wikipedia.org/wiki/Pac-Man", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Pac-Man", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Pac-Man", "wikipedia_id": "https://id.wikipedia.org/wiki/Pac-Man", "wikipedia_is": "https://is.wikipedia.org/wiki/Pac-Man", "wikipedia_it": "https://it.wikipedia.org/wiki/Pac-Man", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%91%E3%83%83%E3%82%AF%E3%83%9E%E3%83%B3", "wikipedia_ka": "https://ka.wikipedia.org/wiki/Pac-Man", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%8C%A9%EB%A7%A8", "wikipedia_la": "https://la.wikipedia.org/wiki/Pac-Man", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Pac-Man", "wikipedia_lv": "https://lv.wikipedia.org/wiki/Pac-Man", "wikipedia_mk": "https://mk.wikipedia.org/wiki/%D0%9F%D0%B0%D0%BA-%D0%9C%D0%B0%D0%BD", "wikipedia_ml": "https://ml.wikipedia.org/wiki/%E0%B4%AA%E0%B4%BE%E0%B4%95%E0%B5%8D-%E0%B4%AE%E0%B4%BE%E0%B5%BB", "wikipedia_nb": "https://no.wikipedia.org/wiki/Pac-Man", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Pac-Man", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Pac-Man", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Pac-Man", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Pac-Man", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Pac-Man", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Pac-Man", "wikipedia_sk": "https://sk.wikipedia.org/wiki/Pac-Man", "wikipedia_sl": "https://sl.wikipedia.org/wiki/Pac-Man", "wikipedia_sq": "https://sq.wikipedia.org/wiki/Pac-Man", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Pac-Man", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Pac-Man", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%81%E0%B8%9E%E0%B9%87%E0%B8%81-%E0%B9%81%E0%B8%A1%E0%B8%99", "wikipedia_tl": "https://tl.wikipedia.org/wiki/Pac-Man_(laro)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Pac-Man", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Pac-Man", "wikipedia_ur": "https://ur.wikipedia.org/wiki/%D9%BE%DB%8C%DA%A9_%D9%85%DB%8C%D9%86", "wikipedia_uz": "https://uz.wikipedia.org/wiki/Pac-Man", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Pac-Man", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%90%83%E8%B1%86%E4%BA%BA", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A8%D8%A7%D9%83_%D9%85%D8%A7%D9%86", "wikipedia_ast": "https://ast.wikipedia.org/wiki/Pac-Man", "wikipedia_egl": "https://eml.wikipedia.org/wiki/Pac-Man", "wikipedia_lmo": "https://lmo.wikipedia.org/wiki/Pac-Man", "wikipedia_scn": "https://scn.wikipedia.org/wiki/Pac-Man", "wikipedia_sco": "https://sco.wikipedia.org/wiki/Pac-Man", "wikipedia_war": "https://war.wikipedia.org/wiki/Pac-Man", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E5%90%83%E8%B1%86%E4%BA%BA", "wikipedia_yue": "https://zh-yue.wikipedia.org/wiki/%E9%A3%9F%E9%AC%BC", "wikipedia_be-tarask": "https://be-tarask.wikipedia.org/wiki/Pac-Man"}	pac-man	2020-12-21 16:12:03.965688+00	2020-12-21 16:12:03.965706+00	NA
157	DRAGON BALL XENOVERSE 2	{"en": "DRAGON BALL XENOVERSE 2"}	Dragon Ball Xenoverse 2 is a role-playing video game developed by Dimps and published by Bandai Namco Entertainment based on the Dragon Ball franchise, and is the sequel to the 2015 game Dragon Ball Xenoverse.[2][3][4][5] It was released in October 25, 2016 for PlayStation 4 and Xbox One, and on October 27 for Microsoft Windows. In Japan, Dragon Ball Xenoverse 2 was initially only available on PlayStation 4.[6] The game was released for the Nintendo Switch in Japan on September 7, 2017 and later released worldwide on September 22, 2017.[7] The game was released on Stadia on December 17, 2019.[8] The game sold 6 million as of May 2020.[9]	{"en": "Dragon Ball Xenoverse 2 is a role-playing video game developed by Dimps and published by Bandai Namco Entertainment based on the Dragon Ball franchise, and is the sequel to the 2015 game Dragon Ball Xenoverse.[2][3][4][5] It was released in October 25, 2016 for PlayStation 4 and Xbox One, and on October 27 for Microsoft Windows. In Japan, Dragon Ball Xenoverse 2 was initially only available on PlayStation 4.[6] The game was released for the Nintendo Switch in Japan on September 7, 2017 and later released worldwide on September 22, 2017.[7] The game was released on Stadia on December 17, 2019.[8] The game sold 6 million as of May 2020.[9]"}	["https://upload.wikimedia.org/wikipedia/en/f/fe/Dragon_Ball_Xenoverse_2_Cover.jpeg"]	{"stadia": "https://stadia.google.com/store/details/80a70c13987841b3a2aedbcac54784abrcp1/sku/66f1b5a13ee54b7aa70aebfddd18c085"}	dragon-ball-xenoverse-2	2020-12-20 04:21:08.331506+00	2021-02-05 23:20:45.918248+00	T
326	Submerged: Hidden Depths	{"en": "Submerged: Hidden Depths"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/3c39a33bbc064308941f9276c38c30e7rcp1/sku/07b0ea07f5554f70a2675fe696b4c9ebp"}	submerged-hidden-depths	2021-02-05 16:52:22.346451+00	2021-02-05 23:20:47.559658+00	E
213	Scott Pilgrim vs. the World: The Game	{"en": "Scott Pilgrim vs. the World: The Game", "fr": "Scott Pilgrim contre le Monde, le jeu", "he": "סקוט פילגרים נגד העולם: המשחק", "ja": "スコット・ピルグリムVS.ザ・ワールド: ザ・ゲーム", "ko": "스콧 필그림 vs. 더 월드: 더 게임", "ru": "Scott Pilgrim vs. the World: The Game", "sv": "Scott Pilgrim vs. the World: The Game"}	Scott Pilgrim vs. the World: The Game is a side-scrolling beat 'em up game developed by Ubisoft Montreal and Ubisoft Chengdu and published by Ubisoft, based on the Scott Pilgrim series of Oni Press graphic novels by Bryan Lee O'Malley and tying in with the release of the film of the same name. The game was originally released digitally for Xbox 360 and PlayStation 3 in August 2010 before being delisted in December 2014.[4] An updated re-release for PlayStation 4, Xbox One, Nintendo Switch, Microsoft Windows, and Stadia, titled Scott Pilgrim vs. the World: The Game - Complete Edition,  is scheduled for release on January 14, 2021.	{"en": "Scott Pilgrim vs. the World: The Game is a side-scrolling beat 'em up game developed by Ubisoft Montreal and Ubisoft Chengdu and published by Ubisoft, based on the Scott Pilgrim series of Oni Press graphic novels by Bryan Lee O'Malley and tying in with the release of the film of the same name. The game was originally released digitally for Xbox 360 and PlayStation 3 in August 2010 before being delisted in December 2014.[4] An updated re-release for PlayStation 4, Xbox One, Nintendo Switch, Microsoft Windows, and Stadia, titled Scott Pilgrim vs. the World: The Game - Complete Edition,  is scheduled for release on January 14, 2021."}	["https://upload.wikimedia.org/wikipedia/en/a/ae/Scottpilgrimthegame.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Scott_Pilgrim_vs._the_World:_The_Game", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Scott_Pilgrim_contre_le_Monde,_le_jeu", "wikipedia_he": "https://he.wikipedia.org/wiki/%D7%A1%D7%A7%D7%95%D7%98_%D7%A4%D7%99%D7%9C%D7%92%D7%A8%D7%99%D7%9D_%D7%A0%D7%92%D7%93_%D7%94%D7%A2%D7%95%D7%9C%D7%9D:_%D7%94%D7%9E%D7%A9%D7%97%D7%A7", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B9%E3%82%B3%E3%83%83%E3%83%88%E3%83%BB%E3%83%94%E3%83%AB%E3%82%B0%E3%83%AA%E3%83%A0VS.%E3%82%B6%E3%83%BB%E3%83%AF%E3%83%BC%E3%83%AB%E3%83%89:_%E3%82%B6%E3%83%BB%E3%82%B2%E3%83%BC%E3%83%A0", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%8A%A4%EC%BD%A7_%ED%95%84%EA%B7%B8%EB%A6%BC_vs._%EB%8D%94_%EC%9B%94%EB%93%9C:_%EB%8D%94_%EA%B2%8C%EC%9E%84", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Scott_Pilgrim_vs._the_World:_The_Game", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Scott_Pilgrim_vs._the_World:_The_Game"}	scott-pilgrim-vs-the-world-the-game	2020-12-21 16:12:04.928194+00	2020-12-21 16:12:04.928224+00	NA
187	Metro: Last Light	{"ar": "مترو: لاست لايت", "be": "Metro: Last Light", "ca": "Metro: Last Light", "cs": "Metro: Last Light", "de": "Metro: Last Light", "en": "Metro: Last Light", "es": "Metro: Last Light", "fa": "مترو: آخرین نور", "fi": "Metro: Last Light", "fr": "Metro: Last Light", "hu": "Metro: Last Light", "id": "Metro: Last Light", "it": "Metro: Last Light", "ja": "メトロ ラストライト", "kk": "Metro: Last Light", "ko": "메트로: 라스트 라이트", "nb": "Metro: Last Light", "nl": "Metro: Last Light", "nn": "Metro: Last Light", "pl": "Metro: Last Light", "pt": "Metro: Last Light", "ro": "Metro: Last Light", "ru": "Metro: Last Light", "sr": "Metro: Last Light", "sv": "Metro: Last Light", "th": "เมโทร: ลาสต์ไลต์", "tr": "Metro: Last Light", "uk": "Metro: Last Light", "vi": "Metro: Last Light", "zh": "地鐵：最後的曙光"}	Metro: Last Light is a post-apocalyptic-themed, first-person shooter video game with stealth and survival horror elements. It was developed by Ukrainian studio 4A Games and published by Deep Silver for Microsoft Windows, PlayStation 3 and Xbox 360 in May 2013. A sequel to the video game Metro 2033, its story follows Artyom, a young soldier living in the Moscow Metro after a devastating nuclear war. Tasked with finding the mysterious Dark Ones, Artyom must venture to different parts of the metro system, and the surface filled with radiated gases, and fight against different factions and mutated monsters. The game improves on various gameplay mechanics of 2033, and introduces elements such as weapon customization.	{"en": "Metro: Last Light is a post-apocalyptic-themed, first-person shooter video game with stealth and survival horror elements. It was developed by Ukrainian studio 4A Games and published by Deep Silver for Microsoft Windows, PlayStation 3 and Xbox 360 in May 2013. A sequel to the video game Metro 2033, its story follows Artyom, a young soldier living in the Moscow Metro after a devastating nuclear war. Tasked with finding the mysterious Dark Ones, Artyom must venture to different parts of the metro system, and the surface filled with radiated gases, and fight against different factions and mutated monsters. The game improves on various gameplay mechanics of 2033, and introduces elements such as weapon customization."}	["https://upload.wikimedia.org/wikipedia/en/c/c4/Metrolastlight.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%85%D8%AA%D8%B1%D9%88:_%D9%84%D8%A7%D8%B3%D8%AA_%D9%84%D8%A7%D9%8A%D8%AA", "wikipedia_be": "https://be.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_de": "https://de.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_en": "https://en.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_es": "https://es.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D8%AA%D8%B1%D9%88:_%D8%A2%D8%AE%D8%B1%DB%8C%D9%86_%D9%86%D9%88%D8%B1", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_id": "https://id.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_it": "https://it.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%A1%E3%83%88%E3%83%AD_%E3%83%A9%E3%82%B9%E3%83%88%E3%83%A9%E3%82%A4%E3%83%88", "wikipedia_kk": "https://kk.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%A9%94%ED%8A%B8%EB%A1%9C:_%EB%9D%BC%EC%8A%A4%ED%8A%B8_%EB%9D%BC%EC%9D%B4%ED%8A%B8", "wikipedia_nb": "https://no.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_sr": "https://sr.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B9%80%E0%B8%A1%E0%B9%82%E0%B8%97%E0%B8%A3:_%E0%B8%A5%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B9%8C%E0%B9%84%E0%B8%A5%E0%B8%95%E0%B9%8C", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Metro:_Last_Light", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%9C%B0%E9%90%B5%EF%BC%9A%E6%9C%80%E5%BE%8C%E7%9A%84%E6%9B%99%E5%85%89"}	metro-last-light	2020-12-21 16:12:02.81612+00	2020-12-21 16:12:02.816142+00	NA
210	Riders Republic	{"de": "Riders Republic", "en": "Riders Republic", "fr": "Riders Republic"}	Riders Republic is an upcoming sports video game developed by Ubisoft Annecy and published by Ubisoft. The game is set to be released for Microsoft Windows, PlayStation 4, PlayStation 5, Stadia, Xbox One, Xbox Series X and Series S on February 25, 2021.	{"en": "Riders Republic is an upcoming sports video game developed by Ubisoft Annecy and published by Ubisoft. The game is set to be released for Microsoft Windows, PlayStation 4, PlayStation 5, Stadia, Xbox One, Xbox Series X and Series S on February 25, 2021."}	["https://upload.wikimedia.org/wikipedia/en/8/8d/Riders_Republic_cover_art.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Riders_Republic", "wikipedia_en": "https://en.wikipedia.org/wiki/Riders_Republic", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Riders_Republic"}	riders-republic	2020-12-21 16:12:04.763747+00	2020-12-21 16:12:04.763768+00	NA
146	Baldur's Gate III	{"de": "Baldur’s Gate III", "en": "Baldur's Gate III", "fi": "Baldur’s Gate 3", "fr": "Baldur's Gate III", "it": "Baldur's Gate III", "pl": "Baldur’s Gate III", "pt": "Baldur's Gate III", "ru": "Baldur’s Gate III", "zh": "博德之门III"}	Baldur's Gate III is an upcoming role-playing video game that is being developed and published by Larian Studios. It is the third main game in the Baldur's Gate series, itself based on the Dungeons & Dragons tabletop role-playing system.[1] A partial version of the game was released in early access format for Microsoft Windows, the Stadia streaming service, and MacOS on 6 October 2020. The game will remain in early access for at least one year before the completed version is released.[2]	{"en": "Baldur's Gate III is an upcoming role-playing video game that is being developed and published by Larian Studios. It is the third main game in the Baldur's Gate series, itself based on the Dungeons & Dragons tabletop role-playing system.[1] A partial version of the game was released in early access format for Microsoft Windows, the Stadia streaming service, and MacOS on 6 October 2020. The game will remain in early access for at least one year before the completed version is released.[2]"}	["https://upload.wikimedia.org/wikipedia/en/d/dc/Baldur%27s_Gate_III_Logo.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Baldur%E2%80%99s_Gate_III", "wikipedia_en": "https://en.wikipedia.org/wiki/Baldur%27s_Gate_III", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Baldur%E2%80%99s_Gate_3", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Baldur%27s_Gate_III", "wikipedia_it": "https://it.wikipedia.org/wiki/Baldur%27s_Gate_III", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Baldur%E2%80%99s_Gate_III", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Baldur%27s_Gate_III", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Baldur%E2%80%99s_Gate_III", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%8D%9A%E5%BE%B7%E4%B9%8B%E9%97%A8III"}	baldurs-gate-iii	2020-12-20 04:10:34.58777+00	2020-12-21 16:11:59.914639+00	NA
221	Sundered	{"en": "Sundered", "fr": "Sundered"}	Sundered is a metroidvania video game developed and published by Canadian studio Thunder Lotus Games. It was released on July 28, 2017 for Windows, Mac OS, Linux, and PlayStation 4. A definitive version of the game[1], Sundered: Eldritch Edition, was released on December 21, 2018 for Nintendo Switch and Xbox One and on May 26, 2020 on Stadia.	{"en": "Sundered is a metroidvania video game developed and published by Canadian studio Thunder Lotus Games. It was released on July 28, 2017 for Windows, Mac OS, Linux, and PlayStation 4. A definitive version of the game[1], Sundered: Eldritch Edition, was released on December 21, 2018 for Nintendo Switch and Xbox One and on May 26, 2020 on Stadia."}	["https://upload.wikimedia.org/wikipedia/en/8/81/Sundered_logo.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Sundered", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Sundered"}	sundered	2020-12-21 16:12:06.288092+00	2020-12-21 16:12:06.288115+00	NA
234	Tomb Raider	{"ar": "توم ريدر (لعبة فيديو 2013)", "az": "Tomb Raider (2013 video oyun)", "bn": "টুম্ব রাইডার (২০১৩-এর ভিডিও গেম)", "cs": "Tomb Raider (2013)", "de": "Tomb Raider (2013)", "en": "Tomb Raider", "es": "Tomb Raider (videojuego de 2013)", "fa": "مهاجم مقبره (بازی ویدئویی ۲۰۱۳)", "fi": "Tomb Raider (vuoden 2013 videopeli)", "fr": "Tomb Raider (jeu vidéo, 2013)", "gl": "Tomb Raider (videoxogo de 2013)", "he": "טומב ריידר (משחק וידאו, 2013)", "it": "Tomb Raider (videogioco 2013)", "ja": "トゥームレイダー (2013年のゲーム)", "ko": "툼레이더 (2013년 비디오 게임)", "lt": "Tomb Raider (2013 kompiuterinis žaidimas)", "mk": "Tomb Raider (видео-игра од 2013)", "mn": "Tomb Raider (2013 оны видео тоглоом)", "ms": "Tomb Raider (permainan video 2013)", "nb": "Tomb Raider (2013)", "nl": "Tomb Raider (2013)", "pl": "Tomb Raider (gra komputerowa 2013)", "pt": "Tomb Raider (jogo eletrônico de 2013)", "ro": "Tomb Raider (joc video din 2013)", "ru": "Tomb Raider (игра, 2013)", "sv": "Tomb Raider (datorspel 2013)", "th": "ทูมเรเดอร์ (วิดีโอเกม พ.ศ. 2556)", "tr": "Tomb Raider (2013 video oyunu)", "uk": "Tomb Raider (відеогра, 2013)", "ur": "ٹومب ریڈر (ویڈیو گیم 2013)", "vi": "Tomb Raider (trò chơi điện tử 2013)", "zh": "古墓丽影 (2013年游戏)", "arz": "تومب رايدر (فيديو لعب 2013)", "pnb": "ٹومب ریڈر (ویڈیو گیم 2013)"}	Tomb Raider is a 2013 action-adventure video game developed by Crystal Dynamics and published by Square Enix. It is the tenth title in the Tomb Raider franchise, and operates as a reboot that reconstructs the origins of Lara Croft.[4][5] Tomb Raider was first released on 5 March 2013 for Microsoft Windows, PlayStation 3 and Xbox 360, and later on 23 January 2014 for OS X, on 27 April 2016 for Linux,[6] and on 7 March 2017 for Shield TV.[7]	{"en": "Tomb Raider is a 2013 action-adventure video game developed by Crystal Dynamics and published by Square Enix. It is the tenth title in the Tomb Raider franchise, and operates as a reboot that reconstructs the origins of Lara Croft.[4][5] Tomb Raider was first released on 5 March 2013 for Microsoft Windows, PlayStation 3 and Xbox 360, and later on 23 January 2014 for OS X, on 27 April 2016 for Linux,[6] and on 7 March 2017 for Shield TV.[7]"}	["https://upload.wikimedia.org/wikipedia/en/f/f1/TombRaider2013.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AA%D9%88%D9%85_%D8%B1%D9%8A%D8%AF%D8%B1_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88_2013)", "wikipedia_az": "https://az.wikipedia.org/wiki/Tomb_Raider_(2013_video_oyun)", "wikipedia_bn": "https://bn.wikipedia.org/wiki/%E0%A6%9F%E0%A7%81%E0%A6%AE%E0%A7%8D%E0%A6%AC_%E0%A6%B0%E0%A6%BE%E0%A6%87%E0%A6%A1%E0%A6%BE%E0%A6%B0_(%E0%A7%A8%E0%A7%A6%E0%A7%A7%E0%A7%A9-%E0%A6%8F%E0%A6%B0_%E0%A6%AD%E0%A6%BF%E0%A6%A1%E0%A6%BF%E0%A6%93_%E0%A6%97%E0%A7%87%E0%A6%AE)", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Tomb_Raider_(2013)", "wikipedia_de": "https://de.wikipedia.org/wiki/Tomb_Raider_(2013)", "wikipedia_en": "https://en.wikipedia.org/wiki/Tomb_Raider_(2013_video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Tomb_Raider_(videojuego_de_2013)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%85%D9%87%D8%A7%D8%AC%D9%85_%D9%85%D9%82%D8%A8%D8%B1%D9%87_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C_%DB%B2%DB%B0%DB%B1%DB%B3)", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Tomb_Raider_(vuoden_2013_videopeli)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Tomb_Raider_(jeu_vid%C3%A9o,_2013)", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Tomb_Raider_(videoxogo_de_2013)", "wikipedia_he": "https://he.wikipedia.org/wiki/%D7%98%D7%95%D7%9E%D7%91_%D7%A8%D7%99%D7%99%D7%93%D7%A8_(%D7%9E%D7%A9%D7%97%D7%A7_%D7%95%D7%99%D7%93%D7%90%D7%95,_2013)", "wikipedia_it": "https://it.wikipedia.org/wiki/Tomb_Raider_(videogioco_2013)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%88%E3%82%A5%E3%83%BC%E3%83%A0%E3%83%AC%E3%82%A4%E3%83%80%E3%83%BC_(2013%E5%B9%B4%E3%81%AE%E3%82%B2%E3%83%BC%E3%83%A0)", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%88%BC%EB%A0%88%EC%9D%B4%EB%8D%94_(2013%EB%85%84_%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Tomb_Raider_(2013_kompiuterinis_%C5%BEaidimas)", "wikipedia_mk": "https://mk.wikipedia.org/wiki/Tomb_Raider_(%D0%B2%D0%B8%D0%B4%D0%B5%D0%BE-%D0%B8%D0%B3%D1%80%D0%B0_%D0%BE%D0%B4_2013)", "wikipedia_mn": "https://mn.wikipedia.org/wiki/Tomb_Raider_(2013_%D0%BE%D0%BD%D1%8B_%D0%B2%D0%B8%D0%B4%D0%B5%D0%BE_%D1%82%D0%BE%D0%B3%D0%BB%D0%BE%D0%BE%D0%BC)", "wikipedia_ms": "https://ms.wikipedia.org/wiki/Tomb_Raider_(permainan_video_2013)", "wikipedia_nb": "https://no.wikipedia.org/wiki/Tomb_Raider_(2013)", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Tomb_Raider_(2013)", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Tomb_Raider_(gra_komputerowa_2013)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Tomb_Raider_(jogo_eletr%C3%B4nico_de_2013)", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Tomb_Raider_(joc_video_din_2013)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Tomb_Raider_(%D0%B8%D0%B3%D1%80%D0%B0,_2013)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Tomb_Raider_(datorspel_2013)", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%97%E0%B8%B9%E0%B8%A1%E0%B9%80%E0%B8%A3%E0%B9%80%E0%B8%94%E0%B8%AD%E0%B8%A3%E0%B9%8C_(%E0%B8%A7%E0%B8%B4%E0%B8%94%E0%B8%B5%E0%B9%82%E0%B8%AD%E0%B9%80%E0%B8%81%E0%B8%A1_%E0%B8%9E.%E0%B8%A8._2556)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Tomb_Raider_(2013_video_oyunu)", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Tomb_Raider_(%D0%B2%D1%96%D0%B4%D0%B5%D0%BE%D0%B3%D1%80%D0%B0,_2013)", "wikipedia_ur": "https://ur.wikipedia.org/wiki/%D9%B9%D9%88%D9%85%D8%A8_%D8%B1%DB%8C%DA%88%D8%B1_(%D9%88%DB%8C%DA%88%DB%8C%D9%88_%DA%AF%DB%8C%D9%85_2013)", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Tomb_Raider_(tr%C3%B2_ch%C6%A1i_%C4%91i%E1%BB%87n_t%E1%BB%AD_2013)", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%8F%A4%E5%A2%93%E4%B8%BD%E5%BD%B1_(2013%E5%B9%B4%E6%B8%B8%E6%88%8F)", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AA%D9%88%D9%85%D8%A8_%D8%B1%D8%A7%D9%8A%D8%AF%D8%B1_(%D9%81%D9%8A%D8%AF%D9%8A%D9%88_%D9%84%D8%B9%D8%A8_2013)", "wikipedia_pnb": "https://pnb.wikipedia.org/wiki/%D9%B9%D9%88%D9%85%D8%A8_%D8%B1%DB%8C%DA%88%D8%B1_(%D9%88%DB%8C%DA%88%DB%8C%D9%88_%DA%AF%DB%8C%D9%85_2013)"}	tomb-raider	2020-12-21 16:12:07.662565+00	2020-12-21 16:12:07.662595+00	NA
150	Borderlands 3	{"en": "Borderlands 3"}	Borderlands 3 is an action role-playing first-person shooter video game developed by Gearbox Software and published by 2K Games. It is a sequel to 2012's Borderlands 2, and the fourth entry in the main Borderlands series. Borderlands 3 was released on 13 September 2019 for Microsoft Windows, PlayStation 4, Xbox One and on 30 October 2019 for Apple macOS. A Stadia port was released on 17 December 2019. Versions for the Xbox Series X and Series S and PlayStation 5 including free upgrades for users on the prior console versions were released on 10 and 12 November, respectively.	{"en": "Borderlands 3 is an action role-playing first-person shooter video game developed by Gearbox Software and published by 2K Games. It is a sequel to 2012's Borderlands 2, and the fourth entry in the main Borderlands series. Borderlands 3 was released on 13 September 2019 for Microsoft Windows, PlayStation 4, Xbox One and on 30 October 2019 for Apple macOS. A Stadia port was released on 17 December 2019. Versions for the Xbox Series X and Series S and PlayStation 5 including free upgrades for users on the prior console versions were released on 10 and 12 November, respectively."}	["https://upload.wikimedia.org/wikipedia/en/2/21/Borderlands_3_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/be080ad40b434ca289166031d3e88623rcp1/sku/958f4c0900c64e7e83b9218ab479304e"}	borderlands-3	2020-12-20 04:10:34.622885+00	2021-02-05 23:20:47.06182+00	M17+
264	Blasphemous	{"en": "Blasphemous", "es": "Blasphemous", "fr": "Blasphemous", "it": "Blasphemous", "ru": "Blasphemous", "tr": "Blasphemous (video oyunu)"}	Blasphemous is a Metroidvania video game developed by Spanish studio The Game Kitchen[2] and published by Team17. The game was released for Nintendo Switch, PC, PlayStation 4 and Xbox One on 10 September 2019.	{"en": "Blasphemous is a Metroidvania video game developed by Spanish studio The Game Kitchen[2] and published by Team17. The game was released for Nintendo Switch, PC, PlayStation 4 and Xbox One on 10 September 2019."}	["https://upload.wikimedia.org/wikipedia/en/c/cd/Blasphemous_%28video_game%29.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Blasphemous_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Blasphemous", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Blasphemous", "wikipedia_it": "https://it.wikipedia.org/wiki/Blasphemous", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Blasphemous", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Blasphemous_(video_oyunu)"}	blasphemous	2020-12-21 20:10:27.563269+00	2020-12-21 20:10:27.56329+00	NA
171	GRID	{"en": "GRID"}	GRID is a racing video game developed and published by Codemasters for Microsoft Windows, Stadia, PlayStation 4 and Xbox One. It is the tenth title in the TOCA series.[1] Initially scheduled for release on 13 September 2019,[2] its release date was delayed, and released on 11 October 2019.[3]	{"en": "GRID is a racing video game developed and published by Codemasters for Microsoft Windows, Stadia, PlayStation 4 and Xbox One. It is the tenth title in the TOCA series.[1] Initially scheduled for release on 13 September 2019,[2] its release date was delayed, and released on 11 October 2019.[3]"}	["https://upload.wikimedia.org/wikipedia/en/a/a5/Grid_2019_cover_art.png"]	{"stadia": "https://stadia.google.com/store/details/ca805d3d37404654a91d2ea62fad7bd4rcp1/sku/75be643ff0fb40d7873fa41edb10d98a"}	grid	2020-12-20 04:21:09.14053+00	2021-02-05 23:20:47.599066+00	E
182	SUPERHOT	{"en": "SUPERHOT"}	Superhot is an independent first-person shooter video game developed and published by Superhot Team. Though the game follows traditional first-person shooter gameplay mechanics, with the player attempting to take out enemy targets using guns and other weapons, time within the game progresses at normal speed only when the player moves; this creates the opportunity for the player to assess their situation in slow motion and respond appropriately, making the gameplay similar to strategy video games. The game is presented in a minimalist art style, with enemies in red and weapons in black, in contrast to the otherwise white and grey environment.	{"en": "Superhot is an independent first-person shooter video game developed and published by Superhot Team. Though the game follows traditional first-person shooter gameplay mechanics, with the player attempting to take out enemy targets using guns and other weapons, time within the game progresses at normal speed only when the player moves; this creates the opportunity for the player to assess their situation in slow motion and respond appropriately, making the gameplay similar to strategy video games. The game is presented in a minimalist art style, with enemies in red and weapons in black, in contrast to the otherwise white and grey environment."}	[]	{"stadia": "https://stadia.google.com/store/details/f7afcff709e74227a5648aacadf03815rcp1/sku/ce8a411f4dc2470da828fc259c584aa5"}	superhot	2020-12-21 16:11:58.99706+00	2021-02-05 23:20:47.344565+00	T
4	Ark: Survival Evolved	{"ar": "آرك: سرفايفل إفولفد", "cs": "Ark: Survival Evolved", "de": "ARK: Survival Evolved", "en": "Ark: Survival Evolved", "eo": "Ark: Survival Evolved", "es": "Ark: Survival Evolved", "fi": "Ark: Survival Evolved", "fr": "Ark: Survival Evolved", "he": "Ark: Survival Evolved", "id": "Ark: Survival Evolved", "it": "Ark: Survival Evolved", "ko": "아크 서바이벌 이볼브드", "la": "Ark: Survival Evolved", "lt": "Ark: Survival Evolved", "pl": "Ark: Survival Evolved", "pt": "Ark: Survival Evolved", "ru": "Ark: Survival Evolved", "tr": "ARK: Survival Evolved", "uk": "Ark: Survival Evolved", "zh": "方舟：生存进化", "arz": "ارك: سرفايفل افولفد"}	Ark: Survival Evolved (stylized as ΛRK) is a 2017 action-adventure survival video game developed by Studio Wildcard, in collaboration with Instinct Games, Efecto Studios, and Virtual Basement. In the game, players must survive being stranded on an island filled with roaming dinosaurs and other prehistoric animals, natural hazards, and potentially hostile human players.	{"en": "Ark: Survival Evolved (stylized as ΛRK) is a 2017 action-adventure survival video game developed by Studio Wildcard, in collaboration with Instinct Games, Efecto Studios, and Virtual Basement. In the game, players must survive being stranded on an island filled with roaming dinosaurs and other prehistoric animals, natural hazards, and potentially hostile human players."}	["https://upload.wikimedia.org/wikipedia/en/2/2b/ArkSurvivalEvolved.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A2%D8%B1%D9%83:_%D8%B3%D8%B1%D9%81%D8%A7%D9%8A%D9%81%D9%84_%D8%A5%D9%81%D9%88%D9%84%D9%81%D8%AF", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_de": "https://de.wikipedia.org/wiki/ARK:_Survival_Evolved", "wikipedia_en": "https://en.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_eo": "https://eo.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_es": "https://es.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_he": "https://he.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_id": "https://id.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_it": "https://it.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%95%84%ED%81%AC_%EC%84%9C%EB%B0%94%EC%9D%B4%EB%B2%8C_%EC%9D%B4%EB%B3%BC%EB%B8%8C%EB%93%9C", "wikipedia_la": "https://la.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_tr": "https://tr.wikipedia.org/wiki/ARK:_Survival_Evolved", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Ark:_Survival_Evolved", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%96%B9%E8%88%9F%EF%BC%9A%E7%94%9F%E5%AD%98%E8%BF%9B%E5%8C%96", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D8%B1%D9%83:_%D8%B3%D8%B1%D9%81%D8%A7%D9%8A%D9%81%D9%84_%D8%A7%D9%81%D9%88%D9%84%D9%81%D8%AF"}	ark-survival-evolved	2020-12-13 04:39:08.289561+00	2020-12-21 16:11:59.195511+00	NA
149	Assassin's Creed Origins	{"en": "Assassin's Creed Origins"}	Assassin's Creed Origins is a 2017 action-adventure video game developed and published by Ubisoft. It is the tenth major installment in the Assassin's Creed series and the successor to 2015's Assassin's Creed Syndicate. The game is set in Ancient Egypt near the end of the Ptolemaic period (49–44 BC). The story follows a Medjay named Bayek, and explores the origins of the centuries-long conflict between the Hidden Ones—forerunners to the Brotherhood of Assassins—who fight for peace by promoting liberty, and The Order of the Ancients—forerunners to the Templar Order—who desire peace through the forced imposition of order. Featuring a large open world, Origins adopted elements from role-playing video games and incorporated an overhauled "hitbox-based" combat system.	{"en": "Assassin's Creed Origins is a 2017 action-adventure video game developed and published by Ubisoft. It is the tenth major installment in the Assassin's Creed series and the successor to 2015's Assassin's Creed Syndicate. The game is set in Ancient Egypt near the end of the Ptolemaic period (49–44 BC). The story follows a Medjay named Bayek, and explores the origins of the centuries-long conflict between the Hidden Ones—forerunners to the Brotherhood of Assassins—who fight for peace by promoting liberty, and The Order of the Ancients—forerunners to the Templar Order—who desire peace through the forced imposition of order. Featuring a large open world, Origins adopted elements from role-playing video games and incorporated an overhauled \\"hitbox-based\\" combat system."}	["https://upload.wikimedia.org/wikipedia/en/4/4a/Assassin%27s_Creed_Origins_Cover_Art.png"]	{"stadia": "https://stadia.google.com/store/details/11dfda5b2d78475d8624972b9b78c995rcp1/sku/562bc9b24c514a019dddd4d848bec0b9p"}	assassins-creed-origins	2020-12-20 04:10:34.609022+00	2021-02-05 23:20:47.067947+00	M17+
71	The Gardens Between	{"en": "The Gardens Between"}	The Gardens Between is a puzzle video game developed by Australian studio The Voxel Agents, released in September 2018 for Microsoft Windows, macOS, Linux, Nintendo Switch, PlayStation 4 and Xbox One. The game was released for  Stadia on November 1, 2020.[1]	{"en": "The Gardens Between is a puzzle video game developed by Australian studio The Voxel Agents, released in September 2018 for Microsoft Windows, macOS, Linux, Nintendo Switch, PlayStation 4 and Xbox One. The game was released for  Stadia on November 1, 2020.[1]"}	["https://upload.wikimedia.org/wikipedia/en/a/a5/The_gardens_between_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/cf65dc95d523465493d6fbc482452227rcp1/sku/86269481f3884521806398d7d875df9e"}	the-gardens-between	2020-12-17 19:51:10.662063+00	2021-02-05 23:20:46.419354+00	E
214	SAMURAI SHODOWN	{"en": "SAMURAI SHODOWN"}	Samurai Shodown (known as Samurai Spirits in Japan) is a 2019 fighting game developed and published by SNK for arcades, PlayStation 4, Xbox One, Nintendo Switch, Stadia, Xbox Series X/S and Windows as an entry in the Samurai Shodown series.	{"en": "Samurai Shodown (known as Samurai Spirits in Japan) is a 2019 fighting game developed and published by SNK for arcades, PlayStation 4, Xbox One, Nintendo Switch, Stadia, Xbox Series X/S and Windows as an entry in the Samurai Shodown series."}	["https://upload.wikimedia.org/wikipedia/en/a/ac/Samurai_Shodown_2019_cover_art.png"]	{"stadia": "https://stadia.google.com/store/details/120348c2707740b99b509fad49a2f45drcp1/sku/888a817c35b5439bb6a03a78ab09e138"}	samurai-shodown	2020-12-21 16:12:04.968558+00	2021-02-05 23:20:48.283198+00	M17+
189	Metro Exodus	{"en": "Metro Exodus"}	Metro Exodus is a first-person shooter video game developed by 4A Games and published by Deep Silver. It is the third installment in the Metro video game trilogy based on Dmitry Glukhovsky's novels, following the events of Metro 2033 and Metro: Last Light. It released in 2019 for Microsoft Windows, PlayStation 4, Xbox One and Stadia and in 2020 for Amazon Luna. An enhanced version of the game is also planned to release for PlayStation 5 and Xbox Series X/S in 2021.[1] The game received positive reviews from critics.	{"en": "Metro Exodus is a first-person shooter video game developed by 4A Games and published by Deep Silver. It is the third installment in the Metro video game trilogy based on Dmitry Glukhovsky's novels, following the events of Metro 2033 and Metro: Last Light. It released in 2019 for Microsoft Windows, PlayStation 4, Xbox One and Stadia and in 2020 for Amazon Luna. An enhanced version of the game is also planned to release for PlayStation 5 and Xbox Series X/S in 2021.[1] The game received positive reviews from critics."}	["https://upload.wikimedia.org/wikipedia/en/a/af/Cover_Art_of_Metro_Exodus.png"]	{"stadia": "https://stadia.google.com/store/details/879d82512f5441829250ead1aa678a70rcp1/sku/8ca5e97f091e4f7fbfcf8069ba850b1f"}	metro-exodus	2020-12-21 16:12:02.874275+00	2021-02-05 23:20:47.258737+00	M17+
165	Football Manager 2020	{"en": "Football Manager 2020"}	Football Manager 2020 (officially abbreviated as FM20) is a 2019 football-management simulation video game developed by Sports Interactive and published by Sega as a successor to Football Manager 2019. It was released worldwide on 18 November 2019.[1]	{"en": "Football Manager 2020 (officially abbreviated as FM20) is a 2019 football-management simulation video game developed by Sports Interactive and published by Sega as a successor to Football Manager 2019. It was released worldwide on 18 November 2019.[1]"}	["https://upload.wikimedia.org/wikipedia/en/0/04/Football_Manager_2020_Cover.jpg"]	{"stadia": "https://stadia.google.com/store/details/8a3cc52ad2334b1e91ded77bc43644e0rcp1/sku/32a0791a88474f08ad7a687846b786f2"}	football-manager-2020	2020-12-20 04:21:08.889079+00	2021-02-05 23:20:47.447769+00	E
324	One Hand Clapping	{"en": "One Hand Clapping"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/76309b9f2f294b07b410e8b6aa879273rcp1/sku/55b718bf03544bd3a9f6a62946fe7436"}	one-hand-clapping	2021-02-05 16:52:22.200202+00	2021-02-05 23:20:47.511321+00	E
307	Shadow of the Tomb Raider Definitive Edition	{"en": "Shadow of the Tomb Raider Definitive Edition"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/efa3b6108d3e41689b2223ba9d48f5c8rcp1/sku/bb9bcb490fd145d9997c8b3ff3f1039f"}	shadow-of-the-tomb-raider-definitive-edition	2021-02-05 16:52:20.874814+00	2021-02-05 23:20:48.275678+00	M17+
162	Far Cry 5	{"en": "Far Cry 5"}	Far Cry 5 is a 2018 first-person shooter game developed by Ubisoft Montreal and Ubisoft Toronto and published by Ubisoft. It is the fifth main installment in the Far Cry series.	{"en": "Far Cry 5 is a 2018 first-person shooter game developed by Ubisoft Montreal and Ubisoft Toronto and published by Ubisoft. It is the fifth main installment in the Far Cry series."}	["https://upload.wikimedia.org/wikipedia/en/0/03/Far_Cry_5_boxshot.jpg"]	{"stadia": "https://stadia.google.com/store/details/7d9beb13648d44839b9aeea7555c37c0rcp1/sku/b446084511c54da8a9b3381be38255c7p"}	far-cry-5	2020-12-20 04:21:08.639128+00	2021-02-05 23:20:47.154344+00	M17+
138	The Turing Test	{"en": "The Turing Test"}	The Turing Test is a first-person puzzle video game developed by Bulkhead Interactive and published by Square Enix. The game was released for Microsoft Windows and Xbox One in August 2016, for PlayStation 4 in January 2017, for Nintendo Switch in February 2020, and for Stadia in May 2020.	{"en": "The Turing Test is a first-person puzzle video game developed by Bulkhead Interactive and published by Square Enix. The game was released for Microsoft Windows and Xbox One in August 2016, for PlayStation 4 in January 2017, for Nintendo Switch in February 2020, and for Stadia in May 2020."}	["https://upload.wikimedia.org/wikipedia/en/a/a3/Turing_test_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/cfd2977e1b9f412387ca2f44848400acrcp1/sku/e8ed70244808408cbb7d3b2b1f06547f"}	the-turing-test	2020-12-18 16:36:43.679466+00	2021-02-05 23:20:49.327908+00	T
239	West of Loathing	{"en": "West of Loathing"}	West of Loathing is a comedy adventure role-playing video game developed by Asymmetric Publications and released on 10 August 2017.	{"en": "West of Loathing is a comedy adventure role-playing video game developed by Asymmetric Publications and released on 10 August 2017."}	["https://upload.wikimedia.org/wikipedia/en/c/c3/West_of_Loathing_game_logo.png"]	{"stadia": "https://stadia.google.com/store/details/0a60fff637b445a797623d0c69433a9crcp1/sku/772119af45f44182bca3ff8d39f62b0b"}	west-of-loathing	2020-12-21 16:12:08.443452+00	2021-02-05 23:20:49.348344+00	T
329	Farming Simulator 19	{"en": "Farming Simulator 19"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/ebf235012b054269af70eee901bc85cfrcp1/sku/c50094b71d054fc28f3116245d9dbc9a"}	farming-simulator-19	2021-02-05 16:52:22.463543+00	2021-02-05 23:20:46.566142+00	E
181	Just Dance 2020	{"en": "Just Dance 2020"}	Just Dance 2020 is a dance rhythm game developed by Ubisoft. It was unveiled on June 10, 2019, during its E3 press conference as the eleventh main installment of the series,[1] celebrating the series' tenth anniversary, and released on November 5, 2019 for Nintendo Switch, Wii, PlayStation 4, Xbox One and Stadia.[2][3] It was also the first game in the series to be released on Stadia. The game was exclusively released on the Nintendo Switch in Japan on March 12, 2020.[4]  	{"en": "Just Dance 2020 is a dance rhythm game developed by Ubisoft. It was unveiled on June 10, 2019, during its E3 press conference as the eleventh main installment of the series,[1] celebrating the series' tenth anniversary, and released on November 5, 2019 for Nintendo Switch, Wii, PlayStation 4, Xbox One and Stadia.[2][3] It was also the first game in the series to be released on Stadia. The game was exclusively released on the Nintendo Switch in Japan on March 12, 2020.[4]  "}	["https://upload.wikimedia.org/wikipedia/en/4/4e/Just_Dance_2020.jpg"]	{"stadia": "https://stadia.google.com/store/details/4b7f307c37364d659118bf7d435733c7rcp1/sku/3feef74cbacf4ba39b5d9087e0dfb9e4"}	just-dance-2020	2020-12-20 04:21:10.247152+00	2021-02-05 23:20:46.3763+00	E10+
338	Little Big Workshop	{"en": "Little Big Workshop"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/e4e8f5e5bc744270a644c554ba3f2962rcp1/sku/c00cecabcbde4e95bdab69be6e80b40bp"}	little-big-workshop	2021-02-05 16:52:23.08883+00	2021-02-05 23:20:46.587114+00	E
144	Assassin's Creed Odyssey	{"en": "Assassin's Creed Odyssey"}	Assassin's Creed Odyssey is an action role-playing video game developed by Ubisoft Quebec and published by Ubisoft. It is the eleventh major installment, and 21st overall, in the Assassin's Creed series and the successor to 2017's Assassin's Creed Origins. Set in the years 431–422 BCE, the plot tells a mythological history of the Peloponnesian War between Athens and Sparta. Players control a male or female mercenary (Ancient Greek: μίσθιος misthios) who fights on both sides of the conflict as they attempt to unite their family.	{"en": "Assassin's Creed Odyssey is an action role-playing video game developed by Ubisoft Quebec and published by Ubisoft. It is the eleventh major installment, and 21st overall, in the Assassin's Creed series and the successor to 2017's Assassin's Creed Origins. Set in the years 431–422 BCE, the plot tells a mythological history of the Peloponnesian War between Athens and Sparta. Players control a male or female mercenary (Ancient Greek: μίσθιος misthios) who fights on both sides of the conflict as they attempt to unite their family."}	["https://upload.wikimedia.org/wikipedia/en/9/99/ACOdysseyCoverArt.png"]	{"stadia": "https://stadia.google.com/store/details/8b7e7f7036e5483eaa8745d46248536crcp1/sku/6760aad6e75b4edc9686c48e8dd38936"}	assassins-creed-odyssey	2020-12-20 04:10:34.368513+00	2021-02-05 23:20:47.109798+00	M17+
39	Hello Neighbor	{"en": "Hello Neighbor"}	Hello Neighbor is a survival horror stealth game developed by Russian video game studio Dynamic Pixels and published by tinyBuild. The goal of the game is to successfully sneak into the basement of the neighbor's house to uncover a secret.[3] The game's artificial intelligence (AI) modifies the neighbor's behavior based on the player's past actions, such as setting traps along paths the player followed in a previous attempt.[4][5][6] A sequel, Hello Neighbor 2, is scheduled for release in 2021.	{"en": "Hello Neighbor is a survival horror stealth game developed by Russian video game studio Dynamic Pixels and published by tinyBuild. The goal of the game is to successfully sneak into the basement of the neighbor's house to uncover a secret.[3] The game's artificial intelligence (AI) modifies the neighbor's behavior based on the player's past actions, such as setting traps along paths the player followed in a previous attempt.[4][5][6] A sequel, Hello Neighbor 2, is scheduled for release in 2021."}	["https://upload.wikimedia.org/wikipedia/en/5/59/Hello_Neighbor_Cover_Art.jpg"]	{"stadia": "https://stadia.google.com/store/details/9dc548a191914b419cc80802ca64788frcp1/sku/dc0627d002f24fdba14ac6755250360ep"}	hello-neighbor	2020-12-17 19:51:06.24486+00	2021-02-05 23:20:49.178659+00	E10+
339	Monster Jam Steel Titans	{"en": "Monster Jam Steel Titans"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/e7506ec75c8046dfa7879fe604505ca7rcp1/sku/2af064a6b4814ae6a280ab8018842623p"}	monster-jam-steel-titans	2021-02-05 16:52:23.198236+00	2021-02-05 23:20:46.309926+00	E
177	Into The Breach	{"en": "Into The Breach"}	Into the Breach is a turn-based strategy video game developed and published by indie studio Subset Games, consisting of Justin Ma and Matthew Davis. Into the Breach is their second game, following FTL: Faster Than Light. It features writing by Chris Avellone and music composed by Ben Prunty. It was released for Microsoft Windows in February 2018, for macOS and Nintendo Switch in August 2018, and for Linux in April 2020. The Nintendo Switch version was released in Japan on September 18, 2020.[1]	{"en": "Into the Breach is a turn-based strategy video game developed and published by indie studio Subset Games, consisting of Justin Ma and Matthew Davis. Into the Breach is their second game, following FTL: Faster Than Light. It features writing by Chris Avellone and music composed by Ben Prunty. It was released for Microsoft Windows in February 2018, for macOS and Nintendo Switch in August 2018, and for Linux in April 2020. The Nintendo Switch version was released in Japan on September 18, 2020.[1]"}	["https://upload.wikimedia.org/wikipedia/en/e/e5/Into_the_breach_cover.png"]	{"stadia": "https://stadia.google.com/store/details/1a871cfe8a7d4ebc8592c2ad4bc07150rcp1/sku/ab83a7b5efed40188c8ab8798d7dbfa6"}	into-the-breach	2020-12-20 04:21:10.147608+00	2021-02-05 23:20:46.372308+00	E10+
155	DOOM Eternal	{"en": "DOOM Eternal"}	Doom Eternal is a first-person shooter video game developed by id Software and published by Bethesda Softworks. The sequel to Doom (2016), and the fifth main game in the Doom series, it was released on March 20, 2020, for Windows, PlayStation 4, Stadia and Xbox One, with a version for Nintendo Switch being released on December 8, 2020 and versions for PlayStation 5 and Xbox Series X and Series S being planned. Set some time after the events of the 2016 game, the story follows the Doom Slayer once again, on a mission to end Hell's consumption of Earth and foil the alien Maykrs' plans to exterminate humanity.	{"en": "Doom Eternal is a first-person shooter video game developed by id Software and published by Bethesda Softworks. The sequel to Doom (2016), and the fifth main game in the Doom series, it was released on March 20, 2020, for Windows, PlayStation 4, Stadia and Xbox One, with a version for Nintendo Switch being released on December 8, 2020 and versions for PlayStation 5 and Xbox Series X and Series S being planned. Set some time after the events of the 2016 game, the story follows the Doom Slayer once again, on a mission to end Hell's consumption of Earth and foil the alien Maykrs' plans to exterminate humanity."}	["https://upload.wikimedia.org/wikipedia/en/9/9d/Cover_Art_of_Doom_Eternal.png"]	{"stadia": "https://stadia.google.com/store/details/632522c846a041ce801e47b96ba2e265rcp1/sku/b171fc78d4e1496d9536d585257a771e"}	doom-eternal	2020-12-20 04:21:08.280823+00	2021-02-05 23:20:47.14332+00	M17+
330	PAC-MAN Mega Tunnel Battle	{"en": "PAC-MAN Mega Tunnel Battle"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/9affbc684aeb422086bfb5d0c8bf2f55rcp1/sku/9a25de2639254575abb6f2d58d5c57e5"}	pac-man-mega-tunnel-battle	2021-02-05 16:52:22.611563+00	2021-02-05 23:20:47.628186+00	E
201	Orcs Must Die! 3	{"en": "Orcs Must Die! 3"}	Orcs Must Die! 3 is a 2020 action-tower defense video game developed and published by Robot Entertainment. It is the fourth installment in the Orcs Must Die! series, and the direct sequel to Orcs Must Die! 2. It released as a timed exclusive on Stadia on July 14, 2020, but there are plans to bring it to other platforms at a future date.[1][2][3]	{"en": "Orcs Must Die! 3 is a 2020 action-tower defense video game developed and published by Robot Entertainment. It is the fourth installment in the Orcs Must Die! series, and the direct sequel to Orcs Must Die! 2. It released as a timed exclusive on Stadia on July 14, 2020, but there are plans to bring it to other platforms at a future date.[1][2][3]"}	["https://upload.wikimedia.org/wikipedia/en/2/2f/Orcs_Must_Die%21_3_logo.png"]	{"stadia": "https://stadia.google.com/store/details/c1928530515748da9f55afc7243fd3e1rcp1/sku/fa63c6e891ff4d1bb76c4ac7580c119a"}	orcs-must-die-3	2020-12-21 16:12:03.725382+00	2021-02-05 23:20:49.183441+00	T
331	El Hijo - A Wild West Tale	{"en": "El Hijo - A Wild West Tale"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/d46f9c2d858d41d6ae4cc12d186657f0rcp1/sku/4761cd53808a462ca823a9e403baea99"}	el-hijo-a-wild-west-tale	2021-02-05 16:52:22.634242+00	2021-02-05 23:20:46.279037+00	E
199	Outward	{"en": "Outward"}	Outward is an open world[3] fantasy role-playing video game developed by Canadian studio Nine Dots[4] and published by Deep Silver.[2] The game can be played in multiplayer both online and or locally through split-screen. The game focuses on survival[3] as well as the concept of the player being a commoner rather than a hero, and features several survival game aspects.[2]	{"en": "Outward is an open world[3] fantasy role-playing video game developed by Canadian studio Nine Dots[4] and published by Deep Silver.[2] The game can be played in multiplayer both online and or locally through split-screen. The game focuses on survival[3] as well as the concept of the player being a commoner rather than a hero, and features several survival game aspects.[2]"}	["https://upload.wikimedia.org/wikipedia/en/4/4a/Outward_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/8185df0ce9d74d61aab58a12d4bf21a0rcp1/sku/6eaae50957c0401e8d6d893bda9d9b97p"}	outward	2020-12-21 16:12:03.685794+00	2021-02-05 23:20:48.091668+00	M17+
267	Iconoclasts	{"en": "Iconoclasts", "uk": "Iconoclasts"}	Iconoclasts is a platform game by Swedish developer Joakim "Konjak" Sandberg and published by Bifrost Entertainment. The game was released on January 23, 2018 for Microsoft Windows, macOS, Linux, PlayStation 4 and PlayStation Vita, and August 2, 2018 for the Nintendo Switch and it was also was released on January 23, 2020 for Xbox One.	{"en": "Iconoclasts is a platform game by Swedish developer Joakim \\"Konjak\\" Sandberg and published by Bifrost Entertainment. The game was released on January 23, 2018 for Microsoft Windows, macOS, Linux, PlayStation 4 and PlayStation Vita, and August 2, 2018 for the Nintendo Switch and it was also was released on January 23, 2020 for Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/1/1d/Iconoclasts_Cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Iconoclasts_(video_game)", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Iconoclasts"}	iconoclasts	2020-12-21 20:10:27.679903+00	2020-12-21 20:10:27.679924+00	NA
142	Ary and the Secret of Seasons	{"en": "Ary and the Secret of Seasons"}	Ary and the Secret of Seasons is an action-adventure game developed by Belgian indie studio Exiin, ported on consoles by Fishing Cactus[1] and published by Modus Games. The game was released on Microsoft Windows via Steam, and Xbox One, PlayStation 4 and Nintendo Switch on September 1, 2020, and Stadia on November 5, 2020.[2]	{"en": "Ary and the Secret of Seasons is an action-adventure game developed by Belgian indie studio Exiin, ported on consoles by Fishing Cactus[1] and published by Modus Games. The game was released on Microsoft Windows via Steam, and Xbox One, PlayStation 4 and Nintendo Switch on September 1, 2020, and Stadia on November 5, 2020.[2]"}	["https://upload.wikimedia.org/wikipedia/en/1/10/Ary_and_the_Secret_of_Seasons.jpg"]	{"stadia": "https://stadia.google.com/store/details/016636d5f49f4862be3ff8cbcf6c7adercp1/sku/be70e67b1fd64dc2bb4f002e65239731p"}	ary-and-the-secret-of-seasons	2020-12-20 04:10:34.218796+00	2021-02-05 23:20:46.12232+00	E10+
69	Sniper Elite 4	{"en": "Sniper Elite 4"}	Sniper Elite 4 is a third-person tactical shooter stealth video game developed and published by Rebellion Developments. The sequel to Sniper Elite III, the game was released for Microsoft Windows, PlayStation 4 and Xbox One on 14 February 2017 and for Stadia on 1 November 2020. A Nintendo Switch port of the game was released on 17 November 2020.	{"en": "Sniper Elite 4 is a third-person tactical shooter stealth video game developed and published by Rebellion Developments. The sequel to Sniper Elite III, the game was released for Microsoft Windows, PlayStation 4 and Xbox One on 14 February 2017 and for Stadia on 1 November 2020. A Nintendo Switch port of the game was released on 17 November 2020."}	["https://upload.wikimedia.org/wikipedia/en/9/90/Sniper_Elite_4_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/1376a179ca87458b85acd44341854772rcp1/sku/b485ca2ff43a4c658b32bd638546142cp"}	sniper-elite-4	2020-12-17 19:51:10.57183+00	2021-02-05 23:20:48.203564+00	M17+
180	Jotun	{"en": "Jotun", "fr": "Jotun (jeu vidéo)", "ja": "Jotun", "nb": "Jotun (videospill)", "pt": "Jotun (jogo eletrônico)", "sv": "Jotun"}	Jøtun is an action-adventure video game developed by  Canadian studio Thunder Lotus Games.[2] It was released for Windows, macOS, and Linux on September 29, 2015. The Wii U version was released on September 8, 2016, while the PlayStation 4 and Xbox One versions were released on September 9, 2016. The Nintendo Switch version was released on April 27, 2018. The Stadia version was released on May 26, 2020.	{"en": "Jøtun is an action-adventure video game developed by  Canadian studio Thunder Lotus Games.[2] It was released for Windows, macOS, and Linux on September 29, 2015. The Wii U version was released on September 8, 2016, while the PlayStation 4 and Xbox One versions were released on September 9, 2016. The Nintendo Switch version was released on April 27, 2018. The Stadia version was released on May 26, 2020."}	["https://upload.wikimedia.org/wikipedia/en/3/3c/Jotun_game_logo.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Jotun_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Jotun_(jeu_vid%C3%A9o)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Jotun", "wikipedia_nb": "https://no.wikipedia.org/wiki/Jotun_(videospill)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Jotun_(jogo_eletr%C3%B4nico)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Jotun"}	jotun	2020-12-20 04:21:10.240674+00	2020-12-21 16:12:01.825268+00	NA
341	Sundered: Eldritch Edition	{"en": "Sundered: Eldritch Edition"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/5ec4424b963f44d18d0016322c19c9f0rcp1/sku/788a1f7b00f74b26b12d7c6d62d50d96"}	sundered-eldritch-edition	2021-02-05 16:52:23.3943+00	2021-02-05 23:20:46.517086+00	E10+
276	Redout	{"en": "Redout"}	Redout is a futuristic racing video game developed and published by Italian studio 34BigThings, and co-published by Nicalis and 505 Games.[1]It is inspired by racing games such as F-Zero, Wipeout, Rollcage, and POD as stated on the game page on Steam.	{"en": "Redout is a futuristic racing video game developed and published by Italian studio 34BigThings, and co-published by Nicalis and 505 Games.[1]It is inspired by racing games such as F-Zero, Wipeout, Rollcage, and POD as stated on the game page on Steam."}	[]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Redout_(video_game)"}	redout	2020-12-21 20:10:27.969512+00	2020-12-21 20:10:27.969534+00	NA
152	DOOM 64	{"en": "DOOM 64"}	Doom 64 is a 1997 first-person shooter game developed and published by Midway Games for the Nintendo 64. It is a sequel to Doom II (1994). A remastered port was released for Windows, Nintendo Switch, PlayStation 4, and Xbox One in March 2020, and on Stadia in May 2020.	{"en": "Doom 64 is a 1997 first-person shooter game developed and published by Midway Games for the Nintendo 64. It is a sequel to Doom II (1994). A remastered port was released for Windows, Nintendo Switch, PlayStation 4, and Xbox One in March 2020, and on Stadia in May 2020."}	["https://upload.wikimedia.org/wikipedia/en/2/2b/Doom_64_box.jpg"]	{"stadia": "https://stadia.google.com/store/details/5a0e892c933c4f56b4d87976cb655ecfrcp1/sku/bcdca49dcac843f98ddb10e06ba83ee9"}	doom-64	2020-12-20 04:21:06.89406+00	2021-02-05 23:20:47.082314+00	M17+
298	Stacks On Stacks (On Stacks)	{"en": "Stacks On Stacks (On Stacks)"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/15a067411b8d4429b0954434d8f05d48rcp1/sku/7ed521aacf2a44168fb99cd1e13472ad"}	stacks-on-stacks-on-stacks	2021-02-05 16:52:19.733018+00	2021-02-05 23:20:47.485083+00	E
302	Spitlings	{"en": "Spitlings"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/921e9afe46aa478fb4aa929a7b1a6bd5rcp1/sku/f16b28e2fd224acaafeee4c19134adb4"}	spitlings	2021-02-05 16:52:20.26597+00	2021-02-05 23:20:47.5381+00	E
327	Outcasters	{"en": "Outcasters"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/8533fb04b9174c3f8dce10a2fec7b062rcp1/sku/dbea776881b04301a1815e2ad662419a"}	outcasters	2021-02-05 16:52:22.384037+00	2021-02-05 23:20:49.299049+00	E10+
346	Windbound	{"en": "Windbound"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/657210fe20ad402b85bda8f816b80d98rcp1/sku/d3e056ee79d947c29eedc5ae232d6c2ep"}	windbound	2021-02-05 16:52:24.193708+00	2021-02-05 23:20:46.22715+00	E10+
196	NBA 2K21	{"en": "NBA 2K21"}	NBA 2K21 is a basketball simulation video game that was developed by Visual Concepts and published by 2K Sports, based on the National Basketball Association (NBA). It is the 22nd installment in the NBA 2K franchise and the successor to NBA 2K20. The game was released on September 4, 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4, Xbox One, and Stadia, and on November 12, 2020 for PlayStation 5 and Xbox Series X and Series S.[1][2] The PS4, Switch, Xbox One, and PC released to mixed or average reviews, with critics criticizing the lack of originality in the gameplay, as well as microtransactions and bugs.	{"en": "NBA 2K21 is a basketball simulation video game that was developed by Visual Concepts and published by 2K Sports, based on the National Basketball Association (NBA). It is the 22nd installment in the NBA 2K franchise and the successor to NBA 2K20. The game was released on September 4, 2020 for Microsoft Windows, Nintendo Switch, PlayStation 4, Xbox One, and Stadia, and on November 12, 2020 for PlayStation 5 and Xbox Series X and Series S.[1][2] The PS4, Switch, Xbox One, and PC released to mixed or average reviews, with critics criticizing the lack of originality in the gameplay, as well as microtransactions and bugs."}	["https://upload.wikimedia.org/wikipedia/en/a/a2/NBA_2K21_-_Damian_Lilliard_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/b0a2ab7cdc194582bc4d111c07c2e30drcp1/sku/ae31d6ce393f4896b9b9d1f2f1ac676ep"}	nba-2k21	2020-12-21 16:12:03.612502+00	2021-02-05 23:20:46.594958+00	E
212	Rise of the Tomb Raider	{"ar": "رايز أوف ذا توم ريدر", "az": "Rise of the Tomb Raider", "cs": "Rise of the Tomb Raider", "de": "Rise of the Tomb Raider", "en": "Rise of the Tomb Raider", "es": "Rise of the Tomb Raider", "fa": "قیام مهاجم مقبره", "fi": "Rise of the Tomb Raider", "fr": "Rise of the Tomb Raider", "he": "Rise of the Tomb Raider", "it": "Rise of the Tomb Raider", "ja": "ライズ オブ ザ トゥームレイダー", "ko": "라이즈 오브 더 툼 레이더", "lt": "Rise of the Tomb Raider", "nl": "Rise of the Tomb Raider", "pl": "Rise of the Tomb Raider", "pt": "Rise of the Tomb Raider", "ro": "Rise of the Tomb Raider", "ru": "Rise of the Tomb Raider", "sv": "Rise of the Tomb Raider", "tr": "Rise of the Tomb Raider", "uk": "Rise of the Tomb Raider", "ur": "رائز آف دی ٹومب ریڈر", "vi": "Rise of the Tomb Raider", "zh": "盜墓者羅拉：崛起", "arz": "رايز اف ذا تومب رايدر", "pnb": "رائز آف دی ٹومب ریڈر"}	Rise of the Tomb Raider is a 2015 action-adventure video game developed by Crystal Dynamics. It is the sequel to the 2013 video game Tomb Raider and the eleventh entry in the Tomb Raider series. Its story follows Lara Croft as she ventures into Siberia in search of the legendary city of Kitezh while battling the paramilitary organization Trinity, which intends to uncover the city's promise of immortality. Lara must traverse the environment and combat enemies with firearms and stealth as she explores semi-open hubs. In these hubs she can raid challenge tombs to unlock new rewards, complete side missions, and scavenge for resources which can be used to craft useful materials.	{"en": "Rise of the Tomb Raider is a 2015 action-adventure video game developed by Crystal Dynamics. It is the sequel to the 2013 video game Tomb Raider and the eleventh entry in the Tomb Raider series. Its story follows Lara Croft as she ventures into Siberia in search of the legendary city of Kitezh while battling the paramilitary organization Trinity, which intends to uncover the city's promise of immortality. Lara must traverse the environment and combat enemies with firearms and stealth as she explores semi-open hubs. In these hubs she can raid challenge tombs to unlock new rewards, complete side missions, and scavenge for resources which can be used to craft useful materials."}	["https://upload.wikimedia.org/wikipedia/en/2/29/Rise_of_the_Tomb_Raider.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B1%D8%A7%D9%8A%D8%B2_%D8%A3%D9%88%D9%81_%D8%B0%D8%A7_%D8%AA%D9%88%D9%85_%D8%B1%D9%8A%D8%AF%D8%B1", "wikipedia_az": "https://az.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_de": "https://de.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_en": "https://en.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_es": "https://es.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D9%82%DB%8C%D8%A7%D9%85_%D9%85%D9%87%D8%A7%D8%AC%D9%85_%D9%85%D9%82%D8%A8%D8%B1%D9%87", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_he": "https://he.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_it": "https://it.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%A4%E3%82%BA_%E3%82%AA%E3%83%96_%E3%82%B6_%E3%83%88%E3%82%A5%E3%83%BC%E3%83%A0%E3%83%AC%E3%82%A4%E3%83%80%E3%83%BC", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%9D%BC%EC%9D%B4%EC%A6%88_%EC%98%A4%EB%B8%8C_%EB%8D%94_%ED%88%BC_%EB%A0%88%EC%9D%B4%EB%8D%94", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_ur": "https://ur.wikipedia.org/wiki/%D8%B1%D8%A7%D8%A6%D8%B2_%D8%A2%D9%81_%D8%AF%DB%8C_%D9%B9%D9%88%D9%85%D8%A8_%D8%B1%DB%8C%DA%88%D8%B1", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Rise_of_the_Tomb_Raider", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%9B%9C%E5%A2%93%E8%80%85%E7%BE%85%E6%8B%89%EF%BC%9A%E5%B4%9B%E8%B5%B7", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B1%D8%A7%D9%8A%D8%B2_%D8%A7%D9%81_%D8%B0%D8%A7_%D8%AA%D9%88%D9%85%D8%A8_%D8%B1%D8%A7%D9%8A%D8%AF%D8%B1", "wikipedia_pnb": "https://pnb.wikipedia.org/wiki/%D8%B1%D8%A7%D8%A6%D8%B2_%D8%A2%D9%81_%D8%AF%DB%8C_%D9%B9%D9%88%D9%85%D8%A8_%D8%B1%DB%8C%DA%88%D8%B1"}	rise-of-the-tomb-raider	2020-12-21 16:12:04.914535+00	2020-12-21 16:12:04.914554+00	NA
278	Epistory - Typing Chronicles	{"en": "Epistory - Typing Chronicles"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/cddb29b222924d11b2bf03a82fee477arcp1/sku/f22c0b322aac4f6dbb9c822780f956c7p"}	epistory-typing-chronicles	2021-02-05 16:52:18.5559+00	2021-02-05 23:20:46.30128+00	E
215	Serious Sam	{"ca": "Serious Sam", "cs": "Serious Sam", "de": "Serious Sam", "en": "Serious Sam", "es": "Serious Sam", "fa": "سریوس سم", "fi": "Serious Sam", "fr": "Serious Sam", "hr": "Serious Sam", "hu": "Serious Sam", "it": "Serious Sam", "ja": "Serious Sam", "lt": "Serious Sam", "lv": "Serious Sam", "nl": "Serious Sam", "pl": "Serious Sam (seria)", "pt": "Serious Sam (série)", "ro": "Serious Sam", "ru": "Serious Sam (серия игр)", "sh": "Serious Sam", "sv": "Serious Sam", "uk": "Серйозний Сем (серія ігор)", "zh": "重裝武力", "wuu": "英雄萨姆"}	Serious Sam is a video game series created and primarily developed by Croteam. It consists predominantly of first-person shooters. The series follows the advances of mercenary Sam "Serious" Stone against Mental, an extraterrestrial overlord who attempts to destroy humanity at various points in time. The first game, Serious Sam: The First Encounter, was released for Microsoft Windows in March 2001. Several spin-offs were developed by other developers, such as a Palm OS conversion of The First Encounter by InterActive Vision, Serious Sam: Next Encounter (on GameCube and PlayStation 2) by Climax Solent, and Serious Sam Advance (on Game Boy Advance) by Climax London. All three were published by Global Star Software.	{"en": "Serious Sam is a video game series created and primarily developed by Croteam. It consists predominantly of first-person shooters. The series follows the advances of mercenary Sam \\"Serious\\" Stone against Mental, an extraterrestrial overlord who attempts to destroy humanity at various points in time. The first game, Serious Sam: The First Encounter, was released for Microsoft Windows in March 2001. Several spin-offs were developed by other developers, such as a Palm OS conversion of The First Encounter by InterActive Vision, Serious Sam: Next Encounter (on GameCube and PlayStation 2) by Climax Solent, and Serious Sam Advance (on Game Boy Advance) by Climax London. All three were published by Global Star Software."}	["https://upload.wikimedia.org/wikipedia/en/5/55/Serious_Sam_logo.png"]	{"wikipedia_ca": "https://ca.wikipedia.org/wiki/Serious_Sam", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Serious_Sam", "wikipedia_de": "https://de.wikipedia.org/wiki/Serious_Sam", "wikipedia_en": "https://en.wikipedia.org/wiki/Serious_Sam", "wikipedia_es": "https://es.wikipedia.org/wiki/Serious_Sam", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D8%B1%DB%8C%D9%88%D8%B3_%D8%B3%D9%85", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Serious_Sam", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Serious_Sam", "wikipedia_hr": "https://hr.wikipedia.org/wiki/Serious_Sam", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Serious_Sam", "wikipedia_it": "https://it.wikipedia.org/wiki/Serious_Sam", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Serious_Sam", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Serious_Sam", "wikipedia_lv": "https://lv.wikipedia.org/wiki/Serious_Sam", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Serious_Sam", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Serious_Sam_(seria)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Serious_Sam_(s%C3%A9rie)", "wikipedia_ro": "https://ro.wikipedia.org/wiki/Serious_Sam", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Serious_Sam_(%D1%81%D0%B5%D1%80%D0%B8%D1%8F_%D0%B8%D0%B3%D1%80)", "wikipedia_sh": "https://sh.wikipedia.org/wiki/Serious_Sam", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Serious_Sam", "wikipedia_uk": "https://uk.wikipedia.org/wiki/%D0%A1%D0%B5%D1%80%D0%B9%D0%BE%D0%B7%D0%BD%D0%B8%D0%B9_%D0%A1%D0%B5%D0%BC_(%D1%81%D0%B5%D1%80%D1%96%D1%8F_%D1%96%D0%B3%D0%BE%D1%80)", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%87%8D%E8%A3%9D%E6%AD%A6%E5%8A%9B", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E8%8B%B1%E9%9B%84%E8%90%A8%E5%A7%86"}	serious-sam	2020-12-21 16:12:05.025424+00	2020-12-21 16:12:05.025443+00	NA
299	Figment	{"en": "Figment"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/7183914d07034cb1bbb8a511779bc1efrcp1/sku/dfc0719b3a5b48ab8213033dc72bfdfcp"}	figment	2021-02-05 16:52:19.848586+00	2021-02-05 23:20:46.277659+00	E10+
279	TOHU	{"en": "TOHU"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/df0f55ed73d946b8a70398fea9805e2drcp1/sku/6a40d7ab07e14609bbb3320b3c1ccb46p"}	tohu	2021-02-05 16:52:18.570772+00	2021-02-05 23:20:46.410372+00	E
173	Hotline Miami	{"en": "Hotline Miami"}	Hotline Miami is a top-down shooter video game by Jonatan Söderström and Dennis Wedin, collectively known as Dennaton Games. The game was published by Devolver Digital and released on 23 October 2012 for Microsoft Windows.[1]	{"en": "Hotline Miami is a top-down shooter video game by Jonatan Söderström and Dennis Wedin, collectively known as Dennaton Games. The game was published by Devolver Digital and released on 23 October 2012 for Microsoft Windows.[1]"}	["https://upload.wikimedia.org/wikipedia/en/f/f4/Hotline_Miami_cover.png"]	{"stadia": "https://stadia.google.com/store/details/5f54e869de4441f8998e80d2c54fa74brcp1/sku/be1bff38daf046f78cde2b36228de554"}	hotline-miami	2020-12-20 04:21:09.918434+00	2021-02-05 23:20:47.241398+00	M17+
164	Far Cry New Dawn	{"en": "Far Cry New Dawn"}	Far Cry New Dawn is a 2019 first-person shooter developed by Ubisoft Montreal and published by Ubisoft. The game is a spin-off of the Far Cry series and a narrative sequel to Far Cry 5. As a result, it features many pre-existing gameplay elements from the series, including a large open world, capturing of outposts, and AI or co-op companions; but also introduces several elements from RPG gameplay, including an upgradeable home base and increased reliance on crafting from limited supplies.[2] The story is set seventeen years after the events of Far Cry 5. After the nuclear exchange known as "the Collapse" devastated the world, survivors attempt to rebuild the community in Hope County.	{"en": "Far Cry New Dawn is a 2019 first-person shooter developed by Ubisoft Montreal and published by Ubisoft. The game is a spin-off of the Far Cry series and a narrative sequel to Far Cry 5. As a result, it features many pre-existing gameplay elements from the series, including a large open world, capturing of outposts, and AI or co-op companions; but also introduces several elements from RPG gameplay, including an upgradeable home base and increased reliance on crafting from limited supplies.[2] The story is set seventeen years after the events of Far Cry 5. After the nuclear exchange known as \\"the Collapse\\" devastated the world, survivors attempt to rebuild the community in Hope County."}	["https://upload.wikimedia.org/wikipedia/en/9/96/FC_New_Dawn_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/a2a4ff75e249404a975db7ae5f77e536rcp1/sku/f500f7d58be94fa389e1cdef3bf1118ep"}	far-cry-new-dawn	2020-12-20 04:21:08.821918+00	2021-02-05 23:20:47.152291+00	M17+
172	HITMAN 2	{"en": "HITMAN 2"}	Hitman 2 is a stealth video game developed by IO Interactive and published by Warner Bros. Interactive Entertainment for Microsoft Windows, PlayStation 4, Xbox One, and Stadia. It is the seventh major installment in the Hitman video game series and is the sequel to the 2016 game Hitman as the second installment of the World of Assassination trilogy. The game was released on 13 November 2018 and was met with generally positive reviews, with critics considering it to be an improvement over its predecessor. A sequel, Hitman 3, is set to be released for Xbox One, Xbox Series X, PlayStation 4, PlayStation 5, Microsoft Windows and Stadia in January 2021.	{"en": "Hitman 2 is a stealth video game developed by IO Interactive and published by Warner Bros. Interactive Entertainment for Microsoft Windows, PlayStation 4, Xbox One, and Stadia. It is the seventh major installment in the Hitman video game series and is the sequel to the 2016 game Hitman as the second installment of the World of Assassination trilogy. The game was released on 13 November 2018 and was met with generally positive reviews, with critics considering it to be an improvement over its predecessor. A sequel, Hitman 3, is set to be released for Xbox One, Xbox Series X, PlayStation 4, PlayStation 5, Microsoft Windows and Stadia in January 2021."}	["https://upload.wikimedia.org/wikipedia/en/8/88/Hitman_2_%282018%29_cover.jpg"]	{"stadia": "https://stadia.google.com/store/details/990ec302c2cd4ba7817cedcf633ab20frcp1/sku/70d2750d0c614a01afbb34e5c4f3a9bc"}	hitman-2	2020-12-20 04:21:09.150009+00	2021-02-05 23:20:47.234924+00	M17+
209	Red Dead Redemption 2	{"en": "Red Dead Redemption 2"}	Red Dead Redemption 2 (stylized as Red Dead Redemption II) is a 2018 action-adventure game developed and published by Rockstar Games. The game is the third entry in the Red Dead series and is a prequel to the 2010 game Red Dead Redemption. The story is set in 1899 in a fictionalized representation of the Western, Midwestern, and Southern United States and follows outlaw Arthur Morgan, a member of the Van der Linde gang. Arthur must deal with the decline of the Wild West whilst attempting to survive against government forces, rival gangs, and other adversaries. The story also follows fellow gang member John Marston, the protagonist of Red Dead Redemption.	{"en": "Red Dead Redemption 2 (stylized as Red Dead Redemption II) is a 2018 action-adventure game developed and published by Rockstar Games. The game is the third entry in the Red Dead series and is a prequel to the 2010 game Red Dead Redemption. The story is set in 1899 in a fictionalized representation of the Western, Midwestern, and Southern United States and follows outlaw Arthur Morgan, a member of the Van der Linde gang. Arthur must deal with the decline of the Wild West whilst attempting to survive against government forces, rival gangs, and other adversaries. The story also follows fellow gang member John Marston, the protagonist of Red Dead Redemption."}	["https://upload.wikimedia.org/wikipedia/en/4/44/Red_Dead_Redemption_II.jpg"]	{"stadia": "https://stadia.google.com/store/details/2152a1e96d5b47b18a5df7ca9bb0751frcp1/sku/f790e37b6161477188923408085528a1"}	red-dead-redemption-2	2020-12-21 16:12:04.736318+00	2021-02-05 23:20:48.077745+00	M17+
219	Shadow of the Tomb Raider	{"ar": "شادو أوف ذا توم ريدر", "az": "Shadow of the Tomb Raider", "de": "Shadow of the Tomb Raider", "en": "Shadow of the Tomb Raider", "es": "Shadow of the Tomb Raider", "fa": "سایه توم ریدر", "fi": "Shadow of the Tomb Raider", "fr": "Shadow of the Tomb Raider", "he": "Shadow of the Tomb Raider", "it": "Shadow of the Tomb Raider", "ja": "シャドウ オブ ザ トゥームレイダー", "ko": "쉐도우 오브 더 툼 레이더", "lt": "Shadow of the Tomb Raider", "nl": "Shadow of the Tomb Raider", "pl": "Shadow of the Tomb Raider", "pt": "Shadow of the Tomb Raider", "ru": "Shadow of the Tomb Raider", "uk": "Shadow of the Tomb Raider", "vi": "Shadow of the Tomb Raider", "zh": "古墓丽影：暗影", "arz": "شادو اوف تومب رايدر"}	Shadow of the Tomb Raider is a 2018 action-adventure video game developed by Eidos-Montréal and published by Square Enix. It continues the narrative from the 2015 game Rise of the Tomb Raider and is the twelfth mainline entry in the Tomb Raider series. The game was originally released worldwide for Microsoft Windows, PlayStation 4 and Xbox One. Versions for macOS and Linux, and Stadia, were released in November 2019. After release, the game was expanded upon with downloadable content in both a season pass and as standalone releases.	{"en": "Shadow of the Tomb Raider is a 2018 action-adventure video game developed by Eidos-Montréal and published by Square Enix. It continues the narrative from the 2015 game Rise of the Tomb Raider and is the twelfth mainline entry in the Tomb Raider series. The game was originally released worldwide for Microsoft Windows, PlayStation 4 and Xbox One. Versions for macOS and Linux, and Stadia, were released in November 2019. After release, the game was expanded upon with downloadable content in both a season pass and as standalone releases."}	["https://upload.wikimedia.org/wikipedia/en/1/11/Shadow_of_the_Tomb_Raider_cover.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B4%D8%A7%D8%AF%D9%88_%D8%A3%D9%88%D9%81_%D8%B0%D8%A7_%D8%AA%D9%88%D9%85_%D8%B1%D9%8A%D8%AF%D8%B1", "wikipedia_az": "https://az.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_de": "https://de.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_en": "https://en.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_es": "https://es.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D8%A7%DB%8C%D9%87_%D8%AA%D9%88%D9%85_%D8%B1%DB%8C%D8%AF%D8%B1", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_he": "https://he.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_it": "https://it.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B7%E3%83%A3%E3%83%89%E3%82%A6_%E3%82%AA%E3%83%96_%E3%82%B6_%E3%83%88%E3%82%A5%E3%83%BC%E3%83%A0%E3%83%AC%E3%82%A4%E3%83%80%E3%83%BC", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%89%90%EB%8F%84%EC%9A%B0_%EC%98%A4%EB%B8%8C_%EB%8D%94_%ED%88%BC_%EB%A0%88%EC%9D%B4%EB%8D%94", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Shadow_of_the_Tomb_Raider", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%8F%A4%E5%A2%93%E4%B8%BD%E5%BD%B1%EF%BC%9A%E6%9A%97%E5%BD%B1", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B4%D8%A7%D8%AF%D9%88_%D8%A7%D9%88%D9%81_%D8%AA%D9%88%D9%85%D8%A8_%D8%B1%D8%A7%D9%8A%D8%AF%D8%B1"}	shadow-of-the-tomb-raider	2020-12-21 16:12:05.153213+00	2020-12-21 16:12:05.153248+00	NA
240	Watch Dogs: Legion	{"en": "Watch Dogs: Legion"}	Watch Dogs: Legion is a 2020 action-adventure game published by Ubisoft and developed by its Toronto studio. It is the third instalment in the Watch Dogs series, and the sequel to 2016's Watch Dogs 2. Set within a fictionalised representation of a future, dystopian London, the game's story focuses on the hacker group DedSec as they seek to clear their names for a series of bombings they have been framed for, as well as liberate its citizens from the control of an oppressive private military company, which turned London into a surveillance state in the aftermath of the bombings.	{"en": "Watch Dogs: Legion is a 2020 action-adventure game published by Ubisoft and developed by its Toronto studio. It is the third instalment in the Watch Dogs series, and the sequel to 2016's Watch Dogs 2. Set within a fictionalised representation of a future, dystopian London, the game's story focuses on the hacker group DedSec as they seek to clear their names for a series of bombings they have been framed for, as well as liberate its citizens from the control of an oppressive private military company, which turned London into a surveillance state in the aftermath of the bombings."}	["https://upload.wikimedia.org/wikipedia/en/thumb/d/dc/Watch_Dogs_Legion_cover_art.webp/283px-Watch_Dogs_Legion_cover_art.webp.png"]	{"stadia": "https://stadia.google.com/store/details/deb490c166544813bf2ab73f4c6e2aa0rcp1/sku/af7331db8d1b4ef588f4f1a219d7e081p"}	watch-dogs-legion	2020-12-21 16:12:08.614149+00	2021-02-05 23:20:48.22848+00	M17+
70	Spiritfarer	{"en": "Spiritfarer"}	Spiritfarer is an indie management sim and sandbox action game developed and published by Canadian studio Thunder Lotus Games and released for Microsoft Windows, macOS, Linux, PlayStation 4, Nintendo Switch, Xbox One and Stadia on August 18, 2020. The main character, Stella, becomes a "Spiritfarer" whose job is to ferry spirits of the deceased to the afterlife. It received generally positive reviews from critics, praising its slow-paced gameplay, detailed animation, orchestral musical score and unique themes.	{"en": "Spiritfarer is an indie management sim and sandbox action game developed and published by Canadian studio Thunder Lotus Games and released for Microsoft Windows, macOS, Linux, PlayStation 4, Nintendo Switch, Xbox One and Stadia on August 18, 2020. The main character, Stella, becomes a \\"Spiritfarer\\" whose job is to ferry spirits of the deceased to the afterlife. It received generally positive reviews from critics, praising its slow-paced gameplay, detailed animation, orchestral musical score and unique themes."}	["https://upload.wikimedia.org/wikipedia/en/1/13/Spiritfarer_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/430bbe284fb7482c9afe8e877b119269rcp1/sku/5582aa71e58a45e59a05598a93cde9a3"}	spiritfarer	2020-12-17 19:51:10.633234+00	2021-02-05 23:20:47.474185+00	T
220	SpongeBob SquarePants: Battle for Bikini Bottom Rehydrated	{"en": "SpongeBob SquarePants: Battle for Bikini Bottom Rehydrated"}	SpongeBob SquarePants: Battle for Bikini Bottom – Rehydrated is a 2020 platform game based on the Nickelodeon animated series SpongeBob SquarePants. It is a remake of the console versions of Heavy Iron Studios' SpongeBob SquarePants: Battle for Bikini Bottom (2003), developed by Purple Lamp Studios and published by THQ Nordic for Microsoft Windows, Nintendo Switch, PlayStation 4, Xbox One and Stadia. It is the first major game in the series since SpongeBob HeroPants (2015).	{"en": "SpongeBob SquarePants: Battle for Bikini Bottom – Rehydrated is a 2020 platform game based on the Nickelodeon animated series SpongeBob SquarePants. It is a remake of the console versions of Heavy Iron Studios' SpongeBob SquarePants: Battle for Bikini Bottom (2003), developed by Purple Lamp Studios and published by THQ Nordic for Microsoft Windows, Nintendo Switch, PlayStation 4, Xbox One and Stadia. It is the first major game in the series since SpongeBob HeroPants (2015)."}	["https://upload.wikimedia.org/wikipedia/en/a/aa/SBBFBBRehydrated.jpeg"]	{"stadia": "https://stadia.google.com/store/details/53bd183291e340dda697167108d3dc6brcp1/sku/a25302b5cbc44d03b1440d2adaa0dd5ap"}	spongebob-squarepants-battle-for-bikini-bottom-rehydrated	2020-12-21 16:12:05.176396+00	2021-02-05 23:20:49.247232+00	E10+
204	RAGE 2	{"en": "RAGE 2"}	Rage 2 is a first-person shooter video game developed by Avalanche Studios in conjunction with id Software and published by Bethesda Softworks.[3] The game is the sequel to the 2011 game Rage. The game was released for Microsoft Windows, PlayStation 4 and Xbox One on May 14, 2019. It received mixed reviews from critics, with praise for its combat but criticism for its story, characters, and open world gameplay.	{"en": "Rage 2 is a first-person shooter video game developed by Avalanche Studios in conjunction with id Software and published by Bethesda Softworks.[3] The game is the sequel to the 2011 game Rage. The game was released for Microsoft Windows, PlayStation 4 and Xbox One on May 14, 2019. It received mixed reviews from critics, with praise for its combat but criticism for its story, characters, and open world gameplay."}	["https://upload.wikimedia.org/wikipedia/en/9/92/Rage_2_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/8615c857d7d54efebd94fe17e3f2896crcp1/sku/78ea22fb5c054167bb722322b469f33f"}	rage-2	2020-12-21 16:12:04.014299+00	2021-02-05 23:20:48.095615+00	M17+
227	Super Bomberman R	{"ar": "سوبر بومبرمان آر", "ca": "Super Bomberman R", "en": "Super Bomberman R", "es": "Super Bomberman R", "fr": "Super Bomberman R", "it": "Super Bomberman R", "ja": "スーパーボンバーマン R", "nb": "Super Bomberman R", "pt": "Super Bomberman R", "sv": "Super Bomberman R", "th": "ซูเปอร์บอมเบอร์แมน อาร์", "zh": "超级炸弹人R", "arz": "سوپر بومبرمان آر", "ast": "Super Bomberman R", "wuu": "超级炸弹人R"}	Super Bomberman R (スーパーボンバーマン Ｒ, Sūpā Bonbāman Āru) is an action-maze game developed by Konami and HexaDrive, and is part of the Bomberman series. The game was first released worldwide as a launch title for the Nintendo Switch in March 2017, and later for Microsoft Windows, PlayStation 4, and Xbox One in June 2018.[4] 	{"en": "Super Bomberman R (スーパーボンバーマン Ｒ, Sūpā Bonbāman Āru) is an action-maze game developed by Konami and HexaDrive, and is part of the Bomberman series. The game was first released worldwide as a launch title for the Nintendo Switch in March 2017, and later for Microsoft Windows, PlayStation 4, and Xbox One in June 2018.[4] "}	["https://upload.wikimedia.org/wikipedia/en/c/cf/Super_Bomberman_R_%28artwork%29.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D9%88%D8%A8%D8%B1_%D8%A8%D9%88%D9%85%D8%A8%D8%B1%D9%85%D8%A7%D9%86_%D8%A2%D8%B1", "wikipedia_ca": "https://ca.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_en": "https://en.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_es": "https://es.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_it": "https://it.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B9%E3%83%BC%E3%83%91%E3%83%BC%E3%83%9C%E3%83%B3%E3%83%90%E3%83%BC%E3%83%9E%E3%83%B3_R", "wikipedia_nb": "https://no.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%8B%E0%B8%B9%E0%B9%80%E0%B8%9B%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%9A%E0%B8%AD%E0%B8%A1%E0%B9%80%E0%B8%9A%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B9%81%E0%B8%A1%E0%B8%99_%E0%B8%AD%E0%B8%B2%E0%B8%A3%E0%B9%8C", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%B6%85%E7%BA%A7%E7%82%B8%E5%BC%B9%E4%BA%BAR", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D9%88%D9%BE%D8%B1_%D8%A8%D9%88%D9%85%D8%A8%D8%B1%D9%85%D8%A7%D9%86_%D8%A2%D8%B1", "wikipedia_ast": "https://ast.wikipedia.org/wiki/Super_Bomberman_R", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E8%B6%85%E7%BA%A7%E7%82%B8%E5%BC%B9%E4%BA%BAR"}	super-bomberman-r	2020-12-21 16:12:06.574679+00	2020-12-21 16:12:06.574699+00	NA
211	Risk of Rain 2	{"en": "Risk of Rain 2"}	Risk of Rain 2 is a roguelike third-person shooter developed by Hopoo Games and published by Gearbox Publishing. A sequel to 2013's Risk of Rain, it was released in early access for Microsoft Windows, and Nintendo Switch, PlayStation 4 and Xbox One in 2019 before fully releasing on August 11, 2020 with a release for Stadia coming a month later.	{"en": "Risk of Rain 2 is a roguelike third-person shooter developed by Hopoo Games and published by Gearbox Publishing. A sequel to 2013's Risk of Rain, it was released in early access for Microsoft Windows, and Nintendo Switch, PlayStation 4 and Xbox One in 2019 before fully releasing on August 11, 2020 with a release for Stadia coming a month later."}	["https://upload.wikimedia.org/wikipedia/en/c/c1/Risk_of_Rain_2.jpg"]	{"stadia": "https://stadia.google.com/store/details/7b6d79b833354dcaa9b2461086a7763crcp1/sku/5470776eda9b4270b049f081c6bc07ce"}	risk-of-rain-2	2020-12-21 16:12:04.836115+00	2021-02-05 23:20:49.270981+00	T
280	Gods Will Fall	{"en": "Gods Will Fall"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/f001c122cb70445d8a247d5b6f6334cbrcp1/sku/ec8c2355c1fc4dab9ff8efd4858316b2p"}	gods-will-fall	2021-02-05 16:52:18.583889+00	2021-02-05 23:20:46.009688+00	T
333	Embr	{"en": "Embr"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/d599576cddfc400f804b889460e84cb3rcp1/sku/2240fd0ec10f4229ab05fe5c7547b20a"}	embr	2021-02-05 16:52:22.945492+00	2021-02-05 23:20:46.242146+00	E10+
216	STAR WARS Jedi: Fallen Order	{"en": "STAR WARS Jedi: Fallen Order"}	Star Wars Jedi: Fallen Order is an action-adventure game developed by Respawn Entertainment and published by Electronic Arts. It was released for Windows, PlayStation 4, and Xbox One on November 15, 2019. A Stadia version was released on November 24, 2020. The story, set in the Star Wars universe five years after Star Wars: Episode III – Revenge of the Sith, follows Jedi Padawan Cal Kestis, who becomes a target of the Galactic Empire and is hunted throughout the galaxy by two Inquisitors while attempting to complete his training, escape his troubled past, and rebuild the fallen Jedi Order.	{"en": "Star Wars Jedi: Fallen Order is an action-adventure game developed by Respawn Entertainment and published by Electronic Arts. It was released for Windows, PlayStation 4, and Xbox One on November 15, 2019. A Stadia version was released on November 24, 2020. The story, set in the Star Wars universe five years after Star Wars: Episode III – Revenge of the Sith, follows Jedi Padawan Cal Kestis, who becomes a target of the Galactic Empire and is hunted throughout the galaxy by two Inquisitors while attempting to complete his training, escape his troubled past, and rebuild the fallen Jedi Order."}	["https://upload.wikimedia.org/wikipedia/en/1/13/Cover_art_of_Star_Wars_Jedi_Fallen_Order.jpg"]	{"stadia": "https://stadia.google.com/store/details/36c01626f21f428e8d5ae35ce19c774brcp1/sku/73f14fd59eb3417c8439562f54d2fc4a"}	star-wars-jedi-fallen-order	2020-12-21 16:12:05.035478+00	2021-02-05 23:20:47.321923+00	T
342	SUPER BOMBERMAN R ONLINE	{"en": "SUPER BOMBERMAN R ONLINE"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/2847419bbb5146ed877a308d9884f504rcp1/sku/e57401bfbe4f4dd98fdfd05b0c75acb5"}	super-bomberman-r-online	2021-02-05 16:52:23.620695+00	2021-02-05 23:20:47.370333+00	E10+
192	Monster Boy and the Cursed Kingdom	{"en": "Monster Boy and the Cursed Kingdom"}	Monster Boy and the Cursed Kingdom is a platform game developed by Game Atelier and published by FDG Entertainment. The game is a followup to Sega's Wonder Boy series, and was released for the Nintendo Switch, PlayStation 4, and Xbox One in December 2018, for Windows in July 2019, for Stadia in April 2020, and for PlayStation 5 and Xbox Series X/S is set to release at a later date. In May 2020, Arc System Works announced their publishing handle of the game in Japan which is set to be released on August 6, 2020.[1] It was generally well received by critics.	{"en": "Monster Boy and the Cursed Kingdom is a platform game developed by Game Atelier and published by FDG Entertainment. The game is a followup to Sega's Wonder Boy series, and was released for the Nintendo Switch, PlayStation 4, and Xbox One in December 2018, for Windows in July 2019, for Stadia in April 2020, and for PlayStation 5 and Xbox Series X/S is set to release at a later date. In May 2020, Arc System Works announced their publishing handle of the game in Japan which is set to be released on August 6, 2020.[1] It was generally well received by critics."}	["https://upload.wikimedia.org/wikipedia/en/f/f3/Monster_Boy_and_the_Cursed_Kingdom_cover_art.png"]	{"stadia": "https://stadia.google.com/store/details/ef14fb2f692c4b42b4b092d3e7864cd8rcp1/sku/38f772ac664545d99890ebb460d1d894"}	monster-boy-and-the-cursed-kingdom	2020-12-21 16:12:03.360689+00	2021-02-05 23:20:49.307242+00	E10+
228	The Crew 2	{"en": "The Crew 2"}	The Crew 2 is an open world racing video game developed by Ivory Tower and published by Ubisoft for Microsoft Windows, PlayStation 4, Xbox One and Stadia. It is the sequel to 2014's The Crew. It features a persistent open world environment for free-roaming across a scaled-down recreation of the United States. The game allows players to control a variety of vehicles including cars, motorcycles, boats, and airplanes. The game was released on June 29, 2018.	{"en": "The Crew 2 is an open world racing video game developed by Ivory Tower and published by Ubisoft for Microsoft Windows, PlayStation 4, Xbox One and Stadia. It is the sequel to 2014's The Crew. It features a persistent open world environment for free-roaming across a scaled-down recreation of the United States. The game allows players to control a variety of vehicles including cars, motorcycles, boats, and airplanes. The game was released on June 29, 2018."}	["https://upload.wikimedia.org/wikipedia/en/2/2b/The_Crew_2_box_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/cc97434908874852a6705d255a605dc8rcp1/sku/94db678cbb6342c3bc0e58f71130b3fb"}	the-crew-2	2020-12-21 16:12:06.67491+00	2021-02-05 23:20:47.338716+00	T
230	Tom Clancy's Ghost Recon Breakpoint	{"ar": "توم كلانسيز غوست ريكون بريكبوينت", "de": "Tom Clancy’s Ghost Recon Breakpoint", "en": "Tom Clancy's Ghost Recon Breakpoint", "es": "Tom Clancy's Ghost Recon Breakpoint", "fa": "گوست ریکان نقطه توقف", "fi": "Tom Clancy’s Ghost Recon Breakpoint", "fr": "Tom Clancy's Ghost Recon Breakpoint", "it": "Tom Clancy's Ghost Recon Breakpoint", "ja": "ゴーストリコン ブレイクポイント", "ko": "고스트 리콘: 브레이크 포인트", "nl": "Tom Clancy's Ghost Recon Breakpoint", "pt": "Tom Clancy's Ghost Recon Breakpoint", "ru": "Tom Clancy’s Ghost Recon Breakpoint", "tr": "Tom Clancy's Ghost Recon Breakpoint", "zh": "幽灵行动：断点", "arz": "توم كلانسيز جوست ريكون بريكبوينت"}	Tom Clancy's Ghost Recon Breakpoint is an online tactical shooter video game developed by Ubisoft Paris and published by Ubisoft. The game was released worldwide on 4 October 2019 for Microsoft Windows, PlayStation 4 and Xbox One, and on 18 December 2019 for Stadia.[2] The game is the eleventh installment in the Tom Clancy's Ghost Recon franchise and is a narrative sequel to the 2017 video game Tom Clancy's Ghost Recon Wildlands.	{"en": "Tom Clancy's Ghost Recon Breakpoint is an online tactical shooter video game developed by Ubisoft Paris and published by Ubisoft. The game was released worldwide on 4 October 2019 for Microsoft Windows, PlayStation 4 and Xbox One, and on 18 December 2019 for Stadia.[2] The game is the eleventh installment in the Tom Clancy's Ghost Recon franchise and is a narrative sequel to the 2017 video game Tom Clancy's Ghost Recon Wildlands."}	["https://upload.wikimedia.org/wikipedia/en/b/ba/Cover_Art_of_Tom_Clancy%27s_Ghost_Recon_Breakpoint.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AA%D9%88%D9%85_%D9%83%D9%84%D8%A7%D9%86%D8%B3%D9%8A%D8%B2_%D8%BA%D9%88%D8%B3%D8%AA_%D8%B1%D9%8A%D9%83%D9%88%D9%86_%D8%A8%D8%B1%D9%8A%D9%83%D8%A8%D9%88%D9%8A%D9%86%D8%AA", "wikipedia_de": "https://de.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_Ghost_Recon_Breakpoint", "wikipedia_en": "https://en.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Breakpoint", "wikipedia_es": "https://es.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Breakpoint", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%AF%D9%88%D8%B3%D8%AA_%D8%B1%DB%8C%DA%A9%D8%A7%D9%86_%D9%86%D9%82%D8%B7%D9%87_%D8%AA%D9%88%D9%82%D9%81", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_Ghost_Recon_Breakpoint", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Breakpoint", "wikipedia_it": "https://it.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Breakpoint", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B4%E3%83%BC%E3%82%B9%E3%83%88%E3%83%AA%E3%82%B3%E3%83%B3_%E3%83%96%E3%83%AC%E3%82%A4%E3%82%AF%E3%83%9D%E3%82%A4%E3%83%B3%E3%83%88", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EA%B3%A0%EC%8A%A4%ED%8A%B8_%EB%A6%AC%EC%BD%98:_%EB%B8%8C%EB%A0%88%EC%9D%B4%ED%81%AC_%ED%8F%AC%EC%9D%B8%ED%8A%B8", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Breakpoint", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Breakpoint", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_Ghost_Recon_Breakpoint", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Breakpoint", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%B9%BD%E7%81%B5%E8%A1%8C%E5%8A%A8%EF%BC%9A%E6%96%AD%E7%82%B9", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AA%D9%88%D9%85_%D9%83%D9%84%D8%A7%D9%86%D8%B3%D9%8A%D8%B2_%D8%AC%D9%88%D8%B3%D8%AA_%D8%B1%D9%8A%D9%83%D9%88%D9%86_%D8%A8%D8%B1%D9%8A%D9%83%D8%A8%D9%88%D9%8A%D9%86%D8%AA"}	tom-clancys-ghost-recon-breakpoint	2020-12-21 16:12:06.78437+00	2020-12-21 16:12:06.784392+00	NA
231	Tom Clancy's The Division 2	{"ar": "توم كلانسيز ذا ديفيجن 2", "cs": "Tom Clancy's The Division 2", "de": "Tom Clancy’s The Division 2", "en": "Tom Clancy's The Division 2", "es": "Tom Clancy's The Division 2", "fa": "تام کلنسی دی دیویژن ۲", "fi": "Tom Clancy’s The Division 2", "fr": "Tom Clancy's The Division 2", "it": "Tom Clancy's The Division 2", "ja": "ディビジョン2", "ko": "톰 클랜시의 디비전 2", "nl": "Tom Clancy's The Division 2", "pl": "Tom Clancy’s The Division 2", "pt": "Tom Clancy's The Division 2", "ru": "Tom Clancy’s The Division 2", "uk": "Tom Clancy's The Division 2", "zh": "湯姆克蘭西：全境封鎖2", "arz": "توم كلانسيز ذا ديڤيچن 2"}	Tom Clancy's The Division 2 is an online action role-playing video game developed by Massive Entertainment and published by Ubisoft. The sequel to Tom Clancy's The Division (2016), it is set in a near-future Washington, D.C. in the aftermath of a genetically engineered virus known as "Green Poison" being released, and follows an agent of the Strategic Homeland Division as they try to rebuild the city. The game was released for Microsoft Windows, PlayStation 4, and Xbox One on March 15, 2019. It received generally favorable reviews from critics, with most noting it as an improvement over the first installment.	{"en": "Tom Clancy's The Division 2 is an online action role-playing video game developed by Massive Entertainment and published by Ubisoft. The sequel to Tom Clancy's The Division (2016), it is set in a near-future Washington, D.C. in the aftermath of a genetically engineered virus known as \\"Green Poison\\" being released, and follows an agent of the Strategic Homeland Division as they try to rebuild the city. The game was released for Microsoft Windows, PlayStation 4, and Xbox One on March 15, 2019. It received generally favorable reviews from critics, with most noting it as an improvement over the first installment."}	["https://upload.wikimedia.org/wikipedia/en/a/af/The_Division_2_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AA%D9%88%D9%85_%D9%83%D9%84%D8%A7%D9%86%D8%B3%D9%8A%D8%B2_%D8%B0%D8%A7_%D8%AF%D9%8A%D9%81%D9%8A%D8%AC%D9%86_2", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_de": "https://de.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_The_Division_2", "wikipedia_en": "https://en.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_es": "https://es.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%AA%D8%A7%D9%85_%DA%A9%D9%84%D9%86%D8%B3%DB%8C_%D8%AF%DB%8C_%D8%AF%DB%8C%D9%88%DB%8C%DA%98%D9%86_%DB%B2", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_The_Division_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_it": "https://it.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%87%E3%82%A3%E3%83%93%E3%82%B8%E3%83%A7%E3%83%B32", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%ED%86%B0_%ED%81%B4%EB%9E%9C%EC%8B%9C%EC%9D%98_%EB%94%94%EB%B9%84%EC%A0%84_2", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_The_Division_2", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_The_Division_2", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Tom_Clancy%27s_The_Division_2", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%B9%AF%E5%A7%86%E5%85%8B%E8%98%AD%E8%A5%BF%EF%BC%9A%E5%85%A8%E5%A2%83%E5%B0%81%E9%8E%962", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AA%D9%88%D9%85_%D9%83%D9%84%D8%A7%D9%86%D8%B3%D9%8A%D8%B2_%D8%B0%D8%A7_%D8%AF%D9%8A%DA%A4%D9%8A%DA%86%D9%86_2"}	tom-clancys-the-division-2	2020-12-21 16:12:07.069548+00	2020-12-21 16:12:07.069567+00	NA
235	Tom Clancy's Ghost Recon Wildlands	{"ar": "توم كلانسز جوست ريكون ويلدلاندز", "br": "Tom Clancy's Ghost Recon Wildlands", "de": "Tom Clancy’s Ghost Recon Wildlands", "en": "Tom Clancy's Ghost Recon Wildlands", "es": "Tom Clancy's Ghost Recon Wildlands", "fa": "گوست ریکان سرزمین‌های وحشی", "fr": "Tom Clancy's Ghost Recon Wildlands", "it": "Tom Clancy's Ghost Recon Wildlands", "ja": "ゴーストリコン ワイルドランズ", "nl": "Tom Clancy's Ghost Recon Wildlands", "pl": "Tom Clancy’s Ghost Recon Wildlands", "pt": "Tom Clancy's Ghost Recon Wildlands", "ru": "Tom Clancy’s Ghost Recon Wildlands", "sv": "Tom Clancy's Ghost Recon Wildlands", "uk": "Tom Clancy's Ghost Recon Wildlands", "zh": "火線獵殺：野境", "arz": "توم كلانسز جوست ريكون ويلدلاندز", "yue": "幽靈行動：野境"}	Tom Clancy's Ghost Recon Wildlands is a tactical shooter video game developed by Ubisoft Paris and Ubisoft Milan and published by Ubisoft. It was released worldwide on March 7, 2017, for Microsoft Windows, PlayStation 4 and Xbox One, as the tenth installment in the Tom Clancy's Ghost Recon franchise and is the first game in the Ghost Recon series to feature an open world environment. The original Ghost Recon (2001) was an open environment. The technology at the time did not allow for such large scale maps. But, the missions were open to players so they can plan out different ways to approach their objectives or explore the maps.	{"en": "Tom Clancy's Ghost Recon Wildlands is a tactical shooter video game developed by Ubisoft Paris and Ubisoft Milan and published by Ubisoft. It was released worldwide on March 7, 2017, for Microsoft Windows, PlayStation 4 and Xbox One, as the tenth installment in the Tom Clancy's Ghost Recon franchise and is the first game in the Ghost Recon series to feature an open world environment. The original Ghost Recon (2001) was an open environment. The technology at the time did not allow for such large scale maps. But, the missions were open to players so they can plan out different ways to approach their objectives or explore the maps."}	["https://upload.wikimedia.org/wikipedia/en/b/b9/Ghost_Recon_Wildlands_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AA%D9%88%D9%85_%D9%83%D9%84%D8%A7%D9%86%D8%B3%D8%B2_%D8%AC%D9%88%D8%B3%D8%AA_%D8%B1%D9%8A%D9%83%D9%88%D9%86_%D9%88%D9%8A%D9%84%D8%AF%D9%84%D8%A7%D9%86%D8%AF%D8%B2", "wikipedia_br": "https://br.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_de": "https://de.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_Ghost_Recon_Wildlands", "wikipedia_en": "https://en.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_es": "https://es.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%AF%D9%88%D8%B3%D8%AA_%D8%B1%DB%8C%DA%A9%D8%A7%D9%86_%D8%B3%D8%B1%D8%B2%D9%85%DB%8C%D9%86%E2%80%8C%D9%87%D8%A7%DB%8C_%D9%88%D8%AD%D8%B4%DB%8C", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_it": "https://it.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%B4%E3%83%BC%E3%82%B9%E3%83%88%E3%83%AA%E3%82%B3%E3%83%B3_%E3%83%AF%E3%82%A4%E3%83%AB%E3%83%89%E3%83%A9%E3%83%B3%E3%82%BA", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_Ghost_Recon_Wildlands", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Tom_Clancy%E2%80%99s_Ghost_Recon_Wildlands", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Tom_Clancy%27s_Ghost_Recon_Wildlands", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%81%AB%E7%B7%9A%E7%8D%B5%E6%AE%BA%EF%BC%9A%E9%87%8E%E5%A2%83", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%AA%D9%88%D9%85_%D9%83%D9%84%D8%A7%D9%86%D8%B3%D8%B2_%D8%AC%D9%88%D8%B3%D8%AA_%D8%B1%D9%8A%D9%83%D9%88%D9%86_%D9%88%D9%8A%D9%84%D8%AF%D9%84%D8%A7%D9%86%D8%AF%D8%B2", "wikipedia_yue": "https://zh-yue.wikipedia.org/wiki/%E5%B9%BD%E9%9D%88%E8%A1%8C%E5%8B%95%EF%BC%9A%E9%87%8E%E5%A2%83"}	tom-clancys-ghost-recon-wildlands	2020-12-21 16:12:07.71383+00	2020-12-21 16:12:07.713861+00	NA
233	Trials Rising	{"en": "Trials Rising"}	Trials Rising is a 2.5D fault-based racing game developed by RedLynx and Ubisoft Kyiv and published by Ubisoft. It was released on Microsoft Windows, PlayStation 4, Xbox One and Nintendo Switch on February 26, 2019 and on Stadia on November 19, 2019. It is the first mainline entry in the Trials series since 2014's Trials Fusion, and the first in the series to be released on a Nintendo console.	{"en": "Trials Rising is a 2.5D fault-based racing game developed by RedLynx and Ubisoft Kyiv and published by Ubisoft. It was released on Microsoft Windows, PlayStation 4, Xbox One and Nintendo Switch on February 26, 2019 and on Stadia on November 19, 2019. It is the first mainline entry in the Trials series since 2014's Trials Fusion, and the first in the series to be released on a Nintendo console."}	["https://upload.wikimedia.org/wikipedia/en/5/5b/Cover_Art_of_Trials_Rising.jpg"]	{"stadia": "https://stadia.google.com/store/details/a031419410cc48469ff8954ea0732640rcp1/sku/01e95e73256c465fb5620fc574446413"}	trials-rising	2020-12-21 16:12:07.60772+00	2021-02-05 23:20:46.670709+00	T
245	Deponia Doomsday	{"de": "Deponia Doomsday", "en": "Deponia Doomsday", "fr": "Deponia Doomsday", "it": "Deponia - Il giorno del giudizio", "nl": "Deponia Doomsday"}	Deponia Doomsday is a point-and-click adventure created by Daedalic Entertainment and released in March 2016.[2] It is the fourth installment of the Deponia franchise. The first three parts are considered a trilogy. This installment is "paralellic."[3]	{"en": "Deponia Doomsday is a point-and-click adventure created by Daedalic Entertainment and released in March 2016.[2] It is the fourth installment of the Deponia franchise. The first three parts are considered a trilogy. This installment is \\"paralellic.\\"[3]"}	["https://upload.wikimedia.org/wikipedia/en/a/a8/DeponiaDoomsdayCover.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Deponia_Doomsday", "wikipedia_en": "https://en.wikipedia.org/wiki/Deponia_Doomsday", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Deponia_Doomsday", "wikipedia_it": "https://it.wikipedia.org/wiki/Deponia_-_Il_giorno_del_giudizio", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Deponia_Doomsday"}	deponia-doomsday	2020-12-21 19:56:02.077127+00	2020-12-21 19:56:02.07715+00	NA
42	Journey to the Savage Planet	{"en": "Journey to the Savage Planet"}	Journey to the Savage Planet is a 2020 adventure game developed by Typhoon Studios and published by 505 Games. It was released for Microsoft Windows, PlayStation 4 and Xbox One on January 29, 2020, with a Nintendo Switch version released on May 21, 2020. It was released in Japan on August 20, 2020.[1]	{"en": "Journey to the Savage Planet is a 2020 adventure game developed by Typhoon Studios and published by 505 Games. It was released for Microsoft Windows, PlayStation 4 and Xbox One on January 29, 2020, with a Nintendo Switch version released on May 21, 2020. It was released in Japan on August 20, 2020.[1]"}	["https://upload.wikimedia.org/wikipedia/en/d/db/Journey_to_the_Savage_Planet_cover_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/22c6d03e67474644a139de4f04a08c11rcp1/sku/a287b8393c204384a8b940dc79d142fd"}	journey-to-the-savage-planet	2020-12-17 19:51:06.42071+00	2021-02-05 23:20:46.124371+00	T
217	Sekiro: Shadows Die Twice	{"en": "Sekiro: Shadows Die Twice"}	Sekiro: Shadows Die Twice is an action-adventure video game developed by FromSoftware and published by Activision. The game follows a shinobi known as Wolf as he attempts to take revenge on a samurai clan who attacked him and kidnapped his lord. It was released for Microsoft Windows, PlayStation 4, and Xbox One in March 2019 and for Stadia in October 2020.	{"en": "Sekiro: Shadows Die Twice is an action-adventure video game developed by FromSoftware and published by Activision. The game follows a shinobi known as Wolf as he attempts to take revenge on a samurai clan who attacked him and kidnapped his lord. It was released for Microsoft Windows, PlayStation 4, and Xbox One in March 2019 and for Stadia in October 2020."}	["https://upload.wikimedia.org/wikipedia/en/6/6e/Sekiro_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/cc3f233990754f77a5819a583594f399rcp1/sku/2a1351f516904ed190546d1b82934bd1"}	sekiro-shadows-die-twice	2020-12-21 16:12:05.099239+00	2021-02-05 23:20:48.165872+00	M17+
301	SteamWorld Quest: Hand of Gilgamech	{"en": "SteamWorld Quest: Hand of Gilgamech"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/b845605f8eb447008f3f0d2295265ffdrcp1/sku/a1afa4eca7b24713a9bcf3421dd85a13"}	steamworld-quest-hand-of-gilgamech	2021-02-05 16:52:20.23183+00	2021-02-05 23:20:46.132488+00	E10+
349	Baldur's Gate 3	{"en": "Baldur's Gate 3"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/41de509cbdbb4a13828636099c57731arcp1/sku/a84dcb8e05e74083b5c879b49e923205p"}	baldurs-gate-3	2021-02-05 16:52:24.311312+00	2021-02-05 23:20:47.063958+00	M17+
218	Serious Sam 4	{"en": "Serious Sam 4"}	Serious Sam 4 is a 2020 first-person shooter developed by Croatian studio Croteam and published by Devolver Digital. It is part of the Serious Sam series and a prequel to Serious Sam 3: BFE. The game was announced in April 2018, originally as Serious Sam 4: Planet Badass, was released in September 2020 for Microsoft Windows and Stadia, and is set to release for PlayStation 4 and Xbox One in 2021.	{"en": "Serious Sam 4 is a 2020 first-person shooter developed by Croatian studio Croteam and published by Devolver Digital. It is part of the Serious Sam series and a prequel to Serious Sam 3: BFE. The game was announced in April 2018, originally as Serious Sam 4: Planet Badass, was released in September 2020 for Microsoft Windows and Stadia, and is set to release for PlayStation 4 and Xbox One in 2021."}	["https://upload.wikimedia.org/wikipedia/en/7/79/Serious_Sam_4.jpg"]	{"stadia": "https://stadia.google.com/store/details/b3bd32ef05444a189dcdc88f8e85d7f2rcp1/sku/3ff11dc4d2bf449f89c89bf329003e10"}	serious-sam-4	2020-12-21 16:12:05.143518+00	2021-02-05 23:20:48.204657+00	M17+
343	Panzer Dragoon: Remake	{"en": "Panzer Dragoon: Remake"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/ffda0b7e397243f8956f92f89b6902c4rcp1/sku/ac819b64342841eda35cebfd3a34c769"}	panzer-dragoon-remake	2021-02-05 16:52:23.660846+00	2021-02-05 23:20:49.15546+00	T
186	Madden NFL 21	{"en": "Madden NFL 21"}	Madden NFL 21 is an American football video game based on the National Football League (NFL), developed by EA Tiburon and published by Electronic Arts. It is an installment of the long-running Madden NFL series. It was released for Microsoft Windows, PlayStation 4 and Xbox One on August 28, 2020, and was released for PlayStation 5 and Xbox Series X/S on December 4, 2020. It features Baltimore Ravens quarterback Lamar Jackson as the cover athlete.[1] The game received mixed reviews from critics, who praised its gameplay but criticized its technical issues, while player reception has been universally negative with many heavily criticizing the lack of innovation. It is currently one of the lowest rated sports games of all time according to Metacritic with launch reviews being universally bad. 	{"en": "Madden NFL 21 is an American football video game based on the National Football League (NFL), developed by EA Tiburon and published by Electronic Arts. It is an installment of the long-running Madden NFL series. It was released for Microsoft Windows, PlayStation 4 and Xbox One on August 28, 2020, and was released for PlayStation 5 and Xbox Series X/S on December 4, 2020. It features Baltimore Ravens quarterback Lamar Jackson as the cover athlete.[1] The game received mixed reviews from critics, who praised its gameplay but criticized its technical issues, while player reception has been universally negative with many heavily criticizing the lack of innovation. It is currently one of the lowest rated sports games of all time according to Metacritic with launch reviews being universally bad. "}	["https://upload.wikimedia.org/wikipedia/en/5/55/Madden21cover.jpeg"]	{"stadia": "https://stadia.google.com/store/details/0e6c703afde840148204847447b9c21drcp1/sku/2e6de1746efc442ca5849584e406f35ep"}	madden-nfl-21	2020-12-21 16:12:02.798827+00	2021-02-05 23:20:47.408709+00	E
334	Gunsport	{"en": "Gunsport"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/16330bd770134d85b5bef3cc6b1407ffrcp1/sku/896565e45f974774a117876f949630df"}	gunsport	2021-02-05 16:52:22.98594+00	2021-02-05 23:20:47.689615+00	E
281	Lara Croft and the Guardian of Light	{"en": "Lara Croft and the Guardian of Light"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/29b3d5d6788f444c8cd59aa0a49d1bd1rcp1/sku/b4f4f4de3d1e4eef9417a9c896513f0ap"}	lara-croft-and-the-guardian-of-light	2021-02-05 16:52:18.613788+00	2021-02-05 23:20:46.125559+00	T
249	Ghost of a Tale	{"en": "Ghost of a Tale", "fr": "Ghost of a Tale", "ja": "Ghost of a Tale", "zh": "幽魂傳奇"}	Ghost of a Tale is an independent action role-playing video game[7] developed primarily by game designer and DreamWorks and Universal Pictures veteran Lionel "Seith" Gallat. The title was funded by a successful Indiegogo crowd-funding campaign which ran from April–May 2013, raising €48,700. An early version was released in 2016 on Windows PCs and the Xbox One as part of Microsoft's ID@Xbox indie developer program. The final PC version was released on March 13, 2018. On February 16, 2019, it was announced that the release date of the PlayStation 4 and Xbox One versions would be March 12, 2019.[8]\nOn March 17, 2020, at an Indie World Nintendo Direct, it was announced that the game was released for the Nintendo Switch on October 8, 2020.	{"en": "Ghost of a Tale is an independent action role-playing video game[7] developed primarily by game designer and DreamWorks and Universal Pictures veteran Lionel \\"Seith\\" Gallat. The title was funded by a successful Indiegogo crowd-funding campaign which ran from April–May 2013, raising €48,700. An early version was released in 2016 on Windows PCs and the Xbox One as part of Microsoft's ID@Xbox indie developer program. The final PC version was released on March 13, 2018. On February 16, 2019, it was announced that the release date of the PlayStation 4 and Xbox One versions would be March 12, 2019.[8]\\nOn March 17, 2020, at an Indie World Nintendo Direct, it was announced that the game was released for the Nintendo Switch on October 8, 2020."}	["https://upload.wikimedia.org/wikipedia/en/1/13/Ghost_of_a_Tale.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Ghost_of_a_Tale", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Ghost_of_a_Tale", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Ghost_of_a_Tale", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%B9%BD%E9%AD%82%E5%82%B3%E5%A5%87"}	ghost-of-a-tale	2020-12-21 19:56:02.154461+00	2020-12-21 19:56:02.154485+00	NA
244	Outcast	{"ca": "Outcast (videojoc)", "de": "Outcast (Computerspiel)", "en": "Outcast", "es": "Outcast (videojuego)", "fr": "Outcast (jeu vidéo)", "it": "Outcast (videogioco)", "ru": "Outcast (компьютерная игра)", "sv": "Outcast (datorspel)"}	Outcast is an action-adventure video game developed by Belgian developer Appeal and released by Infogrames for Windows in 1999. The game was critically acclaimed and was named the "Adventure Game of the Year" by GameSpot in 1999.[2] In 2001, Appeal developed a sequel, called Outcast II: The Lost Paradise, which was never finished due to bankruptcy. In 2010, the game was re-released via digital distribution on GOG. In 2014, Outcast was remastered as Outcast 1.1, after the original developers reacquired the franchise IP. In 2017, a remake titled Outcast: Second Contact was released for Windows, PlayStation 4, and Xbox One.	{"en": "Outcast is an action-adventure video game developed by Belgian developer Appeal and released by Infogrames for Windows in 1999. The game was critically acclaimed and was named the \\"Adventure Game of the Year\\" by GameSpot in 1999.[2] In 2001, Appeal developed a sequel, called Outcast II: The Lost Paradise, which was never finished due to bankruptcy. In 2010, the game was re-released via digital distribution on GOG. In 2014, Outcast was remastered as Outcast 1.1, after the original developers reacquired the franchise IP. In 2017, a remake titled Outcast: Second Contact was released for Windows, PlayStation 4, and Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/e/e3/Outcastbox.jpg"]	{"wikipedia_ca": "https://ca.wikipedia.org/wiki/Outcast_(videojoc)", "wikipedia_de": "https://de.wikipedia.org/wiki/Outcast_(Computerspiel)", "wikipedia_en": "https://en.wikipedia.org/wiki/Outcast_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Outcast_(videojuego)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Outcast_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Outcast_(videogioco)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Outcast_(%D0%BA%D0%BE%D0%BC%D0%BF%D1%8C%D1%8E%D1%82%D0%B5%D1%80%D0%BD%D0%B0%D1%8F_%D0%B8%D0%B3%D1%80%D0%B0)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Outcast_(datorspel)"}	outcast	2020-12-21 17:02:30.121711+00	2020-12-21 17:28:42.122162+00	NA
247	Brothers: A Tale of Two Sons	{"ar": "برذرز: أه تايل أوف تو سنز", "de": "Brothers: A Tale of Two Sons", "en": "Brothers: A Tale of Two Sons", "es": "Brothers: A Tale of Two Sons", "fa": "برادرها: افسانه دو پسر", "fr": "Brothers: A Tale of Two Sons", "it": "Brothers: A Tale of Two Sons", "ja": "ブラザーズ : 2人の息子の物語", "nb": "Brothers: A Tale of Two Sons", "nl": "Brothers: A Tale of Two Sons", "pt": "Brothers: A Tale of Two Sons", "ru": "Brothers: A Tale of Two Sons", "sv": "Brothers: A Tale of Two Sons", "tr": "Brothers: A Tale of Two Sons", "uk": "Brothers: A Tale of Two Sons"}	Brothers: A Tale of Two Sons is an adventure game developed by Starbreeze Studios and published by 505 Games for Xbox 360, Microsoft Windows, PlayStation 3, PlayStation 4, Xbox One, iOS, Android, Windows Phone, and Nintendo Switch. The game takes place in a fantasy world filled with fictitious creatures like orcs and trolls. The story is about two young brothers who set out on a journey to find a cure for their father's illness. Brothers: A Tale of Two Sons received critical acclaim.	{"en": "Brothers: A Tale of Two Sons is an adventure game developed by Starbreeze Studios and published by 505 Games for Xbox 360, Microsoft Windows, PlayStation 3, PlayStation 4, Xbox One, iOS, Android, Windows Phone, and Nintendo Switch. The game takes place in a fantasy world filled with fictitious creatures like orcs and trolls. The story is about two young brothers who set out on a journey to find a cure for their father's illness. Brothers: A Tale of Two Sons received critical acclaim."}	["https://upload.wikimedia.org/wikipedia/en/c/cd/Brothers_A_Tale_of_Two_Sons_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A8%D8%B1%D8%B0%D8%B1%D8%B2:_%D8%A3%D9%87_%D8%AA%D8%A7%D9%8A%D9%84_%D8%A3%D9%88%D9%81_%D8%AA%D9%88_%D8%B3%D9%86%D8%B2", "wikipedia_de": "https://de.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_en": "https://en.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_es": "https://es.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%A8%D8%B1%D8%A7%D8%AF%D8%B1%D9%87%D8%A7:_%D8%A7%D9%81%D8%B3%D8%A7%D9%86%D9%87_%D8%AF%D9%88_%D9%BE%D8%B3%D8%B1", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_it": "https://it.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%96%E3%83%A9%E3%82%B6%E3%83%BC%E3%82%BA_:_2%E4%BA%BA%E3%81%AE%E6%81%AF%E5%AD%90%E3%81%AE%E7%89%A9%E8%AA%9E", "wikipedia_nb": "https://no.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Brothers:_A_Tale_of_Two_Sons"}	brothers-a-tale-of-two-sons	2020-12-21 19:56:02.097661+00	2020-12-21 19:56:02.097685+00	NA
250	Edna & Harvey: Harvey's New Eyes	{"de": "Harveys neue Augen", "en": "Edna & Harvey: Harvey's New Eyes", "fr": "Edna and Harvey: Harvey's New Eyes", "nl": "Edna and Harvey: Harvey's New Eyes", "ru": "Edna & Harvey: Harvey’s New Eyes"}	Edna & Harvey: Harvey's New Eyes,[2] also known as Harvey's New Eyes,[2] is a point-and-click adventure game created by Daedalic Entertainment. The game was released in Germany in August 26, 2011.[1] Harvey's New Eyes is a sequel to Edna & Harvey: The Breakout.	{"en": "Edna & Harvey: Harvey's New Eyes,[2] also known as Harvey's New Eyes,[2] is a point-and-click adventure game created by Daedalic Entertainment. The game was released in Germany in August 26, 2011.[1] Harvey's New Eyes is a sequel to Edna & Harvey: The Breakout."}	["https://upload.wikimedia.org/wikipedia/en/9/94/Edna_%26_Harvey_-_Harvey%27s_New_Eyes_Coverart.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Harveys_neue_Augen", "wikipedia_en": "https://en.wikipedia.org/wiki/Edna_&_Harvey:_Harvey%E2%80%99s_New_Eyes", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Edna_and_Harvey:_Harvey%27s_New_Eyes", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Edna_and_Harvey:_Harvey%27s_New_Eyes", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Edna_%26_Harvey:_Harvey%E2%80%99s_New_Eyes"}	edna-harvey-harveys-new-eyes	2020-12-21 19:56:02.334662+00	2020-12-21 19:56:02.334679+00	NA
335	Metro 2033 Redux	{"en": "Metro 2033 Redux"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/9b3ea6519cac48d68ca821f07b1a6a3drcp1/sku/de1e97332f1148468759dfc4553edad9"}	metro-2033-redux	2021-02-05 16:52:23.002361+00	2021-02-05 23:20:47.251406+00	M17+
251	Edna & Harvey: The Breakout	{"de": "Edna bricht aus", "en": "Edna & Harvey: The Breakout", "fr": "Edna et Harvey s'évadent", "nl": "Edna & Harvey: The Breakout", "ru": "Edna & Harvey: The Breakout"}	Edna & Harvey: The Breakout (known in Germany as German: Edna bricht aus, lit. 'Edna breaks out') is a 2008 adventure game for Windows starring a young woman and her toy rabbit. The object of the game is to escape from a mental hospital which they find themselves in at the beginning of the game.	{"en": "Edna & Harvey: The Breakout (known in Germany as German: Edna bricht aus, lit. 'Edna breaks out') is a 2008 adventure game for Windows starring a young woman and her toy rabbit. The object of the game is to escape from a mental hospital which they find themselves in at the beginning of the game."}	["https://upload.wikimedia.org/wikipedia/en/6/6f/Edna_%26_Harvey_-_The_Breakout_Coverart.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Edna_bricht_aus", "wikipedia_en": "https://en.wikipedia.org/wiki/Edna_&_Harvey:_The_Breakout", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Edna_et_Harvey_s%27%C3%A9vadent", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Edna_%26_Harvey:_The_Breakout", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Edna_%26_Harvey:_The_Breakout"}	edna-harvey-the-breakout	2020-12-21 19:56:02.337472+00	2020-12-21 19:56:02.33749+00	NA
252	Hard Reset	{"en": "Hard Reset", "fr": "Hard Reset", "it": "Hard Reset", "nl": "Hard Reset", "pl": "Hard Reset", "ru": "Hard Reset"}	Hard Reset is a first-person shooter for Microsoft Windows, developed by Flying Wild Hog[1] and released in September 2011.[2] The game features a cyberpunk plot within a dystopian world, and draws inspiration from the works of William Gibson, Neal Stephenson, and Philip K. Dick to create its story, setting and atmosphere. In 2012, Hard Reset received a free expansion titled Hard Reset: Exile, and was then bundled as Hard Reset: Extended Edition. In 2016, a remastered version called Hard Reset Redux was released, with upgraded graphics and new weapons and enemies.	{"en": "Hard Reset is a first-person shooter for Microsoft Windows, developed by Flying Wild Hog[1] and released in September 2011.[2] The game features a cyberpunk plot within a dystopian world, and draws inspiration from the works of William Gibson, Neal Stephenson, and Philip K. Dick to create its story, setting and atmosphere. In 2012, Hard Reset received a free expansion titled Hard Reset: Exile, and was then bundled as Hard Reset: Extended Edition. In 2016, a remastered version called Hard Reset Redux was released, with upgraded graphics and new weapons and enemies."}	["https://upload.wikimedia.org/wikipedia/en/c/c2/Hard_Reset_cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Hard_Reset", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Hard_Reset", "wikipedia_it": "https://it.wikipedia.org/wiki/Hard_Reset", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Hard_Reset", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Hard_Reset", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Hard_Reset"}	hard-reset	2020-12-21 19:56:02.384088+00	2020-12-21 19:56:02.384112+00	NA
253	Lumines: Puzzle Fusion	{"en": "Lumines: Puzzle Fusion", "es": "Lumines", "fr": "Lumines", "it": "Lumines", "ko": "루미네스", "arz": "لومينيس"}	Lumines: Puzzle Fusion[a] is a 2004 puzzle game developed by Q Entertainment. It was published for PlayStation Portable (PSP) by Bandai in Japan and internationally by Ubisoft. Players rotate and drop blocks containing random tiles of two colors so they make filled rectangular shapes of the same color on the playing field. As the player progresses through the game it transitions between skins, affecting the colors and music.	{"en": "Lumines: Puzzle Fusion[a] is a 2004 puzzle game developed by Q Entertainment. It was published for PlayStation Portable (PSP) by Bandai in Japan and internationally by Ubisoft. Players rotate and drop blocks containing random tiles of two colors so they make filled rectangular shapes of the same color on the playing field. As the player progresses through the game it transitions between skins, affecting the colors and music."}	["https://upload.wikimedia.org/wikipedia/en/7/7e/Lumines.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Lumines_Remastered", "wikipedia_es": "https://es.wikipedia.org/wiki/Lumines", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Lumines", "wikipedia_it": "https://it.wikipedia.org/wiki/Lumines", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%A3%A8%EB%AF%B8%EB%84%A4%EC%8A%A4", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%84%D9%88%D9%85%D9%8A%D9%86%D9%8A%D8%B3"}	lumines-puzzle-fusion	2020-12-21 19:56:02.571855+00	2020-12-21 19:56:02.571896+00	NA
131	River City Girls	{"en": "River City Girls", "ko": "열혈경파 쿠니오군 외전 River City Girls", "zh": "熱血硬派國夫君外傳 熱血少女"}	River City Girls[a] is a 2019 beat 'em up video game developed by WayForward, and published by Arc System Works. A spin-off title in the Kunio-kun franchise, the game stars Misako and Kyoko (originally appearing in Nintendo World Cup and Kunio-tachi no Banka respectively) who fight their way through enemies and obstacles to rescue their kidnapped boyfriends, series protagonists Kunio and Riki. The game was released for the Nintendo Switch, PlayStation 4, Xbox One, and Microsoft Windows in September 2019.	{"en": "River City Girls[a] is a 2019 beat 'em up video game developed by WayForward, and published by Arc System Works. A spin-off title in the Kunio-kun franchise, the game stars Misako and Kyoko (originally appearing in Nintendo World Cup and Kunio-tachi no Banka respectively) who fight their way through enemies and obstacles to rescue their kidnapped boyfriends, series protagonists Kunio and Riki. The game was released for the Nintendo Switch, PlayStation 4, Xbox One, and Microsoft Windows in September 2019."}	["https://upload.wikimedia.org/wikipedia/en/0/0e/River_city_girls_title_card.PNG"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/River_City_Girls", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%97%B4%ED%98%88%EA%B2%BD%ED%8C%8C_%EC%BF%A0%EB%8B%88%EC%98%A4%EA%B5%B0_%EC%99%B8%EC%A0%84_River_City_Girls", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%86%B1%E8%A1%80%E7%A1%AC%E6%B4%BE%E5%9C%8B%E5%A4%AB%E5%90%9B%E5%A4%96%E5%82%B3_%E7%86%B1%E8%A1%80%E5%B0%91%E5%A5%B3"}	river-city-girls	2020-12-18 16:36:43.415166+00	2020-12-21 19:56:02.673321+00	NA
62	Overcooked 2	{"en": "Overcooked 2", "fr": "Overcooked 2", "ja": "Overcooked 2", "ko": "Overcooked 2", "sv": "Overcooked 2", "zh": "胡鬧廚房2"}	Overcooked 2 (stylised as Overcooked! 2) is a cooperative cooking simulation video game developed by Team17 alongside Ghost Town Games, and published by Team17. The sequel to Overcooked!, it was released for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One on August 7, 2018. Overcooked: All You Can Eat, a compilation game that includes both Overcooked and Overcooked 2, was released for PlayStation 5 and Xbox Series X/S.[1]	{"en": "Overcooked 2 (stylised as Overcooked! 2) is a cooperative cooking simulation video game developed by Team17 alongside Ghost Town Games, and published by Team17. The sequel to Overcooked!, it was released for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One on August 7, 2018. Overcooked: All You Can Eat, a compilation game that includes both Overcooked and Overcooked 2, was released for PlayStation 5 and Xbox Series X/S.[1]"}	["https://upload.wikimedia.org/wikipedia/en/0/03/Overcooked_2_cover_art.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Overcooked!_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Overcooked_2", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Overcooked_2", "wikipedia_ko": "https://ko.wikipedia.org/wiki/Overcooked_2", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Overcooked_2", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%83%A1%E9%AC%A7%E5%BB%9A%E6%88%BF2"}	overcooked-2	2020-12-17 19:51:08.044882+00	2020-12-21 19:56:02.685841+00	NA
254	Shadow Tactics: Blades of the Shogun	{"de": "Shadow Tactics: Blades of the Shogun", "en": "Shadow Tactics: Blades of the Shogun", "fr": "Shadow Tactics: Blades of the Shogun", "it": "Shadow Tactics: Blades of the Shogun", "pt": "Shadow Tactics: Blades of the Shogun", "ru": "Shadow Tactics: Blades of the Shogun", "uk": "Shadow Tactics: Blades of the Shogun", "vi": "Shadow Tactics: Blades of the Shogun", "zh": "暗影戰略：將軍之刃"}	Shadow Tactics: Blades of the Shogun is a stealth-oriented real-time tactics video game developed by Mimimi Productions and published by Daedalic Entertainment. The gameplay is similar to that of the Commandos and Desperados series. It was released on December 6, 2016 for Microsoft Windows, macOS, and Linux,[2][3] and in July 2017 for PlayStation 4 and Xbox One.[4] The game received three German Developer Awards (best German game, best PC/console game, best game design).	{"en": "Shadow Tactics: Blades of the Shogun is a stealth-oriented real-time tactics video game developed by Mimimi Productions and published by Daedalic Entertainment. The gameplay is similar to that of the Commandos and Desperados series. It was released on December 6, 2016 for Microsoft Windows, macOS, and Linux,[2][3] and in July 2017 for PlayStation 4 and Xbox One.[4] The game received three German Developer Awards (best German game, best PC/console game, best game design)."}	["https://upload.wikimedia.org/wikipedia/en/b/b7/Shadow_Tactics_Blades_of_the_Shogun_title_splash.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Shadow_Tactics:_Blades_of_the_Shogun", "wikipedia_en": "https://en.wikipedia.org/wiki/Shadow_Tactics", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Shadow_Tactics:_Blades_of_the_Shogun", "wikipedia_it": "https://it.wikipedia.org/wiki/Shadow_Tactics:_Blades_of_the_Shogun", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Shadow_Tactics:_Blades_of_the_Shogun", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Shadow_Tactics:_Blades_of_the_Shogun", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Shadow_Tactics:_Blades_of_the_Shogun", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Shadow_Tactics:_Blades_of_the_Shogun", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%9A%97%E5%BD%B1%E6%88%B0%E7%95%A5%EF%BC%9A%E5%B0%87%E8%BB%8D%E4%B9%8B%E5%88%83"}	shadow-tactics-blades-of-the-shogun	2020-12-21 19:56:02.894526+00	2020-12-21 19:56:02.894548+00	NA
255	Rez	{"de": "Rez", "en": "Rez", "es": "Rez", "fr": "Rez", "hu": "Rez", "it": "Rez", "ja": "Rez", "pl": "Rez", "ru": "Rez", "sv": "Rez", "arz": "ريز"}	Rez[c] is a musical rail shooter developed by United Game Artists and published by Sega for the Dreamcast and PlayStation 2. It was released in Japan in 2001, followed by releases to the United States and Europe in 2002. The game was ported to Xbox 360 as Rez HD by Q Entertainment and HexaDrive in 2008. A virtual reality-compatible expanded version dubbed Rez Infinite was co-developed and released through 2016, 2017, and 2020 by Enhance Games, Resonair and Monstars for PlayStation 4, Microsoft Windows, Android and Oculus Quest.	{"en": "Rez[c] is a musical rail shooter developed by United Game Artists and published by Sega for the Dreamcast and PlayStation 2. It was released in Japan in 2001, followed by releases to the United States and Europe in 2002. The game was ported to Xbox 360 as Rez HD by Q Entertainment and HexaDrive in 2008. A virtual reality-compatible expanded version dubbed Rez Infinite was co-developed and released through 2016, 2017, and 2020 by Enhance Games, Resonair and Monstars for PlayStation 4, Microsoft Windows, Android and Oculus Quest."}	["https://upload.wikimedia.org/wikipedia/en/7/71/RezBoxArt.jpg"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Rez", "wikipedia_en": "https://en.wikipedia.org/wiki/Rez_Infinite", "wikipedia_es": "https://es.wikipedia.org/wiki/Rez", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Rez", "wikipedia_hu": "https://hu.wikipedia.org/wiki/Rez", "wikipedia_it": "https://it.wikipedia.org/wiki/Rez", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Rez", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Rez", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Rez", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Rez", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B1%D9%8A%D8%B2"}	rez	2020-12-21 19:56:03.020781+00	2020-12-21 19:56:03.020821+00	NA
81	The Surge 2	{"ar": "ذا سورج 2", "en": "The Surge 2", "es": "The Surge 2", "fr": "The Surge 2", "arz": "ذا سورج 2"}	The Surge 2 is an action role-playing video game developed by Deck13 Interactive and published by Focus Home Interactive for Microsoft Windows, PlayStation 4 and Xbox One. It is the sequel to 2017's The Surge.	{"en": "The Surge 2 is an action role-playing video game developed by Deck13 Interactive and published by Focus Home Interactive for Microsoft Windows, PlayStation 4 and Xbox One. It is the sequel to 2017's The Surge."}	["https://upload.wikimedia.org/wikipedia/en/d/d4/The_Surge_2_cover_art.png"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B0%D8%A7_%D8%B3%D9%88%D8%B1%D8%AC_2", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Surge_2", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Surge_2", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Surge_2", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B0%D8%A7_%D8%B3%D9%88%D8%B1%D8%AC_2"}	the-surge-2	2020-12-17 19:51:11.319675+00	2020-12-21 19:56:03.370077+00	NA
256	Sonic Mania	{"ar": "سونيك مينيا", "de": "Sonic Mania", "en": "Sonic Mania", "es": "Sonic Mania", "fa": "سونیک منیا", "fi": "Sonic Mania", "fr": "Sonic Mania", "he": "Sonic Mania", "it": "Sonic Mania", "ja": "ソニックマニア", "ko": "소닉 매니아", "lt": "Sonic Mania", "nb": "Sonic Mania", "nl": "Sonic Mania", "nn": "Sonic Mania", "pt": "Sonic Mania", "ru": "Sonic Mania", "sv": "Sonic Mania", "tl": "Sonic Mania", "tr": "Sonic Mania", "zh": "索尼克狂热", "arz": "سونيك مينيا", "ast": "Sonic Mania", "sco": "Sonic Mania"}	Sonic Mania is a 2017 platform game published by Sega for Nintendo Switch, PlayStation 4, Xbox One, and Windows. Produced in commemoration of the Sonic the Hedgehog series' 25th anniversary, Sonic Mania homages the original Sega Genesis Sonic games, featuring speedy side-scrolling gameplay. It takes place over 12 levels, including several redesigned stages from past games. The story follows Sonic, Tails and Knuckles as they venture to defeat their nemesis Doctor Eggman and his robotic henchmen, the Hard-Boiled Heavies.	{"en": "Sonic Mania is a 2017 platform game published by Sega for Nintendo Switch, PlayStation 4, Xbox One, and Windows. Produced in commemoration of the Sonic the Hedgehog series' 25th anniversary, Sonic Mania homages the original Sega Genesis Sonic games, featuring speedy side-scrolling gameplay. It takes place over 12 levels, including several redesigned stages from past games. The story follows Sonic, Tails and Knuckles as they venture to defeat their nemesis Doctor Eggman and his robotic henchmen, the Hard-Boiled Heavies."}	["https://upload.wikimedia.org/wikipedia/en/d/d2/Sonic_Mania_%28artwork%29.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B3%D9%88%D9%86%D9%8A%D9%83_%D9%85%D9%8A%D9%86%D9%8A%D8%A7", "wikipedia_de": "https://de.wikipedia.org/wiki/Sonic_Mania", "wikipedia_en": "https://en.wikipedia.org/wiki/Sonic_Mania", "wikipedia_es": "https://es.wikipedia.org/wiki/Sonic_Mania", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B3%D9%88%D9%86%DB%8C%DA%A9_%D9%85%D9%86%DB%8C%D8%A7", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Sonic_Mania", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Sonic_Mania", "wikipedia_he": "https://he.wikipedia.org/wiki/Sonic_Mania", "wikipedia_it": "https://it.wikipedia.org/wiki/Sonic_Mania", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%BD%E3%83%8B%E3%83%83%E3%82%AF%E3%83%9E%E3%83%8B%E3%82%A2", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%86%8C%EB%8B%89_%EB%A7%A4%EB%8B%88%EC%95%84", "wikipedia_lt": "https://lt.wikipedia.org/wiki/Sonic_Mania", "wikipedia_nb": "https://no.wikipedia.org/wiki/Sonic_Mania", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Sonic_Mania", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Sonic_Mania", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Sonic_Mania", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Sonic_Mania", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Sonic_Mania", "wikipedia_tl": "https://tl.wikipedia.org/wiki/Sonic_Mania", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Sonic_Mania", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%B4%A2%E5%B0%BC%E5%85%8B%E7%8B%82%E7%83%AD", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B3%D9%88%D9%86%D9%8A%D9%83_%D9%85%D9%8A%D9%86%D9%8A%D8%A7", "wikipedia_ast": "https://ast.wikipedia.org/wiki/Sonic_Mania", "wikipedia_sco": "https://sco.wikipedia.org/wiki/Sonic_Mania"}	sonic-mania	2020-12-21 19:56:03.346454+00	2020-12-21 19:56:03.346476+00	NA
257	The Surge	{"ar": "ذا سورج", "br": "The Surge", "de": "The Surge", "en": "The Surge", "es": "The Surge", "fr": "The Surge", "it": "The Surge", "ja": "The Surge", "ru": "The Surge"}	The Surge is a science fiction action role-playing video game developed by Deck13 Interactive and published by Focus Home Interactive for Microsoft Windows, PlayStation 4, and Xbox One. It is considered a spiritual successor to Deck13 Interactive's earlier action role-playing game Lords of the Fallen, with which it shares many gameplay features. Deck13 Interactive described the game as inspired by Rise of the Robots[2] and the Souls series.[3]	{"en": "The Surge is a science fiction action role-playing video game developed by Deck13 Interactive and published by Focus Home Interactive for Microsoft Windows, PlayStation 4, and Xbox One. It is considered a spiritual successor to Deck13 Interactive's earlier action role-playing game Lords of the Fallen, with which it shares many gameplay features. Deck13 Interactive described the game as inspired by Rise of the Robots[2] and the Souls series.[3]"}	["https://upload.wikimedia.org/wikipedia/en/8/8f/The_Surge_box-art.jpeg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B0%D8%A7_%D8%B3%D9%88%D8%B1%D8%AC", "wikipedia_br": "https://br.wikipedia.org/wiki/The_Surge", "wikipedia_de": "https://de.wikipedia.org/wiki/The_Surge", "wikipedia_en": "https://en.wikipedia.org/wiki/The_Surge", "wikipedia_es": "https://es.wikipedia.org/wiki/The_Surge", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Surge", "wikipedia_it": "https://it.wikipedia.org/wiki/The_Surge", "wikipedia_ja": "https://ja.wikipedia.org/wiki/The_Surge", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Surge"}	the-surge	2020-12-21 19:56:03.395458+00	2020-12-21 19:56:03.395482+00	NA
153	Destiny 2	{"en": "Destiny 2"}	Destiny 2 (also known as Destiny 2: New Light) is a free-to-play online-only multiplayer first-person shooter video game developed by Bungie. It was originally released as a pay to play game in 2017 for the PlayStation 4, Xbox One, and Microsoft Windows platforms.[1][2] It became free-to-play under the New Light title on October 1, 2019, followed by the game's release on Stadia the following month, and then the PlayStation 5 and Xbox Series X/S platforms in November 2020 with an enhanced version released for both consoles on December 8, 2020. The game was published by Activision until December 31, 2018,[3] when Bungie acquired the publishing rights to the franchise. It is the sequel to 2014's Destiny and its subsequent expansions. Set in a "mythic science fiction" world, the game features a multiplayer "shared-world" environment with elements of role-playing games. Like the original, activities in Destiny 2 are divided among player versus environment (PvE) and player versus player (PvP) game types. In addition to normal story missions, PvE features three-player "strikes" and six-player raids. A free roam patrol mode is also available for each destination which feature public events as well as activities not available in the original. These activities have an emphasis on exploration of the destinations and interactions with non-player characters (NPCs); the original Destiny only featured NPCs in social spaces. PvP features objective-based modes, as well as traditional deathmatch game modes.	{"en": "Destiny 2 (also known as Destiny 2: New Light) is a free-to-play online-only multiplayer first-person shooter video game developed by Bungie. It was originally released as a pay to play game in 2017 for the PlayStation 4, Xbox One, and Microsoft Windows platforms.[1][2] It became free-to-play under the New Light title on October 1, 2019, followed by the game's release on Stadia the following month, and then the PlayStation 5 and Xbox Series X/S platforms in November 2020 with an enhanced version released for both consoles on December 8, 2020. The game was published by Activision until December 31, 2018,[3] when Bungie acquired the publishing rights to the franchise. It is the sequel to 2014's Destiny and its subsequent expansions. Set in a \\"mythic science fiction\\" world, the game features a multiplayer \\"shared-world\\" environment with elements of role-playing games. Like the original, activities in Destiny 2 are divided among player versus environment (PvE) and player versus player (PvP) game types. In addition to normal story missions, PvE features three-player \\"strikes\\" and six-player raids. A free roam patrol mode is also available for each destination which feature public events as well as activities not available in the original. These activities have an emphasis on exploration of the destinations and interactions with non-player characters (NPCs); the original Destiny only featured NPCs in social spaces. PvP features objective-based modes, as well as traditional deathmatch game modes."}	["https://upload.wikimedia.org/wikipedia/en/0/05/Destiny_2_%28artwork%29.jpg"]	{"stadia": "https://stadia.google.com/store/details/20e792017ab34ad89b70dc17a5c72d68rcp1/sku/4950959380034dcda0aecf98f675e11f"}	destiny-2	2020-12-20 04:21:08.248702+00	2021-02-05 23:20:45.911385+00	T
63	Power Rangers: Battle for the Grid	{"en": "Power Rangers: Battle for the Grid"}	Power Rangers: Battle for the Grid is a fighting game developed by San Francisco-based game developer nWay, featuring characters from the Power Rangers franchise. It was released digitally for Xbox One and Nintendo Switch on March 26, 2019, for PlayStation 4 on April 2, 2019, for Microsoft Windows on September 24, 2019, and for Stadia on June 1, 2020. Limited Run Games released a standard physical version on the Switch and PlayStation 4 alongside a more expensive Mega Edition in November 2019.	{"en": "Power Rangers: Battle for the Grid is a fighting game developed by San Francisco-based game developer nWay, featuring characters from the Power Rangers franchise. It was released digitally for Xbox One and Nintendo Switch on March 26, 2019, for PlayStation 4 on April 2, 2019, for Microsoft Windows on September 24, 2019, and for Stadia on June 1, 2020. Limited Run Games released a standard physical version on the Switch and PlayStation 4 alongside a more expensive Mega Edition in November 2019."}	["https://upload.wikimedia.org/wikipedia/en/b/bf/Power_Rangers_Battle_for_the_Grid.jpg"]	{"stadia": "https://stadia.google.com/store/details/bbb1a143aa3449a5a1f236a05c305c9frcp1/sku/fe5459c281d9443ca8f0e420f59936fc"}	power-rangers-battle-for-the-grid	2020-12-17 19:51:08.051352+00	2021-02-05 23:20:49.208064+00	T
259	The Mummy Demastered	{"en": "The Mummy Demastered", "ru": "The Mummy Demastered"}	The Mummy Demastered is a Metroidvania video game released in October 2017 by WayForward Technologies based on the 2017 film The Mummy. It takes place concurrently with the events of the film, with players playing Prodigium soldiers under the command of Dr. Henry Jekyll (with the likeness of Russell Crowe from the film) who must fight the evil forces of Princess Ahmanet (with the likeness of Sofia Boutella). The Nintendo Switch version was released in Japan on July 30, 2020.[2]	{"en": "The Mummy Demastered is a Metroidvania video game released in October 2017 by WayForward Technologies based on the 2017 film The Mummy. It takes place concurrently with the events of the film, with players playing Prodigium soldiers under the command of Dr. Henry Jekyll (with the likeness of Russell Crowe from the film) who must fight the evil forces of Princess Ahmanet (with the likeness of Sofia Boutella). The Nintendo Switch version was released in Japan on July 30, 2020.[2]"}	["https://upload.wikimedia.org/wikipedia/en/2/20/Mummy_Demastered_cover.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/The_Mummy_Demastered", "wikipedia_ru": "https://ru.wikipedia.org/wiki/The_Mummy_Demastered"}	the-mummy-demastered	2020-12-21 19:56:03.418151+00	2020-12-21 19:56:03.418173+00	NA
260	Victor Vran	{"en": "Victor Vran", "fr": "Victor Vran", "it": "Victor Vran"}	Victor Vran is an action role-playing video game developed by the Bulgarian independent development studio Haemimont Games. Victor Vran is published on Steam by EuroVideo Medien. It entered Steam Early Access in February 2015[1] and the final version was released in July 2015.[2] The setting of the game resembles Gothic-fantasy fairy tale where both magic and science have a place in the world. The title exited early access on July 24, 2015.[3] An updated port titled Victor Vran: Overkill Edition was released on PlayStation 4 and Xbox One on 6 June 2017[4][5], and a Nintendo Switch port was released on August 28, 2018.[6]	{"en": "Victor Vran is an action role-playing video game developed by the Bulgarian independent development studio Haemimont Games. Victor Vran is published on Steam by EuroVideo Medien. It entered Steam Early Access in February 2015[1] and the final version was released in July 2015.[2] The setting of the game resembles Gothic-fantasy fairy tale where both magic and science have a place in the world. The title exited early access on July 24, 2015.[3] An updated port titled Victor Vran: Overkill Edition was released on PlayStation 4 and Xbox One on 6 June 2017[4][5], and a Nintendo Switch port was released on August 28, 2018.[6]"}	["https://upload.wikimedia.org/wikipedia/en/2/23/Victor_Vran_logo.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Victor_Vran", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Victor_Vran", "wikipedia_it": "https://it.wikipedia.org/wiki/Victor_Vran"}	victor-vran	2020-12-21 19:56:03.44338+00	2020-12-21 19:56:03.443418+00	NA
261	Yooka-Laylee	{"ar": "يوكا-لايلي", "de": "Yooka-Laylee", "en": "Yooka-Laylee", "es": "Yooka-Laylee", "fr": "Yooka-Laylee", "it": "Yooka-Laylee", "ja": "Yooka-Laylee", "nb": "Yooka-Laylee", "nl": "Yooka-Laylee", "nn": "Yooka-Laylee", "pt": "Yooka-Laylee", "ru": "Yooka-Laylee", "sv": "Yooka-Laylee", "uk": "Yooka-Laylee", "zh": "尤卡莱莉大冒险", "arz": "ياوكا لايلى"}	Yooka-Laylee is a platform game published by Team17 in 2017 for Windows, macOS, Linux, PlayStation 4, Xbox One, and Nintendo Switch.[1] Developed by Playtonic Games, a group of former key personnel from Rare, Yooka-Laylee is a spiritual successor to the Banjo-Kazooie series released for the Nintendo 64 nearly 20 years prior. After years of planning to develop a new game, Playtonic Games initiated a Kickstarter campaign that attracted significant media coverage and raised over a record-breaking GB£2 million. The game follows chameleon Yooka and bat Laylee on their quest to retrieve a magical book from an evil corporation.	{"en": "Yooka-Laylee is a platform game published by Team17 in 2017 for Windows, macOS, Linux, PlayStation 4, Xbox One, and Nintendo Switch.[1] Developed by Playtonic Games, a group of former key personnel from Rare, Yooka-Laylee is a spiritual successor to the Banjo-Kazooie series released for the Nintendo 64 nearly 20 years prior. After years of planning to develop a new game, Playtonic Games initiated a Kickstarter campaign that attracted significant media coverage and raised over a record-breaking GB£2 million. The game follows chameleon Yooka and bat Laylee on their quest to retrieve a magical book from an evil corporation."}	["https://upload.wikimedia.org/wikipedia/en/a/ac/Yooka-Laylee_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%8A%D9%88%D9%83%D8%A7-%D9%84%D8%A7%D9%8A%D9%84%D9%8A", "wikipedia_de": "https://de.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_en": "https://en.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_es": "https://es.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_it": "https://it.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_nb": "https://no.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Yooka-Laylee", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%B0%A4%E5%8D%A1%E8%8E%B1%E8%8E%89%E5%A4%A7%E5%86%92%E9%99%A9", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%8A%D8%A7%D9%88%D9%83%D8%A7_%D9%84%D8%A7%D9%8A%D9%84%D9%89"}	yooka-laylee	2020-12-21 19:56:03.493452+00	2020-12-21 19:56:03.493487+00	NA
262	Ys VIII: Lacrimosa of Dana	{"en": "Ys VIII: Lacrimosa of Dana", "fr": "Ys VIII: Lacrimosa of Dana", "ja": "イースVIII", "ko": "이스 VIII: 라크리모사 오브 다나", "zh": "伊蘇VIII -丹娜的隕涕日-"}	Ys VIII: Lacrimosa of Dana[c] is an action role-playing game developed by Nihon Falcom and published in North America and Europe by NIS America.[1] A part of the Ys series, it first released in Japan by Falcom for the PlayStation Vita in July 2016, with later worldwide releases for PlayStation 4, Microsoft Windows, Nintendo Switch. A mobile version is also expected to be released for Android and iOS in 2020. The game had sold over 500,000 copies by the end of 2018.	{"en": "Ys VIII: Lacrimosa of Dana[c] is an action role-playing game developed by Nihon Falcom and published in North America and Europe by NIS America.[1] A part of the Ys series, it first released in Japan by Falcom for the PlayStation Vita in July 2016, with later worldwide releases for PlayStation 4, Microsoft Windows, Nintendo Switch. A mobile version is also expected to be released for Android and iOS in 2020. The game had sold over 500,000 copies by the end of 2018."}	["https://upload.wikimedia.org/wikipedia/en/4/4a/Ys_VIII_Box_Art_PSVita_North_America.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Ys_VIII:_Lacrimosa_of_Dana", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Ys_VIII:_Lacrimosa_of_Dana", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%A4%E3%83%BC%E3%82%B9VIII", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9D%B4%EC%8A%A4_VIII:_%EB%9D%BC%ED%81%AC%EB%A6%AC%EB%AA%A8%EC%82%AC_%EC%98%A4%EB%B8%8C_%EB%8B%A4%EB%82%98", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E4%BC%8A%E8%98%87VIII_-%E4%B8%B9%E5%A8%9C%E7%9A%84%E9%9A%95%E6%B6%95%E6%97%A5-"}	ys-viii-lacrimosa-of-dana	2020-12-21 19:56:03.623408+00	2020-12-21 19:56:03.623434+00	NA
303	Metro: Last Light Redux	{"en": "Metro: Last Light Redux"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/b65c1c4dcdf24446bcecda190c6a2fe7rcp1/sku/92cd0fa4958444b5846d1b72878c7e25"}	metro-last-light-redux	2021-02-05 16:52:20.458979+00	2021-02-05 23:20:48.098226+00	M17+
283	Reigns	{"en": "Reigns"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/2677ffb357f946e29b4e86a9f18ea55frcp1/sku/0b415b02e06f452f8be948daf77787c1p"}	reigns	2021-02-05 16:52:18.724327+00	2021-02-05 23:20:46.467948+00	E10+
263	The Legend of Heroes: Trails of Cold Steel III	{"en": "The Legend of Heroes: Trails of Cold Steel III", "fr": "The Legend of Heroes: Trails of Cold Steel III"}	The Legend of Heroes: Trails of Cold Steel III[4] is a role-playing video game developed by Nihon Falcom. It is a part of the Trails series, itself a part of the larger The Legend of Heroes franchise, and is a direct sequel to The Legend of Heroes: Trails of Cold Steel II. The game was released for the PlayStation 4 in Japan in September 2017 and worldwide in October 2019. Ports for Nintendo Switch and Microsoft Windows were also released in 2020. A sequel, Trails of Cold Steel IV, was released in Japan in late 2018.	{"en": "The Legend of Heroes: Trails of Cold Steel III[4] is a role-playing video game developed by Nihon Falcom. It is a part of the Trails series, itself a part of the larger The Legend of Heroes franchise, and is a direct sequel to The Legend of Heroes: Trails of Cold Steel II. The game was released for the PlayStation 4 in Japan in September 2017 and worldwide in October 2019. Ports for Nintendo Switch and Microsoft Windows were also released in 2020. A sequel, Trails of Cold Steel IV, was released in Japan in late 2018."}	["https://upload.wikimedia.org/wikipedia/en/f/f3/Trails_of_cold_steel_3_cover_art.jpg"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Trails_of_Cold_Steel_3", "wikipedia_fr": "https://fr.wikipedia.org/wiki/The_Legend_of_Heroes:_Trails_of_Cold_Steel_III"}	the-legend-of-heroes-trails-of-cold-steel-iii	2020-12-21 19:56:03.930075+00	2020-12-21 19:56:03.930114+00	NA
116	Indivisible	{"en": "Indivisible", "es": "Indivisible (videojuego)", "fr": "Indivisible", "ja": "インディヴィジブル 闇を祓う魂たち", "ko": "인디비지블", "ru": "Indivisible", "zh": "Indivisible"}	Indivisible is an action role-playing-platform game developed by the now-defunct Lab Zero Games and published by 505 Games.[1] The game was initially released in October 2019[2] and on Nintendo Switch on April 28, 2020.[3] It was released in Japan on July 16, 2020.[4]	{"en": "Indivisible is an action role-playing-platform game developed by the now-defunct Lab Zero Games and published by 505 Games.[1] The game was initially released in October 2019[2] and on Nintendo Switch on April 28, 2020.[3] It was released in Japan on July 16, 2020.[4]"}	["https://upload.wikimedia.org/wikipedia/en/b/b2/Indivisible_logo.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Indivisible_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Indivisible_(videojuego)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Indivisible", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%82%A4%E3%83%B3%E3%83%87%E3%82%A3%E3%83%B4%E3%82%A3%E3%82%B8%E3%83%96%E3%83%AB_%E9%97%87%E3%82%92%E7%A5%93%E3%81%86%E9%AD%82%E3%81%9F%E3%81%A1", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9D%B8%EB%94%94%EB%B9%84%EC%A7%80%EB%B8%94", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Indivisible", "wikipedia_zh": "https://zh.wikipedia.org/wiki/Indivisible"}	indivisible	2020-12-18 16:36:42.842585+00	2020-12-21 20:10:27.495294+00	NA
241	Wolfenstein: Youngblood	{"en": "Wolfenstein: Youngblood"}	Wolfenstein: Youngblood is a first-person shooter developed by MachineGames and Arkane Studios and published by Bethesda Softworks. A spin-off of the Wolfenstein series, the game was released for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One in July 2019 and Stadia in November 2019 as a launch title. The game received mixed reviews from both critics and fans.	{"en": "Wolfenstein: Youngblood is a first-person shooter developed by MachineGames and Arkane Studios and published by Bethesda Softworks. A spin-off of the Wolfenstein series, the game was released for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One in July 2019 and Stadia in November 2019 as a launch title. The game received mixed reviews from both critics and fans."}	["https://upload.wikimedia.org/wikipedia/en/a/a0/Wolfenstein_Youngblood_cover_art.png"]	{"stadia": "https://stadia.google.com/store/details/4884bd9bd7864cf28deef05ef4b69e70rcp1/sku/31047b9e82bb4a30ba66b24bef71cdf2"}	wolfenstein-youngblood	2020-12-21 16:12:08.623349+00	2021-02-05 23:20:48.158208+00	M17+
242	WWE 2K Battlegrounds	{"en": "WWE 2K Battlegrounds"}	WWE 2K Battlegrounds is a professional wrestling video game developed by Saber Interactive and published by 2K Sports. It was released on September 18, 2020 in lieu of 2K's normal yearly WWE game, which was cancelled due to both the ongoing COVID-19 pandemic and the negative reception surrounding 2K's previous WWE title, WWE 2K20 (2019).	{"en": "WWE 2K Battlegrounds is a professional wrestling video game developed by Saber Interactive and published by 2K Sports. It was released on September 18, 2020 in lieu of 2K's normal yearly WWE game, which was cancelled due to both the ongoing COVID-19 pandemic and the negative reception surrounding 2K's previous WWE title, WWE 2K20 (2019)."}	["https://upload.wikimedia.org/wikipedia/en/c/c2/WWE_2K_Battlegrounds_%28Video_game_cover_art%29.jpg"]	{"stadia": "https://stadia.google.com/store/details/f28e66bbd0984c77ac6a54e8cc3007bdrcp1/sku/30a2e74966344afcabc22d32c0d2cdc3p"}	wwe-2k-battlegrounds	2020-12-21 16:12:08.648579+00	2021-02-05 23:20:47.55823+00	T
265	Control	{"ar": "كنترول (لعبة فيديو 2019)", "de": "Control (Computerspiel)", "en": "Control", "es": "Control (videojuego)", "fa": "کنترل (بازی ویدئویی)", "fi": "Control (videopeli)", "fr": "Control (jeu vidéo)", "it": "Control (videogioco)", "ja": "Control (コンピュータゲーム)", "ko": "컨트롤 (비디오 게임)", "nl": "Control (computerspel)", "pt": "Control (jogo eletrônico)", "ru": "Control (игра)", "tr": "Control (video oyunu)", "uk": "Control (відеогра)", "zh": "控制 (遊戲)", "arz": "كنترول (فيديو لعب 2019)"}	Control is an action-adventure video game developed by Remedy Entertainment and published by 505 Games. Control was released in August 2019 for Microsoft Windows, PlayStation 4, and Xbox One. A cloud-based version for the Nintendo Switch was released in October 2020. Versions for PlayStation 5 and Xbox Series X/S are set to launch in February 2021. The game revolves around the Federal Bureau of Control (FBC), a secret U.S. government agency tasked with containing and studying phenomena that violate the laws of reality. As Jesse Faden (voiced by Courtney Hope), the Bureau's new Director, the player explores the Oldest House – the FBC's paranormal headquarters – and utilize powerful abilities in order to defeat a deadly enemy known as the Hiss, which has invaded and corrupted reality. The player gains abilities by finding Objects of Power, mundane objects like a rotary phone or a floppy disc imbued with energies from another dimension, that have been at the center of major paranormal events and since recovered by the FBC. 	{"en": "Control is an action-adventure video game developed by Remedy Entertainment and published by 505 Games. Control was released in August 2019 for Microsoft Windows, PlayStation 4, and Xbox One. A cloud-based version for the Nintendo Switch was released in October 2020. Versions for PlayStation 5 and Xbox Series X/S are set to launch in February 2021. The game revolves around the Federal Bureau of Control (FBC), a secret U.S. government agency tasked with containing and studying phenomena that violate the laws of reality. As Jesse Faden (voiced by Courtney Hope), the Bureau's new Director, the player explores the Oldest House – the FBC's paranormal headquarters – and utilize powerful abilities in order to defeat a deadly enemy known as the Hiss, which has invaded and corrupted reality. The player gains abilities by finding Objects of Power, mundane objects like a rotary phone or a floppy disc imbued with energies from another dimension, that have been at the center of major paranormal events and since recovered by the FBC. "}	["https://upload.wikimedia.org/wikipedia/en/6/6a/D1IOd0BWsAAiX5T.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%83%D9%86%D8%AA%D8%B1%D9%88%D9%84_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88_2019)", "wikipedia_de": "https://de.wikipedia.org/wiki/Control_(Computerspiel)", "wikipedia_en": "https://en.wikipedia.org/wiki/Control_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Control_(videojuego)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%A9%D9%86%D8%AA%D8%B1%D9%84_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C)", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Control_(videopeli)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Control_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Control_(videogioco)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Control_(%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF%E3%82%B2%E3%83%BC%E3%83%A0)", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%BB%A8%ED%8A%B8%EB%A1%A4_(%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Control_(computerspel)", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Control_(jogo_eletr%C3%B4nico)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Control_(%D0%B8%D0%B3%D1%80%D0%B0)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Control_(video_oyunu)", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Control_(%D0%B2%D1%96%D0%B4%D0%B5%D0%BE%D0%B3%D1%80%D0%B0)", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%8E%A7%E5%88%B6_(%E9%81%8A%E6%88%B2)", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%83%D9%86%D8%AA%D8%B1%D9%88%D9%84_(%D9%81%D9%8A%D8%AF%D9%8A%D9%88_%D9%84%D8%B9%D8%A8_2019)"}	control	2020-12-21 20:10:27.575081+00	2020-12-21 20:10:27.575104+00	NA
266	Abzû	{"ar": "أبزو (لعبة فيديو)", "el": "Abzû", "en": "Abzû", "es": "Abzu (videojuego)", "fr": "Abzû (jeu vidéo)", "nb": "Abzû", "pt": "Abzû (jogo eletrônico)", "ru": "Abzû", "sv": "Abzû", "zh": "智慧之海", "arz": "ابزو", "wuu": "Abzû"}	Abzû[a] is an adventure video game developed by Giant Squid Studios and published by 505 Games for PlayStation 4, Xbox One, Nintendo Switch and Microsoft Windows. Initially released as a digital title in August 2016, a retail version for consoles was released in January 2017. Following the journey of a diver exploring the ocean and restoring life using sonar calls, the gameplay allows the player to freely navigate underwater environments ranging from open water and natural caverns to ancient ruins.	{"en": "Abzû[a] is an adventure video game developed by Giant Squid Studios and published by 505 Games for PlayStation 4, Xbox One, Nintendo Switch and Microsoft Windows. Initially released as a digital title in August 2016, a retail version for consoles was released in January 2017. Following the journey of a diver exploring the ocean and restoring life using sonar calls, the gameplay allows the player to freely navigate underwater environments ranging from open water and natural caverns to ancient ruins."}	["https://upload.wikimedia.org/wikipedia/en/7/73/Abzu.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D8%B2%D9%88_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88)", "wikipedia_el": "https://el.wikipedia.org/wiki/Abz%C3%BB", "wikipedia_en": "https://en.wikipedia.org/wiki/Abz%C3%BB", "wikipedia_es": "https://es.wikipedia.org/wiki/Abzu_(videojuego)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Abz%C3%BB_(jeu_vid%C3%A9o)", "wikipedia_nb": "https://no.wikipedia.org/wiki/Abz%C3%BB", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Abz%C3%BB_(jogo_eletr%C3%B4nico)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Abz%C3%BB", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Abz%C3%BB", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%99%BA%E6%85%A7%E4%B9%8B%E6%B5%B7", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A7%D8%A8%D8%B2%D9%88", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/Abz%C3%BB"}	abzu	2020-12-21 20:10:27.579787+00	2020-12-21 20:10:27.579808+00	NA
13	Bloodstained: Ritual of the Night	{"ar": "بلودستيند: ريتشوال أف ذا نايت", "en": "Bloodstained: Ritual of the Night", "es": "Bloodstained: Ritual of the Night", "fr": "Bloodstained: Ritual of the Night", "ja": "ブラッドステインド:リチュアル・オブ・ザ・ナイト", "ko": "블러드스테인드: 리추얼 오브 더 나이트", "nb": "Bloodstained: Ritual of the Night", "nl": "Bloodstained: Ritual of the Night", "nn": "Bloodstained: Ritual of the Night", "pt": "Bloodstained: Ritual of the Night", "ru": "Bloodstained: Ritual of the Night", "tr": "Bloodstained: Ritual of the Night", "zh": "血污：夜之仪式", "arz": "بلودستايند: ريتول اف ذا نايت"}	Bloodstained: Ritual of the Night is a Metroidvania type video game developed by ArtPlay and published by 505 Games. The game's development was led by former Castlevania series producer Koji Igarashi, and is considered a spiritual successor to the series. The game is the second in the Bloodstained series. Bloodstained: Ritual of the Night was released for Microsoft Windows, Nintendo Switch, PlayStation 4, and Xbox One in June 2019, and for iOS and Android in December 2020.	{"en": "Bloodstained: Ritual of the Night is a Metroidvania type video game developed by ArtPlay and published by 505 Games. The game's development was led by former Castlevania series producer Koji Igarashi, and is considered a spiritual successor to the series. The game is the second in the Bloodstained series. Bloodstained: Ritual of the Night was released for Microsoft Windows, Nintendo Switch, PlayStation 4, and Xbox One in June 2019, and for iOS and Android in December 2020."}	["https://upload.wikimedia.org/wikipedia/en/7/74/Bloodstained_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%A8%D9%84%D9%88%D8%AF%D8%B3%D8%AA%D9%8A%D9%86%D8%AF:_%D8%B1%D9%8A%D8%AA%D8%B4%D9%88%D8%A7%D9%84_%D8%A3%D9%81_%D8%B0%D8%A7_%D9%86%D8%A7%D9%8A%D8%AA", "wikipedia_en": "https://en.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_es": "https://es.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%96%E3%83%A9%E3%83%83%E3%83%89%E3%82%B9%E3%83%86%E3%82%A4%E3%83%B3%E3%83%89:%E3%83%AA%E3%83%81%E3%83%A5%E3%82%A2%E3%83%AB%E3%83%BB%E3%82%AA%E3%83%96%E3%83%BB%E3%82%B6%E3%83%BB%E3%83%8A%E3%82%A4%E3%83%88", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EB%B8%94%EB%9F%AC%EB%93%9C%EC%8A%A4%ED%85%8C%EC%9D%B8%EB%93%9C:_%EB%A6%AC%EC%B6%94%EC%96%BC_%EC%98%A4%EB%B8%8C_%EB%8D%94_%EB%82%98%EC%9D%B4%ED%8A%B8", "wikipedia_nb": "https://no.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Bloodstained:_Ritual_of_the_Night", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E8%A1%80%E6%B1%A1%EF%BC%9A%E5%A4%9C%E4%B9%8B%E4%BB%AA%E5%BC%8F", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%A8%D9%84%D9%88%D8%AF%D8%B3%D8%AA%D8%A7%D9%8A%D9%86%D8%AF:_%D8%B1%D9%8A%D8%AA%D9%88%D9%84_%D8%A7%D9%81_%D8%B0%D8%A7_%D9%86%D8%A7%D9%8A%D8%AA"}	bloodstained-ritual-of-the-night	2020-12-17 19:51:04.355591+00	2020-12-21 20:10:27.709547+00	NA
268	Rime	{"ar": "رايم", "de": "Rime (Computerspiel)", "el": "Rime", "en": "Rime", "es": "Rime", "fa": "ریم (بازی ویدئویی)", "fr": "Rime (jeu vidéo)", "it": "Rime (videogioco)", "ja": "RiME", "nb": "Rime (videospill)", "ru": "Rime", "sv": "Rime", "arz": "رايم"}	Rime (stylized as RiME)[3] is an adventure puzzle video game developed by Tequila Works. The game was released for Microsoft Windows, PlayStation 4, and Xbox One in May 2017, and for the Nintendo Switch in November 2017. The game follows a boy arriving at and searching a mysterious island with a fox-like spirit as a guide. The player guides the boy in solving environmental puzzles across five large levels.	{"en": "Rime (stylized as RiME)[3] is an adventure puzzle video game developed by Tequila Works. The game was released for Microsoft Windows, PlayStation 4, and Xbox One in May 2017, and for the Nintendo Switch in November 2017. The game follows a boy arriving at and searching a mysterious island with a fox-like spirit as a guide. The player guides the boy in solving environmental puzzles across five large levels."}	["https://upload.wikimedia.org/wikipedia/en/4/44/Rime_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%B1%D8%A7%D9%8A%D9%85", "wikipedia_de": "https://de.wikipedia.org/wiki/Rime_(Computerspiel)", "wikipedia_el": "https://el.wikipedia.org/wiki/Rime", "wikipedia_en": "https://en.wikipedia.org/wiki/Rime_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Rime", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%D8%B1%DB%8C%D9%85_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Rime_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Rime_(videogioco)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/RiME", "wikipedia_nb": "https://no.wikipedia.org/wiki/Rime_(videospill)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Rime", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Rime", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B1%D8%A7%D9%8A%D9%85"}	rime	2020-12-21 20:10:27.721596+00	2020-12-21 20:10:27.721619+00	NA
269	Contra	{"ar": "كونترا (لعبة فيديو)", "cs": "Contra (počítačová hra)", "el": "Contra (βιντεοπαιχνίδι)", "en": "Contra", "es": "Contra (videojuego)", "fa": "کنترا (بازی ویدئویی)", "fi": "Contra (videopeli)", "fr": "Probotector (jeu vidéo, 1987)", "gl": "Contra (videoxogo)", "he": "קונטרה (משחק וידאו)", "hy": "Contra", "id": "Contra (permainan video)", "it": "Contra (videogioco)", "ja": "魂斗羅", "ko": "콘트라 (비디오 게임)", "nl": "Contra (arcadespel)", "pl": "Contra", "pt": "Contra (jogo eletrônico)", "ru": "Contra", "sv": "Probotector", "th": "คอนทรา (วิดีโอเกม)", "tr": "Contra (video oyunu)", "uk": "Contra", "vi": "Contra (trò chơi điện tử)", "zh": "魂斗罗", "arz": "كونترا (فيديو لعب 1987)", "wuu": "魂斗罗"}	Contra[3] is a run and gun video game developed and published by Konami, originally released as a coin-operated arcade game on February 20, 1987.[4][5] A home version was released for the Nintendo Entertainment System in 1988, along with ports for various computer formats, including the MSX2. The home versions were localized in the PAL region as Gryzor on the various computer formats and as Probotector on the NES, released later. Several Contra sequels were produced following the original game.	{"en": "Contra[3] is a run and gun video game developed and published by Konami, originally released as a coin-operated arcade game on February 20, 1987.[4][5] A home version was released for the Nintendo Entertainment System in 1988, along with ports for various computer formats, including the MSX2. The home versions were localized in the PAL region as Gryzor on the various computer formats and as Probotector on the NES, released later. Several Contra sequels were produced following the original game."}	["https://upload.wikimedia.org/wikipedia/en/6/65/Contra_cover.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D9%83%D9%88%D9%86%D8%AA%D8%B1%D8%A7_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88)", "wikipedia_cs": "https://cs.wikipedia.org/wiki/Contra_(po%C4%8D%C3%ADta%C4%8Dov%C3%A1_hra)", "wikipedia_el": "https://el.wikipedia.org/wiki/Contra_(%CE%B2%CE%B9%CE%BD%CF%84%CE%B5%CE%BF%CF%80%CE%B1%CE%B9%CF%87%CE%BD%CE%AF%CE%B4%CE%B9)", "wikipedia_en": "https://en.wikipedia.org/wiki/Contra_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Contra_(videojuego)", "wikipedia_fa": "https://fa.wikipedia.org/wiki/%DA%A9%D9%86%D8%AA%D8%B1%D8%A7_(%D8%A8%D8%A7%D8%B2%DB%8C_%D9%88%DB%8C%D8%AF%D8%A6%D9%88%DB%8C%DB%8C)", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Contra_(videopeli)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Probotector_(jeu_vid%C3%A9o,_1987)", "wikipedia_gl": "https://gl.wikipedia.org/wiki/Contra_(videoxogo)", "wikipedia_he": "https://he.wikipedia.org/wiki/%D7%A7%D7%95%D7%A0%D7%98%D7%A8%D7%94_(%D7%9E%D7%A9%D7%97%D7%A7_%D7%95%D7%99%D7%93%D7%90%D7%95)", "wikipedia_hy": "https://hy.wikipedia.org/wiki/Contra", "wikipedia_id": "https://id.wikipedia.org/wiki/Contra_(permainan_video)", "wikipedia_it": "https://it.wikipedia.org/wiki/Contra_(videogioco)", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E9%AD%82%E6%96%97%E7%BE%85", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%BD%98%ED%8A%B8%EB%9D%BC_(%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Contra_(arcadespel)", "wikipedia_pl": "https://pl.wikipedia.org/wiki/Contra", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Contra_(jogo_eletr%C3%B4nico)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Contra", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Probotector", "wikipedia_th": "https://th.wikipedia.org/wiki/%E0%B8%84%E0%B8%AD%E0%B8%99%E0%B8%97%E0%B8%A3%E0%B8%B2_(%E0%B8%A7%E0%B8%B4%E0%B8%94%E0%B8%B5%E0%B9%82%E0%B8%AD%E0%B9%80%E0%B8%81%E0%B8%A1)", "wikipedia_tr": "https://tr.wikipedia.org/wiki/Contra_(video_oyunu)", "wikipedia_uk": "https://uk.wikipedia.org/wiki/Contra", "wikipedia_vi": "https://vi.wikipedia.org/wiki/Contra_(tr%C3%B2_ch%C6%A1i_%C4%91i%E1%BB%87n_t%E1%BB%AD)", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E9%AD%82%E6%96%97%E7%BD%97", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%83%D9%88%D9%86%D8%AA%D8%B1%D8%A7_(%D9%81%D9%8A%D8%AF%D9%8A%D9%88_%D9%84%D8%B9%D8%A8_1987)", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E9%AD%82%E6%96%97%E7%BD%97"}	contra	2020-12-21 20:10:27.749169+00	2020-12-21 20:10:27.74919+00	NA
134	Tacoma	{"ar": "تاكوما (لعبة فيديو)", "en": "Tacoma", "es": "Tacoma (videojuego)", "fr": "Tacoma (jeu vidéo)", "ru": "Tacoma"}	Tacoma is an adventure video game by Fullbright released on Microsoft Windows, macOS, Linux, and Xbox One in August 2017, and on PlayStation 4 in May 2018. The game received generally positive reviews upon release but it sold fewer copies than Gone Home, Fullbright's first game.	{"en": "Tacoma is an adventure video game by Fullbright released on Microsoft Windows, macOS, Linux, and Xbox One in August 2017, and on PlayStation 4 in May 2018. The game received generally positive reviews upon release but it sold fewer copies than Gone Home, Fullbright's first game."}	["https://upload.wikimedia.org/wikipedia/en/3/36/Tacoma_cover_art.jpg"]	{"wikipedia_ar": "https://ar.wikipedia.org/wiki/%D8%AA%D8%A7%D9%83%D9%88%D9%85%D8%A7_(%D9%84%D8%B9%D8%A8%D8%A9_%D9%81%D9%8A%D8%AF%D9%8A%D9%88)", "wikipedia_en": "https://en.wikipedia.org/wiki/Tacoma_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Tacoma_(videojuego)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Tacoma_(jeu_vid%C3%A9o)", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Tacoma"}	tacoma	2020-12-18 16:36:43.515588+00	2020-12-21 20:10:27.781826+00	NA
270	Yooka-Laylee and the Impossible Lair	{"en": "Yooka-Laylee and the Impossible Lair", "es": "Yooka-Laylee and the Impossible Lair", "fr": "Yooka-Laylee and the Impossible Lair", "nl": "Yooka-Laylee and the Impossible Lair", "nn": "Yooka-Laylee and the Impossible Lair", "sv": "Yooka-Laylee and the Impossible Lair"}	Yooka-Laylee and the Impossible Lair is a platform video game developed by Playtonic Games and published by Team17. As a spin-off of Yooka-Laylee (2017), the game was released digitally for Microsoft Windows, PlayStation 4, Nintendo Switch and Xbox One in October 2019, with physical versions releasing only for the latter three on a later date.[2][3]	{"en": "Yooka-Laylee and the Impossible Lair is a platform video game developed by Playtonic Games and published by Team17. As a spin-off of Yooka-Laylee (2017), the game was released digitally for Microsoft Windows, PlayStation 4, Nintendo Switch and Xbox One in October 2019, with physical versions releasing only for the latter three on a later date.[2][3]"}	["https://upload.wikimedia.org/wikipedia/en/7/7d/Yooka_Laylee_and_the_Impossible_Lair_cover_art.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Yooka-Laylee_and_the_Impossible_Lair", "wikipedia_es": "https://es.wikipedia.org/wiki/Yooka-Laylee_and_the_Impossible_Lair", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Yooka-Laylee_and_the_Impossible_Lair", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Yooka-Laylee_and_the_Impossible_Lair", "wikipedia_nn": "https://nn.wikipedia.org/wiki/Yooka-Laylee_and_the_Impossible_Lair", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Yooka-Laylee_and_the_Impossible_Lair"}	yooka-laylee-and-the-impossible-lair	2020-12-21 20:10:27.817435+00	2020-12-21 20:10:27.817451+00	NA
271	Obduction	{"el": "Obduction (βιντεοπαιχνίδι)", "en": "Obduction", "fr": "Obduction (jeu vidéo)", "nl": "Obduction", "ru": "Obduction"}	Obduction is an adventure video game developed by Cyan Worlds. Obduction is considered a spiritual successor to Cyan's previous adventure games, Myst and Riven.[1] In the game, the player finds their character transported to strange alien worlds but with human elements within the settings. The player must explore and solve puzzles to figure out how to return home.	{"en": "Obduction is an adventure video game developed by Cyan Worlds. Obduction is considered a spiritual successor to Cyan's previous adventure games, Myst and Riven.[1] In the game, the player finds their character transported to strange alien worlds but with human elements within the settings. The player must explore and solve puzzles to figure out how to return home."}	[]	{"wikipedia_el": "https://el.wikipedia.org/wiki/Obduction_(%CE%B2%CE%B9%CE%BD%CF%84%CE%B5%CE%BF%CF%80%CE%B1%CE%B9%CF%87%CE%BD%CE%AF%CE%B4%CE%B9)", "wikipedia_en": "https://en.wikipedia.org/wiki/Obduction_(video_game)", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Obduction_(jeu_vid%C3%A9o)", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Obduction", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Obduction"}	obduction	2020-12-21 20:10:27.833914+00	2020-12-21 20:10:27.833936+00	NA
272	Shantae and the Pirate's Curse	{"en": "Shantae and the Pirate's Curse", "es": "Shantae and the Pirate's Curse", "fi": "Shantae and the Pirate’s Curse", "fr": "Shantae and the Pirate's Curse", "pt": "Shantae and the Pirate's Curse", "sv": "Shantae and the Pirate's Curse", "zh": "桑塔與海盜的詛咒", "arz": "شانتاى اند ث پيراتيس كورس"}	Shantae and the Pirate's Curse is a platform game developed by WayForward Technologies for the Nintendo 3DS and the Wii U. It is the third game in the Shantae series, following Shantae: Risky's Revenge. It was released in North America on the 3DS eShop on October 23, 2014 and on the Wii U eShop on December 25, 2014, and in PAL regions on both platforms on February 5, 2015. The game was later ported to PlayStation 4, Xbox One, Microsoft Windows, Amazon Fire TV, and Nintendo Switch. The game follows the adventures of the eponymous half-genie Shantae as she once again has to save Sequin Land from a new foe, the Pirate Master, with help from her nemesis Risky Boots.	{"en": "Shantae and the Pirate's Curse is a platform game developed by WayForward Technologies for the Nintendo 3DS and the Wii U. It is the third game in the Shantae series, following Shantae: Risky's Revenge. It was released in North America on the 3DS eShop on October 23, 2014 and on the Wii U eShop on December 25, 2014, and in PAL regions on both platforms on February 5, 2015. The game was later ported to PlayStation 4, Xbox One, Microsoft Windows, Amazon Fire TV, and Nintendo Switch. The game follows the adventures of the eponymous half-genie Shantae as she once again has to save Sequin Land from a new foe, the Pirate Master, with help from her nemesis Risky Boots."}	["https://upload.wikimedia.org/wikipedia/en/4/41/Shantae_3_cover.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Shantae_and_the_Pirate%27s_Curse", "wikipedia_es": "https://es.wikipedia.org/wiki/Shantae_and_the_Pirate%27s_Curse", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Shantae_and_the_Pirate%E2%80%99s_Curse", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Shantae_and_the_Pirate%27s_Curse", "wikipedia_pt": "https://pt.wikipedia.org/wiki/Shantae_and_the_Pirate%27s_Curse", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Shantae_and_the_Pirate%27s_Curse", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%A1%91%E5%A1%94%E8%88%87%E6%B5%B7%E7%9B%9C%E7%9A%84%E8%A9%9B%E5%92%92", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B4%D8%A7%D9%86%D8%AA%D8%A7%D9%89_%D8%A7%D9%86%D8%AF_%D8%AB_%D9%BE%D9%8A%D8%B1%D8%A7%D8%AA%D9%8A%D8%B3_%D9%83%D9%88%D8%B1%D8%B3"}	shantae-and-the-pirates-curse	2020-12-21 20:10:27.858488+00	2020-12-21 20:10:27.858509+00	NA
304	Ghost Recon Breakpoint	{"en": "Ghost Recon Breakpoint"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/11c9ece5b3a045908d77cf2b66adb010rcp1/sku/06e101d56a03472bb6c204aee96187d7"}	ghost-recon-breakpoint	2021-02-05 16:52:20.633841+00	2021-02-05 23:20:47.157681+00	M17+
337	Ghost Recon Wildlands	{"en": "Ghost Recon Wildlands"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/a1ce1274a83244f1a099bebef7ae1233rcp1/sku/e609b00ee98d4e0e9a5eb80789db566cp"}	ghost-recon-wildlands	2021-02-05 16:52:23.011615+00	2021-02-05 23:20:47.196376+00	M17+
350	Cake Bash	{"en": "Cake Bash"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/19efd5fa36794d7b8bc87de68124e705rcp1/sku/a7f0a6098ae747788a6f75d0d1e1d8f2p"}	cake-bash	2021-02-05 16:52:24.332486+00	2021-02-05 23:20:46.281251+00	E
273	Ken Follett's The Pillars of the Earth	{"de": "Die Säulen der Erde (Computerspiel)", "en": "Ken Follett's The Pillars of the Earth", "fr": "Les Piliers de la Terre (jeu vidéo)", "it": "Ken Follett's The Pillars of the Earth", "arz": "كين فوليتس ث پيلارس اوف ث ايرث"}	Ken Follett's The Pillars of the Earth is a point-and-click adventure video game developed and published by German studio Daedalic Entertainment. It is based on Ken Follett’s award-winning 1989 novel of the same name, which was adapted as a videogame across 21 playable chapters. Book 1 of the game was released on 16 August 2017,[1] Book 2 on 13 December 2017,[2] and Book 3 on 29 March 2018.[3][4]	{"en": "Ken Follett's The Pillars of the Earth is a point-and-click adventure video game developed and published by German studio Daedalic Entertainment. It is based on Ken Follett’s award-winning 1989 novel of the same name, which was adapted as a videogame across 21 playable chapters. Book 1 of the game was released on 16 August 2017,[1] Book 2 on 13 December 2017,[2] and Book 3 on 29 March 2018.[3][4]"}	["https://upload.wikimedia.org/wikipedia/en/c/ca/Ken_Follett%27s_The_Pillars_of_the_Earth_PC_game_cover.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Die_S%C3%A4ulen_der_Erde_(Computerspiel)", "wikipedia_en": "https://en.wikipedia.org/wiki/Ken_Follett%27s_The_Pillars_of_the_Earth", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Les_Piliers_de_la_Terre_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Ken_Follett%27s_The_Pillars_of_the_Earth", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D9%83%D9%8A%D9%86_%D9%81%D9%88%D9%84%D9%8A%D8%AA%D8%B3_%D8%AB_%D9%BE%D9%8A%D9%84%D8%A7%D8%B1%D8%B3_%D8%A7%D9%88%D9%81_%D8%AB_%D8%A7%D9%8A%D8%B1%D8%AB"}	ken-folletts-the-pillars-of-the-earth	2020-12-21 20:10:27.90209+00	2020-12-21 20:10:27.902108+00	NA
274	Yoku's Island Express	{"en": "Yoku's Island Express", "es": "Yoku's Island Express", "fr": "Yoku's Island Express", "it": "Yoku's Island Express", "ja": "Yoku's Island Express", "zh": "尤庫的小島速遞"}	Yoku's Island Express is a platforming pinball adventure video game developed by Swedish studio Villa Gorilla and published by Team17. The studio's debut project, the game was released in 2018 for Nintendo Switch, Microsoft Windows, PlayStation 4 and Xbox One.	{"en": "Yoku's Island Express is a platforming pinball adventure video game developed by Swedish studio Villa Gorilla and published by Team17. The studio's debut project, the game was released in 2018 for Nintendo Switch, Microsoft Windows, PlayStation 4 and Xbox One."}	["https://upload.wikimedia.org/wikipedia/en/b/b9/Yoku%27s_Island_Express_cover.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Yoku%27s_Island_Express", "wikipedia_es": "https://es.wikipedia.org/wiki/Yoku%27s_Island_Express", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Yoku%27s_Island_Express", "wikipedia_it": "https://it.wikipedia.org/wiki/Yoku%27s_Island_Express", "wikipedia_ja": "https://ja.wikipedia.org/wiki/Yoku%27s_Island_Express", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E5%B0%A4%E5%BA%AB%E7%9A%84%E5%B0%8F%E5%B3%B6%E9%80%9F%E9%81%9E"}	yokus-island-express	2020-12-21 20:10:27.921878+00	2020-12-21 20:10:27.921898+00	NA
275	Wonder Boy	{"de": "Wonder Boy", "el": "Wonder Boy (βιντεοπαιχνίδι)", "en": "Wonder Boy", "es": "Wonder Boy (videojuego)", "fi": "Wonder Boy", "fr": "Wonder Boy (jeu vidéo)", "it": "Wonder Boy", "ja": "ワンダーボーイ (ゲーム)", "ko": "원더보이 (비디오 게임)", "nl": "Wonder Boy (computerspel)", "sv": "Wonder Boy (datorspel)", "zh": "神奇男孩 (游戏)", "wuu": "神奇男孩 (游戏)"}	Wonder Boy (ワンダーボーイ, Wandā Bōi) is a 1986 platform game published by Sega and developed by Escape (now known as Westone Bit Entertainment).	{"en": "Wonder Boy (ワンダーボーイ, Wandā Bōi) is a 1986 platform game published by Sega and developed by Escape (now known as Westone Bit Entertainment)."}	["https://upload.wikimedia.org/wikipedia/en/f/ff/WonderBoy_arcadeflyer.png"]	{"wikipedia_de": "https://de.wikipedia.org/wiki/Wonder_Boy", "wikipedia_el": "https://el.wikipedia.org/wiki/Wonder_Boy_(%CE%B2%CE%B9%CE%BD%CF%84%CE%B5%CE%BF%CF%80%CE%B1%CE%B9%CF%87%CE%BD%CE%AF%CE%B4%CE%B9)", "wikipedia_en": "https://en.wikipedia.org/wiki/Wonder_Boy_(video_game)", "wikipedia_es": "https://es.wikipedia.org/wiki/Wonder_Boy_(videojuego)", "wikipedia_fi": "https://fi.wikipedia.org/wiki/Wonder_Boy", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Wonder_Boy_(jeu_vid%C3%A9o)", "wikipedia_it": "https://it.wikipedia.org/wiki/Wonder_Boy", "wikipedia_ja": "https://ja.wikipedia.org/wiki/%E3%83%AF%E3%83%B3%E3%83%80%E3%83%BC%E3%83%9C%E3%83%BC%E3%82%A4_(%E3%82%B2%E3%83%BC%E3%83%A0)", "wikipedia_ko": "https://ko.wikipedia.org/wiki/%EC%9B%90%EB%8D%94%EB%B3%B4%EC%9D%B4_(%EB%B9%84%EB%94%94%EC%98%A4_%EA%B2%8C%EC%9E%84)", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Wonder_Boy_(computerspel)", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Wonder_Boy_(datorspel)", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E7%A5%9E%E5%A5%87%E7%94%B7%E5%AD%A9_(%E6%B8%B8%E6%88%8F)", "wikipedia_wuu": "https://wuu.wikipedia.org/wiki/%E7%A5%9E%E5%A5%87%E7%94%B7%E5%AD%A9_(%E6%B8%B8%E6%88%8F)"}	wonder-boy	2020-12-21 20:10:27.928717+00	2020-12-21 20:10:27.928735+00	NA
277	Shantae: Half-Genie Hero	{"en": "Shantae: Half-Genie Hero", "es": "Shantae: Half-Genie Hero", "fr": "Shantae: Half-Genie Hero", "nl": "Shantae: Half-Genie Hero", "ru": "Shantae: Half-Genie Hero", "sv": "Shantae: Half-Genie Hero", "zh": "桑塔：半精靈英雄", "arz": "شانتاي: هالف جينى هيرو"}	Shantae: Half-Genie Hero, stylized as Shantae: ½ Genie Hero, is a platform video game developed by WayForward Technologies for Microsoft Windows, PlayStation 4, PlayStation Vita, Wii U, Xbox One, and Nintendo Switch. It is the fourth game in the Shantae series, following Shantae and the Pirate's Curse, and the first to be specifically developed for high definition game platforms. The game was released for Microsoft Windows, PlayStation 4, PlayStation Vita, Wii U, and Xbox One in December 2016,[2] and for Nintendo Switch the following June.[3]	{"en": "Shantae: Half-Genie Hero, stylized as Shantae: ½ Genie Hero, is a platform video game developed by WayForward Technologies for Microsoft Windows, PlayStation 4, PlayStation Vita, Wii U, Xbox One, and Nintendo Switch. It is the fourth game in the Shantae series, following Shantae and the Pirate's Curse, and the first to be specifically developed for high definition game platforms. The game was released for Microsoft Windows, PlayStation 4, PlayStation Vita, Wii U, and Xbox One in December 2016,[2] and for Nintendo Switch the following June.[3]"}	["https://upload.wikimedia.org/wikipedia/en/9/9c/Shantae_Half-Genie_Hero.png"]	{"wikipedia_en": "https://en.wikipedia.org/wiki/Shantae:_Half-Genie_Hero", "wikipedia_es": "https://es.wikipedia.org/wiki/Shantae:_Half-Genie_Hero", "wikipedia_fr": "https://fr.wikipedia.org/wiki/Shantae:_Half-Genie_Hero", "wikipedia_nl": "https://nl.wikipedia.org/wiki/Shantae:_Half-Genie_Hero", "wikipedia_ru": "https://ru.wikipedia.org/wiki/Shantae:_Half-Genie_Hero", "wikipedia_sv": "https://sv.wikipedia.org/wiki/Shantae:_Half-Genie_Hero", "wikipedia_zh": "https://zh.wikipedia.org/wiki/%E6%A1%91%E5%A1%94%EF%BC%9A%E5%8D%8A%E7%B2%BE%E9%9D%88%E8%8B%B1%E9%9B%84", "wikipedia_arz": "https://arz.wikipedia.org/wiki/%D8%B4%D8%A7%D9%86%D8%AA%D8%A7%D9%8A:_%D9%87%D8%A7%D9%84%D9%81_%D8%AC%D9%8A%D9%86%D9%89_%D9%87%D9%8A%D8%B1%D9%88"}	shantae-half-genie-hero	2020-12-21 20:10:28.052843+00	2020-12-21 20:10:28.052859+00	NA
336	GYLT	{"en": "GYLT"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/18a3cc2bb111419c8ac873086d04dfaarcp1/sku/9ac5597c3f4a4e648c9ae56bac3d1b32"}	gylt	2021-02-05 16:52:23.009311+00	2021-02-05 23:20:46.032493+00	T
208	République	{"en": "République"}	République is an episodic action-adventure stealth video game developed by Camouflaj and Logan Games and published by GungHo Online Entertainment. The game was originally announced for iOS devices but has since expanded to Android, Microsoft Windows and OS X. A PlayStation 4 version, containing all five episodes, was released on March 22, 2016, while a version for the Stadia cloud gaming service was released on September 15, 2020.[3][4] A VR version debuted on the Oculus Go, followed by a release onto Oculus Quest in July 2019, and Steam on 15 June 2020 (for HTC Vive, Oculus Rift and Valve Index) and Oculus Go.	{"en": "République is an episodic action-adventure stealth video game developed by Camouflaj and Logan Games and published by GungHo Online Entertainment. The game was originally announced for iOS devices but has since expanded to Android, Microsoft Windows and OS X. A PlayStation 4 version, containing all five episodes, was released on March 22, 2016, while a version for the Stadia cloud gaming service was released on September 15, 2020.[3][4] A VR version debuted on the Oculus Go, followed by a release onto Oculus Quest in July 2019, and Steam on 15 June 2020 (for HTC Vive, Oculus Rift and Valve Index) and Oculus Go."}	["https://upload.wikimedia.org/wikipedia/en/4/45/R%C3%A9publique_cover.jpeg"]	{"stadia": "https://stadia.google.com/store/details/65864a95f9e74129845bda0467486413rcp1/sku/2a4af85a84974cdba4d61df620305335"}	republique	2020-12-21 16:12:04.69611+00	2021-02-05 23:20:48.101614+00	M17+
238	Watch Dogs 2	{"en": "Watch Dogs 2"}	Watch Dogs 2 (stylized as WATCH_DOGS 2) is a 2016 action-adventure game developed by Ubisoft Montreal and published by Ubisoft. It is the sequel to 2014's Watch Dogs and the second installment in the Watch Dogs series. It was released for the PlayStation 4, Xbox One and Microsoft Windows in November 2016, and Stadia in December 2020. Set within a fictionalized version of the San Francisco Bay Area, the game is played from a third-person perspective and its open world is navigated on-foot or by vehicle. Players control Marcus Holloway, a hacker who works with the hacking group DedSec to take down the city's advanced surveillance system known as ctOS. There are multiple ways to complete missions, and each successful assignment increases the follower count of DedSec. Cooperative multiplayer allows for competitive one-on-one combat and connecting with other players to neutralize a player who is causing havoc.	{"en": "Watch Dogs 2 (stylized as WATCH_DOGS 2) is a 2016 action-adventure game developed by Ubisoft Montreal and published by Ubisoft. It is the sequel to 2014's Watch Dogs and the second installment in the Watch Dogs series. It was released for the PlayStation 4, Xbox One and Microsoft Windows in November 2016, and Stadia in December 2020. Set within a fictionalized version of the San Francisco Bay Area, the game is played from a third-person perspective and its open world is navigated on-foot or by vehicle. Players control Marcus Holloway, a hacker who works with the hacking group DedSec to take down the city's advanced surveillance system known as ctOS. There are multiple ways to complete missions, and each successful assignment increases the follower count of DedSec. Cooperative multiplayer allows for competitive one-on-one combat and connecting with other players to neutralize a player who is causing havoc."}	["https://upload.wikimedia.org/wikipedia/en/b/b0/Watch_Dogs_2.jpg"]	{"stadia": "https://stadia.google.com/store/details/e6005e58d6d3458abd01bcf68e264ccercp1/sku/b64033837ef440bfaba7b1c54a1ac866p"}	watch-dogs-2	2020-12-21 16:12:08.440795+00	2021-02-05 23:20:48.249588+00	M17+
225	SteamWorld Dig	{"en": "SteamWorld Dig"}	SteamWorld Dig is a single-player platform action-adventure game created by Swedish video game developer Image & Form. The second installment in the SteamWorld series and the  sequel to SteamWorld Tower Defense,[2][3] SteamWorld Dig has the player control Rusty, a steam-powered robot who arrives at a small Western mining town called Tumbleton after having received a deed for a mine from his long-forgotten uncle, Joe. The objective of the game is to dig through Tumbleton's mine, which also involves solving puzzles and platforming to avoid traps and enemies. SteamWorld Dig was initially released on the Nintendo eShop for the Nintendo 3DS in Europe and Australia on 7 August 2013, North America on 8 August 2013, and Japan on 20 November 2013. Later, SteamWorld Dig was released on 5 December 2013 for Microsoft Windows, Mac, and Linux on Steam,[4] on 18 March 2014 in North America and on 19 March 2014 in Europe for PlayStation 4 and PlayStation Vita,[5] on 28 August 2014 for Wii U, on 5 June 2015 for Xbox One, and on 1 February 2018 for Nintendo Switch. A  successor, SteamWorld Heist, was released in December 2015. A sequel, SteamWorld Dig 2, was released in September 2017. It was released on Google's cloud gaming service Stadia on March 10, 2020[6].	{"en": "SteamWorld Dig is a single-player platform action-adventure game created by Swedish video game developer Image & Form. The second installment in the SteamWorld series and the  sequel to SteamWorld Tower Defense,[2][3] SteamWorld Dig has the player control Rusty, a steam-powered robot who arrives at a small Western mining town called Tumbleton after having received a deed for a mine from his long-forgotten uncle, Joe. The objective of the game is to dig through Tumbleton's mine, which also involves solving puzzles and platforming to avoid traps and enemies. SteamWorld Dig was initially released on the Nintendo eShop for the Nintendo 3DS in Europe and Australia on 7 August 2013, North America on 8 August 2013, and Japan on 20 November 2013. Later, SteamWorld Dig was released on 5 December 2013 for Microsoft Windows, Mac, and Linux on Steam,[4] on 18 March 2014 in North America and on 19 March 2014 in Europe for PlayStation 4 and PlayStation Vita,[5] on 28 August 2014 for Wii U, on 5 June 2015 for Xbox One, and on 1 February 2018 for Nintendo Switch. A  successor, SteamWorld Heist, was released in December 2015. A sequel, SteamWorld Dig 2, was released in September 2017. It was released on Google's cloud gaming service Stadia on March 10, 2020[6]."}	["https://upload.wikimedia.org/wikipedia/en/9/98/SteamWorld_Dig_cover.png"]	{"stadia": "https://stadia.google.com/store/details/c4898519ff254b969ede8bafdff927e8rcp1/sku/f6658df6c8874c828532d5d24c66d58f"}	steamworld-dig	2020-12-21 16:12:06.479787+00	2021-02-05 23:20:46.462293+00	E10+
352	Rock of Ages 3: Make & Break	{"en": "Rock of Ages 3: Make & Break"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/d3d8e467203d401387857d5b6cc27263rcp1/sku/5251fd4e832d459ca046e6eb81b16809"}	rock-of-ages-3-make-break	2021-02-05 16:52:24.5565+00	2021-02-05 23:20:46.755993+00	N/A
197	Mortal Kombat 11	{"en": "Mortal Kombat 11"}	Mortal Kombat 11 is a fighting game developed by NetherRealm Studios and published by Warner Bros. Interactive Entertainment. Running on a heavily modified version of Unreal Engine 3,[7] it is the eleventh main installment in the Mortal Kombat series and a sequel to 2015's Mortal Kombat X. Announced at The Game Awards 2018, the game was released in North America and Europe on April 23, 2019 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One — with the exception of Europe's Switch version which was released on May 10, 2019.[8] The game was released on the Stadia on November 19, 2019.[9]	{"en": "Mortal Kombat 11 is a fighting game developed by NetherRealm Studios and published by Warner Bros. Interactive Entertainment. Running on a heavily modified version of Unreal Engine 3,[7] it is the eleventh main installment in the Mortal Kombat series and a sequel to 2015's Mortal Kombat X. Announced at The Game Awards 2018, the game was released in North America and Europe on April 23, 2019 for Microsoft Windows, Nintendo Switch, PlayStation 4 and Xbox One — with the exception of Europe's Switch version which was released on May 10, 2019.[8] The game was released on the Stadia on November 19, 2019.[9]"}	["https://upload.wikimedia.org/wikipedia/en/7/7e/Mortal_Kombat_11_cover_art.png"]	{"stadia": "https://stadia.google.com/store/details/7bfbcba307114ab88ae4231da2ec85d3rcp1/sku/f3f250e8a4d54f60ba730fbc04268052"}	mortal-kombat-11	2020-12-21 16:12:03.64232+00	2021-02-05 23:20:48.10517+00	M17+
229	Thumper	{"en": "Thumper"}	Thumper is a rhythm game developed and published by Drool and released in October 2016 on Microsoft Windows and PlayStation 4, with optional virtual reality (VR) support for the Oculus, HTC Vive, and PlayStation VR headsets. It was later released on the Nintendo Switch in May 2017, the Xbox One in August 2017, iOS in January 2018, Oculus Go in September 2018, Android in February 2019, Oculus Quest in May 2019, and Stadia in November 2019. The game was shown at the Experimental Game Workshop during the 2015 Game Developers Conference.	{"en": "Thumper is a rhythm game developed and published by Drool and released in October 2016 on Microsoft Windows and PlayStation 4, with optional virtual reality (VR) support for the Oculus, HTC Vive, and PlayStation VR headsets. It was later released on the Nintendo Switch in May 2017, the Xbox One in August 2017, iOS in January 2018, Oculus Go in September 2018, Android in February 2019, Oculus Quest in May 2019, and Stadia in November 2019. The game was shown at the Experimental Game Workshop during the 2015 Game Developers Conference."}	["https://upload.wikimedia.org/wikipedia/en/e/e5/Thumper_%28video_game%29.jpg"]	{"stadia": "https://stadia.google.com/store/details/c121d8b3fa744b52b71bf3599cb3da7frcp1/sku/6e98f34bbcae444a99816b8f2613452b"}	thumper	2020-12-21 16:12:06.749989+00	2021-02-05 23:20:46.194372+00	E10+
170	Family Feud	{"en": "Family Feud"}	The video game series based on the game show Family Feud began with ShareData's 1987 release on the Apple II and Commodore 64 consoles.  In 1990 GameTek released a version on the NES. GameTek later released four more Feud games for the Super Nintendo, Sega Genesis, 3DO, and PC between 1993 and 1995.  Hasbro Interactive, Global Star, and Ubisoft have also released versions starting in 2000.	{"en": "The video game series based on the game show Family Feud began with ShareData's 1987 release on the Apple II and Commodore 64 consoles.  In 1990 GameTek released a version on the NES. GameTek later released four more Feud games for the Super Nintendo, Sega Genesis, 3DO, and PC between 1993 and 1995.  Hasbro Interactive, Global Star, and Ubisoft have also released versions starting in 2000."}	["https://upload.wikimedia.org/wikipedia/en/a/a2/FamilyFeud2010Logo.png"]	{"stadia": "https://stadia.google.com/store/details/5ba98de70c8c4b64bf56ca9009d60e62rcp1/sku/3af579475c334c62985ac80b3dfed0bap"}	family-feud	2020-12-20 04:21:09.137754+00	2021-02-05 23:20:46.672493+00	E
176	Just Dance 2021	{"en": "Just Dance 2021"}	Just Dance 2021 is a dance rhythm game developed by Ubisoft. It was unveiled on August 26, 2020 during the  Nintendo Direct Mini: Partner Showcase web presentation as the twelfth main installment of the series,[1] and was released on November 12, 2020, for Nintendo Switch, PlayStation 4, Xbox One, and Stadia, and on November 24, 2020, for PlayStation 5 and Xbox Series X/S.[2][3][4] It is the first game in the series since the initial title not to be announced at E3 due to time constraints brought by the COVID-19 pandemic. It is also the first game in the main series not to be released for the Wii.[5]	{"en": "Just Dance 2021 is a dance rhythm game developed by Ubisoft. It was unveiled on August 26, 2020 during the  Nintendo Direct Mini: Partner Showcase web presentation as the twelfth main installment of the series,[1] and was released on November 12, 2020, for Nintendo Switch, PlayStation 4, Xbox One, and Stadia, and on November 24, 2020, for PlayStation 5 and Xbox Series X/S.[2][3][4] It is the first game in the series since the initial title not to be announced at E3 due to time constraints brought by the COVID-19 pandemic. It is also the first game in the main series not to be released for the Wii.[5]"}	["https://upload.wikimedia.org/wikipedia/en/a/af/Just_Dance_2021.jpg"]	{"stadia": "https://stadia.google.com/store/details/b87ca389d6454546af28dff82898406arcp1/sku/691ff561f94e4fe79a219434f4186862"}	just-dance-2021	2020-12-20 04:21:10.106918+00	2021-02-05 23:20:47.613481+00	E
147	Celeste	{"en": "Celeste"}	Celeste is a 2018 platforming video game designed, directed and written by Maddy Thorson[note 1] and programmed by Thorson and Noel Berry. It is a fully-fleshed version of the 2016 game of the same name,[note 2] which was made in four days solely by Thorson and Berry during a game jam. Set on a fictional version of Mount Celeste, it follows a young woman named Madeline who attempts to climb the mountain, and must face her inner demons in her quest to reach the summit.	{"en": "Celeste is a 2018 platforming video game designed, directed and written by Maddy Thorson[note 1] and programmed by Thorson and Noel Berry. It is a fully-fleshed version of the 2016 game of the same name,[note 2] which was made in four days solely by Thorson and Berry during a game jam. Set on a fictional version of Mount Celeste, it follows a young woman named Madeline who attempts to climb the mountain, and must face her inner demons in her quest to reach the summit."}	["https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Celeste_box_art_final.png/1200px-Celeste_box_art_final.png"]	{"stadia": "https://stadia.google.com/store/details/c911998e4f8d4c6ea6712c5ad33e4a54rcp1/sku/68fb07a7c4ac41f1afb21d742c717538"}	celeste	2020-12-20 04:10:34.594827+00	2021-02-05 23:20:46.275876+00	E10+
353	Hello Neighbor: Hide and Seek	{"en": "Hello Neighbor: Hide and Seek"}	\N	{}	[]	{"stadia": "https://stadia.google.com/store/details/cf784a0f4c554ce68a2880cb461bd903rcp1/sku/ad2362e56c57469cafad1ed5799e8997p"}	hello-neighbor-hide-and-seek	2021-02-05 16:52:24.861431+00	2021-02-05 23:20:46.025812+00	T
158	Doom	{"en": "Doom"}	Doom is a first-person shooter video game developed by id Software and published by Bethesda Softworks. It was released worldwide on Windows, PlayStation 4, and Xbox One in May 2016 and is powered by id Tech 6. A port for Nintendo Switch was co-developed with Panic Button and released in November 2017, and a version for Stadia was released in August 2020. A soft reboot of the Doom franchise, it acts as a sequel to Doom 64 released in 1997, while largely  ignoring the previous installment Doom 3 which was a reboot of the original series and was released in 2004. Doom is the first major installment in the series since Doom 3.	{"en": "Doom is a first-person shooter video game developed by id Software and published by Bethesda Softworks. It was released worldwide on Windows, PlayStation 4, and Xbox One in May 2016 and is powered by id Tech 6. A port for Nintendo Switch was co-developed with Panic Button and released in November 2017, and a version for Stadia was released in August 2020. A soft reboot of the Doom franchise, it acts as a sequel to Doom 64 released in 1997, while largely  ignoring the previous installment Doom 3 which was a reboot of the original series and was released in 2004. Doom is the first major installment in the series since Doom 3."}	["https://upload.wikimedia.org/wikipedia/en/2/28/Doom_Cover.jpg"]	{"stadia": "https://stadia.google.com/store/details/cc1a8e0e94d54f15a22149fed93bbd7arcp1/sku/3d2a4c3229bd44ea80647beacc9ed247"}	doom	2020-12-20 04:21:08.343534+00	2021-02-05 23:20:47.141427+00	M17+
236	Watch Dogs	{"en": "Watch Dogs"}	Watch Dogs (stylized as WATCH_DOGS) is a 2014 action-adventure game developed by Ubisoft Montreal and published by Ubisoft. It is the first installment in the Watch Dogs series.  The game is played from a third-person perspective, and its world is navigated on foot or by vehicle. Set within a fictionalized version of the Chicagoland area in 2013, the single-player story follows hacker and vigilante Aiden Pearce's quest for revenge after the killing of his niece. An online multiplayer mode allows up to eight players to engage in cooperative and competitive gameplay.	{"en": "Watch Dogs (stylized as WATCH_DOGS) is a 2014 action-adventure game developed by Ubisoft Montreal and published by Ubisoft. It is the first installment in the Watch Dogs series.  The game is played from a third-person perspective, and its world is navigated on foot or by vehicle. Set within a fictionalized version of the Chicagoland area in 2013, the single-player story follows hacker and vigilante Aiden Pearce's quest for revenge after the killing of his niece. An online multiplayer mode allows up to eight players to engage in cooperative and competitive gameplay."}	["https://upload.wikimedia.org/wikipedia/en/d/d9/Watch_Dogs_box_art.jpg"]	{"stadia": "https://stadia.google.com/store/details/b7503867ccbc4ac7be7093fe3ba1523crcp1/sku/426d9b3d67b84b359c71606ef2672cbdp"}	watch-dogs	2020-12-21 16:12:07.787084+00	2021-02-05 23:20:48.211796+00	M17+
161	F1 2020	{"en": "F1 2020"}	F1 2020 is the official video game of the 2020 Formula 1 and Formula 2 Championships developed and published by Codemasters. It is the thirteenth title in the Formula 1 series developed by the studio and was released on 7 July 2020 for pre-orders of the Michael Schumacher Edition and 10 July 2020 for the Seventy Edition on Microsoft Windows, PlayStation 4, Xbox One and, for the first time, Stadia.[1] The game is the twelfth installment in the franchise, and it features the twenty-two circuits, twenty drivers and ten teams proposed in the provisional 2020 Formula 1 World Championship.	{"en": "F1 2020 is the official video game of the 2020 Formula 1 and Formula 2 Championships developed and published by Codemasters. It is the thirteenth title in the Formula 1 series developed by the studio and was released on 7 July 2020 for pre-orders of the Michael Schumacher Edition and 10 July 2020 for the Seventy Edition on Microsoft Windows, PlayStation 4, Xbox One and, for the first time, Stadia.[1] The game is the twelfth installment in the franchise, and it features the twenty-two circuits, twenty drivers and ten teams proposed in the provisional 2020 Formula 1 World Championship."}	["https://upload.wikimedia.org/wikipedia/en/8/84/F1_2020_Cover.jpg"]	{"stadia": "https://stadia.google.com/store/details/f3519f3dc3d74fbb8086520577b832e0rcp1/sku/60da786be741463fbbeb63ed5130bc11"}	f1-2020	2020-12-20 04:21:08.634236+00	2021-02-05 23:20:46.57138+00	E
148	Assassin's Creed Syndicate	{"en": "Assassin's Creed Syndicate"}	Assassin's Creed Syndicate is an action-adventure video game developed by Ubisoft Quebec and published by Ubisoft. It was released on October 23, 2015, for PlayStation 4 and Xbox One, and on November 19, 2015, for Microsoft Windows. It is the ninth major installment in the Assassin's Creed series, and the successor to 2014's Assassin's Creed Unity.	{"en": "Assassin's Creed Syndicate is an action-adventure video game developed by Ubisoft Quebec and published by Ubisoft. It was released on October 23, 2015, for PlayStation 4 and Xbox One, and on November 19, 2015, for Microsoft Windows. It is the ninth major installment in the Assassin's Creed series, and the successor to 2014's Assassin's Creed Unity."}	["https://upload.wikimedia.org/wikipedia/en/0/03/ACSyndicate.jpg"]	{"stadia": "https://stadia.google.com/store/details/88a2945345f744519c5148ddd54f26d1rcp1/sku/8aa42ef528804d0ba75608240a6c0289p"}	assassins-creed-syndicate	2020-12-20 04:10:34.598694+00	2021-02-05 23:20:47.087056+00	M17+
232	Valkyria Chronicles 4	{"en": "Valkyria Chronicles 4"}	Valkyria Chronicles 4[a] is a tactical role-playing game developed and published by Sega, with assistance from Media.Vision. It is the fourth main game in the Valkyria Chronicles series. It was released in Japan for the PlayStation 4 in March 2018, and worldwide, in addition for the Xbox One, Nintendo Switch, and Microsoft Windows, in September 2018.[1][2]It was also ported to Stadia on December 8, 2020.	{"en": "Valkyria Chronicles 4[a] is a tactical role-playing game developed and published by Sega, with assistance from Media.Vision. It is the fourth main game in the Valkyria Chronicles series. It was released in Japan for the PlayStation 4 in March 2018, and worldwide, in addition for the Xbox One, Nintendo Switch, and Microsoft Windows, in September 2018.[1][2]It was also ported to Stadia on December 8, 2020."}	["https://upload.wikimedia.org/wikipedia/en/6/69/Valkyria_Chronicles_4.png"]	{"stadia": "https://stadia.google.com/store/details/b00e2f20b91e43c8a0597b07fc80ca84rcp1/sku/bd0a6e3669c7410c8c3f86779cac1f44p"}	valkyria-chronicles-4	2020-12-21 16:12:07.575556+00	2021-02-05 23:20:49.339333+00	T
169	HITMAN	{"en": "HITMAN"}	Hitman is a 2016 stealth video game that was developed by IO Interactive and was released episodically for Microsoft Windows, PlayStation 4 and Xbox One from March to October 2016. The game, which has six episodes, is the sixth mainline entry in the Hitman franchise and the first installment of the World of Assassination trilogy, taking place six years after the events of Hitman: Absolution (2012). It follows professional assassin Agent 47 as he goes on a worldwide adventure and solves a mysterious series of seemingly unconnected assassinations. Hitman features a number of large, open-ended sandboxes that Agent 47 can freely explore. The game presents the player with various assassination opportunities, many of which are unconventional. IO Interactive introduced a "live component" to the game with new content being regularly delivered in downloadable form.	{"en": "Hitman is a 2016 stealth video game that was developed by IO Interactive and was released episodically for Microsoft Windows, PlayStation 4 and Xbox One from March to October 2016. The game, which has six episodes, is the sixth mainline entry in the Hitman franchise and the first installment of the World of Assassination trilogy, taking place six years after the events of Hitman: Absolution (2012). It follows professional assassin Agent 47 as he goes on a worldwide adventure and solves a mysterious series of seemingly unconnected assassinations. Hitman features a number of large, open-ended sandboxes that Agent 47 can freely explore. The game presents the player with various assassination opportunities, many of which are unconventional. IO Interactive introduced a \\"live component\\" to the game with new content being regularly delivered in downloadable form."}	["https://upload.wikimedia.org/wikipedia/en/8/84/Hitman_2015.jpg"]	{"stadia": "https://stadia.google.com/store/details/990ec302c2cd4ba7817cedcf633ab20frcp1/sku/17d98b899531490ba355016919ffe6ff"}	hitman	2020-12-20 04:21:09.100823+00	2021-02-05 23:20:47.179166+00	M17+
178	Hotline Miami 2: Wrong Number	{"en": "Hotline Miami 2: Wrong Number"}	Hotline Miami 2: Wrong Number is a top-down shooter video game co-developed by Dennaton Games and Abstraction Games, and published by Devolver Digital. It takes place before and after the events of its predecessor, Hotline Miami, as it focuses on the backstory and aftermath of the previous protagonist, Jacket, slaying parts of the Russian mafia at the behest of anonymous voices leaving mysterious messages on his answering machine.[1]	{"en": "Hotline Miami 2: Wrong Number is a top-down shooter video game co-developed by Dennaton Games and Abstraction Games, and published by Devolver Digital. It takes place before and after the events of its predecessor, Hotline Miami, as it focuses on the backstory and aftermath of the previous protagonist, Jacket, slaying parts of the Russian mafia at the behest of anonymous voices leaving mysterious messages on his answering machine.[1]"}	["https://upload.wikimedia.org/wikipedia/en/a/af/Hotline_Miami_2_cover.png"]	{"stadia": "https://stadia.google.com/store/details/68add0d67fe3491f94cb439664b1ffc7rcp1/sku/bc01f7206e4f4f83a468ce33eea0c404"}	hotline-miami-2-wrong-number	2020-12-20 04:21:10.173029+00	2021-02-05 23:20:47.257491+00	M17+
44	Human: Fall Flat	{"en": "Human: Fall Flat"}	Human: Fall Flat is a platform-puzzle video game developed by Lithuanian studio No Brakes Games and published by Curve Digital. It was released for Microsoft Windows, Linux and MacOS in July 2016, with PlayStation 4 and Xbox One versions in May 2017 and a Nintendo Switch version in December 2017.[2] A mobile port developed by Codeglue and published by 505 Games was released on 26 June 2019 for iOS and Android.[3] A Stadia version was released on 1 October 2020.[4]	{"en": "Human: Fall Flat is a platform-puzzle video game developed by Lithuanian studio No Brakes Games and published by Curve Digital. It was released for Microsoft Windows, Linux and MacOS in July 2016, with PlayStation 4 and Xbox One versions in May 2017 and a Nintendo Switch version in December 2017.[2] A mobile port developed by Codeglue and published by 505 Games was released on 26 June 2019 for iOS and Android.[3] A Stadia version was released on 1 October 2020.[4]"}	["https://upload.wikimedia.org/wikipedia/en/0/0e/Human_Fall_Flat_logo.png"]	{"stadia": "https://stadia.google.com/store/details/16d98de80a3340ffa4129953ae4e3206rcp1/sku/6ec089b591ee47fab2fed726e466700ap"}	human-fall-flat	2020-12-17 19:51:06.579798+00	2021-02-05 23:20:47.687684+00	E
179	Just Shapes & Beats	{"en": "Just Shapes & Beats"}	Just Shapes & Beats is an action rhythm video game developed and published by Canadian[1] indie team Berzerk Studio. It was released on May 31, 2018 for Microsoft Windows and Nintendo Switch, February 24, 2019 for macOS and Linux, May 10, 2019 for PlayStation 4 in the US, and May 30, 2019 for PlayStation 4 in Europe, Russia and Australia. It was also released on June 30, 2020 for Stadia. In this game, players move a colorful shape to the beat of background music and dodge pink shapes.	{"en": "Just Shapes & Beats is an action rhythm video game developed and published by Canadian[1] indie team Berzerk Studio. It was released on May 31, 2018 for Microsoft Windows and Nintendo Switch, February 24, 2019 for macOS and Linux, May 10, 2019 for PlayStation 4 in the US, and May 30, 2019 for PlayStation 4 in Europe, Russia and Australia. It was also released on June 30, 2020 for Stadia. In this game, players move a colorful shape to the beat of background music and dodge pink shapes."}	["https://upload.wikimedia.org/wikipedia/en/e/e3/Just_Shapes_%26_Beats.jpg"]	{"stadia": "https://stadia.google.com/store/details/6b43cecd79734ba28cef5894985c65f1rcp1/sku/a8918900bd834426ab8f5a55fba998c7"}	just-shapes-beats	2020-12-20 04:21:10.218688+00	2021-02-05 23:20:46.39538+00	E10+
14	Dead by Daylight	{"en": "Dead by Daylight"}	Dead by Daylight is an asymmetric survival horror video game developed by Behaviour Interactive.[1] Dead by Daylight was released for Microsoft Windows in June 2016,[2][3] released on PlayStation 4 and Xbox One in June 2017,[4][5][6] released on Nintendo Switch on September 24, 2019, and a mobile port was released on iOS and Android on April 17, 2020. The Stadia version was released in October 2020, with the PlayStation 5 and Xbox Series X/S versions set to release in late 2020.[7] The game is played as a one versus four online multiplayer where one player takes on the role of the savage killer, and the other four players play as survivors, trying to escape the killer and avoid being caught and sacrificed to a malevolent force known as the Entity.	{"en": "Dead by Daylight is an asymmetric survival horror video game developed by Behaviour Interactive.[1] Dead by Daylight was released for Microsoft Windows in June 2016,[2][3] released on PlayStation 4 and Xbox One in June 2017,[4][5][6] released on Nintendo Switch on September 24, 2019, and a mobile port was released on iOS and Android on April 17, 2020. The Stadia version was released in October 2020, with the PlayStation 5 and Xbox Series X/S versions set to release in late 2020.[7] The game is played as a one versus four online multiplayer where one player takes on the role of the savage killer, and the other four players play as survivors, trying to escape the killer and avoid being caught and sacrificed to a malevolent force known as the Entity."}	["https://upload.wikimedia.org/wikipedia/en/b/b7/Dead_by_Daylight_Steam_header.jpg"]	{"stadia": "https://stadia.google.com/store/details/b67e43f2b05f4ba7acc56a4b222568aarcp1/sku/5af3426b8434401897bb4eeac0344662"}	dead-by-daylight	2020-12-17 19:51:04.56175+00	2021-02-05 23:20:47.105377+00	M17+
206	PLAYERUNKNOWN'S BATTLEGROUNDS	{"en": "PLAYERUNKNOWN'S BATTLEGROUNDS"}	PlayerUnknown's Battlegrounds (PUBG) is an online multiplayer battle royale game developed and published by PUBG Corporation, a subsidiary of South Korean video game company Bluehole. The game is based on previous mods that were created by Brendan "PlayerUnknown" Greene for other games, inspired by the 2000 Japanese film Battle Royale, and expanded into a standalone game under Greene's creative direction. In the game, up to one hundred players parachute onto an island and scavenge for weapons and equipment to kill others while avoiding getting killed themselves. The available safe area of the game's map decreases in size over time, directing surviving players into tighter areas to force encounters. The last player or team standing wins the round.	{"en": "PlayerUnknown's Battlegrounds (PUBG) is an online multiplayer battle royale game developed and published by PUBG Corporation, a subsidiary of South Korean video game company Bluehole. The game is based on previous mods that were created by Brendan \\"PlayerUnknown\\" Greene for other games, inspired by the 2000 Japanese film Battle Royale, and expanded into a standalone game under Greene's creative direction. In the game, up to one hundred players parachute onto an island and scavenge for weapons and equipment to kill others while avoiding getting killed themselves. The available safe area of the game's map decreases in size over time, directing surviving players into tighter areas to force encounters. The last player or team standing wins the round."}	["https://upload.wikimedia.org/wikipedia/en/3/3d/PlayerUnknown%27s_Battlegrounds_Steam_Logo.jpg"]	{"stadia": "https://stadia.google.com/store/details/a4c5eb3f4e614b7fadbba64cba68f849rcp1/sku/71e7c4fc5ca24f0f8301da6d042bf18e"}	playerunknowns-battlegrounds	2020-12-21 16:12:04.115504+00	2021-02-05 23:20:49.136098+00	T
151	Assassin's Creed Unity	{"en": "Assassin's Creed Unity"}	Assassin's Creed Unity is an action-adventure video game developed by Ubisoft Montreal and published by Ubisoft. It was released in November 2014 for Microsoft Windows, PlayStation 4 and Xbox One. The game was released for Google Stadia in December 2020.[1] It is the eighth major installment in the Assassin's Creed series, and the successor to 2013's Assassin's Creed IV: Black Flag. It also has ties to Assassin's Creed Rogue which was released for the previous generation consoles, the PlayStation 3 and Xbox 360 on the same date.	{"en": "Assassin's Creed Unity is an action-adventure video game developed by Ubisoft Montreal and published by Ubisoft. It was released in November 2014 for Microsoft Windows, PlayStation 4 and Xbox One. The game was released for Google Stadia in December 2020.[1] It is the eighth major installment in the Assassin's Creed series, and the successor to 2013's Assassin's Creed IV: Black Flag. It also has ties to Assassin's Creed Rogue which was released for the previous generation consoles, the PlayStation 3 and Xbox 360 on the same date."}	["https://upload.wikimedia.org/wikipedia/en/a/ac/Acunity.jpg"]	{"stadia": "https://stadia.google.com/store/details/92f77c19718444499ffb3054dd97ca36rcp1/sku/41225d1572f64d53948ce77fb498a4e4p"}	assassins-creed-unity	2020-12-20 04:10:34.634718+00	2021-02-05 23:20:47.074723+00	M17+
\.


--
-- Data for Name: games_developers; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games_developers (id, game_id, developer_id) FROM stdin;
1	1	2
2	2	3
3	3	4
4	4	5
5	5	6
6	6	7
7	7	8
8	8	9
9	8	10
10	9	11
11	11	12
12	10	13
13	12	14
14	16	15
15	17	7
16	18	16
17	20	17
18	15	18
19	25	19
20	19	20
21	19	21
22	13	22
23	21	23
24	21	24
25	28	25
26	22	27
27	21	26
28	14	28
29	35	29
30	23	31
31	31	30
32	33	32
33	24	33
34	42	35
35	43	34
36	47	36
37	29	37
38	48	38
39	48	39
40	40	41
41	27	40
42	40	42
43	50	45
44	39	46
45	52	48
46	34	47
47	58	18
48	34	50
49	26	49
50	38	52
51	30	53
52	45	55
53	44	57
54	57	59
55	54	11
56	61	61
57	55	62
58	62	63
59	63	64
60	62	65
61	53	66
62	46	67
63	51	69
64	51	70
65	49	71
66	56	72
67	60	74
68	66	75
69	71	76
70	70	77
71	76	78
72	64	79
73	74	80
74	67	81
75	86	82
76	81	83
77	80	84
78	89	85
79	80	63
80	84	86
81	68	87
82	73	88
83	92	89
84	82	15
85	68	90
86	68	93
87	65	91
88	79	92
89	87	94
90	75	95
91	93	96
92	85	97
93	93	98
94	94	102
95	77	101
96	95	100
97	69	99
98	91	103
99	91	104
100	90	105
101	88	106
102	83	108
103	91	107
104	90	109
105	100	63
106	72	110
107	97	112
108	98	111
109	102	114
110	41	41
111	32	37
112	41	50
113	30	50
114	44	50
115	37	41
116	37	118
117	36	41
118	26	50
119	59	62
120	56	50
121	99	111
122	96	112
123	101	111
124	101	50
125	78	97
126	104	119
127	103	120
128	105	121
129	108	122
130	106	52
131	107	123
132	109	124
133	107	50
134	119	125
135	113	95
136	118	126
137	122	127
138	116	128
139	125	129
140	123	131
141	110	130
142	114	132
143	117	133
144	126	135
145	131	134
146	126	136
147	120	137
148	132	138
149	121	139
150	120	140
151	134	142
152	138	141
153	120	144
154	136	143
155	120	145
156	130	146
157	137	108
158	112	147
159	111	148
160	127	95
161	139	108
162	111	50
163	129	9
164	135	149
165	124	150
166	124	50
167	133	151
168	140	38
169	128	55
170	141	152
171	142	153
172	142	154
173	143	155
174	144	156
175	144	50
176	146	157
177	150	158
178	145	160
179	145	50
180	147	162
181	152	164
182	152	165
183	152	166
184	148	156
185	149	160
186	156	167
187	151	160
188	151	50
189	154	168
190	154	50
191	165	170
192	157	169
193	160	171
194	170	172
195	170	173
196	170	174
197	170	175
198	170	176
199	170	177
200	153	178
201	153	50
202	161	124
203	170	179
204	166	180
205	163	181
206	170	182
207	166	183
208	170	184
209	170	185
210	171	27
211	170	186
212	170	187
213	155	188
214	170	189
215	164	160
216	170	190
217	168	192
218	170	191
219	174	19
220	179	193
221	178	194
222	178	195
223	180	77
224	177	196
225	175	156
226	162	160
227	162	197
228	176	198
229	167	200
230	167	50
231	159	97
232	159	50
233	182	205
234	173	194
235	169	192
236	172	192
237	158	188
238	158	50
239	181	198
240	184	206
241	186	207
242	184	50
243	181	208
244	181	209
245	181	210
246	183	211
247	194	212
249	201	215
250	192	216
251	199	217
252	196	218
253	198	219
254	203	220
255	207	222
256	188	223
257	188	50
258	189	71
259	205	225
260	205	226
261	195	227
263	187	71
264	195	230
265	210	228
267	211	232
268	204	233
269	204	188
270	208	234
271	197	150
272	197	50
273	190	235
274	213	160
275	213	236
276	218	92
277	220	237
278	220	50
279	221	77
280	214	238
281	226	239
282	223	99
283	229	242
284	216	243
285	219	245
286	212	206
287	219	50
288	215	92
289	215	50
290	217	246
291	209	247
292	227	250
293	237	248
294	228	249
295	228	50
297	227	252
298	227	253
299	237	254
300	237	236
303	72	50
304	232	257
305	239	258
306	230	198
307	242	38
308	232	259
309	230	50
310	233	260
311	233	262
312	231	261
313	231	50
314	243	99
315	235	198
316	235	263
318	235	50
319	202	265
320	241	266
321	241	267
322	240	181
323	236	160
324	206	268
325	236	50
326	240	50
327	206	50
328	238	160
329	238	50
330	234	206
331	234	50
332	244	269
333	246	270
334	245	271
335	248	272
336	249	273
337	247	274
338	250	271
339	251	271
340	252	81
341	253	275
342	254	276
343	259	277
344	225	239
345	260	88
346	263	278
347	263	50
348	255	279
349	257	83
350	255	50
351	258	280
352	258	282
353	261	283
354	256	284
355	256	285
356	267	286
357	264	287
358	222	239
359	270	283
360	276	288
361	271	289
362	274	290
363	272	277
364	266	291
366	273	271
367	268	282
368	277	277
369	268	50
370	275	293
371	275	257
372	275	107
373	275	294
375	265	296
376	269	250
377	72	297
378	336	282
379	42	298
380	327	299
381	209	300
382	291	301
383	339	302
384	197	303
385	344	304
386	351	305
387	214	306
388	167	307
389	326	308
390	286	309
391	333	311
392	297	312
393	334	313
394	283	314
395	199	315
396	241	316
397	342	250
398	325	317
399	295	318
400	279	319
401	331	320
402	350	321
403	298	322
404	317	323
405	349	157
406	330	324
407	329	325
408	324	326
409	150	327
410	312	328
411	278	154
412	352	329
413	192	330
414	343	331
415	186	332
416	142	334
417	211	335
418	144	189
419	149	189
420	145	189
421	228	189
422	151	189
423	162	189
424	304	189
425	337	189
426	164	189
427	148	189
428	289	189
429	176	189
430	233	189
431	175	189
432	237	189
433	181	189
434	236	189
435	238	189
436	240	189
437	352	338
438	353	339
439	39	339
440	346	340
441	316	341
442	239	342
443	182	341
444	288	343
445	302	345
446	338	345
447	173	346
448	178	346
449	306	343
450	292	97
451	14	350
452	179	351
453	208	352
454	319	353
455	299	354
456	203	355
457	294	356
458	280	357
459	161	27
460	318	77
461	341	77
462	243	358
463	223	358
464	69	358
465	303	71
466	335	71
467	196	359
468	183	361
469	191	361
470	200	359
471	285	361
\.


--
-- Data for Name: games_genres; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games_genres (id, game_id, genre_id) FROM stdin;
1	1	1
2	2	2
3	2	3
4	2	4
5	3	5
6	3	6
7	4	2
8	4	7
9	5	2
10	6	8
11	7	9
12	7	10
13	8	11
14	8	12
15	9	10
16	11	4
17	10	13
18	12	14
19	12	15
20	16	16
21	17	17
22	17	8
23	18	1
24	18	19
25	13	22
26	28	8
27	28	15
28	14	4
29	22	23
30	35	25
31	35	26
32	33	2
33	31	22
34	33	22
35	23	1
36	31	27
37	23	4
38	43	14
39	42	10
40	43	28
41	42	22
42	43	29
43	43	15
44	43	30
45	29	31
46	47	22
47	27	14
48	39	3
49	58	1
50	39	4
51	38	2
52	50	32
53	38	17
54	34	34
55	50	35
56	52	16
57	45	36
58	57	15
59	57	10
60	54	37
61	61	10
62	61	7
63	55	38
64	61	4
65	62	14
66	55	22
67	61	8
68	46	1
69	46	17
70	49	40
71	49	4
72	66	19
73	60	2
74	60	7
75	70	41
76	71	15
77	76	2
78	70	42
79	64	19
80	74	43
81	76	15
82	64	44
83	81	1
84	86	14
85	89	40
86	80	46
87	73	14
88	80	8
89	89	47
90	73	48
91	92	10
92	92	15
93	87	14
94	79	15
95	65	2
96	68	11
97	65	7
98	75	1
99	93	8
100	85	8
101	94	19
102	85	50
103	95	51
104	94	52
105	77	7
106	69	53
107	88	15
108	69	3
109	91	54
110	83	37
111	88	3
112	83	55
113	100	56
114	72	57
115	100	46
116	90	14
117	98	2
118	97	8
119	102	2
120	102	4
121	20	15
122	19	19
123	25	19
124	19	22
125	15	1
126	15	28
127	25	58
128	15	29
129	21	16
130	21	15
131	24	7
132	41	40
133	32	31
134	44	16
135	44	59
136	30	23
137	44	15
138	26	1
139	58	31
140	63	36
141	51	52
142	67	40
143	59	38
144	59	22
145	56	1
146	56	17
147	82	46
148	96	8
149	99	2
150	101	2
151	78	1
152	40	60
153	36	40
154	37	61
155	104	62
156	103	7
157	105	1
158	108	63
159	108	64
160	106	65
161	108	66
162	109	23
163	107	2
164	113	7
165	115	10
166	119	15
167	119	34
168	118	10
169	116	1
170	116	27
171	125	10
172	125	15
173	123	1
174	114	2
175	123	14
176	114	22
177	117	34
178	117	16
179	126	2
180	126	16
181	131	11
182	132	34
183	121	10
184	134	10
185	132	16
186	138	15
187	136	34
188	130	7
189	137	37
190	120	36
191	112	61
192	127	8
193	137	55
194	139	37
195	129	2
196	135	10
197	133	67
198	124	36
199	140	31
200	133	5
201	133	68
202	128	4
203	141	69
204	141	19
205	111	31
206	142	2
207	143	34
208	143	17
209	144	2
210	144	29
211	146	8
212	150	1
213	150	40
214	147	16
215	152	40
216	145	1
217	149	2
218	148	2
219	148	3
220	156	70
221	156	19
222	151	2
223	154	2
224	151	3
225	165	71
226	160	23
227	157	36
228	157	8
229	153	40
230	161	23
231	166	26
232	163	40
233	171	23
234	155	40
235	174	5
236	179	34
237	168	3
238	178	72
239	180	2
240	177	6
241	175	2
242	176	73
243	167	1
244	159	1
245	159	74
246	182	40
247	144	1
248	164	2
249	173	72
250	164	40
251	169	3
252	172	3
253	162	40
254	158	40
255	186	26
256	184	2
257	181	73
258	191	46
259	194	23
260	191	75
261	183	76
262	183	4
263	199	8
264	192	16
265	198	31
266	201	58
267	201	34
268	198	8
269	196	26
270	188	2
271	207	46
272	207	32
273	189	40
274	189	4
275	187	40
276	210	26
277	187	4
278	195	8
279	205	77
280	211	19
281	211	31
282	208	2
283	204	40
284	197	36
285	208	3
286	213	11
287	218	40
288	220	16
289	220	2
290	221	19
291	221	22
292	214	36
293	223	31
294	229	78
295	226	27
296	216	2
297	226	2
298	226	22
299	219	2
300	212	2
301	215	40
302	217	2
303	228	23
304	209	2
305	227	34
306	239	8
307	227	79
308	237	80
309	242	26
310	230	53
311	232	35
312	233	23
313	231	1
314	231	31
315	231	53
316	243	53
317	243	4
318	241	40
319	206	82
320	240	2
321	234	2
322	244	2
323	246	26
324	250	37
325	251	83
326	252	40
327	253	15
328	259	22
329	254	84
330	225	27
331	260	1
332	257	1
333	255	77
334	225	2
335	255	73
336	263	8
337	258	10
338	225	22
339	258	15
340	225	28
341	261	16
342	256	16
343	267	16
344	264	22
345	270	16
346	276	23
347	222	32
348	222	2
349	271	10
350	271	15
351	274	85
352	273	83
353	266	10
354	274	86
355	274	10
356	266	87
357	266	14
358	268	15
359	272	16
360	272	22
361	272	88
362	265	31
363	275	16
364	265	2
365	269	89
366	179	90
367	229	90
368	191	136
369	243	144
370	242	144
371	181	136
372	142	136
373	329	155
374	324	90
375	176	90
376	17	144
377	351	144
378	350	136
379	334	144
380	298	136
381	350	267
382	44	267
383	149	268
384	331	267
385	147	267
386	292	268
387	331	136
388	170	136
389	333	267
390	150	268
391	279	136
392	349	268
393	44	136
394	232	268
395	72	268
396	301	268
397	207	268
398	167	268
399	192	268
400	237	136
401	195	268
402	199	268
403	239	268
404	17	268
405	229	144
406	352	144
407	214	144
408	239	267
409	326	267
410	330	144
411	286	268
412	173	267
413	278	267
414	334	267
415	283	267
416	319	267
417	177	267
418	156	267
419	237	75
420	177	75
421	285	36
422	242	36
423	306	23
424	339	23
425	288	23
426	322	15
427	324	15
428	297	15
429	299	15
430	279	15
431	161	26
432	165	26
433	334	26
434	312	26
435	200	26
436	203	26
437	333	25
438	170	25
439	342	25
440	330	25
441	298	25
442	333	14
443	161	14
444	338	14
445	186	14
446	165	14
447	329	14
448	203	14
449	288	14
450	306	14
451	70	14
452	351	43
453	350	43
454	294	43
455	170	43
456	327	43
457	179	43
458	176	43
459	181	43
460	344	268
461	327	144
462	312	144
463	343	144
464	298	144
465	223	144
466	165	46
467	177	46
468	338	46
469	201	46
470	222	46
471	232	46
472	283	46
473	151	10
474	144	10
475	142	10
476	148	10
477	192	10
478	145	10
479	281	10
480	211	10
481	344	10
482	154	10
483	153	10
484	351	10
485	278	10
486	279	10
487	17	10
488	223	10
489	331	10
490	326	10
491	299	10
492	280	10
493	239	10
494	240	10
495	336	10
496	324	10
497	145	34
498	144	34
499	319	10
500	142	34
501	70	10
502	292	34
503	149	34
504	69	10
505	351	34
506	225	10
507	341	10
508	346	10
509	152	34
510	155	34
511	71	10
512	173	34
513	294	34
514	304	34
515	148	34
516	39	10
517	353	34
518	39	34
519	325	34
520	42	34
521	14	34
522	335	34
523	17	34
524	151	34
525	141	34
526	153	34
527	285	34
528	208	34
529	156	34
530	289	34
531	223	34
532	189	34
533	184	34
534	169	34
535	178	34
536	317	34
537	341	34
538	342	34
539	318	10
540	185	10
541	44	10
542	291	10
543	183	10
544	184	10
545	317	10
546	209	10
547	343	10
548	175	10
549	297	10
550	208	10
551	216	10
552	307	10
553	217	10
554	344	34
555	308	10
556	158	34
557	299	34
558	157	34
559	175	34
560	185	34
561	168	34
562	280	34
563	281	34
564	336	34
565	206	34
566	308	34
567	211	34
568	197	34
569	192	34
570	303	34
571	154	34
572	301	34
573	337	34
574	295	34
575	150	51
576	226	34
577	153	51
578	178	267
579	303	51
580	290	51
581	236	34
582	69	51
583	206	51
584	241	34
585	217	34
586	218	34
587	204	34
588	225	34
589	243	34
590	312	34
591	346	34
592	343	34
593	307	34
594	327	10
595	209	34
596	309	34
597	214	34
598	201	267
599	147	34
600	141	267
601	309	10
602	182	34
603	238	10
604	164	51
605	316	51
606	337	51
\.


--
-- Data for Name: games_modes; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games_modes (id, game_id, mode_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	3	1
5	3	2
6	4	1
7	4	2
8	5	1
9	7	1
10	7	2
11	9	1
12	11	1
13	10	2
14	12	1
15	16	1
16	17	1
17	18	1
18	17	2
19	18	2
20	13	1
21	13	2
22	28	1
23	14	2
24	22	1
25	22	2
26	35	1
27	35	2
28	33	1
29	23	1
30	31	1
31	23	2
32	31	2
33	42	1
34	42	2
35	43	1
36	48	1
37	29	1
38	47	1
39	29	2
40	48	3
41	27	1
42	27	2
43	39	1
44	34	1
45	38	1
46	34	2
47	50	1
48	52	1
49	45	1
50	45	2
51	57	1
52	57	2
53	54	1
54	62	1
55	55	1
56	62	2
57	61	1
58	46	1
59	46	2
60	49	1
61	66	1
62	60	1
63	71	1
64	60	2
65	70	1
66	60	4
67	64	1
68	76	1
69	70	2
70	81	1
71	86	1
72	80	1
73	81	2
74	89	1
75	80	2
76	73	1
77	92	1
78	87	1
79	79	1
80	68	1
81	65	1
82	68	2
83	75	1
84	85	1
85	94	1
86	77	1
87	94	2
88	69	1
89	88	1
90	69	2
91	91	1
92	88	6
93	83	1
94	91	2
95	100	1
96	72	2
97	100	2
98	98	1
99	97	1
100	97	2
101	102	1
102	20	2
103	20	1
104	19	1
105	25	1
106	15	1
107	25	2
108	21	1
109	21	2
110	24	1
111	32	1
112	24	2
113	41	1
114	41	2
115	32	2
116	30	1
117	30	2
118	44	1
119	44	2
120	26	2
121	58	1
122	58	2
123	63	1
124	63	7
125	51	1
126	51	2
127	67	1
128	59	1
129	67	2
130	56	1
131	82	1
132	96	1
133	99	1
134	101	1
135	101	2
136	78	1
137	40	1
138	40	2
139	36	1
140	36	2
141	37	1
142	37	2
143	104	1
144	103	2
145	105	1
146	106	2
147	108	1
148	109	1
149	107	1
150	109	2
151	107	2
152	113	1
153	113	2
154	115	1
155	119	1
156	119	2
157	118	1
158	116	1
159	125	1
160	123	1
161	114	1
162	117	1
163	126	1
164	131	1
165	121	1
166	132	1
167	131	2
168	134	1
169	138	1
170	136	2
171	130	1
172	130	2
173	127	1
174	112	1
175	137	1
176	139	1
177	112	2
178	129	2
179	135	1
180	124	1
181	140	1
182	124	2
183	140	2
184	133	1
185	133	2
186	128	1
187	141	1
188	141	2
189	111	1
190	111	2
191	142	1
192	143	1
193	143	2
194	144	1
195	146	1
196	146	2
197	150	1
198	150	2
199	147	1
200	152	1
201	149	1
202	145	1
203	148	1
204	154	1
205	165	1
206	160	1
207	151	1
208	160	2
209	165	19
210	151	2
211	157	1
212	157	2
213	153	2
214	161	1
215	161	20
216	161	2
217	166	1
218	163	1
219	171	1
220	166	2
221	163	2
222	171	2
223	155	1
224	155	2
225	179	1
226	174	1
227	179	2
228	174	2
229	168	1
230	178	1
231	177	1
232	180	1
233	175	1
234	176	1
235	176	2
236	167	1
237	167	2
238	159	1
239	182	1
240	173	1
241	164	1
242	169	1
243	164	2
244	172	1
245	162	1
246	172	2
247	158	1
248	162	2
249	158	2
250	186	1
251	184	1
252	184	2
253	186	2
254	181	1
255	194	1
256	181	2
257	183	1
258	199	1
259	199	2
260	201	1
261	196	1
262	201	2
263	198	1
264	196	2
265	198	2
266	188	1
267	207	1
268	189	1
269	210	2
270	187	1
271	195	1
272	205	1
273	211	1
274	204	1
275	197	1
276	211	2
277	197	2
278	208	1
279	213	1
280	218	1
281	213	2
282	218	2
283	220	1
284	220	2
285	221	1
286	214	1
287	214	2
288	223	1
289	223	2
290	229	1
291	216	1
292	226	1
293	219	1
294	212	1
295	217	1
296	209	1
297	228	1
298	228	2
299	209	2
300	239	1
301	227	1
302	237	1
303	227	2
304	237	2
305	242	1
306	242	2
307	230	2
308	232	1
309	233	1
310	233	2
311	231	2
312	243	1
313	243	2
314	241	1
315	241	2
316	206	2
317	240	1
318	240	2
319	234	1
320	234	2
321	246	1
322	246	2
323	246	26
324	250	1
325	251	1
326	252	1
327	253	1
328	253	2
329	259	1
330	254	1
331	260	1
332	257	1
333	260	2
334	263	1
335	255	1
336	258	1
337	225	1
338	261	1
339	261	2
340	256	1
341	256	2
342	267	1
343	264	1
344	270	1
345	276	1
346	276	2
347	222	1
348	271	1
349	273	1
350	274	1
351	266	1
352	268	1
353	272	1
354	275	1
355	265	1
356	269	1
357	269	2
358	176	27
359	199	27
360	17	27
361	70	27
362	179	27
363	242	27
364	44	27
365	181	27
366	196	27
367	63	34
368	242	34
369	14	34
370	294	27
371	186	27
372	342	39
373	63	40
374	319	27
375	325	39
376	327	42
377	170	27
378	179	42
379	233	39
380	158	39
381	191	40
382	153	42
383	289	34
384	333	34
385	181	34
386	206	34
387	350	34
388	329	34
389	72	34
390	176	34
391	298	27
392	237	27
393	285	27
394	334	27
395	341	27
396	302	27
397	157	40
398	44	40
399	17	40
400	339	40
401	161	40
402	199	40
403	197	40
404	214	40
405	298	40
406	237	40
407	294	40
408	350	40
409	196	40
410	281	39
411	197	39
412	298	39
413	155	39
414	150	39
415	184	39
416	334	39
417	63	39
418	294	39
419	285	39
420	161	39
421	352	39
422	237	39
423	186	39
424	14	39
425	191	39
426	304	39
427	337	39
428	170	39
429	228	39
430	327	39
431	281	42
432	241	42
433	155	42
434	184	42
435	191	42
436	330	39
437	186	42
438	176	39
439	306	39
440	206	39
441	312	39
442	350	39
443	181	39
444	157	39
445	72	39
446	288	39
447	351	39
448	63	42
449	176	42
450	333	42
451	181	42
452	242	42
453	179	40
454	214	42
455	186	40
456	237	42
457	334	40
458	289	39
459	196	39
460	153	39
461	242	39
462	199	42
463	334	42
464	176	40
465	242	40
466	350	42
467	162	39
468	165	40
469	181	40
470	285	40
471	233	40
472	302	40
473	161	42
474	171	42
475	157	42
476	337	42
477	44	42
478	288	42
479	304	42
480	165	42
481	306	42
482	329	42
483	150	42
484	72	42
485	325	42
486	302	42
487	289	42
488	290	42
489	69	42
490	285	42
491	312	42
492	206	42
493	352	42
494	197	42
495	14	42
496	309	42
497	243	42
498	209	42
499	317	42
500	211	42
501	351	42
502	294	42
503	185	42
504	330	42
505	342	42
506	228	42
507	196	42
508	170	42
509	158	42
510	233	42
511	167	42
512	17	42
513	349	42
514	162	3
515	319	3
516	203	39
517	17	3
518	333	3
519	281	3
520	164	3
521	294	3
522	185	3
523	184	3
524	42	3
525	228	3
526	201	3
527	289	3
528	199	3
529	312	3
530	223	3
531	290	3
532	72	3
533	351	3
534	186	3
535	308	3
536	304	3
537	197	3
538	337	3
539	211	3
540	153	3
541	200	3
542	237	3
543	167	3
544	141	40
545	200	27
546	150	3
547	307	3
548	203	40
549	179	3
550	200	40
551	157	3
552	285	3
553	218	3
554	69	3
555	196	3
556	44	3
557	325	3
558	151	3
559	241	3
560	242	3
561	200	39
562	327	3
563	302	3
564	203	42
565	200	42
566	292	1
567	170	1
568	286	1
569	192	1
570	200	1
571	325	1
572	338	1
573	283	1
574	349	1
575	203	1
576	350	1
577	301	1
578	334	1
579	341	1
580	335	1
581	279	1
582	72	1
583	316	1
584	326	1
585	295	1
586	352	1
587	309	1
588	297	1
589	312	1
590	236	1
591	238	1
592	220	40
593	291	1
594	302	1
595	17	20
596	298	20
597	199	20
598	290	20
599	339	1
600	44	20
601	346	1
602	322	1
603	306	1
604	220	42
605	312	20
606	298	1
607	344	1
608	331	1
609	288	1
610	290	1
611	185	1
612	191	1
613	333	1
614	278	1
615	336	1
616	353	1
617	318	1
618	337	1
619	153	1
620	308	1
621	299	1
622	281	1
623	307	1
624	285	1
625	294	1
626	304	1
627	329	1
628	303	1
629	343	1
630	280	1
631	324	1
632	156	1
633	319	1
\.


--
-- Data for Name: games_platforms; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games_platforms (id, game_id, platform_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
10	11	1
11	10	1
12	12	1
13	16	1
14	17	1
15	20	1
16	18	1
17	19	1
18	25	1
19	13	1
20	28	1
21	14	1
22	22	1
23	21	1
24	35	1
25	33	1
26	31	1
27	23	1
28	43	1
29	42	1
30	29	1
31	48	1
32	47	1
33	27	1
34	39	1
35	58	1
36	50	1
37	38	1
38	34	1
39	52	1
40	45	1
41	57	1
42	54	1
43	61	1
44	55	1
45	62	1
46	63	1
47	46	1
48	49	1
49	66	1
50	60	1
51	71	1
52	70	1
53	76	1
54	74	1
55	64	1
56	67	1
57	86	1
58	81	1
59	80	1
60	89	1
61	73	1
62	92	1
63	82	1
64	87	1
65	65	1
66	79	1
67	68	1
68	75	1
69	93	1
70	85	1
71	77	1
72	94	1
73	95	1
74	69	1
75	88	1
76	91	1
77	83	1
78	100	1
79	72	1
80	90	1
81	98	1
82	97	1
83	102	1
84	15	1
85	24	1
86	41	1
87	32	1
88	30	1
89	44	1
90	26	1
91	51	1
92	59	1
93	56	1
94	99	1
95	96	1
96	101	1
97	78	1
98	40	1
99	36	1
100	37	1
101	104	1
102	103	1
103	105	1
104	108	1
105	106	1
106	107	1
107	109	1
108	113	1
109	115	1
110	119	1
111	118	1
112	116	1
113	125	1
114	123	1
115	114	1
116	117	1
117	126	1
118	131	1
119	132	1
120	134	1
121	121	1
122	138	1
123	136	1
124	130	1
125	137	1
126	120	1
127	112	1
128	127	1
129	139	1
130	129	1
131	135	1
132	133	1
133	124	1
134	140	1
135	128	1
136	141	1
137	111	1
138	142	3
139	143	3
140	144	3
141	146	3
142	4	3
143	150	3
144	147	3
145	152	3
146	145	3
147	149	3
148	148	3
149	156	3
150	17	3
151	14	3
152	151	3
153	154	3
154	165	3
155	157	3
156	160	3
157	27	3
158	39	3
159	161	3
160	153	3
161	166	3
162	163	3
163	171	3
164	155	3
165	174	3
166	179	3
167	168	3
168	178	3
169	180	3
170	177	3
171	175	3
172	44	3
173	170	3
174	176	3
175	167	3
176	159	3
177	182	3
178	164	3
179	173	3
180	118	3
181	169	3
182	172	3
183	162	3
184	158	3
185	186	3
186	184	3
187	181	3
188	194	3
189	191	3
190	183	3
191	199	3
192	192	3
193	198	3
194	201	3
195	196	3
196	49	3
197	63	3
198	188	3
199	207	3
200	189	3
201	187	3
202	210	3
203	195	3
204	205	3
205	211	3
206	70	3
207	204	3
208	208	3
209	197	3
210	213	3
211	218	3
212	220	3
213	221	3
214	69	3
215	214	3
216	229	3
217	223	3
218	138	3
219	71	3
220	226	3
221	216	3
222	212	3
223	219	3
224	215	3
225	217	3
226	228	3
227	209	3
228	227	3
229	72	3
230	239	3
231	242	3
232	237	3
233	230	3
234	232	3
235	233	3
236	231	3
237	243	3
238	202	3
239	241	3
240	206	3
241	240	3
242	234	3
243	244	3
244	246	4
245	250	4
246	251	4
247	252	4
248	131	4
249	62	4
250	189	4
251	253	4
252	81	4
253	259	4
254	226	4
255	254	4
256	225	4
257	260	4
258	257	4
259	255	4
260	263	4
261	258	4
262	261	4
263	256	4
264	116	4
265	171	4
266	267	4
267	264	4
268	134	4
269	270	4
270	276	4
271	222	4
272	13	4
273	271	4
274	274	4
275	266	4
276	273	4
277	268	4
278	272	4
279	265	4
280	275	4
281	269	4
282	42	3
283	279	3
284	278	3
285	280	3
286	281	3
287	283	3
288	285	3
289	286	3
290	288	3
291	289	3
292	236	3
293	225	3
294	238	3
295	290	3
296	294	3
297	292	3
298	291	3
299	297	3
300	295	3
301	298	3
302	299	3
303	222	3
304	301	3
305	302	3
306	303	3
307	304	3
308	306	3
309	307	3
310	308	3
311	309	3
312	312	3
313	316	3
314	185	3
315	319	3
316	318	3
317	317	3
318	322	3
319	325	3
320	326	3
321	341	3
322	327	3
323	335	3
324	336	3
325	350	3
326	331	3
327	344	3
328	339	3
329	329	3
330	352	3
331	343	3
332	334	3
333	346	3
334	337	3
335	349	3
336	333	3
337	342	3
338	338	3
339	351	3
340	353	3
341	330	3
342	324	3
343	141	3
344	203	3
345	200	3
\.


--
-- Data for Name: games_publishers; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games_publishers (id, game_id, publisher_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	8	9
10	8	10
11	8	11
12	9	12
13	11	13
14	10	14
15	10	15
16	10	16
17	12	17
18	16	18
19	17	6
20	20	20
21	18	19
22	15	6
23	25	21
24	25	22
25	25	23
26	19	24
27	19	25
28	13	26
29	28	27
30	22	28
31	21	29
32	21	30
33	21	31
34	35	32
35	23	33
36	31	34
37	33	1
38	43	36
39	42	26
40	29	37
41	47	38
42	47	39
43	48	2
44	27	40
45	27	41
46	27	43
47	39	18
48	58	44
49	52	45
50	50	46
51	52	48
52	34	47
53	38	49
54	34	50
55	45	51
56	57	1
57	54	12
58	61	18
59	55	52
60	63	53
61	55	54
62	62	32
63	63	13
64	63	55
65	53	3
66	53	56
67	46	5
68	53	57
69	53	58
70	53	59
71	49	62
72	49	63
73	66	18
74	60	64
75	70	66
76	71	65
77	76	67
78	74	69
79	64	68
80	67	1
81	86	70
82	81	2
83	89	68
84	80	32
85	73	3
86	92	68
87	82	72
88	68	73
89	79	1
90	65	75
91	87	74
92	75	76
93	85	77
94	94	68
95	77	79
96	69	80
97	95	78
98	88	81
99	83	82
100	91	22
101	100	32
102	90	83
103	72	84
104	90	85
105	98	22
106	90	87
107	97	86
108	102	88
109	24	26
110	41	52
111	32	52
112	40	37
113	30	37
114	44	89
115	44	90
116	37	37
117	36	37
118	26	84
119	51	52
120	59	37
121	59	91
122	59	93
123	56	94
124	99	96
125	96	86
126	99	97
127	101	22
128	78	77
129	78	98
130	104	1
131	103	117
132	105	118
133	108	68
134	106	52
135	109	28
136	109	86
137	107	37
138	119	119
139	113	52
140	119	120
141	115	1
142	119	121
143	118	122
144	118	57
145	116	26
146	125	1
147	123	32
148	114	125
149	117	1
150	131	126
151	126	37
152	132	1
153	121	127
154	134	128
155	138	94
156	136	129
157	120	130
158	130	52
159	137	82
160	120	132
161	112	131
162	127	3
163	139	82
164	120	133
165	127	135
166	129	52
167	135	52
168	124	5
169	133	3
170	140	136
171	128	51
172	141	1
173	111	131
174	142	143
175	142	144
176	143	145
177	144	146
178	146	147
179	150	148
180	147	150
181	152	151
182	152	152
183	148	146
184	145	146
185	149	146
186	156	153
187	151	146
188	154	6
189	165	22
190	157	154
191	160	28
192	153	155
193	161	28
194	153	156
195	163	146
196	166	157
197	171	28
198	155	84
199	164	146
200	174	22
201	168	159
202	170	158
203	170	160
204	168	161
205	179	163
206	170	162
207	170	164
208	178	1
209	170	165
210	180	66
211	170	166
212	177	167
213	170	146
214	175	146
215	170	168
216	162	146
219	176	146
220	167	94
221	159	77
222	159	90
223	182	169
224	173	1
225	169	94
226	169	98
227	172	5
228	158	84
229	186	157
230	184	94
231	181	146
232	194	170
233	183	154
234	201	171
235	192	172
236	199	86
237	201	173
238	196	174
239	198	94
240	188	148
241	189	86
242	207	176
243	187	86
244	210	146
245	205	22
246	195	94
247	195	98
248	205	177
249	211	88
250	208	178
251	204	84
252	197	5
253	208	179
254	190	148
255	218	1
256	213	146
257	220	6
258	221	66
259	214	180
260	226	181
261	226	182
262	223	80
263	229	184
264	226	183
265	216	185
266	212	94
267	219	94
268	212	98
269	215	186
270	215	187
271	215	188
272	215	189
273	215	190
274	215	191
275	217	192
276	209	193
277	228	146
278	227	194
279	237	131
280	237	195
281	237	196
282	239	197
283	237	146
284	237	198
285	242	174
286	230	146
287	232	22
288	233	146
289	231	146
290	243	119
291	243	120
292	243	121
293	235	146
294	202	199
295	202	200
296	241	84
297	236	146
298	240	146
299	238	146
300	234	94
301	244	164
302	244	201
303	244	202
304	246	203
305	245	204
306	248	205
307	249	206
308	247	26
309	251	204
310	252	207
311	252	208
312	253	209
313	253	210
314	254	204
315	254	211
316	259	212
317	254	213
318	225	181
319	260	214
320	254	161
321	260	27
322	263	215
323	260	216
324	263	217
325	257	2
326	258	218
327	261	32
328	256	22
329	267	219
330	264	32
331	222	220
332	270	32
333	276	221
334	222	222
335	276	223
336	276	26
337	271	224
338	274	32
339	273	204
340	266	26
341	272	212
342	272	182
343	272	225
344	277	212
345	268	228
346	277	226
347	272	227
348	277	229
349	268	230
350	272	231
351	277	232
352	272	161
353	275	234
354	265	26
355	275	235
356	269	194
357	197	236
358	191	146
359	165	237
360	351	239
361	336	218
362	286	240
363	334	241
364	349	147
365	298	242
366	342	194
367	325	243
368	329	244
369	279	245
370	312	246
371	343	247
372	278	248
373	217	249
374	292	250
375	322	251
376	153	252
377	222	253
378	226	253
379	225	253
380	150	255
381	344	6
382	339	6
383	319	258
384	350	258
385	281	94
386	307	94
387	309	94
388	308	94
389	185	94
390	304	146
391	337	146
392	285	146
393	199	59
394	280	59
395	331	260
396	290	1
397	289	146
398	118	59
399	189	59
400	346	59
401	297	59
402	324	260
403	338	260
404	283	1
405	302	260
406	318	66
407	341	66
408	243	262
409	69	262
410	223	262
411	333	89
412	172	159
413	169	159
414	294	258
415	291	143
416	352	143
417	327	266
418	301	253
419	14	273
420	299	274
421	295	275
422	182	276
423	179	278
424	186	185
425	239	279
426	303	86
427	335	86
428	288	280
429	206	283
430	208	285
431	138	286
432	316	276
433	214	287
434	306	280
435	317	18
436	353	18
437	330	154
438	326	266
439	42	266
440	201	266
441	196	255
442	203	255
443	242	255
444	200	255
445	152	84
\.


--
-- Data for Name: games_series; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games_series (id, game_id, series_id) FROM stdin;
1	3	1
2	5	2
3	11	3
4	12	4
5	12	5
6	17	6
7	22	8
8	23	10
9	31	9
10	29	11
11	47	12
12	45	13
13	61	14
14	63	15
15	49	16
16	67	17
17	68	18
18	65	19
19	85	20
20	69	21
21	83	22
22	100	23
23	72	24
24	98	25
25	97	26
26	15	6
27	24	27
28	41	28
29	32	11
30	30	30
31	26	32
32	51	34
33	56	35
34	99	25
35	96	26
36	101	25
37	78	20
38	40	28
39	36	28
40	37	28
41	107	36
42	109	37
43	131	38
44	136	39
45	130	40
46	137	22
47	112	28
48	139	22
49	124	41
50	128	42
51	111	11
52	143	43
53	144	44
54	146	45
55	150	46
56	152	47
57	145	44
58	149	44
59	148	44
60	151	44
61	154	48
62	165	49
63	157	50
64	160	8
65	161	51
66	166	53
67	163	52
68	171	54
69	155	47
70	168	56
71	176	58
72	167	59
73	167	60
74	159	61
75	164	52
76	169	56
77	172	56
78	162	52
79	158	47
80	186	63
81	184	62
82	181	58
83	192	64
84	201	65
85	196	66
86	188	67
87	189	16
88	187	16
89	205	68
90	197	41
91	218	70
92	220	71
93	214	72
94	226	73
95	219	62
96	212	62
97	209	74
98	227	75
99	242	76
100	237	77
101	230	78
102	232	79
103	231	81
104	233	80
105	243	21
106	202	83
107	241	84
108	240	85
109	234	62
110	246	88
111	245	89
112	248	90
113	253	91
114	225	73
115	255	92
116	263	93
117	263	94
118	256	95
119	222	73
120	272	96
121	269	97
\.


--
-- Data for Name: games_tags; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.games_tags (id, game_id, tag_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	1	15
16	1	16
17	4	17
18	4	23
19	4	24
20	4	26
21	7	31
22	7	32
23	7	33
24	7	34
25	8	35
26	8	36
27	8	37
28	5	38
29	5	39
30	5	40
31	5	41
32	5	42
33	5	43
34	5	44
35	5	45
36	5	46
37	9	47
38	9	48
39	9	49
40	10	50
41	10	51
42	10	52
43	11	53
44	11	54
45	10	55
46	11	56
47	10	57
48	11	58
49	11	59
50	10	60
71	12	75
72	13	76
74	13	77
75	14	78
76	12	79
77	15	81
78	17	83
79	14	80
80	16	82
81	13	84
82	18	85
83	15	86
84	20	87
85	13	88
86	19	90
87	18	91
88	17	89
89	21	92
90	22	93
91	19	94
92	14	98
93	23	96
94	18	97
95	15	99
96	20	95
97	22	101
98	13	100
99	25	102
100	21	104
101	19	105
102	23	103
103	24	106
104	20	107
105	14	108
106	15	111
107	22	110
108	24	109
109	19	112
110	21	113
111	13	114
112	23	115
115	21	116
116	26	117
117	23	119
118	14	118
119	24	120
121	27	121
123	14	122
124	26	123
125	28	124
126	29	125
128	30	126
130	14	127
132	29	128
133	27	129
134	26	131
135	30	130
136	35	132
137	32	135
139	34	133
140	31	134
141	33	136
143	34	138
144	31	141
145	37	140
146	32	139
147	36	137
148	39	143
149	26	142
150	27	144
151	38	145
152	37	150
153	30	147
154	40	148
155	24	153
156	36	149
157	42	151
158	29	146
159	39	154
160	41	152
161	38	157
162	40	155
163	26	158
164	43	156
165	30	159
166	32	160
167	41	164
169	45	161
170	44	162
171	42	163
172	37	165
173	34	166
174	36	167
175	44	169
176	45	168
177	38	171
178	40	170
179	26	176
180	41	175
181	32	173
182	47	174
183	46	172
184	44	177
185	49	178
186	48	179
187	37	181
188	45	183
189	47	188
190	34	180
191	36	182
192	46	184
193	40	190
194	50	189
195	51	186
196	32	185
197	49	192
198	27	193
199	29	187
200	48	191
201	46	195
202	49	197
203	40	194
204	44	196
205	36	199
206	51	198
208	34	201
209	52	200
210	30	203
211	53	202
212	46	204
213	45	205
214	49	206
216	44	207
217	27	208
218	54	210
219	55	211
239	55	230
260	55	250
279	55	263
1824	244	1216
1825	244	1217
1826	244	1218
1827	244	1219
1828	244	1220
1829	244	1221
1830	244	1222
1831	244	1223
1964	279	1354
2008	342	1395
220	41	209
226	41	215
1832	245	1224
1835	245	1227
1965	278	1353
2009	352	1404
222	49	214
236	49	223
251	49	238
261	49	247
270	49	258
277	49	262
285	49	269
291	49	275
294	49	278
300	49	282
303	49	284
307	49	285
309	49	288
313	49	289
315	49	290
317	49	291
321	49	297
1833	246	1225
1966	280	1355
2010	344	1400
223	45	212
1834	247	1226
1836	247	1228
1839	247	1231
1841	247	1233
1967	281	1356
2011	351	1402
224	32	213
1837	248	1229
1968	283	1357
2012	334	1405
225	39	217
1838	249	1230
1840	249	1232
1969	285	1358
2013	346	1401
227	51	219
262	51	249
271	51	257
283	51	266
312	51	287
1842	250	1234
1845	250	1237
1847	250	1239
1970	286	1359
2014	324	1386
229	52	220
1843	251	1235
1844	251	1236
1848	251	1240
1971	288	1360
2015	330	1392
230	46	216
248	46	235
258	46	251
269	46	256
272	46	260
288	46	271
295	46	277
1846	252	1238
1972	289	1361
2016	349	649
231	50	221
1850	253	1241
1851	253	1242
1852	253	1243
1853	253	1244
1973	290	1362
2017	333	1393
232	37	218
233	58	226
240	37	232
1854	254	1245
1857	254	1248
1974	292	1363
2018	338	1399
234	34	225
235	57	222
254	57	243
1855	255	1246
1861	255	1251
1975	294	1365
2019	353	1406
237	26	228
1856	256	1247
1864	256	1253
1871	256	1262
1875	256	1265
1877	256	1268
1879	256	1270
1976	291	1364
238	53	224
241	56	227
252	53	241
256	56	246
266	53	255
268	56	253
282	56	265
289	56	272
292	53	276
297	56	280
302	56	283
323	56	293
327	56	302
1858	259	1249
1977	297	1367
242	30	229
1859	257	1250
1862	257	1256
1978	295	1366
243	38	234
245	59	233
259	59	245
273	59	261
286	59	270
290	59	273
296	59	279
310	59	286
1860	258	1252
1870	258	1261
1873	258	1264
1979	298	1368
246	36	231
263	36	252
1863	260	1254
1981	299	1369
247	54	237
249	60	236
264	60	248
265	54	254
284	60	268
293	60	274
299	60	281
320	60	294
329	60	304
1865	261	1255
1868	261	1259
1876	261	1267
1878	261	1269
1982	301	1370
250	44	239
253	61	240
255	63	242
257	62	244
274	61	259
280	62	264
281	63	267
318	64	292
319	65	295
322	66	296
324	68	299
325	67	298
326	65	300
328	69	301
330	71	305
331	70	303
332	72	307
333	65	306
334	73	308
335	68	309
336	69	310
337	70	311
338	73	313
339	72	312
340	74	315
341	64	314
342	76	316
343	75	318
344	77	317
345	68	319
346	78	322
347	75	323
348	65	320
349	67	321
350	69	324
351	68	326
352	80	327
353	79	325
354	78	328
355	73	329
356	78	332
357	81	330
358	75	333
359	77	331
360	68	334
361	82	335
362	72	337
363	83	336
364	81	341
365	84	338
366	85	340
367	78	343
368	82	339
369	77	349
370	86	345
371	65	344
372	75	342
373	83	347
374	68	346
375	88	348
376	80	350
377	79	351
378	87	352
380	89	354
381	69	353
382	72	355
383	84	356
384	75	357
385	85	361
386	83	358
387	90	359
388	92	363
389	73	360
390	91	362
391	83	364
392	78	366
393	90	365
394	85	368
395	65	370
396	83	369
397	77	367
398	87	371
399	88	374
400	85	373
401	72	372
402	83	375
403	90	376
404	78	377
405	93	379
406	91	378
407	75	381
408	85	380
409	69	382
410	94	385
411	90	384
412	83	383
413	93	386
414	88	387
415	97	391
416	96	389
417	69	388
418	98	392
420	100	395
421	95	390
422	101	396
423	94	393
424	77	397
425	99	394
426	98	398
428	102	399
429	91	401
430	99	403
431	97	400
432	101	402
434	96	405
435	100	404
436	102	406
437	88	407
439	83	409
440	98	408
441	99	411
442	97	410
443	102	412
444	101	413
445	72	414
446	98	415
447	78	416
448	99	418
449	96	417
450	101	421
451	98	419
452	102	420
453	101	423
454	97	422
455	78	424
456	99	425
457	102	426
458	78	427
459	101	428
461	101	429
462	78	430
463	101	431
464	78	432
845	103	433
846	103	434
847	103	435
848	103	436
849	104	437
850	103	438
851	104	439
852	103	440
853	104	441
854	103	442
856	104	443
857	103	444
858	103	445
859	103	446
860	103	447
861	103	448
862	105	449
863	105	450
864	105	451
865	105	452
866	106	453
867	107	454
868	108	455
869	109	456
870	107	457
871	110	458
872	108	459
873	109	460
874	106	461
875	111	462
876	109	463
877	110	465
878	111	466
879	107	464
880	109	467
881	112	468
882	113	469
883	114	470
884	110	471
885	109	472
886	112	473
887	113	474
888	111	475
894	111	481
903	111	489
953	111	537
971	111	555
995	111	579
1005	111	586
1866	263	1258
1983	302	1371
889	107	476
892	107	483
1867	262	1257
1869	262	1260
1872	262	1263
1874	262	1266
1984	303	1372
890	109	477
891	116	479
895	109	482
902	116	490
915	116	498
924	116	512
1880	264	1271
1889	264	1279
1985	304	1373
893	114	478
896	115	480
905	115	491
909	114	494
956	114	539
1881	266	1273
1883	266	1274
1887	266	1280
1893	266	1284
1902	266	1292
1911	266	1304
1927	266	1318
1986	306	1374
897	113	485
1882	265	1272
1884	265	1275
1886	265	1277
1890	265	1282
1894	265	1285
1899	265	1291
1912	265	1301
1919	265	1308
1926	265	1315
1934	265	1323
1939	265	1327
1942	265	1331
1944	265	1333
1948	265	1337
1950	265	1339
1953	265	1342
1955	265	1344
1987	307	1375
898	110	484
933	110	517
949	110	533
1885	267	1276
1988	308	1376
899	112	486
900	117	488
901	118	487
904	119	492
906	120	493
907	118	496
908	121	495
910	112	497
911	125	500
912	120	501
913	123	504
914	112	505
916	118	502
917	124	503
918	125	507
919	122	499
920	126	506
921	124	511
922	127	508
923	118	509
926	120	510
927	121	513
928	128	515
929	117	514
930	129	518
931	125	516
932	130	519
934	120	521
935	126	520
938	131	524
939	121	525
940	124	522
941	128	523
942	129	526
943	132	530
944	134	531
945	130	529
946	133	528
947	112	527
948	120	532
950	126	534
951	131	535
952	123	536
954	134	541
955	135	538
957	137	542
958	136	543
959	132	540
960	139	546
961	127	545
962	131	548
963	124	547
964	135	549
965	120	544
966	138	551
967	126	557
968	134	550
969	136	553
970	140	554
972	133	556
973	139	558
974	128	560
975	132	561
976	137	552
977	135	562
978	120	559
979	132	563
980	140	565
981	124	564
982	121	566
983	135	569
984	134	567
985	136	568
986	129	571
987	139	570
988	138	572
989	128	576
990	133	573
991	137	574
992	130	577
993	140	575
994	135	578
996	129	581
997	133	580
998	139	582
999	140	583
1000	135	584
1001	112	585
1002	127	588
1003	124	587
1004	139	589
1006	140	590
1007	135	592
1008	128	591
1009	135	594
1010	133	595
1011	140	593
1013	128	596
1014	124	597
1015	140	598
1016	129	600
1017	133	601
1018	135	599
1019	140	602
1020	133	603
1021	128	606
1022	135	604
1023	140	605
1024	124	607
1025	140	608
1026	128	609
1027	140	610
1028	133	611
1029	140	612
1030	128	613
1031	128	614
1032	141	615
1033	141	616
1049	142	617
1050	143	618
1051	143	619
1052	143	620
1053	143	621
1054	144	622
1055	144	623
1058	144	624
1059	144	625
1062	144	626
1063	144	627
1066	144	628
1068	144	629
1069	147	630
1070	146	631
1071	145	632
1072	148	633
1073	149	634
1074	144	635
1075	147	636
1077	150	638
1078	149	640
1079	148	637
1080	145	639
1081	151	642
1083	147	641
1084	150	643
1085	151	644
1088	149	646
1089	147	645
1092	150	648
1096	147	647
1098	148	650
1099	146	649
1102	147	651
1103	145	655
1104	146	653
1105	149	654
1106	150	652
1107	151	656
1108	148	657
1109	147	658
1110	145	659
1112	151	660
1113	149	661
1115	147	662
1120	147	663
1121	148	664
1122	145	665
1125	147	666
1126	145	667
1127	149	670
1128	150	669
1129	148	668
1132	149	671
1133	147	672
1135	151	673
1138	147	674
1141	151	675
1143	147	676
1144	148	677
1148	147	678
1150	149	679
1151	145	680
1154	147	681
1155	148	682
1157	145	684
1158	149	683
1888	268	1278
1892	268	1283
1900	268	1290
1913	268	1303
1918	268	1310
1922	268	1314
1936	268	1325
1989	309	1377
1159	147	685
1161	147	686
1164	147	688
1166	147	689
1891	269	1281
1898	269	1288
1905	269	1297
1914	269	1305
1923	269	1309
1929	269	1319
1935	269	1324
1938	269	1328
1943	269	1332
1946	269	1335
1949	269	1338
1951	269	1340
1952	269	1341
1954	269	1343
1956	269	1345
1957	269	1346
1958	269	1347
1959	269	1348
1960	269	1349
1961	269	1350
1962	269	1351
1963	269	1352
1990	312	1378
1162	151	687
1167	151	690
1168	151	691
1169	152	692
1170	152	693
1171	152	694
1214	153	695
1216	154	696
1217	155	697
1218	158	694
1219	156	698
1220	157	699
1221	153	702
1222	160	701
1223	159	700
1224	154	703
1225	155	705
1227	158	704
1228	159	706
1229	160	707
1231	161	709
1232	158	711
1233	162	710
1234	159	712
1235	154	708
1236	163	713
1237	157	715
1238	161	716
1239	153	714
1240	162	717
1241	163	718
1242	155	720
1243	164	721
1244	154	722
1246	158	719
1247	165	723
1248	162	727
1249	153	725
1250	164	728
1251	161	724
1252	163	729
1253	166	726
1254	160	730
1255	154	733
1256	157	732
1257	167	731
1258	155	734
1259	158	736
1260	161	735
1262	166	738
1263	170	739
1264	157	741
1265	153	743
1266	168	737
1267	171	744
1268	167	740
1269	169	745
1270	165	751
1271	168	749
1272	172	742
1273	159	746
1274	158	748
1275	155	752
1276	164	753
1277	163	750
1278	171	747
1279	169	755
1280	170	754
1281	168	756
1282	171	760
1284	155	761
1285	161	762
1286	162	763
1287	166	759
1288	172	757
1289	158	758
1290	169	765
1291	159	764
1292	171	767
1293	164	766
1294	163	770
1295	168	769
1296	167	771
1297	161	768
1298	153	773
1299	162	772
1300	158	775
1301	169	774
1302	171	776
1303	172	778
1304	164	777
1305	159	779
1306	167	780
1308	161	781
1309	168	782
1310	169	783
1311	158	784
1312	171	787
1313	153	786
1314	161	788
1315	158	789
1316	172	785
1317	169	790
1318	162	791
1319	163	794
1321	158	793
1322	172	795
1323	155	796
1324	167	800
1325	174	798
1326	169	797
1327	171	792
1328	173	799
1330	176	803
1331	158	802
1332	159	801
1333	172	806
1334	177	808
1335	175	805
1336	178	809
1337	169	807
1338	155	804
1339	179	811
1340	178	814
1341	180	816
1342	173	812
1343	181	813
1344	169	819
1345	176	818
1346	172	815
1347	167	810
1348	164	817
1349	177	820
1350	175	822
1351	158	824
1352	174	821
1353	168	823
1354	179	828
1355	180	829
1356	162	830
1357	181	827
1358	169	826
1359	172	833
1360	159	825
1361	177	831
1362	158	834
1363	176	832
1364	167	835
1365	175	837
1366	169	836
1367	172	838
1368	180	839
1369	158	841
1370	162	840
1371	173	842
1372	169	843
1373	177	845
1374	181	844
1375	158	846
1376	180	847
1377	172	848
1378	169	849
1379	158	850
1380	177	853
1381	173	851
1382	175	852
1383	172	854
1384	162	855
1385	158	856
1386	159	859
1387	169	860
1388	176	858
1389	167	857
1390	172	862
1391	169	864
1392	158	861
1393	181	863
1394	158	866
1395	172	865
1396	159	867
1397	169	868
1398	167	869
1399	172	871
1400	158	870
1401	169	873
1402	176	872
1895	270	1286
1991	316	1382
1403	159	874
1896	271	1287
1903	271	1295
1908	271	1299
1992	319	1380
1404	169	875
1408	169	879
1897	272	1289
1909	272	1302
1928	272	1317
1993	318	1379
1405	158	876
1409	158	881
1411	158	882
1901	274	1293
1924	274	1313
1994	322	1383
1406	172	877
1410	172	880
1904	273	1294
1910	273	1300
1921	273	1311
1930	273	1320
1995	339	1394
1407	181	878
1413	182	883
1467	183	884
1468	184	885
1469	183	886
1470	176	888
1471	184	887
1472	183	890
1473	184	889
1474	185	891
1475	188	892
1476	187	894
1477	186	893
1478	190	896
1479	188	899
1480	189	895
1481	187	897
1482	185	898
1483	190	900
1484	189	902
1485	184	901
1486	183	903
1487	185	905
1488	190	904
1490	191	907
1491	188	908
1492	190	906
1493	189	909
1494	187	910
1495	185	911
1496	192	913
1497	183	912
1498	191	914
1499	188	915
1500	194	917
1501	195	916
1502	187	921
1503	189	919
1504	193	918
1505	192	920
1506	185	922
1507	191	923
1508	196	924
1509	197	927
1510	198	925
1511	192	926
1512	199	928
1513	185	930
1514	195	929
1515	200	931
1516	201	932
1517	196	933
1518	192	934
1519	197	935
1520	198	937
1521	190	936
1522	189	938
1523	185	940
1524	199	941
1525	200	939
1526	187	943
1527	188	942
1528	202	944
1529	190	945
1530	195	947
1531	200	946
1532	197	948
1533	204	950
1534	202	951
1535	185	949
1536	189	953
1537	205	954
1538	203	952
1539	206	955
1540	204	956
1541	207	958
1542	206	960
1543	195	959
1544	197	961
1545	185	957
1546	202	962
1547	205	963
1548	200	965
1549	207	964
1550	185	967
1551	189	966
1552	206	968
1553	204	969
1554	197	973
1555	195	970
1556	185	971
1557	206	972
1559	185	975
1560	204	974
1561	188	976
1562	190	979
1563	187	978
1564	189	977
1565	208	980
1566	185	983
1567	209	981
1568	205	982
1570	208	985
1571	210	984
1572	211	986
1573	213	989
1574	209	988
1575	195	990
1576	187	992
1577	208	987
1578	212	991
1579	214	993
1580	215	994
1581	214	995
1582	204	997
1583	217	1000
1584	213	998
1585	212	999
1586	216	996
1587	218	1002
1588	206	1003
1589	219	1004
1590	208	1001
1591	213	1008
1592	204	1010
1593	220	1009
1594	216	1012
1595	214	1006
1596	208	1013
1597	202	1005
1598	217	1007
1599	197	1011
1600	218	1014
1601	219	1015
1602	206	1016
1603	213	1017
1604	220	1021
1605	218	1019
1606	214	1020
1608	190	1025
1609	217	1027
1610	212	1018
1611	215	1023
1612	213	1022
1613	202	1026
1614	209	1024
1615	216	1029
1616	206	1028
1617	219	1030
1619	212	1032
1620	214	1031
1621	209	1033
1622	214	1034
1624	217	1036
1625	219	1035
1626	216	1038
1627	212	1039
1628	209	1037
1629	214	1040
1630	206	1041
1631	202	1042
1632	214	1043
1633	217	1044
1635	212	1045
1636	215	1046
1637	214	1047
1638	216	1048
1639	215	1049
1640	217	1054
1641	219	1050
1642	216	1053
1644	221	1055
1645	214	1052
1646	212	1051
1647	223	1056
1648	206	1057
1649	224	1058
1650	214	1063
1651	222	1060
1652	215	1061
1653	226	1062
1654	225	1064
1655	216	1059
1656	209	1065
1657	223	1067
1659	219	1066
1686	219	1091
1906	275	1296
1915	275	1306
1920	275	1312
1925	275	1316
1931	275	1322
1937	275	1326
1941	275	1330
1945	275	1334
1947	275	1336
1996	317	1381
1660	206	1068
1661	227	1069
1666	206	1075
1670	227	1077
1688	227	1094
1692	206	1097
1695	227	1100
1701	206	1105
1714	227	1116
1723	227	1124
1728	206	1129
1735	206	1136
1746	206	1143
1776	206	1167
1781	206	1173
1791	206	1181
1799	206	1192
1803	206	1195
1806	206	1199
1907	276	1298
1997	325	1384
1662	224	1070
1663	228	1072
1664	229	1073
1669	228	1079
1672	229	1080
1700	228	1101
1724	228	1126
1917	277	1307
1932	277	1321
1940	277	1329
1998	337	1389
1665	222	1071
1999	329	1385
1667	223	1076
2000	343	1397
1668	202	1074
1671	230	1078
1676	230	1083
1678	202	1084
1690	202	1093
1694	230	1096
1704	230	1109
1717	230	1119
1727	230	1128
1757	202	1153
1759	230	1152
1770	202	1162
1778	202	1172
1792	202	1183
1796	202	1188
2001	326	1387
1674	225	1082
2002	335	1391
1675	215	1081
1677	231	1085
1682	215	1088
1683	231	1089
1691	215	1095
1693	231	1098
1709	231	1114
1719	231	1122
1732	231	1132
1769	231	1163
2003	341	1398
1679	209	1086
1696	209	1099
1715	209	1117
1722	209	1123
2004	350	1403
1680	216	1087
2005	327	1388
1685	217	1090
1697	217	1103
1711	217	1113
2006	331	1390
1689	212	1092
1698	233	1104
1699	232	1102
1702	236	1108
1703	234	1106
1706	232	1110
1707	235	1107
1708	233	1111
1710	234	1112
1712	236	1115
1716	237	1118
1718	235	1120
1720	234	1121
1725	237	1125
1726	232	1127
1730	233	1130
1731	234	1131
1733	232	1133
1734	238	1135
1736	234	1137
1737	239	1134
1739	236	1139
1741	235	1138
1742	233	1140
1743	238	1141
1745	239	1142
1747	234	1145
1748	233	1148
1749	236	1144
1750	240	1147
1752	232	1146
1753	242	1150
1754	239	1151
1755	241	1149
1758	236	1154
1760	234	1155
1761	241	1157
1762	240	1156
1764	235	1158
1765	243	1159
1766	234	1161
1767	233	1160
1771	240	1165
1772	234	1164
1774	238	1166
1775	243	1169
1777	236	1168
1779	241	1170
1780	234	1171
1782	235	1174
1783	234	1175
1784	236	1176
1785	234	1179
1786	238	1177
1787	241	1180
1788	235	1178
1789	240	1182
1790	234	1184
1793	241	1185
1794	234	1186
1795	240	1187
1797	234	1189
1798	241	1191
1800	238	1193
1801	234	1190
1802	236	1194
1804	234	1196
1805	238	1197
1807	240	1201
1808	236	1200
1809	234	1198
1810	234	1202
1811	238	1203
1812	234	1204
1813	234	1205
1814	238	1206
1815	234	1207
1816	234	1208
1817	234	1209
1818	234	1210
1819	234	1211
1820	234	1212
1821	234	1213
1822	234	1214
1823	234	1215
2007	336	1396
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.genres (id, name, slug, created_at, updated_at) FROM stdin;
34	action	action	2020-12-17 19:51:08.361151+00	2020-12-21 16:12:08.868135+00
9	sandbox	sandbox	2020-12-14 19:34:13.812186+00	2020-12-14 19:34:13.812203+00
12	platform game	platform-game	2020-12-14 19:34:13.942005+00	2020-12-14 19:34:13.942022+00
71	sport simulations	sport-simulations	2020-12-20 04:21:09.572409+00	2020-12-20 04:21:09.572432+00
90	Music or rhythm	music-or-rhythm	2021-02-04 19:58:19.039306+00	2021-02-04 19:58:19.03933+00
13	mmorpg	mmorpg	2020-12-14 19:38:23.177928+00	2020-12-14 19:38:23.177945+00
79	maze	maze	2020-12-21 16:12:08.929607+00	2020-12-21 16:12:08.92963+00
80	card game	card-game	2020-12-21 16:12:09.010831+00	2020-12-21 16:12:09.010853+00
55	interactive movie	interactive-movie	2020-12-17 19:51:14.169245+00	2020-12-18 16:36:45.280085+00
61	real-time strategy	real-time-strategy	2020-12-17 20:42:18.089262+00	2020-12-18 16:36:45.295457+00
3	stealth	stealth	2020-12-13 04:33:39.096888+00	2020-12-21 16:12:05.687545+00
25	casual	casual	2020-12-17 19:51:06.265371+00	2020-12-17 19:51:06.26541+00
60	twin-stick shooter	twin-stick-shooter	2020-12-17 20:42:17.722156+00	2020-12-17 20:42:17.722179+00
50	digital card game	digital-card-game	2020-12-17 19:51:13.693519+00	2020-12-17 19:51:13.693542+00
51	shooter	shooter	2020-12-17 19:51:13.709764+00	2020-12-17 19:51:13.709787+00
62	horror	horror	2020-12-18 16:36:42.079648+00	2020-12-18 16:36:42.079672+00
54	business simulation	business-simulation	2020-12-17 19:51:14.033813+00	2020-12-17 19:51:14.033831+00
30	[3]	3	2020-12-17 19:51:07.646506+00	2020-12-17 19:51:07.646526+00
85	platforming	platforming	2020-12-21 20:10:28.341906+00	2020-12-21 20:10:28.341923+00
11	beat 'em up	beat-em-up	2020-12-14 19:34:13.934094+00	2020-12-21 16:12:06.074473+00
84	real-time tactics	real-time-tactics	2020-12-21 19:56:04.288506+00	2020-12-21 19:56:04.288526+00
56	artillery	artillery	2020-12-17 19:51:14.236936+00	2020-12-17 19:51:14.236956+00
83	point-and-click adventure	point-and-click-adventure	2020-12-21 19:56:02.595897+00	2020-12-21 20:10:28.384197+00
63	open-world	open-world	2020-12-18 16:36:42.631451+00	2020-12-18 16:36:42.631466+00
57	massively multiplayer online role-playing	massively-multiplayer-online-role-playing	2020-12-17 19:51:14.312176+00	2020-12-17 19:51:14.312199+00
67	rts	rts	2020-12-18 16:36:45.740508+00	2020-12-18 16:36:45.740533+00
64	adventure game	adventure-game	2020-12-18 16:36:42.65138+00	2020-12-18 16:36:42.651402+00
75	board game	board-game	2020-12-21 16:12:03.858032+00	2020-12-21 16:12:03.858048+00
65	moba	moba	2020-12-18 16:36:42.666818+00	2020-12-18 16:36:42.666854+00
76	puzzle-platformer	puzzle-platformer	2020-12-21 16:12:03.900427+00	2020-12-21 16:12:03.900449+00
86	pinball	pinball	2020-12-21 20:10:28.386203+00	2020-12-21 20:10:28.386221+00
66	survival game	survival-game	2020-12-18 16:36:42.680868+00	2020-12-18 16:36:42.680892+00
35	tactical role-playing	tactical-role-playing	2020-12-17 19:51:08.403757+00	2020-12-21 16:12:09.155216+00
68	grand strategy	grand-strategy	2020-12-18 16:36:45.793796+00	2020-12-18 16:36:45.793814+00
19	roguelike	roguelike	2020-12-17 19:51:05.421718+00	2020-12-21 16:12:06.741495+00
69	bullet hell	bullet-hell	2020-12-18 16:41:43.942362+00	2020-12-18 16:41:43.942398+00
5	4x	4x	2020-12-13 04:38:29.48689+00	2020-12-20 04:21:10.743249+00
36	fighting	fighting	2020-12-17 19:51:08.580367+00	2020-12-21 16:12:07.132055+00
41	management simulation	management-simulation	2020-12-17 19:51:11.482014+00	2020-12-17 19:51:11.482038+00
27	platformer	platformer	2020-12-17 19:51:06.695746+00	2020-12-21 19:56:04.412703+00
42	action platformer	action-platformer	2020-12-17 19:51:11.56803+00	2020-12-17 19:51:11.568059+00
43	party	party	2020-12-17 19:51:11.601795+00	2020-12-17 19:51:11.601815+00
44	deck-building	deck-building	2020-12-17 19:51:11.67979+00	2020-12-17 19:51:11.679814+00
17	hack and slash	hack-and-slash	2020-12-17 19:51:05.232026+00	2020-12-20 04:10:34.385475+00
10	adventure	adventure	2020-12-14 19:34:13.817143+00	2020-12-21 20:10:28.416383+00
58	tower defense	tower-defense	2020-12-17 20:06:17.819423+00	2020-12-21 16:12:04.292148+00
47	roguelite	roguelite	2020-12-17 19:51:12.564043+00	2020-12-17 19:51:12.564063+00
29	[2]	2	2020-12-17 19:51:07.396715+00	2020-12-20 04:10:34.757976+00
78	rhythm	rhythm	2020-12-21 16:12:07.353669+00	2020-12-21 16:12:07.353708+00
48	city building	city-building	2020-12-17 19:51:12.627175+00	2020-12-17 19:51:12.627196+00
87	art game	art-game	2020-12-21 20:10:28.435991+00	2020-12-21 20:10:28.436011+00
6	turn-based strategy	turn-based-strategy	2020-12-13 04:38:29.495179+00	2020-12-20 04:21:11.063804+00
53	tactical shooter	tactical-shooter	2020-12-17 19:51:13.916431+00	2020-12-21 16:12:09.518697+00
1	action role-playing	action-role-playing	2020-12-13 03:29:47.303526+00	2020-12-21 19:56:04.457401+00
14	simulation	simulation	2020-12-17 19:51:04.90659+00	2020-12-21 20:10:28.474198+00
4	survival horror	survival-horror	2020-12-13 04:33:39.1052+00	2020-12-21 16:12:09.589814+00
59	-	-	2020-12-17 20:06:19.554102+00	2020-12-17 20:06:19.554122+00
46	strategy	strategy	2020-12-17 19:51:12.436035+00	2020-12-21 16:12:04.979034+00
74	[15]	15	2020-12-20 04:21:11.533101+00	2020-12-20 04:21:11.533121+00
77	rail shooter	rail-shooter	2020-12-21 16:12:05.466324+00	2020-12-21 19:56:04.572393+00
52	dungeon crawler	dungeon-crawler	2020-12-17 19:51:13.743833+00	2020-12-17 20:06:20.391095+00
15	puzzle	puzzle	2020-12-17 19:51:04.938772+00	2020-12-21 20:10:28.727498+00
38	platform-adventure	platform-adventure	2020-12-17 19:51:09.104717+00	2020-12-17 20:06:20.813444+00
70	space combat	space-combat	2020-12-20 04:21:08.743663+00	2020-12-20 04:21:08.743683+00
82	battle royale	battle-royale	2020-12-21 16:12:09.924334+00	2020-12-21 16:12:09.924356+00
73	music	music	2020-12-20 04:21:11.450963+00	2020-12-21 19:56:04.623569+00
8	role-playing	role-playing	2020-12-14 15:16:09.423108+00	2020-12-21 19:56:04.634272+00
72	top-down shooter	top-down-shooter	2020-12-20 04:21:11.014814+00	2020-12-21 16:12:02.489665+00
22	metroidvania	metroidvania	2020-12-17 19:51:05.630158+00	2020-12-21 20:10:28.791546+00
88	[12]	12	2020-12-21 20:10:28.813834+00	2020-12-21 20:10:28.813983+00
7	survival	survival	2020-12-13 04:39:08.323959+00	2020-12-18 16:36:45.0742+00
26	sports	sports	2020-12-17 19:51:06.329751+00	2020-12-21 19:56:02.202553+00
37	graphic adventure	graphic-adventure	2020-12-17 19:51:08.959758+00	2020-12-21 19:56:02.549787+00
28	[1]	1	2020-12-17 19:51:07.24196+00	2020-12-21 19:56:04.713212+00
40	first-person shooter	first-person-shooter	2020-12-17 19:51:11.038246+00	2020-12-21 19:56:02.65708+00
31	third-person shooter	third-person-shooter	2020-12-17 19:51:07.666156+00	2020-12-21 20:10:28.863429+00
16	platform	platform	2020-12-17 19:51:05.036007+00	2020-12-21 20:10:28.864593+00
2	action-adventure	action-adventure	2020-12-13 04:33:39.084684+00	2020-12-21 20:10:28.87532+00
23	racing	racing	2020-12-17 19:51:06.200413+00	2020-12-21 20:10:28.234577+00
32	turn-based tactics	turn-based-tactics	2020-12-17 19:51:08.264842+00	2020-12-21 20:10:28.248451+00
89	run and gun	run-and-gun	2020-12-21 20:10:29.132159+00	2020-12-21 20:10:29.132183+00
267	Indie	indie	2021-02-05 19:28:26.72061+00	2021-02-05 19:28:26.720651+00
136	Kids & family	kids-family	2021-02-04 19:58:28.946818+00	2021-02-04 19:58:28.946845+00
268	Role-playing game	role-playing-game	2021-02-05 19:28:26.929128+00	2021-02-05 19:28:26.929153+00
144	Arcade	arcade	2021-02-04 19:58:29.740151+00	2021-02-04 19:58:29.740177+00
155	Simulator	simulator	2021-02-05 16:52:37.185829+00	2021-02-05 16:52:37.185861+00
\.


--
-- Data for Name: language_codes; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.language_codes (id, iso, language, language_eng) FROM stdin;
1	arz	مصرى	Egyptian Arabic
2	ru	Русский	Russian
3	ar	العربية	Arabic
4	es	Español	Spanish
5	fr	Français	French
6	pl	Polski	Polish
7	bg	Български	Bulgarian
8	ca	Català	Catalan
9	da	Dansk	Danish
10	de	Deutsch	German
11	ko	한국어	Korean
12	ja	日本語	Japanese
13	pt	Português	Portuguese
14	fi	Suomi	Finnish
15	uk	Українська	Ukrainian
16	zh	中文	Chinese
17	sv	Svenska	Swedish
18	cs	Čeština	Czech
19	it	Italiano	Italian
20	br	Brezhoneg	Breton
21	el	Ελληνικά	Greek
22	vi	Tiếng Việt	Vietnamese
23	fa	فارسی	Persian
24	eo	Esperanto	Esperanto
25	id	Bahasa Indonesia	Indonesian
26	th	ไทย	Thai
27	he	עברית	Hebrew
28	la	Latina	Latin
29	wuu	吴语	Wu Chinese
30	lt	Lietuvių	Lithuanian
31	nl	Nederlands	Dutch
32	tr	Türkçe	Turkish
33	sr	Српски / srpski	Serbian
34	nb	Norsk bokmål	Norwegian Bokmål
35	nn	Norsk nynorsk	Norwegian Nynorsk
36	lzh	文言	Classical Chinese
37	az	Azərbaycanca	Azerbaijani
38	ga	Gaeilge	Irish
39	hy	Հայերեն	Armenian
40	gl	Galego	Galician
41	sl	Slovenščina	Slovenian
42	ro	Română	Romanian
43	an	Aragonés	Aragonese
44	hu	Magyar	Hungarian
45	mk	Македонски	Macedonian
46	yue	粵語	Cantonese
47	et	Eesti	Estonian
48	sk	Slovenčina	Slovak
49	ms	Bahasa Melayu	Malay
50	tl	Tagalog	Tagalog
51	sh	Srpskohrvatski / српскохрватски	Serbo-Croatian
52	hr	Hrvatski	Croatian
53	cy	Cymraeg	Welsh
54	sco	Scots	Scots
55	ckb	کوردی	Central Kurdish
56	bn	বাংলা	Bangla
57	ny	Chi-Chewa	Nyanja
58	ka	ქართული	Georgian
59	hi	हिन्दी	Hindi
60	mn	Монгол	Mongolian
61	hif	Fiji Hindi	Fiji Hindi
62	sw	Kiswahili	Swahili
63	is	Íslenska	Icelandic
64	ast	Asturianu	Asturian
65	nan	Bân-lâm-gú	Chinese (Min Nan)
66	eu	Euskara	Basque
67	sah	Саха тыла	Sakha
68	lv	Latviešu	Latvian
69	lad	Ladino	Ladino
70	be	Беларуская	Belarusian
71	kk	Қазақша	Kazakh
72	pnb	پنجابی	Western Punjabi
73	smn	Anarâškielâ	Inari Sami
74	ur	اردو	Urdu
75	bh	भोजपुरी	Bhojpuri
76	kn	ಕನ್ನಡ	Kannada
77	ky	Кыргызча	Kyrgyz
78	ml	മലയാളം	Malayalam
79	mr	मराठी	Marathi
80	my	မြန်မာဘာသာ	Burmese
81	ne	नेपाली	Nepali
82	pa	ਪੰਜਾਬੀ	Punjabi
83	ps	پښتو	Pashto
84	sat	ᱥᱟᱱᱛᱟᱲᱤ	Santali
85	si	සිංහල	Sinhala
86	ta	தமிழ்	Tamil
87	te	తెలుగు	Telugu
\.


--
-- Data for Name: modes; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.modes (id, name, slug, created_at, updated_at) FROM stdin;
1	single-player	single-player	2020-12-13 03:29:47.310858+00	2020-12-21 20:10:29.13691+00
2	multiplayer	multiplayer	2020-12-13 03:29:47.318264+00	2020-12-21 20:10:29.142455+00
27	Local co-op	local-co-op	2021-02-04 19:58:27.544373+00	2021-02-04 19:58:27.544417+00
19	multiplayer (turn-based)	multiplayer-turn-based	2020-12-20 04:21:09.678653+00	2020-12-20 04:21:09.678676+00
34	Cross platform multiplayer	cross-platform-multiplayer	2021-02-04 19:58:34.448484+00	2021-02-04 19:58:34.44855+00
20	split-screen	split-screen	2020-12-20 04:21:10.306683+00	2020-12-20 04:21:10.306703+00
7	versus multiplayer	versus-multiplayer	2020-12-17 20:06:20.302961+00	2020-12-17 20:06:20.303+00
39	Competitive	competitive	2021-02-05 16:53:33.025799+00	2021-02-05 16:53:33.025838+00
40	Local multiplayer	local-multiplayer	2021-02-05 16:53:33.544886+00	2021-02-05 16:53:33.544914+00
42	Online multiplayer	online-multiplayer	2021-02-05 16:53:37.069126+00	2021-02-05 16:53:37.069173+00
3	online co-op	online-co-op	2020-12-17 19:51:07.825757+00	2020-12-17 19:51:07.825779+00
26	cooperation	cooperation	2020-12-21 19:56:02.269243+00	2020-12-21 19:56:02.269267+00
4	[a]	a	2020-12-17 19:51:11.686132+00	2020-12-17 19:51:11.686166+00
6	multi-player	multi-player	2020-12-17 19:51:14.185575+00	2020-12-17 19:51:14.185593+00
\.


--
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.platforms (id, name, description, pictures, slug, created_at, updated_at, available_countries, internet_requirements, supported_devices, verdict) FROM stdin;
4	Luna	- Closed Beta\r\n- Subscribe to channels. Currently Luna Plus (USD $5.99), and Ubisoft Plus (USD $14.99) channels available.	["https://images-na.ssl-images-amazon.com/images/I/518801AgwOL.png"]	luna	2020-12-21 19:56:02.181474+00	2021-01-15 23:18:13.996289+00	["US"]	at least 10Mbps for 1080p, 20Mbps or more are recommended.	["Windows 10 PCs", "2014 or newer hardware and macOS 10.13+ Macs", "Android 9+ Phones/Tablets", "Fire TV"]	["Closed Beta", "Subscribe to channels. Currently Luna Plus (USD $5.99), and Ubisoft Plus (USD $14.99) channels available."]
1	xCloud	- Netflix-like for games.\r\n- May access 100+ games with the subscription: including all Microsoft published games. Adding new third-party games and deleting them from their service. Many big title games are included. No need to buy or own games.\r\n- USD $14.99 per month: includes Xbox Game Pass Console, Xbox Game Pass PC, and Xbox Live Gold.\r\n- EA Play and Uplay included.	["https://images-eu.ssl-images-amazon.com/images/I/41Qcgb%2BvWuL.jpg"]	xcloud	2020-12-13 03:29:47.295079+00	2021-01-15 23:19:17.274488+00	["Austria", "Belgium", "Canada", "Czechia", "Denmark", "Finland", "France", "Germany", "Hungary", "Ireland", "Italy", "Korea", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Spain", "Sweden", "Switzerland", "United Kingdom", "United States"]	at least 10Mbps speed for 720p, at least 25Mbps for 1080p	["Android 6.0 and up Phones/Tablets", "Xbox One", "Xbox Series X/S", "iPhones/iPads (in Spring 2021)", "Windows PCs (in Spring 2021)"]	["Netflix-like for games.", "May access 100+ games with the subscription: including all Microsoft published games. Adding new third-party games and deleting them from their service. Many big title games are included. No need to buy or own games.", "USD $14.99 per month: includes Xbox Game Pass Console, Xbox Game Pass PC, and Xbox Live Gold.", "EA Play and Uplay included."]
3	Stadia	- Closed platform.\r\n- 100+ game titles available to buy at Stadia Store. Only games from Stadia Store supported. Free games available with Stadia Pro subscription.\r\n- USD $9.99 per month for Stadia Pro subscription. Free tier available: Stadia Base. You may play purchased games with Base plan.\r\n- 4K HDR streaming available with Pro subscription.	["https://ssl.gstatic.com/stadia/gamers/assets/stadia_logo_and_text_v1.jpg"]	stadia	2020-12-20 04:10:34.257248+00	2021-01-15 23:18:44.986816+00	["United States", "Canada", "United Kingdom", "France", "Italy", "Germany", "Austria", "Spain", "Sweden", "Switzerland", "Denmark", "Norway", "Finland", "Belgium", "Ireland", "Netherlands", "Poland", "Portugal", "Czechia", "Slovakia", "Romania", "Hungary"]	at least 10Mbps for 720p, at least 35Mbps for 4K	["Google Chromecast Ultra", "iOS 14.3 and up iPhones/iPadOS 14.3 and up iPads with Safari browser", "Android Phones/Tablets", "PCs/Macs with web browsers"]	["Closed platform.", "100+ game titles available to buy at Stadia Store. Only games from Stadia Store supported. Free games available with Stadia Pro subscription.", "USD $9.99 per month for Stadia Pro subscription. Free tier available: Stadia Base. You may play purchased games with Base plan.", "4K HDR streaming available with Pro subscription."]
11	Apple Arcade	- Download games one-by-one. Not streaming. Offline is possible in number of games. Many family friendly games.\r\n- USD $4.99 per month.	["https://miro.medium.com/max/3504/1*scdHV0GoAnZ0_Uy6iYEdcg.png"]	apple-arcade	2021-01-15 22:35:19.414974+00	2021-01-15 23:16:59.747349+00	["Most countries have Apple App store"]		["latest iOS iPhones", "latest iOS iPods", "latest iPadOS iPad", "latest macOS Mac", "latest tvOS Apple TV"]	["Download games one-by-one. Not streaming. Offline is possible in number of games. Many family friendly games.", "USD $4.99 per month."]
10	PlayStation Now	- More than 800 games. Same libraries on both PS4 and PC. Everything is streaming on PC, on the other hand, you will download games on PS4.\r\n- USD $19.99 per month.	["https://www.obilisk.co/wp-content/uploads/2020/03/playstation-now-listing-thumb-01-us-30sep19.png"]	playstation-now	2021-01-15 22:07:34.402504+00	2021-01-15 23:17:26.715569+00	["Austria", "Belgium", "Canada", "Denmark", "Finland", "France", "Germany", "Ireland", "Italy", "Japan", "Luxembourg", "Norway", "Portugal", "Spain", "Sweden", "Switzerland", "The Netherlands", "UK", "USA"]	at least 5Mbps to stream PlayStation Now	["PS4", "Windows 10 PCs"]	["More than 800 games. Same libraries on both PS4 and PC. Everything is streaming on PC, on the other hand, you will download games on PS4.", "USD $19.99 per month."]
9	GeForce Now	- Open platform. More likely rent a high-end PC on cloud.\r\n- Few free games. Can play games already own from third-party digital stores: Steam, Epic, Uplay, and GOG.com. You keep the game titles you bought. No GeForce Now service dependent.\r\n- USD $4.99 per month for Founders subscription. Free tier available.\r\n- Ray Tracing and DLSS supported with Founders subscription.	["https://images.gamewatcherstatic.com/image/file/0/3a/105870/Nvidia-Geforce-Now-1.png"]	geforce-now	2021-01-14 19:27:17.415136+00	2021-01-15 23:17:53.635277+00	["over 70 countries in Europe", "United States", "Canada", "Mexico", "South Korea", "Japan", "Taiwan"]	at least 15Mbps for 720p at 60fps, and 25Mbps for 1080p at 60fps	["macOS 10.10 and up Mac machines", "64bit Windows 7 and up PCs", "Nvidia Shield TV", "Chrome OS 77.x and up Chromebooks", "Android 5.0 and up Android Phones/Tablets", "iOS 14.2 and up iPhones/iPadOS 14 and up iPads with Safari browser"]	["Open platform. More likely rent a high-end PC on cloud.", "Few free games. Can play games already own from third-party digital stores: Steam, Epic, Uplay, and GOG.com. You keep the game titles you bought. No GeForce Now service dependent.", "USD $4.99 per month for Founders subscription. Free tier available.", "Ray Tracing and DLSS supported with Founders subscription."]
\.


--
-- Data for Name: platforms_stores; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.platforms_stores (id, platform_id, store_id) FROM stdin;
\.


--
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.publishers (id, name, description, slug, pictures, created_at, updated_at) FROM stdin;
4	Studio Wildcard	\N	studio-wildcard	[]	2020-12-13 04:39:08.307632+00	2020-12-13 04:39:08.307653+00
7	System Era Softworks	\N	system-era-softworks	[]	2020-12-14 19:34:13.800791+00	2020-12-14 19:34:13.800813+00
8	Masaya (1991–1994)	\N	masaya-19911994	[]	2020-12-14 19:34:13.898348+00	2020-12-14 19:34:13.898385+00
9	Tradewest (1991–1994)	\N	tradewest-19911994	[]	2020-12-14 19:34:13.904463+00	2020-12-14 19:34:13.904487+00
10	Electronic Arts (Arcade)	\N	electronic-arts-arcade	[]	2020-12-14 19:34:13.913267+00	2020-12-14 19:34:13.913291+00
11	Xbox Game Studios (2019–present)	\N	xbox-game-studios-2019present	[]	2020-12-14 19:34:13.919291+00	2020-12-14 19:34:13.919313+00
14	WW: Pearl Abyss[a]	\N	ww-pearl-abyssa	[]	2020-12-14 19:38:23.15513+00	2020-12-14 19:38:23.155146+00
15	NA/EU: Kakao Games	\N	naeu-kakao-games	[]	2020-12-14 19:38:23.16093+00	2020-12-14 19:38:23.160946+00
16	SA: Red Fox Games	\N	sa-red-fox-games	[]	2020-12-14 19:38:23.167401+00	2020-12-14 19:38:23.167419+00
17	Headup Games	\N	headup-games	[]	2020-12-17 19:51:04.751569+00	2020-12-17 19:51:04.751595+00
69	Jackbox Games	\N	jackbox-games	[]	2020-12-17 19:51:11.41647+00	2020-12-17 19:51:11.416497+00
19	11 Bit Studios	\N	11-bit-studios	[]	2020-12-17 19:51:05.120811+00	2020-12-17 19:51:05.120855+00
20	SMG Studio	\N	smg-studio	[]	2020-12-17 19:51:05.191036+00	2020-12-17 19:51:05.19107+00
88	Gearbox Publishing	\N	gearbox-publishing	[]	2020-12-17 19:51:14.542428+00	2020-12-21 16:12:05.296263+00
21	Amplitude Studio	\N	amplitude-studio	[]	2020-12-17 19:51:05.325893+00	2020-12-17 19:51:05.325929+00
23	(current)	\N	current	[]	2020-12-17 19:51:05.405257+00	2020-12-17 19:51:05.405298+00
24	Motion Twin	\N	motion-twin	[]	2020-12-17 19:51:05.40884+00	2020-12-17 19:51:05.408864+00
25	Playdigious[a]	\N	playdigiousa	[]	2020-12-17 19:51:05.480063+00	2020-12-17 19:51:05.480083+00
29	THQ Wireless (iOS)	\N	thq-wireless-ios	[]	2020-12-17 19:51:05.89811+00	2020-12-17 19:51:05.898133+00
30	THQ (Wii)	\N	thq-wii	[]	2020-12-17 19:51:06.010272+00	2020-12-17 19:51:06.010309+00
31	THQ Nordic (PC PS4 Xbox One Nintendo Switch)	\N	thq-nordic-pc-ps4-xbox-one-nintendo-switch	[]	2020-12-17 19:51:06.05743+00	2020-12-17 19:51:06.057469+00
33	JP: Spike Chunsoft	\N	jp-spike-chunsoft	[]	2020-12-17 19:51:06.355993+00	2020-12-17 19:51:06.356015+00
34	DrinkBox Studios	\N	drinkbox-studios	[]	2020-12-17 19:51:06.390575+00	2020-12-17 19:51:06.390598+00
36	No More Robots	\N	no-more-robots	[]	2020-12-17 19:51:06.930484+00	2020-12-17 19:51:06.930505+00
38	Playism	\N	playism	[]	2020-12-17 19:51:07.360221+00	2020-12-17 19:51:07.360239+00
39	Dangen Entertainment	\N	dangen-entertainment	[]	2020-12-17 19:51:07.532215+00	2020-12-17 19:51:07.532239+00
81	Panic	\N	panic	[]	2020-12-17 19:51:13.867339+00	2020-12-17 19:51:13.867363+00
40	Astragon (2008-present)	\N	astragon-2008-present	[]	2020-12-17 19:51:07.702989+00	2020-12-17 19:51:07.703007+00
41	Focus Home Interactive (2013-present)	\N	focus-home-interactive-2013-present	[]	2020-12-17 19:51:07.773339+00	2020-12-17 19:51:07.77336+00
43	Excalibur Publishing (2008-2012)[citation needed]	\N	excalibur-publishing-2008-2012citation-needed	[]	2020-12-17 19:51:07.868666+00	2020-12-17 19:51:07.868683+00
70	Excalibur Publishing	\N	excalibur-publishing	[]	2020-12-17 19:51:12.063897+00	2020-12-17 19:51:12.06392+00
44	Perfect World Entertainment	\N	perfect-world-entertainment	[]	2020-12-17 19:51:08.023228+00	2020-12-17 19:51:08.023245+00
45	WW: Microsoft Studios	\N	ww-microsoft-studios	[]	2020-12-17 19:51:08.034418+00	2020-12-17 19:51:08.034447+00
46	Funcom	\N	funcom	[]	2020-12-17 19:51:08.041336+00	2020-12-17 19:51:08.041366+00
47	Coffee Stain Studios	\N	coffee-stain-studios	[]	2020-12-17 19:51:08.083851+00	2020-12-17 19:51:08.083875+00
48	WW: Playful Studios	\N	ww-playful-studios	[]	2020-12-17 19:51:08.120385+00	2020-12-17 19:51:08.120406+00
49	Ninja Theory	\N	ninja-theory	[]	2020-12-17 19:51:08.135138+00	2020-12-17 19:51:08.135156+00
50	Double Eleven (consoles)	\N	double-eleven-consoles	[]	2020-12-17 19:51:08.175215+00	2020-12-17 19:51:08.175245+00
12	Night School Studio	\N	night-school-studio	[]	2020-12-14 19:38:23.018521+00	2020-12-17 19:51:08.837287+00
53	nWay	\N	nway	[]	2020-12-17 19:51:08.946083+00	2020-12-17 19:51:08.946098+00
54	Iam8bit (Switch)	\N	iam8bit-switch	[]	2020-12-17 19:51:08.964497+00	2020-12-17 19:51:08.964515+00
13	Lionsgate Games	\N	lionsgate-games	[]	2020-12-14 19:38:23.153904+00	2020-12-17 19:51:09.004938+00
55	Limited Run Games	\N	limited-run-games	[]	2020-12-17 19:51:09.038237+00	2020-12-17 19:51:09.03826+00
83	Emote Games (2009)	\N	emote-games-2009	[]	2020-12-17 19:51:14.014473+00	2020-12-17 19:51:14.014496+00
56	(PC)	\N	pc	[]	2020-12-17 19:51:09.41395+00	2020-12-17 19:51:09.414012+00
3	Paradox Interactive	\N	paradox-interactive	[]	2020-12-13 04:35:52.880902+00	2020-12-18 16:36:45.652573+00
58	(	\N		[]	2020-12-17 19:51:09.509972+00	2020-12-17 19:51:09.51003+00
59	Koch Media	\N	koch-media	[]	2020-12-17 19:51:09.555021+00	2020-12-17 19:51:09.555044+00
62	THQ	\N	thq	[]	2020-12-17 19:51:10.828252+00	2020-12-17 19:51:10.828274+00
63	Deep Silver (Redux Edition)	\N	deep-silver-redux-edition	[]	2020-12-17 19:51:10.865797+00	2020-12-17 19:51:10.86582+00
64	Hello Games	\N	hello-games	[]	2020-12-17 19:51:10.989236+00	2020-12-17 19:51:10.989256+00
18	tinyBuild	\N	tinybuild	[]	2020-12-17 19:51:04.954704+00	2020-12-17 19:51:11.045884+00
65	The Voxel Agents	\N	the-voxel-agents	[]	2020-12-17 19:51:11.2248+00	2020-12-17 19:51:11.224839+00
67	Shin'en Multimedia	\N	shinen-multimedia	[]	2020-12-17 19:51:11.291705+00	2020-12-17 19:51:11.291734+00
85	Avalanche Studios (2015)	\N	avalanche-studios-2015	[]	2020-12-17 19:51:14.155787+00	2020-12-17 19:51:14.155805+00
77	CD Projekt	\N	cd-projekt	[]	2020-12-17 19:51:13.296196+00	2020-12-20 04:21:11.415431+00
82	Telltale Games	\N	telltale-games	[]	2020-12-17 19:51:13.903092+00	2020-12-18 16:36:44.974878+00
72	Landfall Games	\N	landfall-games	[]	2020-12-17 19:51:12.51153+00	2020-12-17 19:51:12.511573+00
73	Dotemu	\N	dotemu	[]	2020-12-17 19:51:12.675598+00	2020-12-17 19:51:12.67562+00
68	Humble Bundle	\N	humble-bundle	[]	2020-12-17 19:51:11.353401+00	2020-12-18 16:36:42.601369+00
74	Dovetail Games	\N	dovetail-games	[]	2020-12-17 19:51:12.74375+00	2020-12-17 19:51:12.743774+00
75	Unknown Worlds Entertainment	\N	unknown-worlds-entertainment	[]	2020-12-17 19:51:12.75328+00	2020-12-17 19:51:12.753301+00
76	Private Division	\N	private-division	[]	2020-12-17 19:51:12.998502+00	2020-12-17 19:51:12.998523+00
84	Bethesda Softworks	\N	bethesda-softworks	[]	2020-12-17 19:51:14.065892+00	2020-12-21 16:12:09.78846+00
78	Bitmap Bureau	\N	bitmap-bureau	[]	2020-12-17 19:51:13.484162+00	2020-12-17 19:51:13.48418+00
79	Hinterland Studio	\N	hinterland-studio	[]	2020-12-17 19:51:13.518705+00	2020-12-17 19:51:13.518731+00
87	Expansive Worlds (2015–present)	\N	expansive-worlds-2015present	[]	2020-12-17 19:51:14.284684+00	2020-12-17 19:51:14.284706+00
90	[b]	\N	b	[]	2020-12-17 20:06:19.258239+00	2020-12-20 04:21:11.439516+00
37	Microsoft Studios	\N	microsoft-studios	[]	2020-12-17 19:51:07.35813+00	2020-12-18 16:36:44.209567+00
5	Warner Bros. Interactive Entertainment	\N	warner-bros-interactive-entertainment	[]	2020-12-14 15:15:18.272557+00	2020-12-21 16:12:05.476005+00
91	iam8bit	\N	iam8bit	[]	2020-12-17 20:06:20.584111+00	2020-12-17 20:06:20.584135+00
89	Curve Digital	\N	curve-digital	[]	2020-12-17 20:06:19.190697+00	2020-12-17 20:06:19.190721+00
66	Thunder Lotus Games	\N	thunder-lotus-games	[]	2020-12-17 19:51:11.262565+00	2020-12-21 16:12:06.626385+00
32	Team17	\N	team17	[]	2020-12-17 19:51:06.153802+00	2020-12-21 20:10:28.284469+00
93	(Nintendo Switch)	\N	nintendo-switch	[]	2020-12-17 20:06:20.691464+00	2020-12-17 20:06:20.691483+00
28	Codemasters	\N	codemasters	[]	2020-12-17 19:51:05.882192+00	2020-12-20 04:21:10.327071+00
57	Ravenscourt	\N	ravenscourt	[]	2020-12-17 19:51:09.462837+00	2020-12-18 16:36:43.538887+00
22	Sega	\N	sega	[]	2020-12-17 19:51:05.353668+00	2020-12-21 19:56:04.844534+00
27	Wired Productions	\N	wired-productions	[]	2020-12-17 19:51:05.858922+00	2020-12-21 19:56:04.21917+00
52	Xbox Game Studios	\N	xbox-game-studios	[]	2020-12-17 19:51:08.935469+00	2020-12-18 16:36:45.457233+00
51	Capcom	\N	capcom	[]	2020-12-17 19:51:08.201444+00	2020-12-18 16:36:45.768364+00
80	Rebellion Developments	\N	rebellion-developments	[]	2020-12-17 19:51:13.53547+00	2020-12-21 16:12:07.191988+00
1	Devolver Digital	\N	devolver-digital	[]	2020-12-13 03:29:47.286409+00	2020-12-21 16:12:05.890246+00
6	THQ Nordic	\N	thq-nordic	[]	2020-12-14 15:16:09.411796+00	2020-12-21 16:12:06.104909+00
94	Square Enix	\N	square-enix	[]	2020-12-17 20:06:20.967236+00	2020-12-21 16:12:10.455841+00
26	505 Games	\N	505-games	[]	2020-12-17 19:51:05.553908+00	2020-12-21 20:10:28.823448+00
2	Focus Home Interactive	\N	focus-home-interactive	[]	2020-12-13 03:40:14.618898+00	2020-12-21 19:56:04.31014+00
96	JP/NA: Sega	\N	jpna-sega	[]	2020-12-17 20:06:23.178736+00	2020-12-17 20:06:23.178758+00
97	PAL: Deep Silver	\N	pal-deep-silver	[]	2020-12-17 20:06:23.242839+00	2020-12-17 20:06:23.242863+00
117	Bohemia Interactive	\N	bohemia-interactive	[]	2020-12-18 16:36:42.12007+00	2020-12-18 16:36:42.120093+00
118	Deck13	\N	deck13	[]	2020-12-18 16:36:42.333381+00	2020-12-18 16:36:42.333404+00
191	Croteam Incubator (2019)	\N	croteam-incubator-2019	[]	2020-12-21 16:12:08.245054+00	2020-12-21 16:12:08.2451+00
122	Parabole	\N	parabole	[]	2020-12-18 16:36:43.470633+00	2020-12-18 16:36:43.470659+00
125	Team Cherry	\N	team-cherry	[]	2020-12-18 16:36:43.821913+00	2020-12-18 16:36:43.821932+00
126	Arc System Works	\N	arc-system-works	[]	2020-12-18 16:36:44.134806+00	2020-12-18 16:36:44.134828+00
127	Finji	\N	finji	[]	2020-12-18 16:36:44.584598+00	2020-12-18 16:36:44.58462+00
128	Fullbright	\N	fullbright	[]	2020-12-18 16:36:44.626445+00	2020-12-18 16:36:44.626463+00
129	Fatshark	\N	fatshark	[]	2020-12-18 16:36:44.723054+00	2020-12-18 16:36:44.723072+00
130	Midway Games (1994–1996 Arcade)	\N	midway-games-19941996-arcade	[]	2020-12-18 16:36:44.81271+00	2020-12-18 16:36:44.812731+00
132	Nintendo (1994–1996 console)	\N	nintendo-19941996-console	[]	2020-12-18 16:36:44.879472+00	2020-12-18 16:36:44.879492+00
133	Microsoft Studios (2013–present)	\N	microsoft-studios-2013present	[]	2020-12-18 16:36:44.949834+00	2020-12-18 16:36:44.949879+00
135	Versus Evil (Switch)	\N	versus-evil-switch	[]	2020-12-18 16:36:45.069207+00	2020-12-18 16:36:45.069233+00
136	Mad Dog Games	\N	mad-dog-games	[]	2020-12-18 16:36:45.711164+00	2020-12-18 16:36:45.711182+00
121	TW: Game Source Entertainment [zh]	\N	tw-game-source-entertainment-zh	[]	2020-12-18 16:36:43.330757+00	2020-12-21 16:12:09.383518+00
143	Modus Games	\N	modus-games	[]	2020-12-20 04:10:34.245433+00	2020-12-20 04:10:34.245454+00
144	Maximum Games	\N	maximum-games	[]	2020-12-20 04:10:34.251755+00	2020-12-20 04:10:34.251779+00
145	Koei Tecmo	\N	koei-tecmo	[]	2020-12-20 04:10:34.360902+00	2020-12-20 04:10:34.360924+00
147	Larian Studios	\N	larian-studios	[]	2020-12-20 04:10:34.840624+00	2020-12-20 04:10:34.840643+00
150	Matt Makes Games	\N	matt-makes-games	[]	2020-12-20 04:10:35.319861+00	2020-12-20 04:10:35.319883+00
151	Midway Home Entertainment	\N	midway-home-entertainment	[]	2020-12-20 04:21:06.971887+00	2020-12-20 04:21:06.971901+00
152	Bethesda Softworks(re-release)	\N	bethesda-softworksre-release	[]	2020-12-20 04:21:06.977776+00	2020-12-20 04:21:06.977796+00
169	Superhot Team	\N	superhot-team	[]	2020-12-21 16:11:59.040851+00	2020-12-21 16:11:59.040873+00
192	JP: FromSoftware	\N	jp-fromsoftware	[]	2020-12-21 16:12:08.352551+00	2020-12-21 16:12:08.352585+00
157	EA Sports	\N	ea-sports	[]	2020-12-20 04:21:10.190923+00	2020-12-21 16:12:03.237326+00
153	Rockfish Games	\N	rockfish-games	[]	2020-12-20 04:21:08.667422+00	2020-12-20 04:21:08.667442+00
193	Rockstar Games	\N	rockstar-games	[]	2020-12-21 16:12:08.408756+00	2020-12-21 16:12:08.408782+00
155	Activision (2017–2018)	\N	activision-20172018	[]	2020-12-20 04:21:09.994236+00	2020-12-20 04:21:09.994259+00
156	Bungie (2019–present)	\N	bungie-2019present	[]	2020-12-20 04:21:10.076568+00	2020-12-20 04:21:10.076587+00
170	Milestone srl	\N	milestone-srl	[]	2020-12-21 16:12:03.662168+00	2020-12-21 16:12:03.662193+00
154	Bandai Namco Entertainment	\N	bandai-namco-entertainment	[]	2020-12-20 04:21:09.434442+00	2020-12-21 16:12:03.712864+00
158	GameTek	\N	gametek	[]	2020-12-20 04:21:10.525311+00	2020-12-20 04:21:10.525348+00
159	IO Interactive	\N	io-interactive	[]	2020-12-20 04:21:10.546817+00	2020-12-20 04:21:10.546838+00
160	[3]	\N	3	[]	2020-12-20 04:21:10.632798+00	2020-12-20 04:21:10.632821+00
162	Hasbro Interactive	\N	hasbro-interactive	[]	2020-12-20 04:21:10.708769+00	2020-12-20 04:21:10.708791+00
163	Berzerk Studio	\N	berzerk-studio	[]	2020-12-20 04:21:10.732963+00	2020-12-20 04:21:10.732985+00
165	(United Kingdom)	\N	united-kingdom	[]	2020-12-20 04:21:10.89619+00	2020-12-20 04:21:10.896212+00
166	Global Star Software	\N	global-star-software	[]	2020-12-20 04:21:10.953566+00	2020-12-20 04:21:10.953582+00
167	Subset Games	\N	subset-games	[]	2020-12-20 04:21:11.004473+00	2020-12-20 04:21:11.004491+00
171	Robot Entertainment and	\N	robot-entertainment-and	[]	2020-12-21 16:12:03.952319+00	2020-12-21 16:12:03.952337+00
172	FDG Entertainment	\N	fdg-entertainment	[]	2020-12-21 16:12:04.011143+00	2020-12-21 16:12:04.01116+00
168	Mobliss	\N	mobliss	[]	2020-12-20 04:21:11.084948+00	2020-12-20 04:21:11.084965+00
173	Google	\N	google	[]	2020-12-21 16:12:04.056424+00	2020-12-21 16:12:04.056448+00
200	NA: Midway Games	\N	na-midway-games	[]	2020-12-21 16:12:09.70225+00	2020-12-21 16:12:09.702272+00
131	Microsoft Game Studios	\N	microsoft-game-studios	[]	2020-12-18 16:36:44.869479+00	2020-12-21 16:12:08.684773+00
176	Snapshot Games	\N	snapshot-games	[]	2020-12-21 16:12:04.766907+00	2020-12-21 16:12:04.76693+00
195	(XBLA)	\N	xbla	[]	2020-12-21 16:12:08.742038+00	2020-12-21 16:12:08.742061+00
196	Gameloft	\N	gameloft	[]	2020-12-21 16:12:08.784255+00	2020-12-21 16:12:08.784274+00
86	Deep Silver	\N	deep-silver	[]	2020-12-17 19:51:14.275061+00	2020-12-21 16:12:05.128122+00
197	Asymmetric Publications	\N	asymmetric-publications	[]	2020-12-21 16:12:08.81698+00	2020-12-21 16:12:08.817003+00
119	JP: Game Source Entertainment [zh]	\N	jp-game-source-entertainment-zh	[]	2020-12-18 16:36:43.129097+00	2020-12-21 16:12:09.32151+00
177	Forever Entertainment (remake)	\N	forever-entertainment-remake	[]	2020-12-21 16:12:05.258159+00	2020-12-21 16:12:05.258178+00
178	NA: GungHo Online Entertainment[1]	\N	na-gungho-online-entertainment1	[]	2020-12-21 16:12:05.428161+00	2020-12-21 16:12:05.428179+00
179	PAL: NIS America	\N	pal-nis-america	[]	2020-12-21 16:12:05.46728+00	2020-12-21 16:12:05.467297+00
148	2K Games	\N	2k-games	[]	2020-12-20 04:10:35.019245+00	2020-12-21 16:12:05.622186+00
120	HK: Game Source Entertainment [zh]	\N	hk-game-source-entertainment-zh	[]	2020-12-18 16:36:43.225961+00	2020-12-21 16:12:09.349577+00
180	JP: SNK Corporation	\N	jp-snk-corporation	[]	2020-12-21 16:12:06.759023+00	2020-12-21 16:12:06.759041+00
183	(retail)	\N	retail	[]	2020-12-21 16:12:07.201353+00	2020-12-21 16:12:07.201376+00
184	Drool	\N	drool	[]	2020-12-21 16:12:07.202428+00	2020-12-21 16:12:07.202442+00
185	Electronic Arts	\N	electronic-arts	[]	2020-12-21 16:12:07.397978+00	2020-12-21 16:12:07.398021+00
98	[a]	\N	a	[]	2020-12-17 20:06:23.875964+00	2020-12-21 16:12:07.761752+00
186	Gathering of Developers (2001–2002)	\N	gathering-of-developers-20012002	[]	2020-12-21 16:12:07.856061+00	2020-12-21 16:12:07.856093+00
187	Global Star Software (2001 2004)	\N	global-star-software-2001-2004	[]	2020-12-21 16:12:07.909691+00	2020-12-21 16:12:07.909733+00
188	Gotham Games (2002)	\N	gotham-games-2002	[]	2020-12-21 16:12:07.963954+00	2020-12-21 16:12:07.96398+00
189	2K Games (2005)	\N	2k-games-2005	[]	2020-12-21 16:12:08.132408+00	2020-12-21 16:12:08.132433+00
190	Devolver Digital (2009–present)	\N	devolver-digital-2009present	[]	2020-12-21 16:12:08.201324+00	2020-12-21 16:12:08.201349+00
174	2K Sports	\N	2k-sports	[]	2020-12-21 16:12:04.093881+00	2020-12-21 16:12:08.877124+00
198	(Xbox One PS4 Nintendo Switch Windows Stadia)	\N	xbox-one-ps4-nintendo-switch-windows-stadia	[]	2020-12-21 16:12:08.878636+00	2020-12-21 16:12:08.878654+00
164	Infogrames	\N	infogrames	[]	2020-12-20 04:21:10.827923+00	2020-12-21 17:02:30.246915+00
199	JP: Namco	\N	jp-namco	[]	2020-12-21 16:12:09.661062+00	2020-12-21 16:12:09.661083+00
201	Bigben Interactive	\N	bigben-interactive	[]	2020-12-21 17:02:30.259049+00	2020-12-21 17:02:30.259094+00
202	(remake)	\N	remake	[]	2020-12-21 17:02:30.268596+00	2020-12-21 17:02:30.268631+00
146	Ubisoft	\N	ubisoft	[]	2020-12-20 04:10:34.693995+00	2020-12-21 16:12:10.031928+00
203	Big Ant Studios	\N	big-ant-studios	[]	2020-12-21 19:56:02.142334+00	2020-12-21 19:56:02.142362+00
205	Vertigo Gaming	\N	vertigo-gaming	[]	2020-12-21 19:56:02.21669+00	2020-12-21 19:56:02.216715+00
206	SeithCG	\N	seithcg	[]	2020-12-21 19:56:02.332417+00	2020-12-21 19:56:02.33244+00
181	Image & Form	\N	image-form	[]	2020-12-21 16:12:07.003342+00	2020-12-21 19:56:04.108454+00
207	Flying Wild Hog	\N	flying-wild-hog	[]	2020-12-21 19:56:02.557698+00	2020-12-21 19:56:02.557722+00
208	Gambitious Digital Entertainment (Redux)	\N	gambitious-digital-entertainment-redux	[]	2020-12-21 19:56:02.59027+00	2020-12-21 19:56:02.590295+00
209	JP: Bandai	\N	jp-bandai	[]	2020-12-21 19:56:02.852662+00	2020-12-21 19:56:02.852699+00
210	NA: Ubisoft	\N	na-ubisoft	[]	2020-12-21 19:56:02.896012+00	2020-12-21 19:56:02.896038+00
194	Konami	\N	konami	[]	2020-12-21 16:12:08.6625+00	2020-12-21 20:10:29.104547+00
182	Rising Star Games	\N	rising-star-games	[]	2020-12-21 16:12:07.088668+00	2020-12-21 20:10:28.39033+00
161	[1]	\N	1	[]	2020-12-20 04:21:10.673782+00	2020-12-21 20:10:28.670996+00
211	Kalypso Media	\N	kalypso-media	[]	2020-12-21 19:56:04.020235+00	2020-12-21 19:56:04.020259+00
213	(console)	\N	console	[]	2020-12-21 19:56:04.106671+00	2020-12-21 19:56:04.106693+00
214	EuroVideo Medien	\N	eurovideo-medien	[]	2020-12-21 19:56:04.148463+00	2020-12-21 19:56:04.148489+00
215	JP: Nihon Falcom[b]	\N	jp-nihon-falcomb	[]	2020-12-21 19:56:04.25089+00	2020-12-21 19:56:04.250914+00
216	(Switch)	\N	switch	[]	2020-12-21 19:56:04.286905+00	2020-12-21 19:56:04.286927+00
217	WW: NIS America	\N	ww-nis-america	[]	2020-12-21 19:56:04.312695+00	2020-12-21 19:56:04.312717+00
218	Tequila Works	\N	tequila-works	[]	2020-12-21 19:56:04.505837+00	2020-12-21 19:56:04.505871+00
219	Bifrost Entertainment	\N	bifrost-entertainment	[]	2020-12-21 20:10:27.829399+00	2020-12-21 20:10:27.829422+00
220	NA: Rising Star Games[a]	\N	na-rising-star-gamesa	[]	2020-12-21 20:10:28.024337+00	2020-12-21 20:10:28.024357+00
221	34BigThings	\N	34bigthings	[]	2020-12-21 20:10:28.074974+00	2020-12-21 20:10:28.074996+00
222	EU: Nintendo	\N	eu-nintendo	[]	2020-12-21 20:10:28.075641+00	2020-12-21 20:10:28.075658+00
223	Nicalis	\N	nicalis	[]	2020-12-21 20:10:28.11495+00	2020-12-21 20:10:28.114982+00
224	Cyan Worlds	\N	cyan-worlds	[]	2020-12-21 20:10:28.235784+00	2020-12-21 20:10:28.2358+00
204	Daedalic Entertainment	\N	daedalic-entertainment	[]	2020-12-21 19:56:02.185961+00	2020-12-21 20:10:28.339836+00
225	[note 2]	\N	note-2	[]	2020-12-21 20:10:28.422653+00	2020-12-21 20:10:28.42267+00
212	WayForward Technologies	\N	wayforward-technologies	[]	2020-12-21 19:56:04.060197+00	2020-12-21 20:10:28.450843+00
226	Xseed Games	\N	xseed-games	[]	2020-12-21 20:10:28.476798+00	2020-12-21 20:10:28.476816+00
227	Oizumi Amuzio Inc.	\N	oizumi-amuzio-inc	[]	2020-12-21 20:10:28.47805+00	2020-12-21 20:10:28.478083+00
228	Grey Box	\N	grey-box	[]	2020-12-21 20:10:28.481032+00	2020-12-21 20:10:28.481049+00
229	[note 1]	\N	note-1	[]	2020-12-21 20:10:28.558466+00	2020-12-21 20:10:28.5585+00
230	Six Foot	\N	six-foot	[]	2020-12-21 20:10:28.572071+00	2020-12-21 20:10:28.572103+00
231	[note 3]	\N	note-3	[]	2020-12-21 20:10:28.57504+00	2020-12-21 20:10:28.575063+00
232	Pqube Games	\N	pqube-games	[]	2020-12-21 20:10:28.662205+00	2020-12-21 20:10:28.662237+00
234	NA/EU: Activision (C64/CPC/ZX)	\N	naeu-activision-c64cpczx	[]	2020-12-21 20:10:28.800493+00	2020-12-21 20:10:28.800547+00
235	EU: Hit Squad (ZX)	\N	eu-hit-squad-zx	[]	2020-12-21 20:10:28.828291+00	2020-12-21 20:10:28.828317+00
236	WB Games	\N	wb-games	[]	2021-02-04 19:58:34.118248+00	2021-02-04 19:58:34.118291+00
237	Sega Europe	\N	sega-europe	[]	2021-02-04 19:58:37.593157+00	2021-02-04 19:58:37.593182+00
239	Unit 2 Games	\N	unit-2-games	[]	2021-02-05 16:53:49.129859+00	2021-02-05 16:53:49.129883+00
240	Zeboyd Digital Entertainment	\N	zeboyd-digital-entertainment	[]	2021-02-05 16:53:50.033652+00	2021-02-05 16:53:50.033678+00
241	Necrosoft Games	\N	necrosoft-games	[]	2021-02-05 16:53:51.837227+00	2021-02-05 16:53:51.837252+00
242	Herringbone Games	\N	herringbone-games	[]	2021-02-05 16:53:53.226154+00	2021-02-05 16:53:53.226178+00
243	KOEI TECMO GAMES CO	\N	koei-tecmo-games-co	[]	2021-02-05 16:53:53.674154+00	2021-02-05 16:53:53.674189+00
244	GIANTS Software	\N	giants-software	[]	2021-02-05 16:53:54.39391+00	2021-02-05 16:53:54.393958+00
245	Irregular Corp	\N	irregular-corp	[]	2021-02-05 16:53:54.846884+00	2021-02-05 16:53:54.846911+00
246	Funktronic Labs	\N	funktronic-labs	[]	2021-02-05 16:53:54.937567+00	2021-02-05 16:53:54.937592+00
247	Forever Entertainment	\N	forever-entertainment	[]	2021-02-05 16:53:55.197925+00	2021-02-05 16:53:55.197951+00
248	Fishing Cactus	\N	fishing-cactus	[]	2021-02-05 16:53:55.519112+00	2021-02-05 16:53:55.519137+00
249	FromSoftware	\N	fromsoftware	[]	2021-02-05 16:53:55.6905+00	2021-02-05 16:53:55.690537+00
250	CD Projekt Red	\N	cd-projekt-red	[]	2021-02-05 16:53:56.222385+00	2021-02-05 16:53:56.22242+00
251	Chump Squad	\N	chump-squad	[]	2021-02-05 16:53:56.279805+00	2021-02-05 16:53:56.27984+00
252	Bungie	\N	bungie	[]	2021-02-05 16:53:57.180082+00	2021-02-05 16:53:57.180107+00
253	Image and Form	\N	image-and-form	[]	2021-02-05 16:54:01.158475+00	2021-02-05 16:54:01.1585+00
255	2K	\N	2k	[]	2021-02-05 16:54:02.016544+00	2021-02-05 16:54:02.016571+00
258	Coatsink	\N	coatsink	[]	2021-02-05 16:54:02.200413+00	2021-02-05 16:54:02.200455+00
260	Handy Games	\N	handy-games	[]	2021-02-05 16:54:04.469123+00	2021-02-05 16:54:04.469164+00
262	Rebellion	\N	rebellion	[]	2021-02-05 19:17:28.6819+00	2021-02-05 19:17:28.681923+00
266	Stadia Games and Entertainment	\N	stadia-games-and-entertainment	[]	2021-02-05 19:17:30.715564+00	2021-02-05 19:17:30.71559+00
273	BHVR	\N	bhvr	[]	2021-02-05 19:28:17.658453+00	2021-02-05 19:28:17.658477+00
274	Bedtime Digital Games	\N	bedtime-digital-games	[]	2021-02-05 19:28:17.722338+00	2021-02-05 19:28:17.722363+00
275	Big Sugar Games	\N	big-sugar-games	[]	2021-02-05 19:28:17.80236+00	2021-02-05 19:28:17.802404+00
276	SUPERHOT	\N	superhot	[]	2021-02-05 19:28:18.830338+00	2021-02-05 19:28:18.83037+00
278	Berzerk	\N	berzerk	[]	2021-02-05 19:28:18.904589+00	2021-02-05 19:28:18.904615+00
279	Asymmetric	\N	asymmetric	[]	2021-02-05 19:28:19.968951+00	2021-02-05 19:28:19.969023+00
280	Milestone	\N	milestone	[]	2021-02-05 19:28:20.272192+00	2021-02-05 19:28:20.272217+00
283	PUBG Corporation	\N	pubg-corporation	[]	2021-02-05 19:33:02.605536+00	2021-02-05 19:33:02.605571+00
285	Camouflaj Studios	\N	camouflaj-studios	[]	2021-02-05 19:33:07.201008+00	2021-02-05 19:33:07.201038+00
286	Bulkhead Interactive	\N	bulkhead-interactive	[]	2021-02-05 19:33:09.00684+00	2021-02-05 19:33:09.006866+00
287	SNK	\N	snk	[]	2021-02-05 19:41:02.34669+00	2021-02-05 19:41:02.346712+00
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.series (id, name, slug, created_at, updated_at) FROM stdin;
1	Age of Wonders	age-of-wonders	2020-12-13 04:35:52.886328+00	2020-12-13 04:35:52.886344+00
2	Batman: Arkham	batman-arkham	2020-12-14 15:15:18.278107+00	2020-12-14 15:15:18.278125+00
3	Blair Witch	blair-witch	2020-12-14 19:38:23.159355+00	2020-12-14 19:38:23.159376+00
4	Bridge Constructor	bridge-constructor	2020-12-17 19:51:04.785034+00	2020-12-17 19:51:04.785057+00
5	Portal	portal	2020-12-17 19:51:04.826271+00	2020-12-17 19:51:04.826296+00
9	Guacamelee!	guacamelee	2020-12-17 19:51:06.43151+00	2020-12-17 19:51:06.43155+00
10	Dead Island	dead-island	2020-12-17 19:51:06.440478+00	2020-12-17 19:51:06.440551+00
12	Momodora	momodora	2020-12-17 19:51:07.620591+00	2020-12-17 19:51:07.620614+00
13	Marvel vs. Capcom	marvel-vs-capcom	2020-12-17 19:51:08.339054+00	2020-12-17 19:51:08.339079+00
14	Pathologic	pathologic	2020-12-17 19:51:08.881748+00	2020-12-17 19:51:08.881765+00
15	Power Rangers	power-rangers	2020-12-17 19:51:09.119+00	2020-12-17 19:51:09.119021+00
17	Shadow Warrior	shadow-warrior	2020-12-17 19:51:11.640966+00	2020-12-17 19:51:11.641003+00
18	Streets of Rage	streets-of-rage	2020-12-17 19:51:12.79137+00	2020-12-17 19:51:12.791393+00
19	Subnautica	subnautica	2020-12-17 19:51:12.839523+00	2020-12-17 19:51:12.839546+00
23	Worms	worms	2020-12-17 19:51:14.134967+00	2020-12-17 19:51:14.134987+00
24	The Elder Scrolls	the-elder-scrolls	2020-12-17 19:51:14.1595+00	2020-12-17 19:51:14.15954+00
6	Darksiders	darksiders	2020-12-17 19:51:05.043587+00	2020-12-17 20:06:17.568166+00
27	Don't Starve	dont-starve	2020-12-17 20:06:18.931553+00	2020-12-17 20:06:18.931576+00
30	Forza	forza	2020-12-17 20:06:19.257222+00	2020-12-17 20:06:19.257259+00
32	Fallout	fallout	2020-12-17 20:06:19.642162+00	2020-12-17 20:06:19.642187+00
34	Minecraft	minecraft	2020-12-17 20:06:20.19393+00	2020-12-17 20:06:20.193953+00
35	Drakengard	drakengard	2020-12-17 20:06:21.157696+00	2020-12-17 20:06:21.15772+00
26	Wasteland	wasteland	2020-12-17 19:51:14.370319+00	2020-12-17 20:06:23.321641+00
25	Yakuza	yakuza	2020-12-17 19:51:14.338973+00	2020-12-17 20:06:23.468785+00
20	The Witcher	the-witcher	2020-12-17 19:51:13.412568+00	2020-12-17 20:06:23.895478+00
74	Red Dead	red-dead	2020-12-21 16:12:08.503032+00	2020-12-21 16:12:08.503051+00
75	Bomberman	bomberman	2020-12-21 16:12:08.727346+00	2020-12-21 16:12:08.727369+00
36	Crackdown	crackdown	2020-12-18 16:36:43.143011+00	2020-12-18 16:36:43.143032+00
37	Formula One	formula-one	2020-12-18 16:36:43.171222+00	2020-12-18 16:36:43.171245+00
38	Kunio-kun	kunio-kun	2020-12-18 16:36:44.467246+00	2020-12-18 16:36:44.46727+00
39	Warhammer Fantasy	warhammer-fantasy	2020-12-18 16:36:44.797652+00	2020-12-18 16:36:44.797692+00
40	State of Decay	state-of-decay	2020-12-18 16:36:44.907233+00	2020-12-18 16:36:44.907255+00
76	WWE 2K	wwe-2k	2020-12-21 16:12:08.908919+00	2020-12-21 16:12:08.908944+00
28	Halo	halo	2020-12-17 20:06:19.134007+00	2020-12-18 16:36:44.976148+00
22	The Walking Dead	the-walking-dead	2020-12-17 19:51:13.972234+00	2020-12-18 16:36:45.100758+00
42	Resident Evil	resident-evil	2020-12-18 16:36:45.792094+00	2020-12-18 16:36:45.79211+00
11	Gears of War	gears-of-war	2020-12-17 19:51:07.451665+00	2020-12-18 16:41:46.358978+00
43	Attack on Titan	attack-on-titan	2020-12-20 04:10:34.366773+00	2020-12-20 04:10:34.366796+00
45	Baldur's Gate	baldurs-gate	2020-12-20 04:10:34.860131+00	2020-12-20 04:10:34.860153+00
46	Borderlands	borderlands	2020-12-20 04:10:35.042359+00	2020-12-20 04:10:35.04238+00
77	Uno	uno	2020-12-21 16:12:08.923176+00	2020-12-21 16:12:08.923195+00
78	Tom Clancy's Ghost Recon	tom-clancys-ghost-recon	2020-12-21 16:12:08.952463+00	2020-12-21 16:12:08.952497+00
79	Valkyria Chronicles	valkyria-chronicles	2020-12-21 16:12:09.029544+00	2020-12-21 16:12:09.029568+00
44	Assassin's Creed	assassins-creed	2020-12-20 04:10:34.709217+00	2020-12-20 04:21:09.225834+00
48	Destroy All Humans!	destroy-all-humans	2020-12-20 04:21:09.328766+00	2020-12-20 04:21:09.328805+00
49	Football Manager	football-manager	2020-12-20 04:21:09.464493+00	2020-12-20 04:21:09.464509+00
50	Dragon Ball	dragon-ball	2020-12-20 04:21:09.501198+00	2020-12-20 04:21:09.501222+00
8	Dirt	dirt	2020-12-17 19:51:05.920812+00	2020-12-20 04:21:09.523429+00
51	Formula 1	formula-1	2020-12-20 04:21:10.09266+00	2020-12-20 04:21:10.092677+00
53	FIFA	fifa	2020-12-20 04:21:10.267864+00	2020-12-20 04:21:10.267881+00
54	Grid	grid	2020-12-20 04:21:10.377957+00	2020-12-20 04:21:10.377979+00
80	Trials	trials	2020-12-21 16:12:09.075173+00	2020-12-21 16:12:09.075196+00
59	Final Fantasy (main)	final-fantasy-main	2020-12-20 04:21:11.39725+00	2020-12-20 04:21:11.39727+00
60	Fabula Nova Crystallis Final Fantasy (sub)	fabula-nova-crystallis-final-fantasy-sub	2020-12-20 04:21:11.44145+00	2020-12-20 04:21:11.44147+00
61	Cyberpunk	cyberpunk	2020-12-20 04:21:11.472944+00	2020-12-20 04:21:11.472966+00
81	Tom Clancy's	tom-clancys	2020-12-21 16:12:09.125891+00	2020-12-21 16:12:09.125915+00
21	Sniper Elite	sniper-elite	2020-12-17 19:51:13.636538+00	2020-12-21 16:12:09.418818+00
56	Hitman	hitman	2020-12-20 04:21:10.775555+00	2020-12-21 16:12:02.693006+00
52	Far Cry	far-cry	2020-12-20 04:21:10.223844+00	2020-12-21 16:12:02.843162+00
47	Doom	doom	2020-12-20 04:21:06.983269+00	2020-12-21 16:12:02.957846+00
63	Madden NFL	madden-nfl	2020-12-21 16:12:03.31144+00	2020-12-21 16:12:03.311473+00
58	Just Dance	just-dance	2020-12-20 04:21:11.301262+00	2020-12-21 16:12:03.613999+00
64	Wonder Boy	wonder-boy	2020-12-21 16:12:04.068793+00	2020-12-21 16:12:04.068813+00
65	Orcs Must Die!	orcs-must-die	2020-12-21 16:12:04.129967+00	2020-12-21 16:12:04.129988+00
66	NBA 2K	nba-2k	2020-12-21 16:12:04.142328+00	2020-12-21 16:12:04.142349+00
67	Mafia	mafia	2020-12-21 16:12:04.834174+00	2020-12-21 16:12:04.834196+00
16	Metro	metro	2020-12-17 19:51:10.916124+00	2020-12-21 16:12:05.174174+00
68	Panzer Dragoon	panzer-dragoon	2020-12-21 16:12:05.319935+00	2020-12-21 16:12:05.319955+00
41	Mortal Kombat	mortal-kombat	2020-12-18 16:36:45.665335+00	2020-12-21 16:12:05.5042+00
70	Serious Sam	serious-sam	2020-12-21 16:12:05.939288+00	2020-12-21 16:12:05.939311+00
71	SpongeBob SquarePants	spongebob-squarepants	2020-12-21 16:12:06.150752+00	2020-12-21 16:12:06.150773+00
72	Samurai Shodown	samurai-shodown	2020-12-21 16:12:06.81019+00	2020-12-21 16:12:06.810214+00
83	Pac-Man	pac-man	2020-12-21 16:12:09.739538+00	2020-12-21 16:12:09.739561+00
84	Wolfenstein	wolfenstein	2020-12-21 16:12:09.82334+00	2020-12-21 16:12:09.823363+00
85	Watch Dogs	watch-dogs	2020-12-21 16:12:09.915258+00	2020-12-21 16:12:09.915279+00
62	Tomb Raider	tomb-raider	2020-12-21 16:12:03.30766+00	2020-12-21 16:12:10.5053+00
88	AO Tennis	ao-tennis	2020-12-21 19:56:02.157611+00	2020-12-21 19:56:02.157649+00
89	Deponia	deponia	2020-12-21 19:56:02.205299+00	2020-12-21 19:56:02.20545+00
90	Cook Serve Delicious!	cook-serve-delicious	2020-12-21 19:56:02.247104+00	2020-12-21 19:56:02.247126+00
91	Lumines	lumines	2020-12-21 19:56:02.968863+00	2020-12-21 19:56:02.968886+00
92	Rez	rez	2020-12-21 19:56:04.3266+00	2020-12-21 19:56:04.326624+00
93	The Legend of Heroes	the-legend-of-heroes	2020-12-21 19:56:04.347825+00	2020-12-21 19:56:04.347846+00
94	Trails	trails	2020-12-21 19:56:04.447971+00	2020-12-21 19:56:04.447997+00
95	Sonic the Hedgehog	sonic-the-hedgehog	2020-12-21 19:56:04.850802+00	2020-12-21 19:56:04.85082+00
73	SteamWorld	steamworld	2020-12-21 16:12:07.336916+00	2020-12-21 20:10:28.115831+00
96	Shantae	shantae	2020-12-21 20:10:28.731523+00	2020-12-21 20:10:28.731541+00
97	Contra	contra	2020-12-21 20:10:29.115991+00	2020-12-21 20:10:29.116069+00
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.stores (id, name, slug, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: cgdb
--

COPY public.tags (id, tag, slug, created_at) FROM stdin;
1	Absolver	absolver	2020-12-13 02:53:58.862271+00
2	A Plague Tale: Innocence	a-plague-tale-innocence	2020-12-13 03:40:14.604352+00
3	Age of Wonders: Planetfall	age-of-wonders-planetfall	2020-12-13 04:35:52.867355+00
4	Ark: Survival Evolved	ark-survival-evolved	2020-12-13 04:39:08.294795+00
5	Batman: Arkham Knight	batman-arkham-knight	2020-12-14 15:15:18.259802+00
6	Battle Chasers: Nightwar	battle-chasers-nightwar	2020-12-14 15:16:09.398452+00
7	أبليغ تيل: إينوسينس	أبليغ-تيل-إينوسينس	2020-12-14 18:30:44.49949+00
8	افسانه طاعون: اینسنس	افسانه-طاعون-اینسنس	2020-12-14 18:30:44.511516+00
9	플래그 테일: 이노센스	플래그-테일-이노센스	2020-12-14 18:30:44.521245+00
10	ابلاجو تايل: اينوسينس	ابلاجو-تايل-اينوسينس	2020-12-14 18:30:44.529769+00
11	プレイグ テイル -イノセンス-	プレイグ-テイル-イノセンス-	2020-12-14 18:30:44.538153+00
12	อะเพลกเทลอินโนเซนซ์	อะเพลกเทลอนโนเซนซ	2020-12-14 18:30:44.550697+00
13	瘟疫传说：无罪	瘟疫传说无罪	2020-12-14 18:30:44.560471+00
14	瘟疫傳說：無罪	瘟疫傳說無罪	2020-12-14 18:30:44.56638+00
15	أبسولفر	أبسولفر	2020-12-14 18:31:43.609068+00
16	ابسولڤير	ابسولڤير	2020-12-14 18:31:43.622217+00
17	آرك: سرفايفل إفولفد	آرك-سرفايفل-إفولفد	2020-12-14 18:59:17.425121+00
1216	Outcast	outcast	2020-12-21 17:02:30.126164+00
1217	Outcast (videojoc)	outcast-videojoc	2020-12-21 17:02:30.138776+00
1218	Outcast (Computerspiel)	outcast-computerspiel	2020-12-21 17:02:30.152677+00
1219	Outcast (videojuego)	outcast-videojuego	2020-12-21 17:02:30.166047+00
1220	Outcast (jeu vidéo)	outcast-jeu-vidéo	2020-12-21 17:02:30.179882+00
23	아크 서바이벌 이볼브드	아크-서바이벌-이볼브드	2020-12-14 19:21:43.19786+00
24	ارك: سرفايفل افولفد	ارك-سرفايفل-افولفد	2020-12-14 19:21:43.214244+00
1221	Outcast (videogioco)	outcast-videogioco	2020-12-21 17:02:30.193053+00
26	方舟：生存进化	方舟生存进化	2020-12-14 19:21:43.233636+00
1222	Outcast (компьютерная игра)	outcast-компьютерная-игра	2020-12-21 17:02:30.206106+00
1223	Outcast (datorspel)	outcast-datorspel	2020-12-21 17:02:30.22232+00
1353	Epistory - Typing Chronicles	epistory-typing-chronicles	2021-02-05 16:52:18.586141+00
31	Astroneer	astroneer	2020-12-14 19:34:13.743302+00
32	아스트로니어	아스트로니어	2020-12-14 19:34:13.757842+00
33	استرونير	استرونير	2020-12-14 19:34:13.767257+00
34	异星探险家	异星探险家	2020-12-14 19:34:13.784899+00
35	Battletoads	battletoads	2020-12-14 19:34:13.860212+00
36	Battletoads (franquicia)	battletoads-franquicia	2020-12-14 19:34:13.867198+00
37	Battletoads (серия игр)	battletoads-серия-игр	2020-12-14 19:34:13.878206+00
38	باتمان: أركام نايت	باتمان-أركام-نايت	2020-12-14 19:34:13.946839+00
39	بتمن: شوالیه آرکهام	بتمن-شوالیه-آرکهام	2020-12-14 19:34:13.965435+00
40	배트맨: 아캄 나이트	배트맨-아캄-나이트	2020-12-14 19:34:13.974437+00
41	באטמן: ארקהם נייט	באטמן-ארקהם-נייט	2020-12-14 19:34:13.983162+00
42	باتمان: ارخام كنيجت	باتمان-ارخام-كنيجت	2020-12-14 19:34:13.990408+00
43	バットマン アーカム・ナイト	バットマン-アーカムナイト	2020-12-14 19:34:13.99907+00
44	แบทแมน: อาร์คแฮมไนท์	แบทแมน-อารคแฮมไนท	2020-12-14 19:34:14.018134+00
45	蝙蝠侠：阿卡姆骑士	蝙蝠侠阿卡姆骑士	2020-12-14 19:34:14.028185+00
46	蝙蝠俠：阿卡漢騎士	蝙蝠俠阿卡漢騎士	2020-12-14 19:34:14.034534+00
47	Afterparty	afterparty	2020-12-14 19:38:22.99206+00
48	افتيرپارتى	افتيرپارتى	2020-12-14 19:38:22.999947+00
49	Afterparty (игра)	afterparty-игра	2020-12-14 19:38:23.007105+00
50	Black Desert Online	black-desert-online	2020-12-14 19:38:23.078356+00
51	بلاك دزرت	بلاك-دزرت	2020-12-14 19:38:23.087348+00
52	Black Desert	black-desert	2020-12-14 19:38:23.104813+00
53	Blair Witch	blair-witch	2020-12-14 19:38:23.106469+00
54	بلير ويتش	بلير-ويتش	2020-12-14 19:38:23.115954+00
55	검은사막	검은사막	2020-12-14 19:38:23.117109+00
56	Blair Witch (videojuego de 2019)	blair-witch-videojuego-de-2019	2020-12-14 19:38:23.123219+00
57	黒い砂漠 (オンラインゲーム)	黒い砂漠-オンラインゲーム	2020-12-14 19:38:23.124559+00
58	Blair Witch (jeu vidéo)	blair-witch-jeu-vidéo	2020-12-14 19:38:23.131153+00
59	Blair Witch (gra komputerowa 2019)	blair-witch-gra-komputerowa-2019	2020-12-14 19:38:23.139279+00
60	黑色沙漠	黑色沙漠	2020-12-14 19:38:23.142193+00
75	Bridge Constructor Portal	bridge-constructor-portal	2020-12-17 19:51:04.416208+00
76	Bloodstained: Ritual of the Night	bloodstained-ritual-of-the-night	2020-12-17 19:51:04.425227+00
77	بلودستيند: ريتشوال أف ذا نايت	بلودستيند-ريتشوال-أف-ذا-نايت	2020-12-17 19:51:04.541045+00
78	Dead by Daylight	dead-by-daylight	2020-12-17 19:51:04.590814+00
79	بريدج كونستروكتور پورتال	بريدج-كونستروكتور-پورتال	2020-12-17 19:51:04.603707+00
80	ديد باي دايلايت	ديد-باي-دايلايت	2020-12-17 19:51:04.668853+00
81	Darksiders III	darksiders-iii	2020-12-17 19:51:04.678649+00
82	Clustertruck	clustertruck	2020-12-17 19:51:04.682628+00
83	Darksiders Genesis	darksiders-genesis	2020-12-17 19:51:04.689235+00
84	블러드스테인드: 리추얼 오브 더 나이트	블러드스테인드-리추얼-오브-더-나이트	2020-12-17 19:51:04.717983+00
85	Children of Morta	children-of-morta	2020-12-17 19:51:04.719484+00
86	دارکسایدرز ۳	دارکسایدرز-۳	2020-12-17 19:51:04.781599+00
87	Death Squared	death-squared	2020-12-17 19:51:04.793211+00
89	پیدایش دارکسایدرز	پیدایش-دارکسایدرز	2020-12-17 19:51:04.794643+00
88	بلودستايند: ريتول اف ذا نايت	بلودستايند-ريتول-اف-ذا-نايت	2020-12-17 19:51:04.793685+00
90	Dead Cells	dead-cells	2020-12-17 19:51:04.79538+00
94	سلول‌های مرده	سلولهای-مرده	2020-12-17 19:51:04.898595+00
100	ブラッドステインド:リチュアル・オブ・ザ・ナイト	ブラッドステインドリチュアルオブザナイト	2020-12-17 19:51:04.960102+00
105	دايد سيلس	دايد-سيلس	2020-12-17 19:51:05.00727+00
112	死亡細胞	死亡細胞	2020-12-17 19:51:05.16572+00
114	血污：夜之仪式	血污夜之仪式	2020-12-17 19:51:05.342313+00
1224	Deponia Doomsday	deponia-doomsday	2020-12-21 19:56:02.087575+00
1227	Deponia - Il giorno del giudizio	deponia-il-giorno-del-giudizio	2020-12-21 19:56:02.130381+00
1354	TOHU	tohu	2021-02-05 16:52:18.601949+00
91	فرزندان مورتا	فرزندان-مورتا	2020-12-17 19:51:04.811611+00
92	De Blob	de-blob	2020-12-17 19:51:04.850232+00
93	Dirt 4	dirt-4	2020-12-17 19:51:04.894321+00
97	كيلدرين اوف مورتا	كيلدرين-اوف-مورتا	2020-12-17 19:51:04.915901+00
101	ديرت 4	ديرت-4	2020-12-17 19:51:04.96072+00
104	더 블랍: 컬러 레볼루션	더-블랍-컬러-레볼루션	2020-12-17 19:51:04.993538+00
110	دیرت ۴	دیرت-۴	2020-12-17 19:51:05.101039+00
113	د بلوب	د-بلوب	2020-12-17 19:51:05.172873+00
116	ブロブ カラフルなきぼう	ブロブ-カラフルなきぼう	2020-12-17 19:51:05.426393+00
1225	AO Tennis 2	ao-tennis-2	2020-12-21 19:56:02.099452+00
1355	Gods Will Fall	gods-will-fall	2021-02-05 16:52:18.698575+00
95	ロロロロ	ロロロロ	2020-12-17 19:51:04.904992+00
96	Dead Island: Riptide	dead-island-riptide	2020-12-17 19:51:04.909393+00
103	ديد آيلاند: ريبتايد	ديد-آيلاند-ريبتايد	2020-12-17 19:51:04.989169+00
107	㗊	㗊	2020-12-17 19:51:05.017776+00
115	جزیره مرده: آب‌های خروشان	جزیره-مرده-آبهای-خروشان	2020-12-17 19:51:05.350449+00
119	데드 아일랜드 립타이드	데드-아일랜드-립타이드	2020-12-17 19:51:05.60721+00
1226	Brothers: A Tale of Two Sons	brothers-a-tale-of-two-sons	2020-12-21 19:56:02.116086+00
1228	برذرز: أه تايل أوف تو سنز	برذرز-أه-تايل-أوف-تو-سنز	2020-12-21 19:56:02.136522+00
1231	برادرها: افسانه دو پسر	برادرها-افسانه-دو-پسر	2020-12-21 19:56:02.195592+00
1233	ブラザーズ : 2人の息子の物語	ブラザーズ-2人の息子の物語	2020-12-21 19:56:02.315261+00
1356	Lara Croft and the Guardian of Light	lara-croft-and-the-guardian-of-light	2021-02-05 16:52:18.718392+00
98	دد بای دیلایت	دد-بای-دیلایت	2020-12-17 19:51:04.920162+00
108	데드 바이 데이라이트	데드-바이-데이라이트	2020-12-17 19:51:05.048295+00
118	黎明殺機	黎明殺機	2020-12-17 19:51:05.598661+00
122	黎明杀机	黎明杀机	2020-12-17 19:51:05.728352+00
127	黎明杀机 (游戏)	黎明杀机-游戏	2020-12-17 19:51:05.834218+00
1229	Cook, Serve, Delicious! 3	cook-serve-delicious-3	2020-12-21 19:56:02.143112+00
1357	Reigns	reigns	2021-02-05 16:52:18.790634+00
99	داركسيديرس اى (فيديو لعب)	داركسيديرس-اى-فيديو-لعب	2020-12-17 19:51:04.945906+00
102	Dungeon of the Endless	dungeon-of-the-endless	2020-12-17 19:51:04.98484+00
106	Don't Starve	dont-starve	2020-12-17 19:51:05.010899+00
109	دونت ستارف	دونت-ستارف	2020-12-17 19:51:05.081344+00
111	末世騎士III	末世騎士iii	2020-12-17 19:51:05.113017+00
117	Fallout 76	fallout-76	2020-12-17 19:51:05.571886+00
120	돈 스타브	돈-스타브	2020-12-17 19:51:05.609141+00
121	Farming Simulator	farming-simulator	2020-12-17 19:51:05.634188+00
123	فول أوت 76	فول-أوت-76	2020-12-17 19:51:05.732561+00
124	Fractured Minds	fractured-minds	2020-12-17 19:51:05.735665+00
125	Gears of War 4	gears-of-war-4	2020-12-17 19:51:05.77236+00
126	Forza Horizon 4	forza-horizon-4	2020-12-17 19:51:05.825905+00
128	جيرز أوف وور 4	جيرز-أوف-وور-4	2020-12-17 19:51:05.872342+00
129	Landwirtschafts-Simulator	landwirtschafts-simulator	2020-12-17 19:51:05.880264+00
130	فورزا هوريزون 4	فورزا-هوريزون-4	2020-12-17 19:51:05.914438+00
131	Fallout76	fallout76	2020-12-17 19:51:05.918143+00
132	Golf with Your Friends	golf-with-your-friends	2020-12-17 19:51:05.993586+00
133	Goat Simulator	goat-simulator	2020-12-17 19:51:06.006212+00
134	Guacamelee! 2	guacamelee-2	2020-12-17 19:51:06.065096+00
135	Gears 5	gears-5	2020-12-17 19:51:06.071787+00
136	Gato Roboto	gato-roboto	2020-12-17 19:51:06.102683+00
137	Halo 5: Guardians	halo-5-guardians	2020-12-17 19:51:06.16165+00
138	غوت سميولايتر	غوت-سميولايتر	2020-12-17 19:51:06.165138+00
139	غيرز 5	غيرز-5	2020-12-17 19:51:06.189428+00
140	Halo Wars 2	halo-wars-2	2020-12-17 19:51:06.20624+00
141	กัวกาเมเลเอ! 2	กวกาเมเลเอ-2	2020-12-17 19:51:06.228649+00
142	فال‌اوت ۷۶	فالاوت-۷۶	2020-12-17 19:51:06.255592+00
143	Hello Neighbor	hello-neighbor	2020-12-17 19:51:06.286659+00
144	파밍 시뮬레이터	파밍-시뮬레이터	2020-12-17 19:51:06.352891+00
145	Hellblade: Senua's Sacrifice	hellblade-senuas-sacrifice	2020-12-17 19:51:06.359603+00
146	چرخ‌دنده‌های جنگ ۴	چرخدندههای-جنگ-۴	2020-12-17 19:51:06.371331+00
147	فورتزا هورایزن ۴	فورتزا-هورایزن-۴	2020-12-17 19:51:06.372569+00
148	Halo: Spartan Assault	halo-spartan-assault	2020-12-17 19:51:06.392511+00
149	هيلو 5: غارديانز	هيلو-5-غارديانز	2020-12-17 19:51:06.402633+00
150	هالو وارز 2	هالو-وارز-2	2020-12-17 19:51:06.409969+00
151	Journey to the Savage Planet	journey-to-the-savage-planet	2020-12-17 19:51:06.450746+00
152	Halo: The Master Chief Collection	halo-the-master-chief-collection	2020-12-17 19:51:06.454243+00
153	饥荒 (游戏)	饥荒-游戏	2020-12-17 19:51:06.463376+00
154	هالو نيبور	هالو-نيبور	2020-12-17 19:51:06.500538+00
155	هيلو: سبارتن أسلت	هيلو-سبارتن-أسلت	2020-12-17 19:51:06.539271+00
156	Hypnospace Outlaw	hypnospace-outlaw	2020-12-17 19:51:06.540296+00
157	هيل بليد: سنواز سكريفايس	هيل-بليد-سنواز-سكريفايس	2020-12-17 19:51:06.541207+00
158	폴아웃 76	폴아웃-76	2020-12-17 19:51:06.542386+00
159	포르자 호라이즌 4	포르자-호라이즌-4	2020-12-17 19:51:06.594801+00
160	چرخ‌دنده‌های ۵	چرخدندههای-۵	2020-12-17 19:51:06.617686+00
161	Marvel vs. Capcom: Infinite	marvel-vs-capcom-infinite	2020-12-17 19:51:06.661855+00
162	Human: Fall Flat	human-fall-flat	2020-12-17 19:51:06.670024+00
163	저니 투 더 새비지 플래닛	저니-투-더-새비지-플래닛	2020-12-17 19:51:06.678693+00
164	هیلو: مجموعه مستر چیف	هیلو-مجموعه-مستر-چیف	2020-12-17 19:51:06.687771+00
165	نبردهای هیلو ۲	نبردهای-هیلو-۲	2020-12-17 19:51:06.723887+00
166	고트 시뮬레이터	고트-시뮬레이터	2020-12-17 19:51:06.743656+00
167	هیلو ۵: نگهبانان	هیلو-۵-نگهبانان	2020-12-17 19:51:06.789897+00
168	مارفل فيرسز كابكوم: إنفنيت	مارفل-فيرسز-كابكوم-إنفنيت	2020-12-17 19:51:06.825295+00
169	هيومن: فول فلات	هيومن-فول-فلات	2020-12-17 19:51:06.826462+00
170	هیلو: حمله اسپارتان	هیلو-حمله-اسپارتان	2020-12-17 19:51:06.847607+00
171	هل‌بلید: پیشکش سنوئا	هلبلید-پیشکش-سنوئا	2020-12-17 19:51:06.858428+00
172	Middle-earth: Shadow of War	middle-earth-shadow-of-war	2020-12-17 19:51:06.862283+00
173	기어스 5	기어스-5	2020-12-17 19:51:06.872841+00
174	Momodora: Reverie Under the Moonlight	momodora-reverie-under-the-moonlight	2020-12-17 19:51:06.879571+00
175	헤일로: 마스터 치프 콜렉션	헤일로-마스터-치프-콜렉션	2020-12-17 19:51:06.881364+00
176	فول اوت 76	فول-اوت-76	2020-12-17 19:51:06.923761+00
177	휴먼: 폴 플랫	휴먼-폴-플랫	2020-12-17 19:51:06.926791+00
178	Metro 2033	metro-2033	2020-12-17 19:51:06.932737+00
179	Mudrunner	mudrunner	2020-12-17 19:51:06.960349+00
180	جوت سيموليتر	جوت-سيموليتر	2020-12-17 19:51:06.968134+00
181	헤일로 워즈 2	헤일로-워즈-2	2020-12-17 19:51:06.983005+00
182	헤일로 5: 가디언즈	헤일로-5-가디언즈	2020-12-17 19:51:07.02571+00
183	مارول در برابر کپ‌کام: بی نهایت	مارول-در-برابر-کپکام-بی-نهایت	2020-12-17 19:51:07.036716+00
184	ميدل إيرث: شادو أوف وور	ميدل-إيرث-شادو-أوف-وور	2020-12-17 19:51:07.047693+00
185	جيرز 5	جيرز-5	2020-12-17 19:51:07.078316+00
186	Minecraft Dungeons	minecraft-dungeons	2020-12-17 19:51:07.07887+00
187	戰爭機器4	戰爭機器4	2020-12-17 19:51:07.099427+00
188	莫莫多拉：月下遐想	莫莫多拉月下遐想	2020-12-17 19:51:07.100264+00
189	Mutant Year Zero: Road to Eden	mutant-year-zero-road-to-eden	2020-12-17 19:51:07.107605+00
190	헤일로: 스파르탄 어썰트	헤일로-스파르탄-어썰트	2020-12-17 19:51:07.104255+00
191	Spintires: MudRunner	spintires-mudrunner	2020-12-17 19:51:07.124788+00
192	مترو 2033 (لعبة فيديو)	مترو-2033-لعبة-فيديو	2020-12-17 19:51:07.166648+00
193	Farming Simulator (серия игр)	farming-simulator-серия-игр	2020-12-17 19:51:07.179204+00
194	هالو: سپارتان اساولت	هالو-سپارتان-اساولت	2020-12-17 19:51:07.257949+00
195	Mittelerde: Schatten des Krieges	mittelerde-schatten-des-krieges	2020-12-17 19:51:07.259855+00
196	هيومن: فال فليت	هيومن-فال-فليت	2020-12-17 19:51:07.262241+00
197	Metro 2033 (video oyun)	metro-2033-video-oyun	2020-12-17 19:51:07.26333+00
198	ماينكرافت دونجنس	ماينكرافت-دونجنس	2020-12-17 19:51:07.27325+00
199	هالو 5: جوارديانس	هالو-5-جوارديانس	2020-12-17 19:51:07.287345+00
200	Super Lucky's Tale	super-luckys-tale	2020-12-17 19:51:07.321404+00
201	Symulator kozy	symulator-kozy	2020-12-17 19:51:07.324559+00
202	Mount & Blade: Warband	mount-blade-warband	2020-12-17 19:51:07.378741+00
203	فۆرزا ھۆرایزن ٤	فۆرزا-ھۆرایزن-٤	2020-12-17 19:51:07.384596+00
204	La Tierra Media: Sombras de guerra	la-tierra-media-sombras-de-guerra	2020-12-17 19:51:07.420238+00
216	سرزمین میانه: سایه جنگ	سرزمین-میانه-سایه-جنگ	2020-12-17 19:51:07.685287+00
235	La Terre du Milieu : L'Ombre de la guerre	la-terre-du-milieu-lombre-de-la-guerre	2020-12-17 19:51:08.015126+00
251	La Terra di Mezzo: L'ombra della guerra	la-terra-di-mezzo-lombra-della-guerra	2020-12-17 19:51:08.199363+00
256	ميدل ايرث: شادو اف وور	ميدل-ايرث-شادو-اف-وور	2020-12-17 19:51:08.37674+00
260	Śródziemie: Cień wojny	śródziemie-cień-wojny	2020-12-17 19:51:08.611503+00
271	中土世界：战争之影	中土世界战争之影	2020-12-17 19:51:08.998466+00
277	中土世界：戰爭之影	中土世界戰爭之影	2020-12-17 19:51:09.172567+00
1230	Ghost of a Tale	ghost-of-a-tale	2020-12-21 19:56:02.163427+00
1232	幽魂傳奇	幽魂傳奇	2020-12-21 19:56:02.266043+00
1358	Scott Pilgrim vs. The World	scott-pilgrim-vs-the-world	2021-02-05 16:52:18.844591+00
205	مارڤيل ڤيرسيس كاپكوم: انفنيت	مارڤيل-ڤيرسيس-كاپكوم-انفنيت	2020-12-17 19:51:07.443671+00
212	マーベル VS. カプコン:インフィニット	マーベル-vs-カプコンインフィニット	2020-12-17 19:51:07.585499+00
1234	Edna & Harvey: Harvey's New Eyes	edna-harvey-harveys-new-eyes	2020-12-21 19:56:02.348476+00
1237	Harveys neue Augen	harveys-neue-augen	2020-12-21 19:56:02.404895+00
1239	Edna and Harvey: Harvey's New Eyes	edna-and-harvey-harveys-new-eyes	2020-12-21 19:56:02.431584+00
1359	Cthulhu Saves Christmas	cthulhu-saves-christmas	2021-02-05 16:52:18.895528+00
206	Metro 2033 (videojoc)	metro-2033-videojoc	2020-12-17 19:51:07.444717+00
214	Metro 2033 (počítačová hra)	metro-2033-počítačová-hra	2020-12-17 19:51:07.608349+00
223	Metro 2033 (Computerspiel)	metro-2033-computerspiel	2020-12-17 19:51:07.76543+00
238	Metro 2033 (videojuego)	metro-2033-videojuego	2020-12-17 19:51:08.052949+00
247	مترو ۲۰۳۳	مترو-۲۰۳۳	2020-12-17 19:51:08.166648+00
258	메트로 2033 (비디오 게임)	메트로-2033-비디오-게임	2020-12-17 19:51:08.484623+00
262	Metro 2033 (համակարգչային խաղ)	metro-2033-համակարգչային-խաղ	2020-12-17 19:51:08.747278+00
269	Metro 2033 (videójáték)	metro-2033-videójáték	2020-12-17 19:51:08.912305+00
275	Metro 2033 (computerspel)	metro-2033-computerspel	2020-12-17 19:51:09.147548+00
278	メトロ2033	メトロ2033	2020-12-17 19:51:09.224923+00
282	Metro 2033 (gra komputerowa)	metro-2033-gra-komputerowa	2020-12-17 19:51:09.525743+00
284	Metro 2033 (joc video)	metro-2033-joc-video	2020-12-17 19:51:09.655691+00
285	Метро 2033 (игра)	метро-2033-игра	2020-12-17 19:51:09.716981+00
288	Metro 2033 (videopeli)	metro-2033-videopeli	2020-12-17 19:51:09.849016+00
289	Metro 2033 (spel)	metro-2033-spel	2020-12-17 19:51:09.920488+00
290	Metro 2033 (video oyunu)	metro-2033-video-oyunu	2020-12-17 19:51:10.100368+00
291	Metro 2033 (відеогра)	metro-2033-відеогра	2020-12-17 19:51:10.39368+00
297	地铁2033 (游戏)	地铁2033-游戏	2020-12-17 19:51:10.55622+00
1235	Edna & Harvey: The Breakout	edna-harvey-the-breakout	2020-12-21 19:56:02.35561+00
1236	Edna bricht aus	edna-bricht-aus	2020-12-21 19:56:02.404348+00
1240	Edna et Harvey s'évadent	edna-et-harvey-sévadent	2020-12-21 19:56:02.436467+00
1360	MotoGP20	motogp20	2021-02-05 16:52:19.404116+00
207	ヒューマン フォール フラット	ヒューマン-フォール-フラット	2020-12-17 19:51:07.455254+00
239	人类：一败涂地	人类一败涂地	2020-12-17 19:51:08.055036+00
1238	Hard Reset	hard-reset	2020-12-21 19:56:02.415671+00
1361	The Division 2	the-division-2	2021-02-05 16:52:19.429385+00
208	Farming Simulator (серія ігор)	farming-simulator-серія-ігор	2020-12-17 19:51:07.467581+00
1241	Lumines: Puzzle Fusion	lumines-puzzle-fusion	2020-12-21 19:56:02.599896+00
1242	Lumines	lumines	2020-12-21 19:56:02.628322+00
1243	루미네스	루미네스	2020-12-21 19:56:02.702005+00
1244	لومينيس	لومينيس	2020-12-21 19:56:02.770253+00
1362	Serious Sam Collection	serious-sam-collection	2021-02-05 16:52:19.535767+00
209	เฮโล: เดอะมาสเตอร์ชีฟคอลเลกชัน	เฮโล-เดอะมาสเตอรชฟคอลเลกชน	2020-12-17 19:51:07.495394+00
210	Oxenfree	oxenfree	2020-12-17 19:51:07.569082+00
211	Ori and the Will of the Wisps	ori-and-the-will-of-the-wisps	2020-12-17 19:51:07.579126+00
215	光环：士官长合集	光环士官长合集	2020-12-17 19:51:07.676284+00
230	اری اند د ویل آو د وسپس	اری-اند-د-ویل-آو-د-وسپس	2020-12-17 19:51:07.869262+00
237	옥센프리	옥센프리	2020-12-17 19:51:08.039045+00
250	오리와 도깨비불	오리와-도깨비불	2020-12-17 19:51:08.195853+00
254	اوكسينفرى	اوكسينفرى	2020-12-17 19:51:08.288681+00
263	精灵与萤火意志	精灵与萤火意志	2020-12-17 19:51:08.784833+00
1245	Shadow Tactics: Blades of the Shogun	shadow-tactics-blades-of-the-shogun	2020-12-21 19:56:02.953696+00
1248	暗影戰略：將軍之刃	暗影戰略將軍之刃	2020-12-21 19:56:03.430466+00
1363	Cyberpunk	cyberpunk	2021-02-05 16:52:19.601939+00
213	戰爭機器5	戰爭機器5	2020-12-17 19:51:07.597933+00
1246	Rez	rez	2020-12-21 19:56:03.041144+00
1251	ريز	ريز	2020-12-21 19:56:03.458396+00
1364	Lost Words: Beyond the Page	lost-words-beyond-the-page	2021-02-05 16:52:19.60261+00
217	你好，邻居	你好邻居	2020-12-17 19:51:07.700308+00
1247	Sonic Mania	sonic-mania	2020-12-21 19:56:03.404071+00
1253	سونيك مينيا	سونيك-مينيا	2020-12-21 19:56:03.524899+00
1262	سونیک منیا	سونیک-منیا	2020-12-21 19:56:04.155831+00
1265	소닉 매니아	소닉-매니아	2020-12-21 19:56:04.286535+00
1268	ソニックマニア	ソニックマニア	2020-12-21 19:56:04.637668+00
1270	索尼克狂热	索尼克狂热	2020-12-21 19:56:04.822225+00
1365	Get Packed	get-packed	2021-02-05 16:52:19.633755+00
218	光环战争2	光环战争2	2020-12-17 19:51:07.710385+00
232	星環戰役2	星環戰役2	2020-12-17 19:51:07.874816+00
1249	The Mummy Demastered	the-mummy-demastered	2020-12-21 19:56:03.454809+00
1366	Unto The End	unto-the-end	2021-02-05 16:52:19.714909+00
219	ماینکرفت دانجنز	ماینکرفت-دانجنز	2020-12-17 19:51:07.711551+00
249	마인크래프트 던전스	마인크래프트-던전스	2020-12-17 19:51:08.194602+00
257	מיינקראפט דאנג'נס	מיינקראפט-דאנגנס	2020-12-17 19:51:08.470491+00
266	ماينكرافت دونچنس	ماينكرافت-دونچنس	2020-12-17 19:51:08.842559+00
287	我的世界 地下城	我的世界-地下城	2020-12-17 19:51:09.829063+00
1250	The Surge	the-surge	2020-12-21 19:56:03.457488+00
1256	ذا سورج	ذا-سورج	2020-12-21 19:56:03.669336+00
1367	Relicta	relicta	2021-02-05 16:52:19.715956+00
220	超級拉奇傳說	超級拉奇傳說	2020-12-17 19:51:07.727445+00
1252	The Sexy Brutale	the-sexy-brutale	2020-12-21 19:56:03.490549+00
1261	ث سيكسى بروتال	ث-سيكسى-بروتال	2020-12-21 19:56:04.131661+00
1264	性感的殘酷	性感的殘酷	2020-12-21 19:56:04.239697+00
1368	Stacks On Stacks (On Stacks)	stacks-on-stacks-on-stacks	2021-02-05 16:52:19.775021+00
221	突變元年：伊甸園之路	突變元年伊甸園之路	2020-12-17 19:51:07.737892+00
222	Pikuniku	pikuniku	2020-12-17 19:51:07.744185+00
243	پيكونيكو	پيكونيكو	2020-12-17 19:51:08.121756+00
1254	Victor Vran	victor-vran	2020-12-21 19:56:03.602849+00
1369	Figment	figment	2021-02-05 16:52:19.887972+00
224	Mount and Blade: Warband	mount-and-blade-warband	2020-12-17 19:51:07.773804+00
241	سواری و شمشیر: اتحاد جنگی	سواری-و-شمشیر-اتحاد-جنگی	2020-12-17 19:51:08.094516+00
255	Mount&Blade: Warband	mountblade-warband	2020-12-17 19:51:08.310765+00
276	骑马与砍杀：战团	骑马与砍杀战团	2020-12-17 19:51:09.171834+00
1255	Yooka-Laylee	yooka-laylee	2020-12-21 19:56:03.62268+00
1259	يوكا-لايلي	يوكا-لايلي	2020-12-21 19:56:04.092921+00
1267	ياوكا لايلى	ياوكا-لايلى	2020-12-21 19:56:04.348356+00
1269	尤卡莱莉大冒险	尤卡莱莉大冒险	2020-12-21 19:56:04.721202+00
1370	SteamWorld Quest: Hand of Gilgamech	steamworld-quest-hand-of-gilgamech	2021-02-05 16:52:20.242907+00
225	模擬山羊	模擬山羊	2020-12-17 19:51:07.796068+00
226	Remnant: From the Ashes	remnant-from-the-ashes	2020-12-17 19:51:07.80364+00
227	Nier: Automata	nier-automata	2020-12-17 19:51:07.839847+00
246	نير: الآلي	نير-الآلي	2020-12-17 19:51:08.150917+00
253	নিয়ার: অটোমাটা	নযর-অটমট	2020-12-17 19:51:08.262676+00
265	نیئا: اتوماتا	نیئا-اتوماتا	2020-12-17 19:51:08.839331+00
272	니어: 오토마타	니어-오토마타	2020-12-17 19:51:09.012685+00
280	نير: اوتوماتا	نير-اوتوماتا	2020-12-17 19:51:09.417338+00
283	ニーア オートマタ	ニーア-オートマタ	2020-12-17 19:51:09.577278+00
293	尼尔：机械纪元	尼尔机械纪元	2020-12-17 19:51:10.49044+00
302	尼爾：自動人形	尼爾自動人形	2020-12-17 19:51:10.682926+00
1257	Ys VIII: Lacrimosa of Dana	ys-viii-lacrimosa-of-dana	2020-12-21 19:56:03.942899+00
1260	이스 VIII: 라크리모사 오브 다나	이스-viii-라크리모사-오브-다나	2020-12-21 19:56:04.117072+00
1263	イースVIII	イースviii	2020-12-21 19:56:04.220504+00
1266	伊蘇VIII -丹娜的隕涕日-	伊蘇viii-丹娜的隕涕日-	2020-12-21 19:56:04.290114+00
1371	Spitlings	spitlings	2021-02-05 16:52:20.281158+00
228	辐射76	辐射76	2020-12-17 19:51:07.842321+00
1258	The Legend of Heroes: Trails of Cold Steel III	the-legend-of-heroes-trails-of-cold-steel-iii	2020-12-21 19:56:03.970466+00
1372	Metro: Last Light Redux	metro-last-light-redux	2021-02-05 16:52:20.478443+00
229	极限竞速 地平线4	极限竞速-地平线4	2020-12-17 19:51:07.845938+00
1271	Blasphemous	blasphemous	2020-12-21 20:10:27.570606+00
1279	Blasphemous (video oyunu)	blasphemous-video-oyunu	2020-12-21 20:10:27.741279+00
1373	Ghost Recon Breakpoint	ghost-recon-breakpoint	2021-02-05 16:52:20.642293+00
231	เฮโล 5: การ์เดี้ยนส์	เฮโล-5-การเดยนส	2020-12-17 19:51:07.873158+00
233	Ori and the Blind Forest	ori-and-the-blind-forest	2020-12-17 19:51:07.971307+00
245	أوري أند ذا بلايند فورست	أوري-أند-ذا-بلايند-فورست	2020-12-17 19:51:08.134127+00
252	最後一戰5：守護者	最後一戰5守護者	2020-12-17 19:51:08.229845+00
261	اوری و جنگل کور	اوری-و-جنگل-کور	2020-12-17 19:51:08.728052+00
270	오리와 눈먼 숲	오리와-눈먼-숲	2020-12-17 19:51:08.950103+00
273	اورى اند ث بليند فوريست	اورى-اند-ث-بليند-فوريست	2020-12-17 19:51:09.120144+00
279	オリとくらやみの森	オリとくらやみの森	2020-12-17 19:51:09.314116+00
286	奧里與迷失森林	奧里與迷失森林	2020-12-17 19:51:09.784633+00
1272	Control	control	2020-12-21 20:10:27.588745+00
1275	كنترول (لعبة فيديو 2019)	كنترول-لعبة-فيديو-2019	2020-12-21 20:10:27.656525+00
1277	Control (Computerspiel)	control-computerspiel	2020-12-21 20:10:27.725743+00
1282	Control (videojuego)	control-videojuego	2020-12-21 20:10:27.803755+00
1285	کنترل (بازی ویدئویی)	کنترل-بازی-ویدئویی	2020-12-21 20:10:27.843786+00
1291	Control (jeu vidéo)	control-jeu-vidéo	2020-12-21 20:10:27.917798+00
1301	컨트롤 (비디오 게임)	컨트롤-비디오-게임	2020-12-21 20:10:28.030243+00
1308	Control (videogioco)	control-videogioco	2020-12-21 20:10:28.107431+00
1315	كنترول (فيديو لعب 2019)	كنترول-فيديو-لعب-2019	2020-12-21 20:10:28.221126+00
1323	Control (computerspel)	control-computerspel	2020-12-21 20:10:28.280394+00
1327	Control (コンピュータゲーム)	control-コンピュータゲーム	2020-12-21 20:10:28.371673+00
1331	Control (jogo eletrônico)	control-jogo-eletrônico	2020-12-21 20:10:28.417658+00
1333	Control (игра)	control-игра	2020-12-21 20:10:28.467807+00
1337	Control (videopeli)	control-videopeli	2020-12-21 20:10:28.582113+00
1339	Control (video oyunu)	control-video-oyunu	2020-12-21 20:10:28.685559+00
1342	Control (відеогра)	control-відеогра	2020-12-21 20:10:28.757465+00
1344	控制 (遊戲)	控制-遊戲	2020-12-21 20:10:28.781252+00
1374	Monster Energy Supercross 3	monster-energy-supercross-3	2021-02-05 16:52:20.840632+00
234	地狱之刃：塞娜的献祭	地狱之刃塞娜的献祭	2020-12-17 19:51:07.986157+00
236	No Man's Sky	no-mans-sky	2020-12-17 19:51:08.017927+00
240	Pathologic 2	pathologic-2	2020-12-17 19:51:08.06675+00
242	Power Rangers: Battle for the Grid	power-rangers-battle-for-the-grid	2020-12-17 19:51:08.10337+00
244	Overcooked 2	overcooked-2	2020-12-17 19:51:08.131195+00
248	نو مانز سكاي	نو-مانز-سكاي	2020-12-17 19:51:08.182187+00
259	Мор (игра)	мор-игра	2020-12-17 19:51:08.602717+00
264	胡鬧廚房2	胡鬧廚房2	2020-12-17 19:51:08.811507+00
267	金剛戰士：網絡之戰	金剛戰士網絡之戰	2020-12-17 19:51:08.843787+00
268	آسمان هیچ‌کس	آسمان-هیچکس	2020-12-17 19:51:08.860588+00
274	노 맨즈 스카이	노-맨즈-스카이	2020-12-17 19:51:09.137644+00
281	نو مانز سكاى	نو-مانز-سكاى	2020-12-17 19:51:09.466929+00
292	Slay the Spire	slay-the-spire	2020-12-17 19:51:10.433228+00
294	無人深空	無人深空	2020-12-17 19:51:10.504798+00
295	Subnautica	subnautica	2020-12-17 19:51:10.507491+00
296	Streets of Rogue	streets-of-rogue	2020-12-17 19:51:10.542863+00
298	Shadow Warrior 2	shadow-warrior-2	2020-12-17 19:51:10.584585+00
299	Streets of Rage 4	streets-of-rage-4	2020-12-17 19:51:10.611858+00
300	سابنوتيكا	سابنوتيكا	2020-12-17 19:51:10.61472+00
301	Sniper Elite 4	sniper-elite-4	2020-12-17 19:51:10.641057+00
303	Spiritfarer	spiritfarer	2020-12-17 19:51:10.685533+00
304	无人深空	无人深空	2020-12-17 19:51:10.744926+00
305	The Gardens Between	the-gardens-between	2020-12-17 19:51:10.77901+00
306	Субнавтика	субнавтика	2020-12-17 19:51:10.802883+00
307	The Elder Scrolls Online	the-elder-scrolls-online	2020-12-17 19:51:10.826756+00
308	Surviving Mars	surviving-mars	2020-12-17 19:51:10.834437+00
309	ستريتز أوف ريج 4	ستريتز-أوف-ريج-4	2020-12-17 19:51:10.90332+00
310	سنايبر إليت 4	سنايبر-إليت-4	2020-12-17 19:51:10.905792+00
311	تاکسی ارواح	تاکسی-ارواح	2020-12-17 19:51:10.91025+00
312	ذي إلدر سكرولز أونلاين	ذي-إلدر-سكرولز-أونلاين	2020-12-17 19:51:10.934152+00
313	سورفايفين مارس	سورفايفين-مارس	2020-12-17 19:51:10.946081+00
314	杀戮尖塔	杀戮尖塔	2020-12-17 19:51:10.974328+00
315	The Jackbox Party Pack	the-jackbox-party-pack	2020-12-17 19:51:11.053296+00
316	The Touryst	the-touryst	2020-12-17 19:51:11.084889+00
317	The Long Dark	the-long-dark	2020-12-17 19:51:11.108017+00
318	The Outer Worlds	the-outer-worlds	2020-12-17 19:51:11.12869+00
319	شورش در شهر ۴	شورش-در-شهر-۴	2020-12-17 19:51:11.14836+00
320	서브노티카	서브노티카	2020-12-17 19:51:11.213727+00
321	影武者2	影武者2	2020-12-17 19:51:11.250344+00
322	The Witcher 3: Wild Hunt	the-witcher-3-wild-hunt	2020-12-17 19:51:11.250901+00
323	ذا أوتر ورلدز	ذا-أوتر-ورلدز	2020-12-17 19:51:11.257127+00
324	تک‌تیرانداز نخبه ۴	تکتیرانداز-نخبه-۴	2020-12-17 19:51:11.32356+00
325	The Talos Principle	the-talos-principle	2020-12-17 19:51:11.384431+00
326	베어 너클 IV	베어-너클-iv	2020-12-17 19:51:11.418707+00
327	The Escapists 2	the-escapists-2	2020-12-17 19:51:11.439807+00
328	ذا ويتشر 3: وايلد هانت	ذا-ويتشر-3-وايلد-هانت	2020-12-17 19:51:11.444752+00
329	سورڤايڤين مارش	سورڤايڤين-مارش	2020-12-17 19:51:11.515593+00
330	The Surge 2	the-surge-2	2020-12-17 19:51:11.575781+00
331	تاریکی طولانی	تاریکی-طولانی	2020-12-17 19:51:11.595866+00
332	Вядзьмар 3	вядзьмар-3	2020-12-17 19:51:11.624049+00
333	جهان‌های بیرونی	جهانهای-بیرونی	2020-12-17 19:51:11.648381+00
334	ستريتس اوف راج 4	ستريتس-اوف-راج-4	2020-12-17 19:51:11.649641+00
335	Totally Accurate Battle Simulator	totally-accurate-battle-simulator	2020-12-17 19:51:11.713581+00
336	The Walking Dead: Season Two	the-walking-dead-season-two	2020-12-17 19:51:11.722401+00
337	الدر اسکورولز آنلاین	الدر-اسکورولز-آنلاین	2020-12-17 19:51:11.72358+00
338	Touhou Luna Nights	touhou-luna-nights	2020-12-17 19:51:11.7909+00
339	توتالي أكورايت باتل سيمولاتور	توتالي-أكورايت-باتل-سيمولاتور	2020-12-17 19:51:11.801953+00
340	Thronebreaker: The Witcher Tales	thronebreaker-the-witcher-tales	2020-12-17 19:51:11.805353+00
341	ذا سورج 2	ذا-سورج-2	2020-12-17 19:51:11.805938+00
342	아우터 월드	아우터-월드	2020-12-17 19:51:11.815969+00
343	Zaklínač 3: Divoký hon	zaklínač-3-divoký-hon	2020-12-17 19:51:11.849041+00
344	サブノーティカ	サブノーティカ	2020-12-17 19:51:11.84946+00
345	Tracks – The Train Set Game	tracks-the-train-set-game	2020-12-17 19:51:11.859146+00
346	ベア・ナックルIV	ベアナックルiv	2020-12-17 19:51:11.862209+00
347	الموتى السائرون: الموسم الثاني	الموتى-السائرون-الموسم-الثاني	2020-12-17 19:51:11.881371+00
348	Untitled Goose Game	untitled-goose-game	2020-12-17 19:51:11.902756+00
349	더 롱 다크	더-롱-다크	2020-12-17 19:51:11.916996+00
350	逃脱者2	逃脱者2	2020-12-17 19:51:11.932286+00
351	ث تالوس پرينسيپل	ث-تالوس-پرينسيپل	2020-12-17 19:51:11.953329+00
352	Train Sim World	train-sim-world	2020-12-17 19:51:11.96106+00
353	سنيپير اليت 4	سنيپير-اليت-4	2020-12-17 19:51:11.966048+00
354	Void Bastards	void-bastards	2020-12-17 19:51:11.981674+00
355	엘더스크롤 온라인	엘더스크롤-온라인	2020-12-17 19:51:12.006782+00
356	東方月神夜	東方月神夜	2020-12-17 19:51:12.024393+00
357	ذا اوتر ورلدز	ذا-اوتر-ورلدز	2020-12-17 19:51:12.080878+00
358	مردگان متحرک: فصل دوم	مردگان-متحرک-فصل-دوم	2020-12-17 19:51:12.121495+00
359	theHunter	thehunter	2020-12-17 19:51:12.127197+00
360	火星求生	火星求生	2020-12-17 19:51:12.139466+00
361	سلطنت‌شکن: افسانه ویچر	سلطنتشکن-افسانه-ویچر	2020-12-17 19:51:12.150979+00
362	Two Point Hospital	two-point-hospital	2020-12-17 19:51:12.163001+00
363	Wandersong	wandersong	2020-12-17 19:51:12.203809+00
364	The Walking Dead : Saison 2	the-walking-dead-saison-2	2020-12-17 19:51:12.242103+00
365	The Hunter (jeu vidéo)	the-hunter-jeu-vidéo	2020-12-17 19:51:12.249491+00
366	ویچر ۳: شکار وحشیانه	ویچر-۳-شکار-وحشیانه	2020-12-17 19:51:12.253903+00
367	ث لونج دارك	ث-لونج-دارك	2020-12-17 19:51:12.307809+00
368	ثرونيبرايكير: ث ويتشير تاليس	ثرونيبرايكير-ث-ويتشير-تاليس	2020-12-17 19:51:12.331078+00
369	워킹 데드: 시즌 투	워킹-데드-시즌-투	2020-12-17 19:51:12.339517+00
370	深海迷航	深海迷航	2020-12-17 19:51:12.360295+00
371	模拟火车世界	模拟火车世界	2020-12-17 19:51:12.400945+00
372	ث الدير سكرولس اونلين	ث-الدير-سكرولس-اونلين	2020-12-17 19:51:12.432736+00
374	انتيتليد جوس جام	انتيتليد-جوس-جام	2020-12-17 19:51:12.51582+00
373	奪われし玉座:ウィッチャーテイルズ	奪われし玉座ウィッチャーテイルズ	2020-12-17 19:51:12.458417+00
380	Кровная вражда: Ведьмак. Истории	кровная-вражда-ведьмак-истории	2020-12-17 19:51:12.704609+00
1273	Abzû	abzû	2020-12-21 20:10:27.589418+00
1274	أبزو (لعبة فيديو)	أبزو-لعبة-فيديو	2020-12-21 20:10:27.6435+00
1280	Abzu (videojuego)	abzu-videojuego	2020-12-21 20:10:27.741804+00
1284	Abzû (jeu vidéo)	abzû-jeu-vidéo	2020-12-21 20:10:27.823534+00
1292	ابزو	ابزو	2020-12-21 20:10:27.930743+00
1304	Abzû (jogo eletrônico)	abzû-jogo-eletrônico	2020-12-21 20:10:28.046109+00
1318	智慧之海	智慧之海	2020-12-21 20:10:28.227372+00
1375	Shadow of the Tomb Raider Definitive Edition	shadow-of-the-tomb-raider-definitive-edition	2021-02-05 16:52:20.881813+00
375	ث والكينج دايد: سايسون تو	ث-والكينج-دايد-سايسون-تو	2020-12-17 19:51:12.522759+00
383	ウォーキング・デッド シーズン2	ウォーキングデッド-シーズン2	2020-12-17 19:51:12.910637+00
409	行屍：第二季	行屍第二季	2020-12-17 19:51:13.65021+00
1276	Iconoclasts	iconoclasts	2020-12-21 20:10:27.701673+00
1376	Rise of the Tomb Raider: 20 Year Celebration	rise-of-the-tomb-raider-20-year-celebration	2021-02-05 16:52:21.123865+00
376	The Hunter (jogo eletrônico)	the-hunter-jogo-eletrônico	2020-12-17 19:51:12.585502+00
384	The Hunter (videopeli)	the-hunter-videopeli	2020-12-17 19:51:12.928493+00
1278	Rime	rime	2020-12-21 20:10:27.734124+00
1283	رايم	رايم	2020-12-21 20:10:27.81577+00
1290	Rime (Computerspiel)	rime-computerspiel	2020-12-21 20:10:27.911169+00
1303	ریم (بازی ویدئویی)	ریم-بازی-ویدئویی	2020-12-21 20:10:28.042949+00
1310	Rime (jeu vidéo)	rime-jeu-vidéo	2020-12-21 20:10:28.112098+00
1314	Rime (videogioco)	rime-videogioco	2020-12-21 20:10:28.180996+00
1325	Rime (videospill)	rime-videospill	2020-12-21 20:10:28.343446+00
1377	Tomb Raider: Definitive Edition	tomb-raider-definitive-edition	2021-02-05 16:52:21.129128+00
377	더 위쳐 3: 와일드 헌트	더-위쳐-3-와일드-헌트	2020-12-17 19:51:12.616471+00
416	ウィッチャー3 ワイルドハント	ウィッチャー3-ワイルドハント	2020-12-17 19:51:13.984748+00
424	Wiedźmin 3: Dziki Gon	wiedźmin-3-dziki-gon	2020-12-17 19:51:14.174258+00
427	Ведьмак 3: Дикая Охота	ведьмак-3-дикая-охота	2020-12-17 19:51:14.38021+00
430	เดอะวิตเชอร์ 3: ไวลด์ฮันต์	เดอะวตเชอร-3-ไวลดฮนต	2020-12-17 19:51:14.695052+00
432	巫师3：狂猎	巫师3狂猎	2020-12-17 19:51:14.935729+00
1281	Contra	contra	2020-12-21 20:10:27.78698+00
1288	كونترا (لعبة فيديو)	كونترا-لعبة-فيديو	2020-12-21 20:10:27.87207+00
1297	Contra (počítačová hra)	contra-počítačová-hra	2020-12-21 20:10:27.9738+00
1305	Contra (βιντεοπαιχνίδι)	contra-βιντεοπαιχνίδι	2020-12-21 20:10:28.058157+00
1309	Contra (videojuego)	contra-videojuego	2020-12-21 20:10:28.111251+00
1319	کنترا (بازی ویدئویی)	کنترا-بازی-ویدئویی	2020-12-21 20:10:28.243325+00
1324	Probotector (jeu vidéo, 1987)	probotector-jeu-vidéo-1987	2020-12-21 20:10:28.324326+00
1328	Contra (videoxogo)	contra-videoxogo	2020-12-21 20:10:28.375241+00
1332	콘트라 (비디오 게임)	콘트라-비디오-게임	2020-12-21 20:10:28.434156+00
1335	Contra (permainan video)	contra-permainan-video	2020-12-21 20:10:28.511153+00
1338	Contra (videogioco)	contra-videogioco	2020-12-21 20:10:28.666963+00
1340	קונטרה (משחק וידאו)	קונטרה-משחק-וידאו	2020-12-21 20:10:28.725393+00
1341	كونترا (فيديو لعب 1987)	كونترا-فيديو-لعب-1987	2020-12-21 20:10:28.756904+00
1343	Contra (arcadespel)	contra-arcadespel	2020-12-21 20:10:28.773452+00
1345	魂斗羅	魂斗羅	2020-12-21 20:10:28.807107+00
1346	Contra (jogo eletrônico)	contra-jogo-eletrônico	2020-12-21 20:10:28.85527+00
1347	Contra (videopeli)	contra-videopeli	2020-12-21 20:10:28.895481+00
1348	Probotector	probotector	2020-12-21 20:10:28.927214+00
1349	คอนทรา (วิดีโอเกม)	คอนทรา-วดโอเกม	2020-12-21 20:10:28.947098+00
1350	Contra (video oyunu)	contra-video-oyunu	2020-12-21 20:10:28.965722+00
1351	Contra (trò chơi điện tử)	contra-trò-chơi-điện-tử	2020-12-21 20:10:29.022152+00
1352	魂斗罗	魂斗罗	2020-12-21 20:10:29.070438+00
1378	Wave Break	wave-break	2021-02-05 16:52:21.504705+00
378	تو پوينت هوسپيتال	تو-پوينت-هوسپيتال	2020-12-17 19:51:12.638696+00
379	Wasteland	wasteland	2020-12-17 19:51:12.642876+00
386	Wasteland (série)	wasteland-série	2020-12-17 19:51:12.99196+00
401	双点医院	双点医院	2020-12-17 19:51:13.423812+00
1286	Yooka-Laylee and the Impossible Lair	yooka-laylee-and-the-impossible-lair	2020-12-21 20:10:27.848282+00
1379	Jotun: Valhalla Edition	jotun-valhalla-edition	2021-02-05 16:52:22.01539+00
381	外圍世界	外圍世界	2020-12-17 19:51:12.783452+00
1287	Obduction	obduction	2020-12-21 20:10:27.869096+00
1295	Obduction (βιντεοπαιχνίδι)	obduction-βιντεοπαιχνίδι	2020-12-21 20:10:27.959714+00
1299	Obduction (jeu vidéo)	obduction-jeu-vidéo	2020-12-21 20:10:28.020582+00
1380	PHOGS!	phogs	2021-02-05 16:52:22.067518+00
382	สไนเปอร์อีลีต 4	สไนเปอรอลต-4	2020-12-17 19:51:12.858711+00
385	Wizard of Legend	wizard-of-legend	2020-12-17 19:51:12.98059+00
388	狙击精英4	狙击精英4	2020-12-17 19:51:13.103962+00
393	傳說法師	傳說法師	2020-12-17 19:51:13.20388+00
1289	Shantae and the Pirate's Curse	shantae-and-the-pirates-curse	2020-12-21 20:10:27.885022+00
1302	شانتاى اند ث پيراتيس كورس	شانتاى-اند-ث-پيراتيس-كورس	2020-12-21 20:10:28.032893+00
1317	桑塔與海盜的詛咒	桑塔與海盜的詛咒	2020-12-21 20:10:28.226568+00
1381	Secret Neighbor	secret-neighbor	2021-02-05 16:52:22.184487+00
387	Untitled Goose Game 〜いたずらガチョウがやって来た!〜	untitled-goose-game-いたずらガチョウがやって来た	2020-12-17 19:51:13.02692+00
389	Wasteland 2	wasteland-2	2020-12-17 19:51:13.106922+00
390	Xeno Crisis	xeno-crisis	2020-12-17 19:51:13.108081+00
391	Wasteland 3	wasteland-3	2020-12-17 19:51:13.136829+00
392	Yakuza Kiwami 2	yakuza-kiwami-2	2020-12-17 19:51:13.168098+00
394	Yakuza Kiwami	yakuza-kiwami	2020-12-17 19:51:13.227167+00
395	Worms W.M.D	worms-wmd	2020-12-17 19:51:13.234125+00
396	Yakuza 0	yakuza-0	2020-12-17 19:51:13.260915+00
398	ياكوزا كيوامي 2	ياكوزا-كيوامي-2	2020-12-17 19:51:13.351533+00
400	ویست‌لند ۳	ویستلند-۳	2020-12-17 19:51:13.422063+00
402	ياكوزا 0	ياكوزا-0	2020-12-17 19:51:13.4251+00
403	ياكوزا كيوامي	ياكوزا-كيوامي	2020-12-17 19:51:13.44332+00
404	ورمس دبليو.ام.دى	ورمس-دبليوامدى	2020-12-17 19:51:13.531558+00
405	ویست‌لند ۲	ویستلند-۲	2020-12-17 19:51:13.555681+00
407	鹅作剧	鹅作剧	2020-12-17 19:51:13.592931+00
408	용과 같이 극 2	용과-같이-극-2	2020-12-17 19:51:13.605027+00
410	واستيلاند 3	واستيلاند-3	2020-12-17 19:51:13.663986+00
411	용과 같이 극	용과-같이-극	2020-12-17 19:51:13.713967+00
413	یاکوزا ۰	یاکوزا-۰	2020-12-17 19:51:13.873035+00
415	ياكوزا كيوامى 2	ياكوزا-كيوامى-2	2020-12-17 19:51:13.944246+00
417	واستيلاند 2	واستيلاند-2	2020-12-17 19:51:14.002979+00
418	ياكوزا كيوامى	ياكوزا-كيوامى	2020-12-17 19:51:14.005518+00
419	ยากูซ่าคิวามิ 2	ยากซาความ-2	2020-12-17 19:51:14.068499+00
421	Yakuza Zero	yakuza-zero	2020-12-17 19:51:14.094884+00
422	废土3	废土3	2020-12-17 19:51:14.141924+00
423	용과 같이 0: 맹세의 장소	용과-같이-0-맹세의-장소	2020-12-17 19:51:14.170572+00
425	ยากูซ่าคิวามิ	ยากซาความ	2020-12-17 19:51:14.205958+00
428	龍が如く0 誓いの場所	龍が如く0-誓いの場所	2020-12-17 19:51:14.396425+00
429	ยากูซ่า 0	ยากซา-0	2020-12-17 19:51:14.602175+00
431	人中之龍0 誓約的場所	人中之龍0-誓約的場所	2020-12-17 19:51:14.731861+00
1293	Yoku's Island Express	yokus-island-express	2020-12-21 20:10:27.953192+00
1313	尤庫的小島速遞	尤庫的小島速遞	2020-12-21 20:10:28.179963+00
1382	SUPERHOT: MIND CONTROL DELETE	superhot-mind-control-delete	2021-02-05 16:52:22.199485+00
397	漫漫長夜	漫漫長夜	2020-12-17 19:51:13.304665+00
399	We Happy Few	we-happy-few	2020-12-17 19:51:13.365986+00
406	وي هابي فيو	وي-هابي-فيو	2020-12-17 19:51:13.569045+00
412	وی هپی فیو	وی-هپی-فیو	2020-12-17 19:51:13.827443+00
420	وى هاپى فيو	وى-هاپى-فيو	2020-12-17 19:51:14.085945+00
426	We Happy Few (jogo eletrônico)	we-happy-few-jogo-eletrônico	2020-12-17 19:51:14.217245+00
1294	Ken Follett's The Pillars of the Earth	ken-folletts-the-pillars-of-the-earth	2020-12-21 20:10:27.95373+00
1300	Die Säulen der Erde (Computerspiel)	die-säulen-der-erde-computerspiel	2020-12-21 20:10:28.027725+00
1311	Les Piliers de la Terre (jeu vidéo)	les-piliers-de-la-terre-jeu-vidéo	2020-12-21 20:10:28.117195+00
1320	كين فوليتس ث پيلارس اوف ث ايرث	كين-فوليتس-ث-پيلارس-اوف-ث-ايرث	2020-12-21 20:10:28.266506+00
1383	Kine	kine	2021-02-05 16:52:22.299505+00
414	上古卷軸Online	上古卷軸online	2020-12-17 19:51:13.886055+00
433	DayZ	dayz	2020-12-18 16:36:41.938076+00
434	داي زي	داي-زي	2020-12-18 16:36:41.954797+00
435	DayZ (c'hoari video)	dayz-choari-video	2020-12-18 16:36:41.965695+00
436	데이즈 (비디오 게임)	데이즈-비디오-게임	2020-12-18 16:36:42.001874+00
437	Carrion	carrion	2020-12-18 16:36:42.0099+00
438	DayZ Standalone	dayz-standalone	2020-12-18 16:36:42.014878+00
439	Carrion (jeu vidéo)	carrion-jeu-vidéo	2020-12-18 16:36:42.020003+00
440	داى زى	داى-زى	2020-12-18 16:36:42.02951+00
441	Carrion (videogioco)	carrion-videogioco	2020-12-18 16:36:42.030035+00
442	DayZ (ゲーム)	dayz-ゲーム	2020-12-18 16:36:42.037911+00
443	Carrion (игра)	carrion-игра	2020-12-18 16:36:42.047894+00
444	DayZ (gra komputerowa)	dayz-gra-komputerowa	2020-12-18 16:36:42.04844+00
445	DayZ (игра)	dayz-игра	2020-12-18 16:36:42.061664+00
446	DayZ (videopeli)	dayz-videopeli	2020-12-18 16:36:42.07238+00
447	DayZ (datorspel)	dayz-datorspel	2020-12-18 16:36:42.081024+00
448	DayZ (гра)	dayz-гра	2020-12-18 16:36:42.098869+00
449	CrossCode	crosscode	2020-12-18 16:36:42.242328+00
450	كروسكود	كروسكود	2020-12-18 16:36:42.255707+00
451	크로스코드	크로스코드	2020-12-18 16:36:42.281157+00
452	遠星物語	遠星物語	2020-12-18 16:36:42.306712+00
453	Bleeding Edge	bleeding-edge	2020-12-18 16:36:42.434365+00
454	Crackdown 3	crackdown-3	2020-12-18 16:36:42.452978+00
455	Forager	forager	2020-12-18 16:36:42.461516+00
456	F1 2019	f1-2019	2020-12-18 16:36:42.469596+00
457	كراك داون 3	كراك-داون-3	2020-12-18 16:36:42.489918+00
458	Frostpunk	frostpunk	2020-12-18 16:36:42.493702+00
459	فورجير (لعبة فيديو)	فورجير-لعبة-فيديو	2020-12-18 16:36:42.510629+00
460	F1 2019 (videojuego)	f1-2019-videojuego	2020-12-18 16:36:42.53379+00
461	尖峰战队	尖峰战队	2020-12-18 16:36:42.550099+00
462	Gears of War	gears-of-war	2020-12-18 16:36:42.568754+00
463	F1 2019 (jeu vidéo)	f1-2019-jeu-vidéo	2020-12-18 16:36:42.579046+00
464	크랙다운 3	크랙다운-3	2020-12-18 16:36:42.612512+00
465	فراست‌پانک	فراستپانک	2020-12-18 16:36:42.616211+00
466	غيرز أوف وور	غيرز-أوف-وور	2020-12-18 16:36:42.630178+00
467	F1 2019 (비디오 게임)	f1-2019-비디오-게임	2020-12-18 16:36:42.635714+00
468	Halo Wars	halo-wars	2020-12-18 16:36:42.645647+00
469	Grounded	grounded	2020-12-18 16:36:42.654847+00
470	Hollow Knight	hollow-knight	2020-12-18 16:36:42.661562+00
471	프로스트펑크	프로스트펑크	2020-12-18 16:36:42.681393+00
472	F1 2019 (computerspel)	f1-2019-computerspel	2020-12-18 16:36:42.702102+00
473	هيلو وورز	هيلو-وورز	2020-12-18 16:36:42.727777+00
474	گراندد (بازی ویدئویی)	گراندد-بازی-ویدئویی	2020-12-18 16:36:42.743378+00
475	چرخ‌دنده‌های جنگ	چرخدندههای-جنگ	2020-12-18 16:36:42.751044+00
476	แครกดาวน์ 3	แครกดาวน-3	2020-12-18 16:36:42.788899+00
477	F1 2019 (jogo eletrônico)	f1-2019-jogo-eletrônico	2020-12-18 16:36:42.789482+00
478	할로 나이트	할로-나이트	2020-12-18 16:36:42.877092+00
479	Indivisible	indivisible	2020-12-18 16:36:42.882368+00
480	Minit	minit	2020-12-18 16:36:42.886578+00
481	Gears of War (jeu vidéo)	gears-of-war-jeu-vidéo	2020-12-18 16:36:42.887963+00
482	F1 2019 (video oyunu)	f1-2019-video-oyunu	2020-12-18 16:36:42.888432+00
483	除暴戰警3	除暴戰警3	2020-12-18 16:36:42.892246+00
484	فروستپونك	فروستپونك	2020-12-18 16:36:42.895416+00
485	Grounded (permainan video)	grounded-permainan-video	2020-12-18 16:36:42.898437+00
486	نبردهای هیلو	نبردهای-هیلو	2020-12-18 16:36:42.922707+00
487	Kona	kona	2020-12-18 16:36:42.943099+00
488	Katana Zero	katana-zero	2020-12-18 16:36:42.948494+00
489	기어스 오브 워 (비디오 게임)	기어스-오브-워-비디오-게임	2020-12-18 16:36:42.976285+00
490	Indivisible (videojuego)	indivisible-videojuego	2020-12-18 16:36:42.978697+00
491	Minit (Computerspiel)	minit-computerspiel	2020-12-18 16:36:42.991751+00
492	Moving Out	moving-out	2020-12-18 16:36:42.995642+00
493	Killer Instinct	killer-instinct	2020-12-18 16:36:43.024502+00
494	هولو كنيجت	هولو-كنيجت	2020-12-18 16:36:43.03577+00
495	Night in the Woods	night-in-the-woods	2020-12-18 16:36:43.051701+00
496	Kona (Computerspiel)	kona-computerspiel	2020-12-18 16:36:43.052435+00
497	헤일로 워즈	헤일로-워즈	2020-12-18 16:36:43.112841+00
498	인디비지블	인디비지블	2020-12-18 16:36:43.133547+00
499	Moonlighter	moonlighter	2020-12-18 16:36:43.149776+00
500	Observation	observation	2020-12-18 16:36:43.153456+00
501	Killer Instinct (Spieleserie)	killer-instinct-spieleserie	2020-12-18 16:36:43.154004+00
502	Kona (videojuego)	kona-videojuego	2020-12-18 16:36:43.157689+00
503	Mortal Kombat X	mortal-kombat-x	2020-12-18 16:36:43.162329+00
504	My Time at Portia	my-time-at-portia	2020-12-18 16:36:43.175417+00
505	हेलो वॉर्स	हल-वरस	2020-12-18 16:36:43.195138+00
506	ReCore	recore	2020-12-18 16:36:43.221767+00
507	Observation (jeu vidéo)	observation-jeu-vidéo	2020-12-18 16:36:43.228706+00
508	Pillars of Eternity	pillars-of-eternity	2020-12-18 16:36:43.262283+00
509	Kona (jeu vidéo)	kona-jeu-vidéo	2020-12-18 16:36:43.281217+00
510	Killer Instinct (serie)	killer-instinct-serie	2020-12-18 16:36:43.286583+00
511	مورتال كومبات إكس	مورتال-كومبات-إكس	2020-12-18 16:36:43.287201+00
512	インディヴィジブル 闇を祓う魂たち	インディヴィジブル-闇を祓う魂たち	2020-12-18 16:36:43.295015+00
513	나이트 인 더 우즈	나이트-인-더-우즈	2020-12-18 16:36:43.317213+00
514	كاتانا زيرو	كاتانا-زيرو	2020-12-18 16:36:43.323907+00
515	Resident Evil 7: Biohazard	resident-evil-7-biohazard	2020-12-18 16:36:43.350057+00
516	اوبسيرڤاتيون	اوبسيرڤاتيون	2020-12-18 16:36:43.382534+00
517	冰汽之世	冰汽之世	2020-12-18 16:36:43.397571+00
518	Sea of Thieves	sea-of-thieves	2020-12-18 16:36:43.432047+00
519	State of Decay 2	state-of-decay-2	2020-12-18 16:36:43.445465+00
520	ریکور (بازی ویدئویی)	ریکور-بازی-ویدئویی	2020-12-18 16:36:43.462764+00
521	Killer Instinct (série de jeux vidéo)	killer-instinct-série-de-jeux-vidéo	2020-12-18 16:36:43.466762+00
522	Mortal Kombat X (oyun, 2015)	mortal-kombat-x-oyun-2015	2020-12-18 16:36:43.490699+00
523	ريزدنت إيفل 7: بايوهازرد	ريزدنت-إيفل-7-بايوهازرد	2020-12-18 16:36:43.499107+00
524	River City Girls	river-city-girls	2020-12-18 16:36:43.504591+00
525	نيجت اين ث ودس	نيجت-اين-ث-ودس	2020-12-18 16:36:43.50962+00
526	سي أوف ثيفز	سي-أوف-ثيفز	2020-12-18 16:36:43.512594+00
527	هالو وارس	هالو-وارس	2020-12-18 16:36:43.524142+00
528	Stellaris	stellaris	2020-12-18 16:36:43.528533+00
529	ستيت أف ديكاي 2	ستيت-أف-ديكاي-2	2020-12-18 16:36:43.532482+00
530	The Messenger	the-messenger	2020-12-18 16:36:43.539948+00
531	Tacoma	tacoma	2020-12-18 16:36:43.570823+00
532	Killer Instinct (computerspelserie)	killer-instinct-computerspelserie	2020-12-18 16:36:43.572789+00
544	キラーインスティンクト	キラーインスティンクト	2020-12-18 16:36:43.704318+00
559	Killer Instinct (серия игр)	killer-instinct-серия-игр	2020-12-18 16:36:43.865033+00
1296	Wonder Boy	wonder-boy	2020-12-21 20:10:27.962022+00
1306	Wonder Boy (βιντεοπαιχνίδι)	wonder-boy-βιντεοπαιχνίδι	2020-12-21 20:10:28.080706+00
1312	Wonder Boy (videojuego)	wonder-boy-videojuego	2020-12-21 20:10:28.127704+00
1316	Wonder Boy (jeu vidéo)	wonder-boy-jeu-vidéo	2020-12-21 20:10:28.222937+00
1322	원더보이 (비디오 게임)	원더보이-비디오-게임	2020-12-21 20:10:28.270781+00
1326	Wonder Boy (computerspel)	wonder-boy-computerspel	2020-12-21 20:10:28.353018+00
1330	ワンダーボーイ (ゲーム)	ワンダーボーイ-ゲーム	2020-12-21 20:10:28.40694+00
1334	Wonder Boy (datorspel)	wonder-boy-datorspel	2020-12-21 20:10:28.481526+00
1336	神奇男孩 (游戏)	神奇男孩-游戏	2020-12-21 20:10:28.580154+00
1384	Attack on Titan 2: Final Battle	attack-on-titan-2-final-battle	2021-02-05 16:52:22.68919+00
533	冰汽时代	冰汽时代	2020-12-18 16:36:43.582911+00
1298	Redout	redout	2020-12-21 20:10:28.00323+00
1385	Farming Simulator 19	farming-simulator-19	2021-02-05 16:52:23.26617+00
534	ريكور	ريكور	2020-12-18 16:36:43.600084+00
557	核心機群	核心機群	2020-12-18 16:36:43.859112+00
1307	Shantae: Half-Genie Hero	shantae-half-genie-hero	2020-12-21 20:10:28.097081+00
1321	شانتاي: هالف جينى هيرو	شانتاي-هالف-جينى-هيرو	2020-12-21 20:10:28.267451+00
1329	桑塔：半精靈英雄	桑塔半精靈英雄	2020-12-21 20:10:28.380758+00
1386	One Hand Clapping	one-hand-clapping	2021-02-05 16:52:23.393446+00
535	열혈경파 쿠니오군 외전 River City Girls	열혈경파-쿠니오군-외전-river-city-girls	2020-12-18 16:36:43.626691+00
548	熱血硬派國夫君外傳 熱血少女	熱血硬派國夫君外傳-熱血少女	2020-12-18 16:36:43.764205+00
1387	Submerged: Hidden Depths	submerged-hidden-depths	2021-02-05 16:52:23.580505+00
536	波西亚时光	波西亚时光	2020-12-18 16:36:43.637815+00
1388	Outcasters	outcasters	2021-02-05 16:52:23.607668+00
537	Gears of War (jogo eletrônico)	gears-of-war-jogo-eletrônico	2020-12-18 16:36:43.664339+00
538	Tell Me Why	tell-me-why	2020-12-18 16:36:43.673215+00
549	Tell Me Why (Computerspiel)	tell-me-why-computerspiel	2020-12-18 16:36:43.765364+00
555	کەرستەکانی جەنگ (یاری ڤیدیۆیی)	کەرستەکانی-جەنگ-یاری-ڤیدیۆیی	2020-12-18 16:36:43.852131+00
562	Tell Me Why (videojuego)	tell-me-why-videojuego	2020-12-18 16:36:43.913248+00
569	تل می وای (بازی ویدئویی)	تل-می-وای-بازی-ویدئویی	2020-12-18 16:36:44.199109+00
578	Tell Me Why (jeu vidéo)	tell-me-why-jeu-vidéo	2020-12-18 16:36:44.537402+00
579	战争机器 (游戏)	战争机器-游戏	2020-12-18 16:36:44.566429+00
584	Tell Me Why (videogioco)	tell-me-why-videogioco	2020-12-18 16:36:44.644652+00
586	戰爭機器 (遊戲)	戰爭機器-遊戲	2020-12-18 16:36:44.66986+00
592	Tell Me Why (jogo eletrônico)	tell-me-why-jogo-eletrônico	2020-12-18 16:36:44.807301+00
594	Tell Me Why (игра)	tell-me-why-игра	2020-12-18 16:36:44.916241+00
599	Tell Me Why (video oyunu)	tell-me-why-video-oyunu	2020-12-18 16:36:45.091209+00
604	Tell Me Why (trò chơi video)	tell-me-why-trò-chơi-video	2020-12-18 16:36:45.322626+00
1389	Ghost Recon Wildlands	ghost-recon-wildlands	2021-02-05 16:52:23.896523+00
539	空洞騎士	空洞騎士	2020-12-18 16:36:43.675022+00
1390	El Hijo - A Wild West Tale	el-hijo-a-wild-west-tale	2021-02-05 16:52:23.897482+00
540	The Messenger (jeu vidéo, 2018)	the-messenger-jeu-vidéo-2018	2020-12-18 16:36:43.680775+00
561	The Messenger (jogo eletrônico)	the-messenger-jogo-eletrônico	2020-12-18 16:36:43.89844+00
563	The Messenger (2018 video oyunu)	the-messenger-2018-video-oyunu	2020-12-18 16:36:44.084472+00
1391	Metro 2033 Redux	metro-2033-redux	2021-02-05 16:52:23.948072+00
541	تاكوما (لعبة فيديو)	تاكوما-لعبة-فيديو	2020-12-18 16:36:43.686795+00
542	The Walking Dead: Michonne	the-walking-dead-michonne	2020-12-18 16:36:43.693305+00
543	Warhammer: Vermintide 2	warhammer-vermintide-2	2020-12-18 16:36:43.700737+00
550	Tacoma (videojuego)	tacoma-videojuego	2020-12-18 16:36:43.784485+00
552	مردگان متحرک (میشون)	مردگان-متحرک-میشون	2020-12-18 16:36:43.827491+00
553	وارهيمر: فيرمنتايد 2	وارهيمر-فيرمنتايد-2	2020-12-18 16:36:43.836134+00
567	Tacoma (jeu vidéo)	tacoma-jeu-vidéo	2020-12-18 16:36:44.160214+00
568	وارهيمر: ڤيرمنتايد 2	وارهيمر-ڤيرمنتايد-2	2020-12-18 16:36:44.197983+00
574	ث والكينج دايد: ميتشون	ث-والكينج-دايد-ميتشون	2020-12-18 16:36:44.435776+00
1392	PAC-MAN Mega Tunnel Battle	pac-man-mega-tunnel-battle	2021-02-05 16:52:23.952974+00
545	پيلارس اوف اتيرنيتى	پيلارس-اوف-اتيرنيتى	2020-12-18 16:36:43.727934+00
546	The Walking Dead: A New Frontier	the-walking-dead-a-new-frontier	2020-12-18 16:36:43.742777+00
558	الموتى السائرون: ثغرة جديدة	الموتى-السائرون-ثغرة-جديدة	2020-12-18 16:36:43.862959+00
570	مردگان متحرک: مرز جدید	مردگان-متحرک-مرز-جدید	2020-12-18 16:36:44.217956+00
582	ذا والكينج ديد: ذا نيو فرونتر	ذا-والكينج-ديد-ذا-نيو-فرونتر	2020-12-18 16:36:44.617763+00
588	永恒之柱	永恒之柱	2020-12-18 16:36:44.722574+00
589	ウォーキング・デッド シーズン3	ウォーキングデッド-シーズン3	2020-12-18 16:36:44.744949+00
1393	Embr	embr	2021-02-05 16:52:24.080973+00
547	مورتال کامبت اکس	مورتال-کامبت-اکس	2020-12-18 16:36:43.746346+00
551	The Turing Test	the-turing-test	2020-12-18 16:36:43.789195+00
554	World War Z	world-war-z	2020-12-18 16:36:43.851191+00
564	모탈 컴뱃 X	모탈-컴뱃-x	2020-12-18 16:36:44.086176+00
565	World War Z (videojuego)	world-war-z-videojuego	2020-12-18 16:36:44.101364+00
572	圖靈實驗 (遊戲)	圖靈實驗-遊戲	2020-12-18 16:36:44.385015+00
575	جنگ جهانی زد (بازی ویدئویی ۲۰۱۹)	جنگ-جهانی-زد-بازی-ویدئویی-۲۰۱۹	2020-12-18 16:36:44.444004+00
583	World War Z (jeu vidéo, 2019)	world-war-z-jeu-vidéo-2019	2020-12-18 16:36:44.618103+00
587	مورتال كومبات اكس	مورتال-كومبات-اكس	2020-12-18 16:36:44.697345+00
590	월드워Z (2019년 비디오 게임)	월드워z-2019년-비디오-게임	2020-12-18 16:36:44.769752+00
593	World War Z (permainan video 2019)	world-war-z-permainan-video-2019	2020-12-18 16:36:44.91279+00
597	مۆڕتاڵ کۆمبات ئێکس	مۆڕتاڵ-کۆمبات-ئێکس	2020-12-18 16:36:45.029292+00
598	World War Z (videogioco 2019)	world-war-z-videogioco-2019	2020-12-18 16:36:45.080459+00
602	ورلد وار زى	ورلد-وار-زى	2020-12-18 16:36:45.296218+00
605	World War Z (игра, 2019)	world-war-z-игра-2019	2020-12-18 16:36:45.366003+00
607	真人快打X	真人快打x	2020-12-18 16:36:45.411256+00
608	World War Z (larong bidyo ng 2019)	world-war-z-larong-bidyo-ng-2019	2020-12-18 16:36:45.441955+00
610	World War Z (trò chơi điện tử)	world-war-z-trò-chơi-điện-tử	2020-12-18 16:36:45.510807+00
612	僵尸世界大战（2019年游戏）	僵尸世界大战2019年游戏	2020-12-18 16:36:45.587485+00
1394	Monster Jam Steel Titans	monster-jam-steel-titans	2021-02-05 16:52:24.10392+00
556	استلاریس	استلاریس	2020-12-18 16:36:43.858498+00
573	스텔라리스	스텔라리스	2020-12-18 16:36:44.43274+00
580	Stellaris (videogioco 2016)	stellaris-videogioco-2016	2020-12-18 16:36:44.584964+00
595	Stellaris (jogo eletrônico)	stellaris-jogo-eletrônico	2020-12-18 16:36:44.921701+00
601	Stellaris (videopeli)	stellaris-videopeli	2020-12-18 16:36:45.131221+00
603	Stellaris (spel)	stellaris-spel	2020-12-18 16:36:45.314887+00
611	群星 (游戏)	群星-游戏	2020-12-18 16:36:45.526045+00
1395	SUPER BOMBERMAN R ONLINE	super-bomberman-r-online	2021-02-05 16:52:24.194866+00
560	رزیدنت ایول ۷: بایوهازارد	رزیدنت-ایول-۷-بایوهازارد	2020-12-18 16:36:43.887839+00
576	바이오하자드 7 레지던트 이블	바이오하자드-7-레지던트-이블	2020-12-18 16:36:44.451585+00
591	ريزدنت ايفل 7:بايوهازرد	ريزدنت-ايفل-7بايوهازرد	2020-12-18 16:36:44.78287+00
596	バイオハザード7 レジデント イービル	バイオハザード7-レジデント-イービル	2020-12-18 16:36:45.006743+00
606	ڕێزدێنت ئیڤڵ ٧: بایۆھازارد	ڕێزدێنت-ئیڤڵ-٧-بایۆھازارد	2020-12-18 16:36:45.367114+00
609	เรซิเดนต์อีวิล 7: ไบโอฮาซาร์ด	เรซเดนตอวล-7-ไบโอฮาซารด	2020-12-18 16:36:45.490626+00
613	生化危机7 恶灵古堡	生化危机7-恶灵古堡	2020-12-18 16:36:45.625612+00
614	生化危機7 惡靈古堡	生化危機7-惡靈古堡	2020-12-18 16:36:45.692725+00
1396	GYLT	gylt	2021-02-05 16:52:24.198513+00
566	林中之夜	林中之夜	2020-12-18 16:36:44.158+00
1397	Panzer Dragoon: Remake	panzer-dragoon-remake	2021-02-05 16:52:24.201278+00
571	씨 오브 시브즈	씨-오브-시브즈	2020-12-18 16:36:44.370708+00
581	سى اف ثيفيز	سى-اف-ثيفيز	2020-12-18 16:36:44.592488+00
600	盗贼之海	盗贼之海	2020-12-18 16:36:45.098528+00
1398	Sundered: Eldritch Edition	sundered-eldritch-edition	2021-02-05 16:52:24.205497+00
577	ستيت اف ديكاى 2	ستيت-اف-ديكاى-2	2020-12-18 16:36:44.485709+00
1399	Little Big Workshop	little-big-workshop	2021-02-05 16:52:24.35749+00
585	星環戰役	星環戰役	2020-12-18 16:36:44.660408+00
615	Enter the Gungeon	enter-the-gungeon	2020-12-18 16:41:43.894223+00
616	انتير ث جونجيون	انتير-ث-جونجيون	2020-12-18 16:41:43.909908+00
617	Ary and the Secret of Seasons	ary-and-the-secret-of-seasons	2020-12-20 04:10:34.2241+00
618	Attack on Titan 2	attack-on-titan-2	2020-12-20 04:10:34.310772+00
619	هجوم العمالقة 2 (لعبة فيديو)	هجوم-العمالقة-2-لعبة-فيديو	2020-12-20 04:10:34.322168+00
620	A.O.T. 2	aot-2	2020-12-20 04:10:34.334509+00
621	اتاك اون تايتن 2	اتاك-اون-تايتن-2	2020-12-20 04:10:34.342889+00
622	Assassin's Creed Odyssey	assassins-creed-odyssey	2020-12-20 04:10:34.374188+00
623	أساسنز كريد أوديسي	أساسنز-كريد-أوديسي	2020-12-20 04:10:34.384186+00
624	اساسینز کرید ادیسه	اساسینز-کرید-ادیسه	2020-12-20 04:10:34.446943+00
625	어쌔신 크리드 오디세이	어쌔신-크리드-오디세이	2020-12-20 04:10:34.464021+00
626	اساسنز كريد: اوديسى	اساسنز-كريد-اوديسى	2020-12-20 04:10:34.485517+00
627	アサシン クリード オデッセイ	アサシン-クリード-オデッセイ	2020-12-20 04:10:34.494849+00
628	ئەساسنز کرید ئۆدیسی	ئەساسنز-کرید-ئۆدیسی	2020-12-20 04:10:34.512604+00
629	อัสแซสซินส์ครีด โอดิสซี	อสแซสซนสครด-โอดสซ	2020-12-20 04:10:34.55168+00
630	Celeste	celeste	2020-12-20 04:10:34.606834+00
631	Baldur's Gate III	baldurs-gate-iii	2020-12-20 04:10:34.609606+00
632	Assassin's Creed Valhalla	assassins-creed-valhalla	2020-12-20 04:10:34.61363+00
633	Assassin's Creed Syndicate	assassins-creed-syndicate	2020-12-20 04:10:34.61935+00
634	Assassin's Creed Origins	assassins-creed-origins	2020-12-20 04:10:34.624547+00
635	刺客信条：奥德赛	刺客信条奥德赛	2020-12-20 04:10:34.625002+00
636	سيليست	سيليست	2020-12-20 04:10:34.635822+00
637	أساسنز كريد سنديكيت	أساسنز-كريد-سنديكيت	2020-12-20 04:10:34.643128+00
638	Borderlands 3	borderlands-3	2020-12-20 04:10:34.64458+00
639	أساسنز كريد فالهالا	أساسنز-كريد-فالهالا	2020-12-20 04:10:34.645513+00
640	أساسنز كريد أوريجنز	أساسنز-كريد-أوريجنز	2020-12-20 04:10:34.652039+00
641	Celeste (computerspil)	celeste-computerspil	2020-12-20 04:10:34.659332+00
642	Assassin's Creed Unity	assassins-creed-unity	2020-12-20 04:10:34.660874+00
643	بوردرلاندز 3	بوردرلاندز-3	2020-12-20 04:10:34.668895+00
644	أساسنز كريد يونيتي	أساسنز-كريد-يونيتي	2020-12-20 04:10:34.686756+00
645	Celeste (Computerspiel)	celeste-computerspiel	2020-12-20 04:10:34.689459+00
646	অ্যাসাসিন'স ক্রিড অরিজিনস	অযসসনস-করড-অরজনস	2020-12-20 04:10:34.696674+00
647	Celeste (videojuego)	celeste-videojuego	2020-12-20 04:10:34.732492+00
648	سرزمین‌های مرزی ۳	سرزمینهای-مرزی-۳	2020-12-20 04:10:34.738969+00
649	Baldur’s Gate 3	baldurs-gate-3	2020-12-20 04:10:34.764843+00
650	اساسینز کرید: سندیکا	اساسینز-کرید-سندیکا	2020-12-20 04:10:34.768452+00
651	سلسته (بازی ویدئویی)	سلسته-بازی-ویدئویی	2020-12-20 04:10:34.782976+00
652	보더랜드 3	보더랜드-3	2020-12-20 04:10:34.789067+00
653	博德之门III	博德之门iii	2020-12-20 04:10:34.793587+00
654	اساسینز کرید ریشه‌ها	اساسینز-کرید-ریشهها	2020-12-20 04:10:34.799041+00
655	اساسینز کرید والهالا	اساسینز-کرید-والهالا	2020-12-20 04:10:34.799822+00
656	اساسینز کرید: وحدت	اساسینز-کرید-وحدت	2020-12-20 04:10:34.808905+00
657	어쌔신 크리드: 신디케이트	어쌔신-크리드-신디케이트	2020-12-20 04:10:34.81487+00
658	Celeste (jeu vidéo)	celeste-jeu-vidéo	2020-12-20 04:10:34.829077+00
659	어쌔신 크리드 발할라	어쌔신-크리드-발할라	2020-12-20 04:10:34.843598+00
660	어쌔신 크리드: 유니티	어쌔신-크리드-유니티	2020-12-20 04:10:34.8567+00
661	어쌔신 크리드 오리진	어쌔신-크리드-오리진	2020-12-20 04:10:34.860703+00
662	설레스트 (비디오 게임)	설레스트-비디오-게임	2020-12-20 04:10:34.87045+00
663	Celeste (tölvuleikur)	celeste-tölvuleikur	2020-12-20 04:10:34.916619+00
664	اساسينس كريد سينديكات	اساسينس-كريد-سينديكات	2020-12-20 04:10:34.926292+00
665	اساسنز كريد فالهالا	اساسنز-كريد-فالهالا	2020-12-20 04:10:34.926788+00
666	Celeste (videogioco)	celeste-videogioco	2020-12-20 04:10:34.956356+00
667	アサシン クリード ヴァルハラ	アサシン-クリード-ヴァルハラ	2020-12-20 04:10:34.964371+00
668	アサシン クリード シンジケート	アサシン-クリード-シンジケート	2020-12-20 04:10:34.970836+00
669	无主之地3	无主之地3	2020-12-20 04:10:34.977348+00
670	اساسنز كريد اوريجونز	اساسنز-كريد-اوريجونز	2020-12-20 04:10:34.977906+00
671	アサシン クリード オリジンズ	アサシン-クリード-オリジンズ	2020-12-20 04:10:35.010986+00
672	Celeste (computerspel)	celeste-computerspel	2020-12-20 04:10:35.013518+00
673	اساسينس كريد ونيتى	اساسينس-كريد-ونيتى	2020-12-20 04:10:35.032595+00
674	Dataspelet Celeste	dataspelet-celeste	2020-12-20 04:10:35.057456+00
675	アサシン クリード ユニティ	アサシン-クリード-ユニティ	2020-12-20 04:10:35.086957+00
676	Celeste (jogo eletrônico)	celeste-jogo-eletrônico	2020-12-20 04:10:35.100714+00
677	อัสแซสซินส์ครีด ซินดิเคท	อสแซสซนสครด-ซนดเคท	2020-12-20 04:10:35.119576+00
678	Celeste (игра)	celeste-игра	2020-12-20 04:10:35.131204+00
679	อัสแซสซินส์ครีด ออริจินส์	อสแซสซนสครด-ออรจนส	2020-12-20 04:10:35.141805+00
680	อัสแซสซินส์ครีด วัลฮัลลา	อสแซสซนสครด-วลฮลลา	2020-12-20 04:10:35.143907+00
681	Celeste (datorspel)	celeste-datorspel	2020-12-20 04:10:35.172586+00
682	刺客教條：梟雄	刺客教條梟雄	2020-12-20 04:10:35.174917+00
683	刺客信条：起源	刺客信条起源	2020-12-20 04:10:35.191454+00
684	刺客信条：英灵殿	刺客信条英灵殿	2020-12-20 04:10:35.192108+00
685	Celeste (larong bidyo)	celeste-larong-bidyo	2020-12-20 04:10:35.200449+00
686	Celeste (video oyunu)	celeste-video-oyunu	2020-12-20 04:10:35.233196+00
687	อัสแซสซินส์ครีด ยูนิตี	อสแซสซนสครด-ยนต	2020-12-20 04:10:35.236208+00
688	蔚蓝 (游戏)	蔚蓝-游戏	2020-12-20 04:10:35.258308+00
689	蔚藍 (遊戲)	蔚藍-遊戲	2020-12-20 04:10:35.294186+00
690	刺客信条：大革命	刺客信条大革命	2020-12-20 04:10:35.300867+00
691	刺客教條：大革命	刺客教條大革命	2020-12-20 04:10:35.314344+00
692	Doom 64	doom-64	2020-12-20 04:21:06.899779+00
693	دوم 64	دوم-64	2020-12-20 04:21:06.912139+00
694	DOOM	doom	2020-12-20 04:21:06.937985+00
695	Destiny 2	destiny-2	2020-12-20 04:21:08.301874+00
696	Destroy All Humans!	destroy-all-humans	2020-12-20 04:21:08.310591+00
697	Doom Eternal	doom-eternal	2020-12-20 04:21:08.333219+00
698	Everspace	everspace	2020-12-20 04:21:08.414806+00
699	Dragon Ball Xenoverse 2	dragon-ball-xenoverse-2	2020-12-20 04:21:08.419849+00
700	Cyberpunk 2077	cyberpunk-2077	2020-12-20 04:21:08.437754+00
701	Dirt 5	dirt-5	2020-12-20 04:21:08.455861+00
702	ديستني 2	ديستني-2	2020-12-20 04:21:08.470811+00
703	ديستروي أول هيومن! (لعبة فيديو 2020)	ديستروي-أول-هيومن-لعبة-فيديو-2020	2020-12-20 04:21:08.500255+00
704	دوم (لعبة فيديو 2016)	دوم-لعبة-فيديو-2016	2020-12-20 04:21:08.553273+00
705	دوم إيترنال	دوم-إيترنال	2020-12-20 04:21:08.572277+00
706	سايبر بانك 2077	سايبر-بانك-2077	2020-12-20 04:21:08.63782+00
707	ديرت 5	ديرت-5	2020-12-20 04:21:08.662053+00
708	Destroy All Humans! (jeu vidéo, 2020)	destroy-all-humans-jeu-vidéo-2020	2020-12-20 04:21:08.692043+00
709	F1 2020	f1-2020	2020-12-20 04:21:08.695119+00
710	Far Cry 5	far-cry-5	2020-12-20 04:21:08.702201+00
711	Doom (2016)	doom-2016	2020-12-20 04:21:08.718986+00
712	সাইবারপাঙ্ক ২০৭৭	সইবরপঙক-২০৭৭	2020-12-20 04:21:08.742706+00
713	Far Cry 6	far-cry-6	2020-12-20 04:21:08.767477+00
714	سرنوشت ۲ (بازی ویدئویی)	سرنوشت-۲-بازی-ویدئویی	2020-12-20 04:21:08.782831+00
715	드래곤볼 제노버스 2	드래곤볼-제노버스-2	2020-12-20 04:21:08.783368+00
716	إف 1 2020 (لعبة فيديو)	إف-1-2020-لعبة-فيديو	2020-12-20 04:21:08.792699+00
717	فار كراي 5	فار-كراي-5	2020-12-20 04:21:08.829591+00
718	فار كراي 6	فار-كراي-6	2020-12-20 04:21:08.863448+00
719	Doom (computerspil fra 2016)	doom-computerspil-fra-2016	2020-12-20 04:21:08.863876+00
720	دوم اترنال	دوم-اترنال	2020-12-20 04:21:08.87237+00
721	Far Cry New Dawn	far-cry-new-dawn	2020-12-20 04:21:08.892926+00
722	ديستروى اوول هيومن! (فيديو لعب 2020)	ديستروى-اوول-هيومن-فيديو-لعب-2020	2020-12-20 04:21:08.920707+00
723	Football Manager 2020	football-manager-2020	2020-12-20 04:21:08.925247+00
724	F1 2020 (videojuego)	f1-2020-videojuego	2020-12-20 04:21:08.944145+00
725	데스티니 가디언즈	데스티니-가디언즈	2020-12-20 04:21:08.949177+00
726	FIFA 21	fifa-21	2020-12-20 04:21:08.973966+00
727	ফার ক্রাই ৫	ফর-করই-৫	2020-12-20 04:21:08.984495+00
728	فار كراي نيو داون	فار-كراي-نيو-داون	2020-12-20 04:21:08.990325+00
729	ফার ক্রাই ৬	ফর-করই-৬	2020-12-20 04:21:08.99672+00
730	دیرت ۵	دیرت-۵	2020-12-20 04:21:08.999608+00
731	Final Fantasy XV	final-fantasy-xv	2020-12-20 04:21:09.005774+00
732	دراجون بال اكسينوڤيرس 2	دراجون-بال-اكسينوڤيرس-2	2020-12-20 04:21:09.020833+00
733	Destroy All Humans! (2020 video oyunu)	destroy-all-humans-2020-video-oyunu	2020-12-20 04:21:09.064259+00
734	둠 이터널	둠-이터널	2020-12-20 04:21:09.067502+00
735	F1 2020 (jeu vidéo)	f1-2020-jeu-vidéo	2020-12-20 04:21:09.116681+00
736	Doom (videojuego de 2016)	doom-videojuego-de-2016	2020-12-20 04:21:09.127182+00
737	Hitman 3	hitman-3	2020-12-20 04:21:09.131562+00
738	فيفا 21	فيفا-21	2020-12-20 04:21:09.133687+00
739	Family Feud	family-feud	2020-12-20 04:21:09.167702+00
740	فاينل فانتازي 15	فاينل-فانتازي-15	2020-12-20 04:21:09.172433+00
741	ドラゴンボール ゼノバース2	ドラゴンボール-ゼノバース2	2020-12-20 04:21:09.174452+00
742	Hitman 2	hitman-2	2020-12-20 04:21:09.181972+00
743	ديستنى 2	ديستنى-2	2020-12-20 04:21:09.185239+00
744	Grid	grid	2020-12-20 04:21:09.192699+00
745	Hitman	hitman	2020-12-20 04:21:09.233614+00
746	سایبرپانک ۲۰۷۷	سایبرپانک-۲۰۷۷	2020-12-20 04:21:09.264594+00
747	غريد (لعبة فيديو 2019)	غريد-لعبة-فيديو-2019	2020-12-20 04:21:09.278542+00
748	دوم (بازی ویدئویی ۲۰۱۶)	دوم-بازی-ویدئویی-۲۰۱۶	2020-12-20 04:21:09.279952+00
749	هيتمان 3	هيتمان-3	2020-12-20 04:21:09.282717+00
750	فار کرای ۶	فار-کرای-۶	2020-12-20 04:21:09.283287+00
751	足球經理2020	足球經理2020	2020-12-20 04:21:09.283798+00
752	דום הנצחי	דום-הנצחי	2020-12-20 04:21:09.310862+00
753	فار کرای طلیعه نوین	فار-کرای-طلیعه-نوین	2020-12-20 04:21:09.326578+00
754	Family Feud (computerspelserie)	family-feud-computerspelserie	2020-12-20 04:21:09.333416+00
755	هيتمان (لعبة فيديو 2016)	هيتمان-لعبة-فيديو-2016	2020-12-20 04:21:09.358383+00
756	হিটম্যান ৩	হটমযন-৩	2020-12-20 04:21:09.382803+00
757	هيتمان 2 (لعبة فيديو 2018)	هيتمان-2-لعبة-فيديو-2018	2020-12-20 04:21:09.384016+00
758	Doom (jeu vidéo, 2016)	doom-jeu-vidéo-2016	2020-12-20 04:21:09.390966+00
759	فیفا ۲۱	فیفا-۲۱	2020-12-20 04:21:09.407824+00
760	Grid (jeu vidéo, 2019)	grid-jeu-vidéo-2019	2020-12-20 04:21:09.421477+00
761	دوم ايترنال	دوم-ايترنال	2020-12-20 04:21:09.431413+00
762	اف 1 2020 (فيديو لعب)	اف-1-2020-فيديو-لعب	2020-12-20 04:21:09.43971+00
763	فار کرای ۵	فار-کرای-۵	2020-12-20 04:21:09.442155+00
764	사이버펑크 2077	사이버펑크-2077	2020-12-20 04:21:09.467418+00
765	Hitman (videospil fra 2016)	hitman-videospil-fra-2016	2020-12-20 04:21:09.486159+00
766	파 크라이 뉴 던	파-크라이-뉴-던	2020-12-20 04:21:09.503993+00
767	Grid (permainan video)	grid-permainan-video	2020-12-20 04:21:09.526027+00
768	F1 2020 (computerspel)	f1-2020-computerspel	2020-12-20 04:21:09.532313+00
769	هیتمن ۳	هیتمن-۳	2020-12-20 04:21:09.536888+00
770	فار كراى 6	فار-كراى-6	2020-12-20 04:21:09.553679+00
771	فاینال فانتزی ۱۵	فاینال-فانتزی-۱۵	2020-12-20 04:21:09.561202+00
772	파 크라이 5	파-크라이-5	2020-12-20 04:21:09.585219+00
773	เดสตินี 2	เดสตน-2	2020-12-20 04:21:09.58972+00
774	Hitman (2016)	hitman-2016	2020-12-20 04:21:09.613346+00
775	둠 (2016년 비디오 게임)	둠-2016년-비디오-게임	2020-12-20 04:21:09.630036+00
776	جريد (فيديو لعب 2019)	جريد-فيديو-لعب-2019	2020-12-20 04:21:09.669349+00
777	فار كراى نيو داون	فار-كراى-نيو-داون	2020-12-20 04:21:09.682971+00
778	هیتمن ۲	هیتمن-۲	2020-12-20 04:21:09.688165+00
779	सायबरपंक 2077	सयबरपक-2077	2020-12-20 04:21:09.689832+00
780	파이널 판타지 XV	파이널-판타지-xv	2020-12-20 04:21:09.712562+00
781	F1 2020 (jogo eletrônico)	f1-2020-jogo-eletrônico	2020-12-20 04:21:09.723702+00
782	Hitman III	hitman-iii	2020-12-20 04:21:09.736145+00
783	Hitman (videojuego de 2016)	hitman-videojuego-de-2016	2020-12-20 04:21:09.754416+00
784	Doom (videogioco 2016)	doom-videogioco-2016	2020-12-20 04:21:09.770352+00
785	Hitman 2 (jeu vidéo, 2018)	hitman-2-jeu-vidéo-2018	2020-12-20 04:21:09.796392+00
786	命运2	命运2	2020-12-20 04:21:09.82497+00
787	Grid (computerspel uit 2019)	grid-computerspel-uit-2019	2020-12-20 04:21:09.829919+00
792	Grid (jogo eletrônico de 2019)	grid-jogo-eletrônico-de-2019	2020-12-20 04:21:09.980297+00
1400	Chronos: Before the Ashes	chronos-before-the-ashes	2021-02-05 16:52:24.488553+00
788	F1 2020 (video game)	f1-2020-video-game	2020-12-20 04:21:09.852897+00
1401	Windbound	windbound	2021-02-05 16:52:24.501042+00
789	דום (משחק וידאו, 2016)	דום-משחק-וידאו-2016	2020-12-20 04:21:09.890322+00
793	Doom (videójáték, 2016)	doom-videójáték-2016	2020-12-20 04:21:09.985099+00
802	دوم (فيديو لعب 2016)	دوم-فيديو-لعب-2016	2020-12-20 04:21:10.141727+00
824	DOOM (2016年のゲーム)	doom-2016年のゲーム	2020-12-20 04:21:10.364716+00
834	2016-dataspelet Doom	2016-dataspelet-doom	2020-12-20 04:21:10.503335+00
841	Doom (gra komputerowa 2016)	doom-gra-komputerowa-2016	2020-12-20 04:21:10.64435+00
846	Doom (jogo eletrônico de 2016)	doom-jogo-eletrônico-de-2016	2020-12-20 04:21:10.768299+00
850	Doom (игра, 2016)	doom-игра-2016	2020-12-20 04:21:10.865061+00
856	Doom (videoigra, 2016)	doom-videoigra-2016	2020-12-20 04:21:10.936011+00
861	Doom (vuoden 2016 videopeli)	doom-vuoden-2016-videopeli	2020-12-20 04:21:11.005735+00
866	Doom (datorspel, 2016)	doom-datorspel-2016	2020-12-20 04:21:11.094019+00
870	Doom (2016 video oyunu)	doom-2016-video-oyunu	2020-12-20 04:21:11.165306+00
876	Doom (відеогра 2016)	doom-відеогра-2016	2020-12-20 04:21:11.244896+00
881	毁灭战士 (2016年游戏)	毁灭战士-2016年游戏	2020-12-20 04:21:11.348898+00
882	毀滅戰士 (2016年遊戲)	毀滅戰士-2016年遊戲	2020-12-20 04:21:11.411557+00
1402	Crayta	crayta	2021-02-05 16:52:24.536661+00
790	هیتمن (بازی ویدئویی ۲۰۱۶)	هیتمن-بازی-ویدئویی-۲۰۱۶	2020-12-20 04:21:09.950203+00
797	Hitman (jeu vidéo, 2016)	hitman-jeu-vidéo-2016	2020-12-20 04:21:10.070173+00
807	Hitman (videogioco 2016)	hitman-videogioco-2016	2020-12-20 04:21:10.200536+00
819	Hitman (2016 kompiuterinis žaidimas)	hitman-2016-kompiuterinis-žaidimas	2020-12-20 04:21:10.31418+00
826	Hitman (computerspel)	hitman-computerspel	2020-12-20 04:21:10.40355+00
836	Hitman (2016年のゲーム)	hitman-2016年のゲーム	2020-12-20 04:21:10.523049+00
843	Hitman (gra komputerowa)	hitman-gra-komputerowa	2020-12-20 04:21:10.713152+00
849	Hitman (jogo eletrônico de 2016)	hitman-jogo-eletrônico-de-2016	2020-12-20 04:21:10.841293+00
860	Hitman (игра, 2016)	hitman-игра-2016	2020-12-20 04:21:10.954177+00
864	Hitman (vuoden 2016 videopeli)	hitman-vuoden-2016-videopeli	2020-12-20 04:21:11.02118+00
868	Hitman (datorspel, 2016)	hitman-datorspel-2016	2020-12-20 04:21:11.132249+00
873	Hitman (2016, video oyunu)	hitman-2016-video-oyunu	2020-12-20 04:21:11.18414+00
875	Hitman (гра, 2016)	hitman-гра-2016	2020-12-20 04:21:11.244046+00
879	杀手 (2016年游戏)	杀手-2016年游戏	2020-12-20 04:21:11.334713+00
1403	Cake Bash	cake-bash	2021-02-05 16:52:24.557394+00
791	فار كراى 5	فار-كراى-5	2020-12-20 04:21:09.971011+00
830	فار کرای ٥	فار-کرای-٥	2020-12-20 04:21:10.432315+00
840	ฟาร์คราย 5	ฟารคราย-5	2020-12-20 04:21:10.636367+00
855	孤岛惊魂5	孤岛惊魂5	2020-12-20 04:21:10.925873+00
1404	Rock of Ages 3: Make & Break	rock-of-ages-3-make-break	2021-02-05 16:52:24.740638+00
794	孤岛惊魂6	孤岛惊魂6	2020-12-20 04:21:09.996966+00
1405	Gunsport	gunsport	2021-02-05 16:52:24.868662+00
795	히트맨 2 (2018년 비디오 게임)	히트맨-2-2018년-비디오-게임	2020-12-20 04:21:10.025773+00
806	Hitman 2 (videogioco 2018)	hitman-2-videogioco-2018	2020-12-20 04:21:10.170291+00
815	هيتمان 2 (فيديو لعب 2018)	هيتمان-2-فيديو-لعب-2018	2020-12-20 04:21:10.295925+00
833	ヒットマン2	ヒットマン2	2020-12-20 04:21:10.476639+00
838	Hitman 2 (jogo eletrônico de 2018)	hitman-2-jogo-eletrônico-de-2018	2020-12-20 04:21:10.592904+00
848	Hitman 2 (joc video din 2018)	hitman-2-joc-video-din-2018	2020-12-20 04:21:10.804551+00
854	Hitman 2 (игра, 2018)	hitman-2-игра-2018	2020-12-20 04:21:10.92237+00
862	Hitman 2 (vuoden 2018 videopeli)	hitman-2-vuoden-2018-videopeli	2020-12-20 04:21:11.018712+00
865	Hitman 2 (datorspel, 2018)	hitman-2-datorspel-2018	2020-12-20 04:21:11.068744+00
871	Hitman 2 (2018, video oyunu)	hitman-2-2018-video-oyunu	2020-12-20 04:21:11.166497+00
877	Hitman 2 (2018)	hitman-2-2018	2020-12-20 04:21:11.265831+00
880	杀手2 (2018年游戏)	杀手2-2018年游戏	2020-12-20 04:21:11.343392+00
1406	Hello Neighbor: Hide and Seek	hello-neighbor-hide-and-seek	2021-02-05 16:52:25.111713+00
796	毁灭战士：永恒	毁灭战士永恒	2020-12-20 04:21:10.034801+00
798	Humankind	humankind	2020-12-20 04:21:10.079407+00
799	Hotline Miami	hotline-miami	2020-12-20 04:21:10.088046+00
804	毀滅戰士：永恆	毀滅戰士永恆	2020-12-20 04:21:10.155813+00
812	هوت لاين ميامي	هوت-لاين-ميامي	2020-12-20 04:21:10.266511+00
821	هومانكيند	هومانكيند	2020-12-20 04:21:10.338525+00
842	핫라인 마이애미	핫라인-마이애미	2020-12-20 04:21:10.667251+00
851	ホットライン・マイアミ	ホットラインマイアミ	2020-12-20 04:21:10.87362+00
800	Final Fantasy Versus XIII	final-fantasy-versus-xiii	2020-12-20 04:21:10.090303+00
810	فاينل فانتسى 15	فاينل-فانتسى-15	2020-12-20 04:21:10.250934+00
835	ファイナルファンタジーXV	ファイナルファンタジーxv	2020-12-20 04:21:10.510463+00
857	ไฟนอลแฟนตาซี XV	ไฟนอลแฟนตาซ-xv	2020-12-20 04:21:10.939282+00
869	最終幻想XV	最終幻想xv	2020-12-20 04:21:11.148235+00
801	سايبربونك 2077	سايبربونك-2077	2020-12-20 04:21:10.115259+00
803	Just Dance 2021	just-dance-2021	2020-12-20 04:21:10.154226+00
805	Immortals Fenyx Rising	immortals-fenyx-rising	2020-12-20 04:21:10.167339+00
808	Into the Breach	into-the-breach	2020-12-20 04:21:10.208058+00
809	Hotline Miami 2: Wrong Number	hotline-miami-2-wrong-number	2020-12-20 04:21:10.213851+00
811	Just Shapes & Beats	just-shapes-beats	2020-12-20 04:21:10.253279+00
813	Just Dance 2020	just-dance-2020	2020-12-20 04:21:10.287104+00
814	هوت لاين ميامي 2: رونغ نمبر	هوت-لاين-ميامي-2-رونغ-نمبر	2020-12-20 04:21:10.292764+00
816	Jotun	jotun	2020-12-20 04:21:10.299228+00
818	جاست دانس 2021	جاست-دانس-2021	2020-12-20 04:21:10.303608+00
820	إنتو ذا بريش	إنتو-ذا-بريش	2020-12-20 04:21:10.324999+00
822	السرمديون، فينكس نحو القمة	السرمديون-فينكس-نحو-القمة	2020-12-20 04:21:10.34505+00
825	サイバーパンク2077	サイバーパンク2077	2020-12-20 04:21:10.365157+00
827	جاست دانس 2020	جاست-دانس-2020	2020-12-20 04:21:10.415635+00
828	Just Shapes and Beats	just-shapes-and-beats	2020-12-20 04:21:10.4161+00
829	Jotun (jeu vidéo)	jotun-jeu-vidéo	2020-12-20 04:21:10.419529+00
831	به سوی شکاف	به-سوی-شکاف	2020-12-20 04:21:10.465982+00
832	فقط برقص ۲۰۲۱	فقط-برقص-۲۰۲۱	2020-12-20 04:21:10.470674+00
837	ايمورتوس فينكس ريسنج	ايمورتوس-فينكس-ريسنج	2020-12-20 04:21:10.530723+00
839	Jotun (videospill)	jotun-videospill	2020-12-20 04:21:10.635923+00
844	저스트 댄스 2020	저스트-댄스-2020	2020-12-20 04:21:10.741941+00
845	انتو ذا بريش	انتو-ذا-بريش	2020-12-20 04:21:10.742479+00
847	Jotun (jogo eletrônico)	jotun-jogo-eletrônico	2020-12-20 04:21:10.799617+00
852	渡神纪 芬尼斯崛起	渡神纪-芬尼斯崛起	2020-12-20 04:21:10.885763+00
853	陷陣之志	陷陣之志	2020-12-20 04:21:10.902941+00
858	چاست دانس 2021	چاست-دانس-2021	2020-12-20 04:21:10.944973+00
859	ไซเบอร์พังก์ 2077	ไซเบอรพงก-2077	2020-12-20 04:21:10.952264+00
863	چاست دانس 2020	چاست-دانس-2020	2020-12-20 04:21:11.01945+00
867	赛博朋克2077	赛博朋克2077	2020-12-20 04:21:11.095668+00
872	舞力全开2021	舞力全开2021	2020-12-20 04:21:11.168573+00
874	數碼鬅客 2077	數碼鬅客-2077	2020-12-20 04:21:11.216213+00
878	舞力全開2020	舞力全開2020	2020-12-20 04:21:11.289082+00
817	孤岛惊魂：新曙光	孤岛惊魂新曙光	2020-12-20 04:21:10.303153+00
823	刺客任務3	刺客任務3	2020-12-20 04:21:10.354368+00
883	Superhot	superhot	2020-12-21 16:11:59.000747+00
884	Little Nightmares	little-nightmares	2020-12-21 16:12:02.112386+00
885	Lara Croft and the Temple of Osiris	lara-croft-and-the-temple-of-osiris	2020-12-21 16:12:02.144633+00
886	ليتل نايتميرز	ليتل-نايتميرز	2020-12-21 16:12:02.32265+00
887	لارا كروفت اند ث تيمپل اوف اوسيريس	لارا-كروفت-اند-ث-تيمپل-اوف-اوسيريس	2020-12-21 16:12:02.517739+00
888	Wikipédia:Candidatos a artigo/Just Dance 2021	wikipédiacandidatos-a-artigojust-dance-2021	2020-12-21 16:12:02.532721+00
889	ララ・クロフト アンド テンプル オブ オシリス	ララクロフト-アンド-テンプル-オブ-オシリス	2020-12-21 16:12:02.687506+00
890	لیتل نایتمرز	لیتل-نایتمرز	2020-12-21 16:12:02.743353+00
891	Marvel's Avengers	marvels-avengers	2020-12-21 16:12:02.836166+00
892	Mafia III	mafia-iii	2020-12-21 16:12:02.874848+00
893	Madden NFL 21	madden-nfl-21	2020-12-21 16:12:02.885594+00
894	Metro: Last Light	metro-last-light	2020-12-21 16:12:02.89547+00
895	Metro Exodus	metro-exodus	2020-12-21 16:12:02.925097+00
896	Mafia II	mafia-ii	2020-12-21 16:12:02.92972+00
897	مترو: لاست لايت	مترو-لاست-لايت	2020-12-21 16:12:02.961781+00
898	أفنجرز (لعبة فيديو 2020)	أفنجرز-لعبة-فيديو-2020	2020-12-21 16:12:02.97533+00
899	مافيا 3	مافيا-3	2020-12-21 16:12:02.994402+00
900	مافيا 2	مافيا-2	2020-12-21 16:12:03.06947+00
901	劳拉和俄西里斯神庙	劳拉和俄西里斯神庙	2020-12-21 16:12:03.084424+00
902	مترو إكسودس	مترو-إكسودس	2020-12-21 16:12:03.087162+00
903	LITTLE NIGHTMARES-リトルナイトメア-	little-nightmares-リトルナイトメア-	2020-12-21 16:12:03.091015+00
904	মাফিয়া ২	মফয-২	2020-12-21 16:12:03.166529+00
905	অ্যাভেঞ্জার্স (২০২০-এর ভিডিও গেম)	অযভঞজরস-২০২০-এর-ভডও-গম	2020-12-21 16:12:03.173988+00
906	Мафія 2	мафія-2	2020-12-21 16:12:03.321058+00
907	Monopoly	monopoly	2020-12-21 16:12:03.340979+00
908	مافیا ۳	مافیا-۳	2020-12-21 16:12:03.378743+00
909	مترو اکسدس	مترو-اکسدس	2020-12-21 16:12:03.39063+00
910	مترو: آخرین نور	مترو-آخرین-نور	2020-12-21 16:12:03.392601+00
911	انتقام‌جویان (بازی ویدئویی ۲۰۲۰)	انتقامجویان-بازی-ویدئویی-۲۰۲۰	2020-12-21 16:12:03.448164+00
912	小小梦魇	小小梦魇	2020-12-21 16:12:03.448781+00
913	Monster Boy and the Cursed Kingdom	monster-boy-and-the-cursed-kingdom	2020-12-21 16:12:03.457414+00
914	Liste de jeux vidéo Monopoly	liste-de-jeux-vidéo-monopoly	2020-12-21 16:12:03.500799+00
915	마피아 III	마피아-iii	2020-12-21 16:12:03.506761+00
916	Octopath Traveler	octopath-traveler	2020-12-21 16:12:03.55329+00
917	Monster Energy Supercross: The Official Videogame	monster-energy-supercross-the-official-videogame	2020-12-21 16:12:03.55787+00
918	MotoGP 20	motogp-20	2020-12-21 16:12:03.559611+00
919	메트로 엑소더스	메트로-엑소더스	2020-12-21 16:12:03.566117+00
920	Monster Boy et le Royaume Maudit	monster-boy-et-le-royaume-maudit	2020-12-21 16:12:03.568996+00
921	메트로: 라스트 라이트	메트로-라스트-라이트	2020-12-21 16:12:03.571495+00
922	Marvel's Avengers (jeu vidéo)	marvels-avengers-jeu-vidéo	2020-12-21 16:12:03.626189+00
923	โมโนโพลี (วิดีโอเกม)	โมโนโพล-วดโอเกม	2020-12-21 16:12:03.654076+00
924	NBA 2K21	nba-2k21	2020-12-21 16:12:03.694667+00
925	Outriders	outriders	2020-12-21 16:12:03.695799+00
926	몬스터 보이와 저주받은 왕국	몬스터-보이와-저주받은-왕국	2020-12-21 16:12:03.696818+00
927	Mortal Kombat 11	mortal-kombat-11	2020-12-21 16:12:03.702193+00
928	Outward	outward	2020-12-21 16:12:03.716545+00
929	أوكتوباث ترافيلر	أوكتوباث-ترافيلر	2020-12-21 16:12:03.717353+00
930	Marvel's Avengers (videogioco 2020)	marvels-avengers-videogioco-2020	2020-12-21 16:12:03.744271+00
931	NBA 2K20	nba-2k20	2020-12-21 16:12:03.76228+00
932	Orcs Must Die! 3	orcs-must-die-3	2020-12-21 16:12:03.786148+00
933	ان‌بی‌ای ۲کا۲۱	انبیای-۲کا۲۱	2020-12-21 16:12:03.810057+00
934	مونستير بوى اند ث كورسيد كينجدوم	مونستير-بوى-اند-ث-كورسيد-كينجدوم	2020-12-21 16:12:03.838678+00
935	مورتال كومبات 11	مورتال-كومبات-11	2020-12-21 16:12:03.852271+00
936	مافیا ۲	مافیا-۲	2020-12-21 16:12:03.861382+00
937	اوت‌رایدرز (بازی ویدئویی)	اوترایدرز-بازی-ویدئویی	2020-12-21 16:12:03.868427+00
938	مترو اكسودوس	مترو-اكسودوس	2020-12-21 16:12:03.885741+00
939	إن بي آيه تو كاي 20	إن-بي-آيه-تو-كاي-20	2020-12-21 16:12:03.889726+00
940	הנוקמים (משחק וידאו, 2020)	הנוקמים-משחק-וידאו-2020	2020-12-21 16:12:03.910327+00
941	物质世界	物质世界	2020-12-21 16:12:03.910883+00
942	マフィア III	マフィア-iii	2020-12-21 16:12:03.925418+00
943	メトロ ラストライト	メトロ-ラストライト	2020-12-21 16:12:03.947252+00
944	Pac-Man	pac-man	2020-12-21 16:12:03.994602+00
945	마피아 II	마피아-ii	2020-12-21 16:12:03.99865+00
946	ان‌بی‌ای ۲کا۲۰	انبیای-۲کا۲۰	2020-12-21 16:12:04.0186+00
947	مسافر اختاپوس	مسافر-اختاپوس	2020-12-21 16:12:04.035924+00
948	مورتال کامبت ۱۱	مورتال-کامبت-۱۱	2020-12-21 16:12:04.041247+00
949	Avengers (jogo eletrônico)	avengers-jogo-eletrônico	2020-12-21 16:12:04.063339+00
950	Rage 2	rage-2	2020-12-21 16:12:04.071329+00
951	ፓክ-ማን	ፓክ-ማን	2020-12-21 16:12:04.076954+00
952	PGA Tour 2K21	pga-tour-2k21	2020-12-21 16:12:04.077608+00
953	メトロ エクソダス	メトロ-エクソダス	2020-12-21 16:12:04.080055+00
954	Panzer Dragoon	panzer-dragoon	2020-12-21 16:12:04.116458+00
955	PlayerUnknown's Battlegrounds	playerunknowns-battlegrounds	2020-12-21 16:12:04.157996+00
956	ريج 2	ريج-2	2020-12-21 16:12:04.165429+00
957	Avengers (игра, 2020)	avengers-игра-2020	2020-12-21 16:12:04.187199+00
958	Phoenix Point	phoenix-point	2020-12-21 16:12:04.194131+00
959	옥토패스 트래블러	옥토패스-트래블러	2020-12-21 16:12:04.194751+00
960	ببجي	ببجي	2020-12-21 16:12:04.232816+00
961	모탈 컴뱃 11	모탈-컴뱃-11	2020-12-21 16:12:04.245113+00
962	باك مان	باك-مان	2020-12-21 16:12:04.279575+00
963	Panzer Dragoon (jeu vidéo)	panzer-dragoon-jeu-vidéo	2020-12-21 16:12:04.283171+00
964	فوينيكس پوينت	فوينيكس-پوينت	2020-12-21 16:12:04.356925+00
965	نبا 2ك20	نبا-2ك20	2020-12-21 16:12:04.357419+00
966	เมโทรเอ็กโซดัส	เมโทรเอกโซดส	2020-12-21 16:12:04.381068+00
967	Marvel’s Avengers (vuoden 2020 videopeli)	marvels-avengers-vuoden-2020-videopeli	2020-12-21 16:12:04.385174+00
968	প্লেয়ারআননোওন'স ব্যাটলগ্রাউন্ড	পলযরআননওনস-বযটলগরউনড	2020-12-21 16:12:04.3889+00
969	ریج ۲	ریج-۲	2020-12-21 16:12:04.470741+00
974	레이지 2	레이지-2	2020-12-21 16:12:04.619653+00
997	狂怒2	狂怒2	2020-12-21 16:12:05.111525+00
1010	狂怒煉獄2	狂怒煉獄2	2020-12-21 16:12:05.250082+00
970	اوكتوباث ترافيلر	اوكتوباث-ترافيلر	2020-12-21 16:12:04.473169+00
990	八方旅人	八方旅人	2020-12-21 16:12:04.984409+00
971	อเวนเจอร์ส (วิดีโอเกม พ.ศ. 2563)	อเวนเจอรส-วดโอเกม-พศ-2563	2020-12-21 16:12:04.479402+00
975	Marvel's Avengers (video oyunu, 2020)	marvels-avengers-video-oyunu-2020	2020-12-21 16:12:04.630329+00
983	漫威復仇者聯盟	漫威復仇者聯盟	2020-12-21 16:12:04.811953+00
972	पबजी	पबज	2020-12-21 16:12:04.488853+00
1003	پلیرآن‌ناونز بتل‌گراندز	پلیرآنناونز-بتلگراندز	2020-12-21 16:12:05.171565+00
1016	배틀그라운드 (비디오 게임)	배틀그라운드-비디오-게임	2020-12-21 16:12:05.327408+00
1028	प्लेयरअननोन्स बैटलग्राउंड्स	पलयरअनननस-बटलगरउडस	2020-12-21 16:12:05.546932+00
1041	ಪ್ಲೇಯರ್ ಅನ್ನೋನ್ಸ್ ಬ್ಯಾಟಲ್ಗ್ರೌಂಡ್ಸ್	ಪಲಯರ-ಅನನನಸ-ಬಯಟಲಗರಡಸ	2020-12-21 16:12:05.883299+00
1057	പബ്‌ജി	പബജ	2020-12-21 16:12:06.488208+00
1068	प्लेयरअननोन्स बॅटलग्राऊंड्स	पलयरअनननस-बटलगरऊडस	2020-12-21 16:12:06.686986+00
1075	بلاير انونز باتل جراوندز	بلاير-انونز-باتل-جراوندز	2020-12-21 16:12:06.823871+00
1097	ਪਬਜੀ	ਪਬਜ	2020-12-21 16:12:07.567563+00
1105	پابجي	پابجي	2020-12-21 16:12:07.791333+00
1129	PUBG	pubg	2020-12-21 16:12:08.327761+00
1136	ᱯᱞᱮᱭᱚᱨ ᱚᱱ-ᱱᱚᱱᱥ ᱵᱮᱴᱚᱞᱜᱽᱨᱟᱣᱩᱱᱰᱥ	ᱯᱞᱮᱭᱚᱨ-ᱚᱱ-ᱱᱚᱱᱥ-ᱵᱮᱴᱚᱞᱜᱽᱨᱟᱣᱩᱱᱰᱥ	2020-12-21 16:12:08.482341+00
1143	پلەیر ئەنناونز بەتڵگراوندز	پلەیر-ئەنناونز-بەتڵگراوندز	2020-12-21 16:12:08.645998+00
1167	பப்ஜி	பபஜ	2020-12-21 16:12:09.005869+00
1173	పబ్ జి వీడియో గేమ్	పబ-జ-వడయ-గమ	2020-12-21 16:12:09.132889+00
1181	เพลเยอร์อันโนนส์แบตเทิลกราวดส์	เพลเยอรอนโนนสแบตเทลกราวดส	2020-12-21 16:12:09.37303+00
1192	绝地求生	绝地求生	2020-12-21 16:12:09.67625+00
1195	食雞	食雞	2020-12-21 16:12:09.749694+00
1199	絕地求生	絕地求生	2020-12-21 16:12:09.834973+00
973	מורטל קומבט 11	מורטל-קומבט-11	2020-12-21 16:12:04.506367+00
1011	真人快打11	真人快打11	2020-12-21 16:12:05.284805+00
976	黑手党III	黑手党iii	2020-12-21 16:12:04.669038+00
977	戰慄深隧：流亡	戰慄深隧流亡	2020-12-21 16:12:04.679455+00
978	เมโทร: ลาสต์ไลต์	เมโทร-ลาสตไลต	2020-12-21 16:12:04.693472+00
992	地鐵：最後的曙光	地鐵最後的曙光	2020-12-21 16:12:04.995948+00
979	Mafia 2	mafia-2	2020-12-21 16:12:04.719433+00
980	République	république	2020-12-21 16:12:04.760338+00
981	Red Dead Redemption 2	red-dead-redemption-2	2020-12-21 16:12:04.798224+00
985	République (počítačová hra)	république-počítačová-hra	2020-12-21 16:12:04.87139+00
987	République (videojuego)	république-videojuego	2020-12-21 16:12:04.96098+00
988	ريد ديد ريدمبشن 2	ريد-ديد-ريدمبشن-2	2020-12-21 16:12:04.966403+00
1001	République (jeu vidéo)	république-jeu-vidéo	2020-12-21 16:12:05.160263+00
1013	リパブリック (ゲーム)	リパブリック-ゲーム	2020-12-21 16:12:05.292179+00
1024	رد دد ریدمپشن ۲	رد-دد-ریدمپشن-۲	2020-12-21 16:12:05.475257+00
1025	黑手党II	黑手党ii	2020-12-21 16:12:05.479152+00
1033	Red Dead Redemption II	red-dead-redemption-ii	2020-12-21 16:12:05.684811+00
1037	레드 데드 리뎀션 2	레드-데드-리뎀션-2	2020-12-21 16:12:05.803696+00
1065	レッド・デッド・リデンプションII	レッドデッドリデンプションii	2020-12-21 16:12:06.617584+00
1086	ڕێد دێد ڕیدێمپشن ٢	ڕێد-دێد-ڕیدێمپشن-٢	2020-12-21 16:12:07.184233+00
1099	เรดเดดรีเดมพ์ชัน 2	เรดเดดรเดมพชน-2	2020-12-21 16:12:07.614376+00
1117	荒野大镖客2	荒野大镖客2	2020-12-21 16:12:08.06455+00
1123	碧血狂殺2	碧血狂殺2	2020-12-21 16:12:08.209554+00
982	飛龍騎士 (遊戲)	飛龍騎士-遊戲	2020-12-21 16:12:04.806674+00
984	Riders Republic	riders-republic	2020-12-21 16:12:04.815896+00
986	Risk of Rain 2	risk-of-rain-2	2020-12-21 16:12:04.91919+00
989	Scott Pilgrim vs. the World: The Game	scott-pilgrim-vs-the-world-the-game	2020-12-21 16:12:04.975+00
991	Rise of the Tomb Raider	rise-of-the-tomb-raider	2020-12-21 16:12:04.993834+00
993	Samurai Shodown	samurai-shodown	2020-12-21 16:12:05.030301+00
994	Serious Sam	serious-sam	2020-12-21 16:12:05.057188+00
995	ساموراي شوداون (لعبة فيديو 2019)	ساموراي-شوداون-لعبة-فيديو-2019	2020-12-21 16:12:05.091517+00
996	Star Wars Jedi: Fallen Order	star-wars-jedi-fallen-order	2020-12-21 16:12:05.093151+00
998	Scott Pilgrim contre le Monde, le jeu	scott-pilgrim-contre-le-monde-le-jeu	2020-12-21 16:12:05.116505+00
999	رايز أوف ذا توم ريدر	رايز-أوف-ذا-توم-ريدر	2020-12-21 16:12:05.139654+00
1000	Sekiro: Shadows Die Twice	sekiro-shadows-die-twice	2020-12-21 16:12:05.147347+00
1002	Serious Sam 4	serious-sam-4	2020-12-21 16:12:05.164604+00
1004	Shadow of the Tomb Raider	shadow-of-the-tomb-raider	2020-12-21 16:12:05.197922+00
1006	Samurai Shodown (videojuego de 2019)	samurai-shodown-videojuego-de-2019	2020-12-21 16:12:05.223766+00
1007	سكيرو: شادوز داي توايس	سكيرو-شادوز-داي-توايس	2020-12-21 16:12:05.229777+00
1008	스콧 필그림 vs. 더 월드: 더 게임	스콧-필그림-vs-더-월드-더-게임	2020-12-21 16:12:05.231648+00
1012	ستار وورز جيدي: فالين أوردر	ستار-وورز-جيدي-فالين-أوردر	2020-12-21 16:12:05.286812+00
1014	سریوس سم ۴	سریوس-سم-۴	2020-12-21 16:12:05.29887+00
1015	شادو أوف ذا توم ريدر	شادو-أوف-ذا-توم-ريدر	2020-12-21 16:12:05.32051+00
1017	סקוט פילגרים נגד העולם: המשחק	סקוט-פילגרים-נגד-העולם-המשחק	2020-12-21 16:12:05.339806+00
1018	قیام مهاجم مقبره	قیام-مهاجم-مقبره	2020-12-21 16:12:05.395625+00
1019	シリアス・サム4	シリアスサム4	2020-12-21 16:12:05.407589+00
1020	سامورایی شودان (بازی ویدئویی ۲۰۱۹)	سامورایی-شودان-بازی-ویدئویی-۲۰۱۹	2020-12-21 16:12:05.41788+00
1022	スコット・ピルグリムVS.ザ・ワールド: ザ・ゲーム	スコットピルグリムvsザワールド-ザゲーム	2020-12-21 16:12:05.449221+00
1023	سریوس سم	سریوس-سم	2020-12-21 16:12:05.463839+00
1027	সেকিরো: শ্যাডোওস ডাই টুয়াইস	সকর-শযডওস-ডই-টযইস	2020-12-21 16:12:05.482351+00
1029	جنگ ستارگان جدای: محفل سرنگون	جنگ-ستارگان-جدای-محفل-سرنگون	2020-12-21 16:12:05.5624+00
1030	سایه توم ریدر	سایه-توم-ریدر	2020-12-21 16:12:05.575348+00
1031	Samurai Shodown (jeu vidéo, 2019)	samurai-shodown-jeu-vidéo-2019	2020-12-21 16:12:05.592384+00
1032	라이즈 오브 더 툼 레이더	라이즈-오브-더-툼-레이더	2020-12-21 16:12:05.620472+00
1034	사무라이 쇼다운 (2019년 비디오 게임)	사무라이-쇼다운-2019년-비디오-게임	2020-12-21 16:12:05.752071+00
1035	쉐도우 오브 더 툼 레이더	쉐도우-오브-더-툼-레이더	2020-12-21 16:12:05.775552+00
1036	سکیرو: سایه‌ها دو بار می‌میرند	سکیرو-سایهها-دو-بار-میمیرند	2020-12-21 16:12:05.797392+00
1038	스타워즈 제다이: 오더의 몰락	스타워즈-제다이-오더의-몰락	2020-12-21 16:12:05.826833+00
1039	رايز اف ذا تومب رايدر	رايز-اف-ذا-تومب-رايدر	2020-12-21 16:12:05.84157+00
1040	Samurai Shodown (videogioco 2019)	samurai-shodown-videogioco-2019	2020-12-21 16:12:05.881377+00
1043	ساموراى شادون (فيديو لعب 2019)	ساموراى-شادون-فيديو-لعب-2019	2020-12-21 16:12:05.97244+00
1044	세키로: 섀도우 다이 트와이스	세키로-섀도우-다이-트와이스	2020-12-21 16:12:05.981847+00
1045	ライズ オブ ザ トゥームレイダー	ライズ-オブ-ザ-トゥームレイダー	2020-12-21 16:12:06.004013+00
1046	Serious Sam (seria)	serious-sam-seria	2020-12-21 16:12:06.064435+00
1047	SAMURAI SPIRITS (2019年のビデオゲーム)	samurai-spirits-2019年のビデオゲーム	2020-12-21 16:12:06.088544+00
1048	ستار وورز جيدى: فالين اوردر	ستار-وورز-جيدى-فالين-اوردر	2020-12-21 16:12:06.122938+00
1049	Serious Sam (série)	serious-sam-série	2020-12-21 16:12:06.187988+00
1050	شادو اوف تومب رايدر	شادو-اوف-تومب-رايدر	2020-12-21 16:12:06.232726+00
1051	رائز آف دی ٹومب ریڈر	رائز-آف-دی-ٹومب-ریڈر	2020-12-21 16:12:06.306779+00
1052	Samurai Shodown (игра, 2019)	samurai-shodown-игра-2019	2020-12-21 16:12:06.331765+00
1053	スター・ウォーズ ジェダイ:フォールン・オーダー	スターウォーズ-ジェダイフォールンオーダー	2020-12-21 16:12:06.341142+00
1054	سيكيرو: شادوز داى توايس	سيكيرو-شادوز-داى-توايس	2020-12-21 16:12:06.364347+00
1059	Star Wars Jedi: Upadły zakon	star-wars-jedi-upadły-zakon	2020-12-21 16:12:06.523961+00
1061	Serious Sam (серия игр)	serious-sam-серия-игр	2020-12-21 16:12:06.548475+00
1063	侍魂 曉	侍魂-曉	2020-12-21 16:12:06.55426+00
1066	シャドウ オブ ザ トゥームレイダー	シャドウ-オブ-ザ-トゥームレイダー	2020-12-21 16:12:06.632101+00
1081	Серйозний Сем (серія ігор)	серйозний-сем-серія-ігор	2020-12-21 16:12:07.064817+00
1087	星球大戰 絕地：組織殞落	星球大戰-絕地組織殞落	2020-12-21 16:12:07.260265+00
1088	英雄萨姆	英雄萨姆	2020-12-21 16:12:07.318624+00
1090	เซกิโระ: แชโดวส์ดายทไวซ์	เซกโระ-แชโดวสดายทไวซ	2020-12-21 16:12:07.364048+00
1091	古墓丽影：暗影	古墓丽影暗影	2020-12-21 16:12:07.377702+00
1092	盜墓者羅拉：崛起	盜墓者羅拉崛起	2020-12-21 16:12:07.391082+00
1095	重裝武力	重裝武力	2020-12-21 16:12:07.484781+00
1103	只狼：影逝二度	只狼影逝二度	2020-12-21 16:12:07.697834+00
1113	隻狼：暗影雙死	隻狼暗影雙死	2020-12-21 16:12:07.938852+00
1005	پک-من	پک-من	2020-12-21 16:12:05.207378+00
1009	SpongeBob SquarePants: Battle for Bikini Bottom – Rehydrated	spongebob-squarepants-battle-for-bikini-bottom-rehydrated	2020-12-21 16:12:05.241588+00
1021	باب‌اسفنجی شلوارمکعبی: نبرد برای بیکینی باتم – دوباره هیدراته شد	باباسفنجی-شلوارمکعبی-نبرد-برای-بیکینی-باتم-دوباره-هیدراته-شد	2020-12-21 16:12:05.425493+00
1026	팩맨	팩맨	2020-12-21 16:12:05.481902+00
1042	פק-מן	פק-מן	2020-12-21 16:12:05.901642+00
1055	Sundered	sundered	2020-12-21 16:12:06.375845+00
1056	Strange Brigade	strange-brigade	2020-12-21 16:12:06.405716+00
1058	SteamWorld Quest	steamworld-quest	2020-12-21 16:12:06.519748+00
1060	SteamWorld Heist	steamworld-heist	2020-12-21 16:12:06.533564+00
1062	SteamWorld Dig 2	steamworld-dig-2	2020-12-21 16:12:06.549708+00
1064	SteamWorld Dig	steamworld-dig	2020-12-21 16:12:06.571102+00
1067	سترينج بريغيد	سترينج-بريغيد	2020-12-21 16:12:06.636246+00
1069	Super Bomberman R	super-bomberman-r	2020-12-21 16:12:06.715373+00
1070	スチームワールドクエスト	スチームワールドクエスト	2020-12-21 16:12:06.739756+00
1071	スチームワールドハイスト	スチームワールドハイスト	2020-12-21 16:12:06.755934+00
1072	The Crew 2	the-crew-2	2020-12-21 16:12:06.763866+00
1073	Thumper	thumper	2020-12-21 16:12:06.787018+00
1074	Пак-Ман	пак-ман	2020-12-21 16:12:06.810774+00
1076	سترينچ بريجد	سترينچ-بريجد	2020-12-21 16:12:06.837132+00
1077	سوبر بومبرمان آر	سوبر-بومبرمان-آر	2020-12-21 16:12:06.843287+00
1078	Tom Clancy's Ghost Recon Breakpoint	tom-clancys-ghost-recon-breakpoint	2020-12-21 16:12:06.876063+00
1079	ذا كرو 2	ذا-كرو-2	2020-12-21 16:12:06.963545+00
1080	Thumper (jeu vidéo)	thumper-jeu-vidéo	2020-12-21 16:12:06.968617+00
1082	スチームワールド ディグ	スチームワールド-ディグ	2020-12-21 16:12:07.078266+00
1083	توم كلانسيز غوست ريكون بريكبوينت	توم-كلانسيز-غوست-ريكون-بريكبوينت	2020-12-21 16:12:07.098287+00
1084	പാക്-മാൻ	പക-മൻ	2020-12-21 16:12:07.10404+00
1085	Tom Clancy's The Division 2	tom-clancys-the-division-2	2020-12-21 16:12:07.17165+00
1089	توم كلانسيز ذا ديفيجن 2	توم-كلانسيز-ذا-ديفيجن-2	2020-12-21 16:12:07.335848+00
1093	パックマン	パックマン	2020-12-21 16:12:07.414306+00
1094	سوپر بومبرمان آر	سوپر-بومبرمان-آر	2020-12-21 16:12:07.458871+00
1096	گوست ریکان نقطه توقف	گوست-ریکان-نقطه-توقف	2020-12-21 16:12:07.554193+00
1098	تام کلنسی دی دیویژن ۲	تام-کلنسی-دی-دیویژن-۲	2020-12-21 16:12:07.586545+00
1100	スーパーボンバーマン R	スーパーボンバーマン-r	2020-12-21 16:12:07.621438+00
1101	ザ・クルー2	ザクルー2	2020-12-21 16:12:07.645281+00
1102	Valkyria Chronicles 4	valkyria-chronicles-4	2020-12-21 16:12:07.682267+00
1104	Trials Rising	trials-rising	2020-12-21 16:12:07.738962+00
1106	Tomb Raider	tomb-raider	2020-12-21 16:12:07.791782+00
1107	Tom Clancy's Ghost Recon Wildlands	tom-clancys-ghost-recon-wildlands	2020-12-21 16:12:07.835274+00
1108	Watch Dogs	watch-dogs	2020-12-21 16:12:07.836403+00
1109	고스트 리콘: 브레이크 포인트	고스트-리콘-브레이크-포인트	2020-12-21 16:12:07.843955+00
1110	فالكيريا كرونكلس 4	فالكيريا-كرونكلس-4	2020-12-21 16:12:07.845651+00
1111	تريلز ريسنغ	تريلز-ريسنغ	2020-12-21 16:12:07.908621+00
1112	توم ريدر (لعبة فيديو 2013)	توم-ريدر-لعبة-فيديو-2013	2020-12-21 16:12:07.936687+00
1114	톰 클랜시의 디비전 2	톰-클랜시의-디비전-2	2020-12-21 16:12:07.947052+00
1115	واتش دوغز	واتش-دوغز	2020-12-21 16:12:07.973809+00
1116	ซูเปอร์บอมเบอร์แมน อาร์	ซเปอรบอมเบอรแมน-อาร	2020-12-21 16:12:08.046757+00
1118	Uno	uno	2020-12-21 16:12:08.079548+00
1119	توم كلانسيز جوست ريكون بريكبوينت	توم-كلانسيز-جوست-ريكون-بريكبوينت	2020-12-21 16:12:08.084577+00
1120	توم كلانسز جوست ريكون ويلدلاندز	توم-كلانسز-جوست-ريكون-ويلدلاندز	2020-12-21 16:12:08.085535+00
1121	Tomb Raider (2013 video oyun)	tomb-raider-2013-video-oyun	2020-12-21 16:12:08.145166+00
1122	توم كلانسيز ذا ديڤيچن 2	توم-كلانسيز-ذا-ديڤيچن-2	2020-12-21 16:12:08.167557+00
1124	超级炸弹人R	超级炸弹人r	2020-12-21 16:12:08.210624+00
1125	Uno (videojuego)	uno-videojuego	2020-12-21 16:12:08.217279+00
1126	飆酷車神2：動力世界	飆酷車神2動力世界	2020-12-21 16:12:08.219471+00
1127	ڤالكيريا كرونكلس 4	ڤالكيريا-كرونكلس-4	2020-12-21 16:12:08.259709+00
1128	ゴーストリコン ブレイクポイント	ゴーストリコン-ブレイクポイント	2020-12-21 16:12:08.26201+00
1130	트라이얼스 라이징	트라이얼스-라이징	2020-12-21 16:12:08.329102+00
1131	টুম্ব রাইডার (২০১৩-এর ভিডিও গেম)	টমব-রইডর-২০১৩-এর-ভডও-গম	2020-12-21 16:12:08.349893+00
1132	ディビジョン2	ディビジョン2	2020-12-21 16:12:08.35661+00
1133	戦場のヴァルキュリア4	戦場のヴァルキュリア4	2020-12-21 16:12:08.386873+00
1134	West of Loathing	west-of-loathing	2020-12-21 16:12:08.475882+00
1135	Watch Dogs 2	watch-dogs-2	2020-12-21 16:12:08.477331+00
1137	Tomb Raider (2013)	tomb-raider-2013	2020-12-21 16:12:08.505091+00
1138	گوست ریکان سرزمین‌های وحشی	گوست-ریکان-سرزمینهای-وحشی	2020-12-21 16:12:08.51573+00
1139	سگ‌های نگهبان	سگهای-نگهبان	2020-12-21 16:12:08.532301+00
1140	تريلز ريسنج	تريلز-ريسنج	2020-12-21 16:12:08.536041+00
1141	واتش دوغز 2	واتش-دوغز-2	2020-12-21 16:12:08.588963+00
1142	웨스트 오브 로팅	웨스트-오브-로팅	2020-12-21 16:12:08.620733+00
1144	Watch Dogs (jeu vidéo)	watch-dogs-jeu-vidéo	2020-12-21 16:12:08.650898+00
1145	Tomb Raider (videojuego de 2013)	tomb-raider-videojuego-de-2013	2020-12-21 16:12:08.651334+00
1146	戰場女武神4	戰場女武神4	2020-12-21 16:12:08.660311+00
1147	Watch Dogs: Legion	watch-dogs-legion	2020-12-21 16:12:08.663576+00
1148	トライアルズ ライジング	トライアルズ-ライジング	2020-12-21 16:12:08.666057+00
1149	Wolfenstein: Youngblood	wolfenstein-youngblood	2020-12-21 16:12:08.673935+00
1150	WWE 2K Battlegrounds	wwe-2k-battlegrounds	2020-12-21 16:12:08.679431+00
1151	ويسانت اوف لواثينج	ويسانت-اوف-لواثينج	2020-12-21 16:12:08.697564+00
1152	幽灵行动：断点	幽灵行动断点	2020-12-21 16:12:08.715972+00
1153	Pac-Man (laro)	pac-man-laro	2020-12-21 16:12:08.736843+00
1154	와치독	와치독	2020-12-21 16:12:08.739192+00
1155	مهاجم مقبره (بازی ویدئویی ۲۰۱۳)	مهاجم-مقبره-بازی-ویدئویی-۲۰۱۳	2020-12-21 16:12:08.74955+00
1156	واتش دوغز: ليجن	واتش-دوغز-ليجن	2020-12-21 16:12:08.762378+00
1157	ولفينشتاين: يانغ بلود	ولفينشتاين-يانغ-بلود	2020-12-21 16:12:08.782706+00
1158	ゴーストリコン ワイルドランズ	ゴーストリコン-ワイルドランズ	2020-12-21 16:12:08.798268+00
1159	Zombie Army 4: Dead War	zombie-army-4-dead-war	2020-12-21 16:12:08.804874+00
1169	좀비 아미 4: 데드 워	좀비-아미-4-데드-워	2020-12-21 16:12:09.050868+00
1174	幽靈行動：野境	幽靈行動野境	2020-12-21 16:12:09.164588+00
1178	火線獵殺：野境	火線獵殺野境	2020-12-21 16:12:09.338224+00
1160	特技摩托賽：崛起	特技摩托賽崛起	2020-12-21 16:12:08.833999+00
1161	Tomb Raider (jeu vidéo, 2013)	tomb-raider-jeu-vidéo-2013	2020-12-21 16:12:08.842452+00
1164	Tomb Raider (videoxogo de 2013)	tomb-raider-videoxogo-de-2013	2020-12-21 16:12:08.935364+00
1171	툼레이더 (2013년 비디오 게임)	툼레이더-2013년-비디오-게임	2020-12-21 16:12:09.086341+00
1175	Tomb Raider (videogioco 2013)	tomb-raider-videogioco-2013	2020-12-21 16:12:09.285323+00
1179	טומב ריידר (משחק וידאו, 2013)	טומב-ריידר-משחק-וידאו-2013	2020-12-21 16:12:09.341407+00
1184	Tomb Raider (2013 kompiuterinis žaidimas)	tomb-raider-2013-kompiuterinis-žaidimas	2020-12-21 16:12:09.406876+00
1186	Tomb Raider (видео-игра од 2013)	tomb-raider-видео-игра-од-2013	2020-12-21 16:12:09.482217+00
1189	تومب رايدر (فيديو لعب 2013)	تومب-رايدر-فيديو-لعب-2013	2020-12-21 16:12:09.577879+00
1190	Tomb Raider (permainan video 2013)	tomb-raider-permainan-video-2013	2020-12-21 16:12:09.652538+00
1196	Tomb Raider (2013 оны видео тоглоом)	tomb-raider-2013-оны-видео-тоглоом	2020-12-21 16:12:09.77119+00
1198	トゥームレイダー (2013年のゲーム)	トゥームレイダー-2013年のゲーム	2020-12-21 16:12:09.83267+00
1202	ٹومب ریڈر (ویڈیو گیم 2013)	ٹومب-ریڈر-ویڈیو-گیم-2013	2020-12-21 16:12:09.895807+00
1204	Tomb Raider (gra komputerowa 2013)	tomb-raider-gra-komputerowa-2013	2020-12-21 16:12:09.942497+00
1205	Tomb Raider (jogo eletrônico de 2013)	tomb-raider-jogo-eletrônico-de-2013	2020-12-21 16:12:09.969576+00
1207	Tomb Raider (joc video din 2013)	tomb-raider-joc-video-din-2013	2020-12-21 16:12:09.993418+00
1208	Tomb Raider (игра, 2013)	tomb-raider-игра-2013	2020-12-21 16:12:10.031168+00
1209	Tomb Raider (vuoden 2013 videopeli)	tomb-raider-vuoden-2013-videopeli	2020-12-21 16:12:10.114877+00
1210	Tomb Raider (datorspel 2013)	tomb-raider-datorspel-2013	2020-12-21 16:12:10.146407+00
1211	ทูมเรเดอร์ (วิดีโอเกม พ.ศ. 2556)	ทมเรเดอร-วดโอเกม-พศ-2556	2020-12-21 16:12:10.168253+00
1212	Tomb Raider (2013 video oyunu)	tomb-raider-2013-video-oyunu	2020-12-21 16:12:10.19016+00
1213	Tomb Raider (відеогра, 2013)	tomb-raider-відеогра-2013	2020-12-21 16:12:10.243356+00
1214	Tomb Raider (trò chơi điện tử 2013)	tomb-raider-trò-chơi-điện-tử-2013	2020-12-21 16:12:10.339403+00
1215	古墓丽影 (2013年游戏)	古墓丽影-2013年游戏	2020-12-21 16:12:10.410394+00
1162	แพ็ก-แมน	แพก-แมน	2020-12-21 16:12:08.854302+00
1172	پیک مین	پیک-مین	2020-12-21 16:12:09.092761+00
1183	吃豆人	吃豆人	2020-12-21 16:12:09.391426+00
1188	食鬼	食鬼	2020-12-21 16:12:09.537845+00
1163	湯姆克蘭西：全境封鎖2	湯姆克蘭西全境封鎖2	2020-12-21 16:12:08.85643+00
1165	سگ‌های نگهبان: لژیون	سگهای-نگهبان-لژیون	2020-12-21 16:12:08.938135+00
1182	واتش دوجس: ليچن	واتش-دوجس-ليچن	2020-12-21 16:12:09.3874+00
1187	ウォッチドッグス レギオン	ウォッチドッグス-レギオン	2020-12-21 16:12:09.536461+00
1201	看門狗：自由軍團	看門狗自由軍團	2020-12-21 16:12:09.842092+00
1166	سگ‌های نگهبان ۲	سگهای-نگهبان-۲	2020-12-21 16:12:08.961494+00
1177	와치독 2	와치독-2	2020-12-21 16:12:09.337652+00
1193	واتش دوجس 2	واتش-دوجس-2	2020-12-21 16:12:09.683062+00
1197	ウォッチドッグス2	ウォッチドッグス2	2020-12-21 16:12:09.777417+00
1203	วอตช์ด็อกส์ 2	วอตชดอกส-2	2020-12-21 16:12:09.925596+00
1206	看门狗2	看门狗2	2020-12-21 16:12:09.986884+00
1168	واتش دوجس	واتش-دوجس	2020-12-21 16:12:09.030146+00
1176	ウォッチドッグス	ウォッチドッグス	2020-12-21 16:12:09.299475+00
1194	วอตช์ด็อกส์	วอตชดอกส	2020-12-21 16:12:09.722051+00
1200	看門狗 (遊戲)	看門狗-遊戲	2020-12-21 16:12:09.838699+00
1170	ولفنشتاین: نیروی تازه‌نفس	ولفنشتاین-نیروی-تازهنفس	2020-12-21 16:12:09.06701+00
1180	울펜슈타인: 영블러드	울펜슈타인-영블러드	2020-12-21 16:12:09.367921+00
1185	ولفينشتاين: يونج بلود	ولفينشتاين-يونج-بلود	2020-12-21 16:12:09.460194+00
1191	德軍總部：新血脈	德軍總部新血脈	2020-12-21 16:12:09.66167+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: cgdb_core_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.cgdb_core_user_groups_id_seq', 1, false);


--
-- Name: cgdb_core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.cgdb_core_user_id_seq', 1, true);


--
-- Name: cgdb_core_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.cgdb_core_user_user_permissions_id_seq', 1, false);


--
-- Name: developers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.developers_id_seq', 362, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 41, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- Name: game_free_on_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.game_free_on_subscriptions_id_seq', 69, true);


--
-- Name: game_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.game_prices_id_seq', 1, false);


--
-- Name: game_release_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.game_release_dates_id_seq', 1333, true);


--
-- Name: games_developers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_developers_id_seq', 471, true);


--
-- Name: games_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_genres_id_seq', 606, true);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_id_seq', 421, true);


--
-- Name: games_modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_modes_id_seq', 633, true);


--
-- Name: games_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_platforms_id_seq', 345, true);


--
-- Name: games_publishers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_publishers_id_seq', 445, true);


--
-- Name: games_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_series_id_seq', 121, true);


--
-- Name: games_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.games_tags_id_seq', 2290, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.genres_id_seq', 376, true);


--
-- Name: language_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.language_codes_id_seq', 87, true);


--
-- Name: modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.modes_id_seq', 519, true);


--
-- Name: platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.platforms_id_seq', 11, true);


--
-- Name: platforms_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.platforms_stores_id_seq', 1, false);


--
-- Name: publishers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.publishers_id_seq', 289, true);


--
-- Name: series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.series_id_seq', 97, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.stores_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cgdb
--

SELECT pg_catalog.setval('public.tags_id_seq', 1406, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: cgdb_core_user_groups cgdb_core_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_groups
    ADD CONSTRAINT cgdb_core_user_groups_pkey PRIMARY KEY (id);


--
-- Name: cgdb_core_user_groups cgdb_core_user_groups_user_id_group_id_1f59d5df_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_groups
    ADD CONSTRAINT cgdb_core_user_groups_user_id_group_id_1f59d5df_uniq UNIQUE (user_id, group_id);


--
-- Name: cgdb_core_user cgdb_core_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user
    ADD CONSTRAINT cgdb_core_user_pkey PRIMARY KEY (id);


--
-- Name: cgdb_core_user_user_permissions cgdb_core_user_user_perm_user_id_permission_id_ca465dba_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_user_permissions
    ADD CONSTRAINT cgdb_core_user_user_perm_user_id_permission_id_ca465dba_uniq UNIQUE (user_id, permission_id);


--
-- Name: cgdb_core_user_user_permissions cgdb_core_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_user_permissions
    ADD CONSTRAINT cgdb_core_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: cgdb_core_user cgdb_core_user_username_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user
    ADD CONSTRAINT cgdb_core_user_username_key UNIQUE (username);


--
-- Name: developers developers_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.developers
    ADD CONSTRAINT developers_pkey PRIMARY KEY (id);


--
-- Name: developers developers_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.developers
    ADD CONSTRAINT developers_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: game_free_on_subscriptions game_free_on_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_free_on_subscriptions
    ADD CONSTRAINT game_free_on_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: game_prices game_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_prices
    ADD CONSTRAINT game_prices_pkey PRIMARY KEY (id);


--
-- Name: game_release_dates game_release_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_release_dates
    ADD CONSTRAINT game_release_dates_pkey PRIMARY KEY (id);


--
-- Name: games_developers games_developers_game_id_developer_id_44daa27d_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_developers
    ADD CONSTRAINT games_developers_game_id_developer_id_44daa27d_uniq UNIQUE (game_id, developer_id);


--
-- Name: games_developers games_developers_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_developers
    ADD CONSTRAINT games_developers_pkey PRIMARY KEY (id);


--
-- Name: games_genres games_genres_game_id_genre_id_021c77b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_genres
    ADD CONSTRAINT games_genres_game_id_genre_id_021c77b0_uniq UNIQUE (game_id, genre_id);


--
-- Name: games_genres games_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_genres
    ADD CONSTRAINT games_genres_pkey PRIMARY KEY (id);


--
-- Name: games_modes games_modes_game_id_mode_id_f98d3524_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_modes
    ADD CONSTRAINT games_modes_game_id_mode_id_f98d3524_uniq UNIQUE (game_id, mode_id);


--
-- Name: games_modes games_modes_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_modes
    ADD CONSTRAINT games_modes_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: games_platforms games_platforms_game_id_platform_id_f2d35c51_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_platforms
    ADD CONSTRAINT games_platforms_game_id_platform_id_f2d35c51_uniq UNIQUE (game_id, platform_id);


--
-- Name: games_platforms games_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_platforms
    ADD CONSTRAINT games_platforms_pkey PRIMARY KEY (id);


--
-- Name: games_publishers games_publishers_game_id_publisher_id_76703242_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_publishers
    ADD CONSTRAINT games_publishers_game_id_publisher_id_76703242_uniq UNIQUE (game_id, publisher_id);


--
-- Name: games_publishers games_publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_publishers
    ADD CONSTRAINT games_publishers_pkey PRIMARY KEY (id);


--
-- Name: games_series games_series_game_id_series_id_ce14827c_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_series
    ADD CONSTRAINT games_series_game_id_series_id_ce14827c_uniq UNIQUE (game_id, series_id);


--
-- Name: games_series games_series_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_series
    ADD CONSTRAINT games_series_pkey PRIMARY KEY (id);


--
-- Name: games games_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_slug_key UNIQUE (slug);


--
-- Name: games_tags games_tags_game_id_tag_id_2a289516_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_tags
    ADD CONSTRAINT games_tags_game_id_tag_id_2a289516_uniq UNIQUE (game_id, tag_id);


--
-- Name: games_tags games_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_tags
    ADD CONSTRAINT games_tags_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: genres genres_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_slug_key UNIQUE (slug);


--
-- Name: language_codes language_codes_iso_b2ac25cb_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.language_codes
    ADD CONSTRAINT language_codes_iso_b2ac25cb_uniq UNIQUE (iso);


--
-- Name: language_codes language_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.language_codes
    ADD CONSTRAINT language_codes_pkey PRIMARY KEY (id);


--
-- Name: modes modes_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_pkey PRIMARY KEY (id);


--
-- Name: modes modes_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.modes
    ADD CONSTRAINT modes_slug_key UNIQUE (slug);


--
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- Name: platforms platforms_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_slug_key UNIQUE (slug);


--
-- Name: platforms_stores platforms_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms_stores
    ADD CONSTRAINT platforms_stores_pkey PRIMARY KEY (id);


--
-- Name: platforms_stores platforms_stores_platform_id_store_id_4d7b5a3e_uniq; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms_stores
    ADD CONSTRAINT platforms_stores_platform_id_store_id_4d7b5a3e_uniq UNIQUE (platform_id, store_id);


--
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- Name: publishers publishers_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_slug_key UNIQUE (slug);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);


--
-- Name: series series_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_slug_key UNIQUE (slug);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: stores stores_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_slug_key UNIQUE (slug);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tags tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_slug_key UNIQUE (slug);


--
-- Name: tags tags_tag_key; Type: CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_tag_key UNIQUE (tag);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: cgdb_core_user_groups_group_id_b219ef02; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX cgdb_core_user_groups_group_id_b219ef02 ON public.cgdb_core_user_groups USING btree (group_id);


--
-- Name: cgdb_core_user_groups_user_id_3149ff59; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX cgdb_core_user_groups_user_id_3149ff59 ON public.cgdb_core_user_groups USING btree (user_id);


--
-- Name: cgdb_core_user_user_permissions_permission_id_c373ac75; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX cgdb_core_user_user_permissions_permission_id_c373ac75 ON public.cgdb_core_user_user_permissions USING btree (permission_id);


--
-- Name: cgdb_core_user_user_permissions_user_id_fdffa07d; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX cgdb_core_user_user_permissions_user_id_fdffa07d ON public.cgdb_core_user_user_permissions USING btree (user_id);


--
-- Name: cgdb_core_user_username_3b0b1e14_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX cgdb_core_user_username_3b0b1e14_like ON public.cgdb_core_user USING btree (username varchar_pattern_ops);


--
-- Name: developers_slug_4172c6eb_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX developers_slug_4172c6eb_like ON public.developers USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: game_free_on_subscriptions_game_id_ec138cb8; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX game_free_on_subscriptions_game_id_ec138cb8 ON public.game_free_on_subscriptions USING btree (game_id);


--
-- Name: game_free_on_subscriptions_platform_id_747b04f0; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX game_free_on_subscriptions_platform_id_747b04f0 ON public.game_free_on_subscriptions USING btree (platform_id);


--
-- Name: game_prices_game_id_f4ee35d7; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX game_prices_game_id_f4ee35d7 ON public.game_prices USING btree (game_id);


--
-- Name: game_prices_store_id_87f30f54; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX game_prices_store_id_87f30f54 ON public.game_prices USING btree (store_id);


--
-- Name: game_release_dates_game_id_10b7b0c8; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX game_release_dates_game_id_10b7b0c8 ON public.game_release_dates USING btree (game_id);


--
-- Name: game_release_dates_platform_id_21823a32; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX game_release_dates_platform_id_21823a32 ON public.game_release_dates USING btree (platform_id);


--
-- Name: games_developers_developer_id_9fc2d8e9; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_developers_developer_id_9fc2d8e9 ON public.games_developers USING btree (developer_id);


--
-- Name: games_developers_game_id_26153e4c; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_developers_game_id_26153e4c ON public.games_developers USING btree (game_id);


--
-- Name: games_genres_game_id_7bd63915; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_genres_game_id_7bd63915 ON public.games_genres USING btree (game_id);


--
-- Name: games_genres_genre_id_4ac689f3; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_genres_genre_id_4ac689f3 ON public.games_genres USING btree (genre_id);


--
-- Name: games_modes_game_id_aafa3bcf; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_modes_game_id_aafa3bcf ON public.games_modes USING btree (game_id);


--
-- Name: games_modes_mode_id_d12215b0; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_modes_mode_id_d12215b0 ON public.games_modes USING btree (mode_id);


--
-- Name: games_platforms_game_id_414874a7; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_platforms_game_id_414874a7 ON public.games_platforms USING btree (game_id);


--
-- Name: games_platforms_platform_id_ab5fcb4a; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_platforms_platform_id_ab5fcb4a ON public.games_platforms USING btree (platform_id);


--
-- Name: games_publishers_game_id_667e27c2; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_publishers_game_id_667e27c2 ON public.games_publishers USING btree (game_id);


--
-- Name: games_publishers_publisher_id_456f8537; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_publishers_publisher_id_456f8537 ON public.games_publishers USING btree (publisher_id);


--
-- Name: games_series_game_id_bfb3819b; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_series_game_id_bfb3819b ON public.games_series USING btree (game_id);


--
-- Name: games_series_series_id_5e08c251; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_series_series_id_5e08c251 ON public.games_series USING btree (series_id);


--
-- Name: games_slug_67005ddf_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_slug_67005ddf_like ON public.games USING btree (slug varchar_pattern_ops);


--
-- Name: games_tags_game_id_a3f1a80a; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_tags_game_id_a3f1a80a ON public.games_tags USING btree (game_id);


--
-- Name: games_tags_tag_id_719a7ff0; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX games_tags_tag_id_719a7ff0 ON public.games_tags USING btree (tag_id);


--
-- Name: genres_slug_99e229b7_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX genres_slug_99e229b7_like ON public.genres USING btree (slug varchar_pattern_ops);


--
-- Name: language_codes_iso_b2ac25cb_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX language_codes_iso_b2ac25cb_like ON public.language_codes USING btree (iso varchar_pattern_ops);


--
-- Name: modes_slug_d71110fe_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX modes_slug_d71110fe_like ON public.modes USING btree (slug varchar_pattern_ops);


--
-- Name: platforms_slug_ec633445_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX platforms_slug_ec633445_like ON public.platforms USING btree (slug varchar_pattern_ops);


--
-- Name: platforms_stores_platform_id_553c5808; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX platforms_stores_platform_id_553c5808 ON public.platforms_stores USING btree (platform_id);


--
-- Name: platforms_stores_store_id_e6b58472; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX platforms_stores_store_id_e6b58472 ON public.platforms_stores USING btree (store_id);


--
-- Name: publishers_slug_799efa64_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX publishers_slug_799efa64_like ON public.publishers USING btree (slug varchar_pattern_ops);


--
-- Name: series_slug_3945e4fc_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX series_slug_3945e4fc_like ON public.series USING btree (slug varchar_pattern_ops);


--
-- Name: stores_slug_c8d524d0_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX stores_slug_c8d524d0_like ON public.stores USING btree (slug varchar_pattern_ops);


--
-- Name: tags_slug_92625acc_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX tags_slug_92625acc_like ON public.tags USING btree (slug varchar_pattern_ops);


--
-- Name: tags_tag_85ac96db_like; Type: INDEX; Schema: public; Owner: cgdb
--

CREATE INDEX tags_tag_85ac96db_like ON public.tags USING btree (tag varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cgdb_core_user_groups cgdb_core_user_groups_group_id_b219ef02_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_groups
    ADD CONSTRAINT cgdb_core_user_groups_group_id_b219ef02_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cgdb_core_user_groups cgdb_core_user_groups_user_id_3149ff59_fk_cgdb_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_groups
    ADD CONSTRAINT cgdb_core_user_groups_user_id_3149ff59_fk_cgdb_core_user_id FOREIGN KEY (user_id) REFERENCES public.cgdb_core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cgdb_core_user_user_permissions cgdb_core_user_user__permission_id_c373ac75_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_user_permissions
    ADD CONSTRAINT cgdb_core_user_user__permission_id_c373ac75_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cgdb_core_user_user_permissions cgdb_core_user_user__user_id_fdffa07d_fk_cgdb_core; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.cgdb_core_user_user_permissions
    ADD CONSTRAINT cgdb_core_user_user__user_id_fdffa07d_fk_cgdb_core FOREIGN KEY (user_id) REFERENCES public.cgdb_core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_cgdb_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_cgdb_core_user_id FOREIGN KEY (user_id) REFERENCES public.cgdb_core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_free_on_subscriptions game_free_on_subscriptions_game_id_ec138cb8_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_free_on_subscriptions
    ADD CONSTRAINT game_free_on_subscriptions_game_id_ec138cb8_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_free_on_subscriptions game_free_on_subscriptions_platform_id_747b04f0_fk_platforms_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_free_on_subscriptions
    ADD CONSTRAINT game_free_on_subscriptions_platform_id_747b04f0_fk_platforms_id FOREIGN KEY (platform_id) REFERENCES public.platforms(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_prices game_prices_game_id_f4ee35d7_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_prices
    ADD CONSTRAINT game_prices_game_id_f4ee35d7_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_prices game_prices_store_id_87f30f54_fk_stores_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_prices
    ADD CONSTRAINT game_prices_store_id_87f30f54_fk_stores_id FOREIGN KEY (store_id) REFERENCES public.stores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_release_dates game_release_dates_game_id_10b7b0c8_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_release_dates
    ADD CONSTRAINT game_release_dates_game_id_10b7b0c8_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_release_dates game_release_dates_platform_id_21823a32_fk_platforms_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.game_release_dates
    ADD CONSTRAINT game_release_dates_platform_id_21823a32_fk_platforms_id FOREIGN KEY (platform_id) REFERENCES public.platforms(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_developers games_developers_developer_id_9fc2d8e9_fk_developers_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_developers
    ADD CONSTRAINT games_developers_developer_id_9fc2d8e9_fk_developers_id FOREIGN KEY (developer_id) REFERENCES public.developers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_developers games_developers_game_id_26153e4c_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_developers
    ADD CONSTRAINT games_developers_game_id_26153e4c_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_genres games_genres_game_id_7bd63915_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_genres
    ADD CONSTRAINT games_genres_game_id_7bd63915_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_genres games_genres_genre_id_4ac689f3_fk_genres_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_genres
    ADD CONSTRAINT games_genres_genre_id_4ac689f3_fk_genres_id FOREIGN KEY (genre_id) REFERENCES public.genres(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_modes games_modes_game_id_aafa3bcf_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_modes
    ADD CONSTRAINT games_modes_game_id_aafa3bcf_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_modes games_modes_mode_id_d12215b0_fk_modes_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_modes
    ADD CONSTRAINT games_modes_mode_id_d12215b0_fk_modes_id FOREIGN KEY (mode_id) REFERENCES public.modes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_platforms games_platforms_game_id_414874a7_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_platforms
    ADD CONSTRAINT games_platforms_game_id_414874a7_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_platforms games_platforms_platform_id_ab5fcb4a_fk_platforms_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_platforms
    ADD CONSTRAINT games_platforms_platform_id_ab5fcb4a_fk_platforms_id FOREIGN KEY (platform_id) REFERENCES public.platforms(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_publishers games_publishers_game_id_667e27c2_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_publishers
    ADD CONSTRAINT games_publishers_game_id_667e27c2_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_publishers games_publishers_publisher_id_456f8537_fk_publishers_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_publishers
    ADD CONSTRAINT games_publishers_publisher_id_456f8537_fk_publishers_id FOREIGN KEY (publisher_id) REFERENCES public.publishers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_series games_series_game_id_bfb3819b_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_series
    ADD CONSTRAINT games_series_game_id_bfb3819b_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_series games_series_series_id_5e08c251_fk_series_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_series
    ADD CONSTRAINT games_series_series_id_5e08c251_fk_series_id FOREIGN KEY (series_id) REFERENCES public.series(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_tags games_tags_game_id_a3f1a80a_fk_games_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_tags
    ADD CONSTRAINT games_tags_game_id_a3f1a80a_fk_games_id FOREIGN KEY (game_id) REFERENCES public.games(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games_tags games_tags_tag_id_719a7ff0_fk_tags_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.games_tags
    ADD CONSTRAINT games_tags_tag_id_719a7ff0_fk_tags_id FOREIGN KEY (tag_id) REFERENCES public.tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: platforms_stores platforms_stores_platform_id_553c5808_fk_platforms_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms_stores
    ADD CONSTRAINT platforms_stores_platform_id_553c5808_fk_platforms_id FOREIGN KEY (platform_id) REFERENCES public.platforms(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: platforms_stores platforms_stores_store_id_e6b58472_fk_stores_id; Type: FK CONSTRAINT; Schema: public; Owner: cgdb
--

ALTER TABLE ONLY public.platforms_stores
    ADD CONSTRAINT platforms_stores_store_id_e6b58472_fk_stores_id FOREIGN KEY (store_id) REFERENCES public.stores(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

