--
-- PostgreSQL database dump
--

\restrict ozghG3ez4cWD6Fo2JcvXlSaHFdqkseNmj1p87gCXrcrEVg09ZoKQrfUepZ0ERZR

-- Dumped from database version 16.12
-- Dumped by pg_dump version 18.2

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
-- Name: about_pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.about_pages (
    id integer NOT NULL,
    document_id character varying(255),
    eyebrow character varying(255),
    heading character varying(255),
    heading_accent character varying(255),
    description text,
    badge_1_text character varying(255),
    badge_2_text character varying(255),
    section_title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: about_pages_cmps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.about_pages_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


--
-- Name: about_pages_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.about_pages_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: about_pages_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.about_pages_cmps_id_seq OWNED BY public.about_pages_cmps.id;


--
-- Name: about_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.about_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: about_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.about_pages_id_seq OWNED BY public.about_pages.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: components_blocks_photo_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.components_blocks_photo_cards (
    id integer NOT NULL,
    alt character varying(255)
);


--
-- Name: components_blocks_photo_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.components_blocks_photo_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: components_blocks_photo_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.components_blocks_photo_cards_id_seq OWNED BY public.components_blocks_photo_cards.id;


--
-- Name: components_blocks_principles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.components_blocks_principles (
    id integer NOT NULL,
    badge character varying(255),
    title character varying(255),
    paragraph_1 text,
    paragraph_2 text
);


--
-- Name: components_blocks_principles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.components_blocks_principles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: components_blocks_principles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.components_blocks_principles_id_seq OWNED BY public.components_blocks_principles.id;


--
-- Name: components_blocks_stat_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.components_blocks_stat_cards (
    id integer NOT NULL,
    value character varying(255),
    label character varying(255)
);


--
-- Name: components_blocks_stat_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.components_blocks_stat_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: components_blocks_stat_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.components_blocks_stat_cards_id_seq OWNED BY public.components_blocks_stat_cards.id;


--
-- Name: diag_ctas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diag_ctas (
    id integer NOT NULL,
    document_id character varying(255),
    heading character varying(255),
    subheading text,
    button_label character varying(255),
    button_href character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: diag_ctas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diag_ctas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diag_ctas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diag_ctas_id_seq OWNED BY public.diag_ctas.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    document_id character varying(255),
    project character varying(255),
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    doc_status character varying(255)
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: documents_user_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents_user_lnk (
    id integer NOT NULL,
    document_id integer,
    user_id integer
);


--
-- Name: documents_user_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.documents_user_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_user_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.documents_user_lnk_id_seq OWNED BY public.documents_user_lnk.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text text,
    caption text,
    focal_point jsonb,
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url text,
    preview_url text,
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: hero_blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hero_blocks (
    id integer NOT NULL,
    document_id character varying(255),
    eyebrow character varying(255),
    description text,
    primary_button_label character varying(255),
    primary_button_href character varying(255),
    secondary_button_label character varying(255),
    secondary_button_href character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    heading character varying(255)
);


--
-- Name: hero_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hero_blocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hero_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hero_blocks_id_seq OWNED BY public.hero_blocks.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: menu_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_services (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    slug character varying(255),
    link character varying(255),
    sort_order integer,
    is_active boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: menu_services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.menu_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menu_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.menu_services_id_seq OWNED BY public.menu_services.id;


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.referrals (
    id integer NOT NULL,
    document_id character varying(255),
    contact_person character varying(255),
    email character varying(255),
    phone character varying(255),
    company character varying(255),
    product character varying(255),
    status character varying(255),
    payout integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    inviter_user_id integer
);


--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.referrals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.referrals_id_seq OWNED BY public.referrals.id;


--
-- Name: referrals_user_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.referrals_user_lnk (
    id integer NOT NULL,
    referral_id integer,
    user_id integer
);


--
-- Name: referrals_user_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.referrals_user_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: referrals_user_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.referrals_user_lnk_id_seq OWNED BY public.referrals_user_lnk.id;


--
-- Name: service_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_cards (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    description text,
    link character varying(255),
    link_label character varying(255),
    is_featured boolean,
    sort_order integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: service_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_cards_id_seq OWNED BY public.service_cards.id;


--
-- Name: services_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_sections (
    id integer NOT NULL,
    document_id character varying(255),
    heading character varying(255),
    subheading text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: services_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_sections_id_seq OWNED BY public.services_sections.id;


--
-- Name: stats_blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_blocks (
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: stats_blocks_cmps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats_blocks_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


--
-- Name: stats_blocks_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_blocks_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_blocks_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_blocks_cmps_id_seq OWNED BY public.stats_blocks_cmps.id;


--
-- Name: stats_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_blocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_blocks_id_seq OWNED BY public.stats_blocks.id;


--
-- Name: strapi_ai_localization_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_ai_localization_jobs (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255) NOT NULL,
    source_locale character varying(255) NOT NULL,
    target_locales jsonb NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_ai_localization_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_ai_localization_jobs_id_seq OWNED BY public.strapi_ai_localization_jobs.id;


--
-- Name: strapi_ai_metadata_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_ai_metadata_jobs (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    completed_at timestamp(6) without time zone
);


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_ai_metadata_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_ai_metadata_jobs_id_seq OWNED BY public.strapi_ai_metadata_jobs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_sessions (
    id integer NOT NULL,
    document_id character varying(255),
    user_id character varying(255),
    session_id character varying(255),
    child_id character varying(255),
    device_id character varying(255),
    origin character varying(255),
    expires_at timestamp(6) without time zone,
    absolute_expires_at timestamp(6) without time zone,
    status character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_sessions_id_seq OWNED BY public.strapi_sessions.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: team_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_members (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    role character varying(255),
    description character varying(255),
    sort_order integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    phone character varying(255),
    email character varying(255),
    contact_handle character varying(255)
);


--
-- Name: team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_members_id_seq OWNED BY public.team_members.id;


--
-- Name: team_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_sections (
    id integer NOT NULL,
    document_id character varying(255),
    heading character varying(255),
    subheading text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: team_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_sections_id_seq OWNED BY public.team_sections.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    phone character varying(255),
    company character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    middle_name character varying(255)
);


--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: about_pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages ALTER COLUMN id SET DEFAULT nextval('public.about_pages_id_seq'::regclass);


--
-- Name: about_pages_cmps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages_cmps ALTER COLUMN id SET DEFAULT nextval('public.about_pages_cmps_id_seq'::regclass);


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: components_blocks_photo_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components_blocks_photo_cards ALTER COLUMN id SET DEFAULT nextval('public.components_blocks_photo_cards_id_seq'::regclass);


--
-- Name: components_blocks_principles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components_blocks_principles ALTER COLUMN id SET DEFAULT nextval('public.components_blocks_principles_id_seq'::regclass);


--
-- Name: components_blocks_stat_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components_blocks_stat_cards ALTER COLUMN id SET DEFAULT nextval('public.components_blocks_stat_cards_id_seq'::regclass);


--
-- Name: diag_ctas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diag_ctas ALTER COLUMN id SET DEFAULT nextval('public.diag_ctas_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: documents_user_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_user_lnk ALTER COLUMN id SET DEFAULT nextval('public.documents_user_lnk_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: hero_blocks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_blocks ALTER COLUMN id SET DEFAULT nextval('public.hero_blocks_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: menu_services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_services ALTER COLUMN id SET DEFAULT nextval('public.menu_services_id_seq'::regclass);


--
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- Name: referrals_user_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals_user_lnk ALTER COLUMN id SET DEFAULT nextval('public.referrals_user_lnk_id_seq'::regclass);


--
-- Name: service_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_cards ALTER COLUMN id SET DEFAULT nextval('public.service_cards_id_seq'::regclass);


--
-- Name: services_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_sections ALTER COLUMN id SET DEFAULT nextval('public.services_sections_id_seq'::regclass);


--
-- Name: stats_blocks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks ALTER COLUMN id SET DEFAULT nextval('public.stats_blocks_id_seq'::regclass);


--
-- Name: stats_blocks_cmps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks_cmps ALTER COLUMN id SET DEFAULT nextval('public.stats_blocks_cmps_id_seq'::regclass);


--
-- Name: strapi_ai_localization_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_localization_jobs_id_seq'::regclass);


--
-- Name: strapi_ai_metadata_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_metadata_jobs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions ALTER COLUMN id SET DEFAULT nextval('public.strapi_sessions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: team_members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_members ALTER COLUMN id SET DEFAULT nextval('public.team_members_id_seq'::regclass);


--
-- Name: team_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_sections ALTER COLUMN id SET DEFAULT nextval('public.team_sections_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: about_pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.about_pages (id, document_id, eyebrow, heading, heading_accent, description, badge_1_text, badge_2_text, section_title, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	htl7ucv2phqnq5pun2okjjch	\N	\N	\N	\N	\N	\N	\N	2026-04-06 12:03:12.741	2026-04-06 12:03:12.741	\N	1	1	\N
2	htl7ucv2phqnq5pun2okjjch	\N	\N	\N	\N	\N	\N	\N	2026-04-06 12:03:12.741	2026-04-06 12:03:12.741	2026-04-06 12:03:12.763	1	1	\N
\.


--
-- Data for Name: about_pages_cmps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.about_pages_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	l3wqzoomfq1f6xvoc8bujps8	plugin::content-manager.explorer.create	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	[]	2026-04-03 18:53:48.997	2026-04-03 18:53:48.997	2026-04-03 18:53:48.997	\N	\N	\N
2	igvmyauyit4jvalvez4n5ybt	plugin::content-manager.explorer.read	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	[]	2026-04-03 18:53:49	2026-04-03 18:53:49	2026-04-03 18:53:49	\N	\N	\N
3	nzd8q0nic46h0k9legu7lj31	plugin::content-manager.explorer.update	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	[]	2026-04-03 18:53:49.002	2026-04-03 18:53:49.002	2026-04-03 18:53:49.002	\N	\N	\N
4	iltfzbfin6ghrwnltvj4p72e	plugin::content-manager.explorer.delete	{}	api::menu-service.menu-service	{}	[]	2026-04-03 18:53:49.004	2026-04-03 18:53:49.004	2026-04-03 18:53:49.004	\N	\N	\N
5	dfw7bxmcdopsknj9e9npznjs	plugin::content-manager.explorer.publish	{}	api::menu-service.menu-service	{}	[]	2026-04-03 18:53:49.005	2026-04-03 18:53:49.005	2026-04-03 18:53:49.005	\N	\N	\N
6	t97ujp0oq7rctn1yqc7mq7nh	plugin::upload.read	{}	\N	{}	[]	2026-04-03 18:53:49.007	2026-04-03 18:53:49.007	2026-04-03 18:53:49.007	\N	\N	\N
7	exdleyng0f6x8v9pgp84yuu8	plugin::upload.configure-view	{}	\N	{}	[]	2026-04-03 18:53:49.009	2026-04-03 18:53:49.009	2026-04-03 18:53:49.009	\N	\N	\N
8	qruhvs2pscbu49o053n9yttq	plugin::upload.assets.create	{}	\N	{}	[]	2026-04-03 18:53:49.011	2026-04-03 18:53:49.011	2026-04-03 18:53:49.011	\N	\N	\N
9	oz147i3spo6u0n9mnw72twzl	plugin::upload.assets.update	{}	\N	{}	[]	2026-04-03 18:53:49.013	2026-04-03 18:53:49.013	2026-04-03 18:53:49.013	\N	\N	\N
10	o5uftirum9dum44d3mblgjw3	plugin::upload.assets.download	{}	\N	{}	[]	2026-04-03 18:53:49.014	2026-04-03 18:53:49.014	2026-04-03 18:53:49.014	\N	\N	\N
11	nxljemq9fakbb13cwnd76xbk	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-04-03 18:53:49.016	2026-04-03 18:53:49.016	2026-04-03 18:53:49.016	\N	\N	\N
12	bhliigot5kzy4659ci2webcd	plugin::content-manager.explorer.create	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	["admin::is-creator"]	2026-04-03 18:53:49.018	2026-04-03 18:53:49.018	2026-04-03 18:53:49.018	\N	\N	\N
13	p62mps0mipxghlsqco2ydp7r	plugin::content-manager.explorer.read	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	["admin::is-creator"]	2026-04-03 18:53:49.019	2026-04-03 18:53:49.019	2026-04-03 18:53:49.02	\N	\N	\N
14	tyg96cf843csdew40nheui1d	plugin::content-manager.explorer.update	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	["admin::is-creator"]	2026-04-03 18:53:49.021	2026-04-03 18:53:49.021	2026-04-03 18:53:49.021	\N	\N	\N
15	ytvg12xxz047xvmpc4pjd7un	plugin::content-manager.explorer.delete	{}	api::menu-service.menu-service	{}	["admin::is-creator"]	2026-04-03 18:53:49.022	2026-04-03 18:53:49.022	2026-04-03 18:53:49.022	\N	\N	\N
16	zkhgdseov7y7ikuzyc35kskm	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2026-04-03 18:53:49.024	2026-04-03 18:53:49.024	2026-04-03 18:53:49.024	\N	\N	\N
17	ofih85ksexyalwnz57gprsdu	plugin::upload.configure-view	{}	\N	{}	[]	2026-04-03 18:53:49.025	2026-04-03 18:53:49.025	2026-04-03 18:53:49.025	\N	\N	\N
18	eydolzmdbi9gpfder1330w29	plugin::upload.assets.create	{}	\N	{}	[]	2026-04-03 18:53:49.028	2026-04-03 18:53:49.028	2026-04-03 18:53:49.028	\N	\N	\N
19	vbihx6qr1c5ab0lb8y5mem3v	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2026-04-03 18:53:49.032	2026-04-03 18:53:49.032	2026-04-03 18:53:49.033	\N	\N	\N
20	vgouz7fzep0hnal3haqabral	plugin::upload.assets.download	{}	\N	{}	[]	2026-04-03 18:53:49.034	2026-04-03 18:53:49.034	2026-04-03 18:53:49.034	\N	\N	\N
21	ntzd2afeeygqrb3il812zmi2	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-04-03 18:53:49.036	2026-04-03 18:53:49.036	2026-04-03 18:53:49.036	\N	\N	\N
22	xdy0dlc382g9ihjttrqi4xvz	plugin::content-manager.explorer.create	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	[]	2026-04-03 18:53:49.044	2026-04-03 18:53:49.044	2026-04-03 18:53:49.044	\N	\N	\N
24	oy1i2o1ohq2ssx3rft09xm2k	plugin::content-manager.explorer.read	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	[]	2026-04-03 18:53:49.048	2026-04-03 18:53:49.048	2026-04-03 18:53:49.048	\N	\N	\N
26	js5kd0ab16i35kz2g2k69b3r	plugin::content-manager.explorer.update	{}	api::menu-service.menu-service	{"fields": ["title", "slug", "link", "sortOrder", "isActive"]}	[]	2026-04-03 18:53:49.053	2026-04-03 18:53:49.053	2026-04-03 18:53:49.053	\N	\N	\N
28	jiyupzlxsy9vr2le5y06awu2	plugin::content-manager.explorer.delete	{}	api::menu-service.menu-service	{}	[]	2026-04-03 18:53:49.056	2026-04-03 18:53:49.056	2026-04-03 18:53:49.056	\N	\N	\N
29	aot339rpwlsh0zzd3gow8coi	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2026-04-03 18:53:49.057	2026-04-03 18:53:49.057	2026-04-03 18:53:49.057	\N	\N	\N
30	csjfmwu2grwehy8ip90z1x03	plugin::content-manager.explorer.publish	{}	api::menu-service.menu-service	{}	[]	2026-04-03 18:53:49.059	2026-04-03 18:53:49.059	2026-04-03 18:53:49.06	\N	\N	\N
31	fx5eip02pcgmjp6k9g5xk9d1	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2026-04-03 18:53:49.062	2026-04-03 18:53:49.062	2026-04-03 18:53:49.062	\N	\N	\N
32	n2iskws1xyoovrtc2o4sq4ky	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2026-04-03 18:53:49.064	2026-04-03 18:53:49.064	2026-04-03 18:53:49.064	\N	\N	\N
33	g5svdzull2dd7ahy3kmcus29	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2026-04-03 18:53:49.066	2026-04-03 18:53:49.066	2026-04-03 18:53:49.066	\N	\N	\N
34	qconbsl1xrskjhvwftew6nn4	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2026-04-03 18:53:49.067	2026-04-03 18:53:49.067	2026-04-03 18:53:49.067	\N	\N	\N
35	jzi1oqmnzl151s8q2sgsk57c	plugin::content-type-builder.read	{}	\N	{}	[]	2026-04-03 18:53:49.069	2026-04-03 18:53:49.069	2026-04-03 18:53:49.069	\N	\N	\N
36	ctrbufqq65s4gv2bm0w7mp5p	plugin::email.settings.read	{}	\N	{}	[]	2026-04-03 18:53:49.07	2026-04-03 18:53:49.07	2026-04-03 18:53:49.07	\N	\N	\N
37	azbe8qah8s5cemcs98atkjbs	plugin::upload.read	{}	\N	{}	[]	2026-04-03 18:53:49.072	2026-04-03 18:53:49.072	2026-04-03 18:53:49.072	\N	\N	\N
38	pp4a32d0jejvkh7xf1t2ybl5	plugin::upload.assets.create	{}	\N	{}	[]	2026-04-03 18:53:49.074	2026-04-03 18:53:49.074	2026-04-03 18:53:49.074	\N	\N	\N
39	lo0mrcd6w2l6x5wb4yqyfdjd	plugin::upload.assets.update	{}	\N	{}	[]	2026-04-03 18:53:49.076	2026-04-03 18:53:49.076	2026-04-03 18:53:49.076	\N	\N	\N
40	w5kfprmcb2oraqakn1xmvn4h	plugin::upload.assets.download	{}	\N	{}	[]	2026-04-03 18:53:49.078	2026-04-03 18:53:49.078	2026-04-03 18:53:49.078	\N	\N	\N
41	f0xrkjynotpkedtf6s4cik4t	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-04-03 18:53:49.08	2026-04-03 18:53:49.08	2026-04-03 18:53:49.08	\N	\N	\N
42	mja3z7g32zkyieasfuhiimfa	plugin::upload.configure-view	{}	\N	{}	[]	2026-04-03 18:53:49.083	2026-04-03 18:53:49.083	2026-04-03 18:53:49.083	\N	\N	\N
43	cqow7r2agg4qanevdami1ln6	plugin::upload.settings.read	{}	\N	{}	[]	2026-04-03 18:53:49.085	2026-04-03 18:53:49.085	2026-04-03 18:53:49.085	\N	\N	\N
44	cc16qitn3s37kkozem7nuec4	plugin::i18n.locale.create	{}	\N	{}	[]	2026-04-03 18:53:49.087	2026-04-03 18:53:49.087	2026-04-03 18:53:49.087	\N	\N	\N
45	svvg12l7uu6edfjdmu4f8yep	plugin::i18n.locale.read	{}	\N	{}	[]	2026-04-03 18:53:49.088	2026-04-03 18:53:49.088	2026-04-03 18:53:49.088	\N	\N	\N
46	hps7wy8v43lxvzmjer8fgsrq	plugin::i18n.locale.update	{}	\N	{}	[]	2026-04-03 18:53:49.09	2026-04-03 18:53:49.09	2026-04-03 18:53:49.09	\N	\N	\N
47	wewo6xyjib5gsbvmx9u4sv46	plugin::i18n.locale.delete	{}	\N	{}	[]	2026-04-03 18:53:49.092	2026-04-03 18:53:49.092	2026-04-03 18:53:49.092	\N	\N	\N
48	cc9v2dmkqsgz5iqz06s92mvf	plugin::users-permissions.roles.create	{}	\N	{}	[]	2026-04-03 18:53:49.093	2026-04-03 18:53:49.093	2026-04-03 18:53:49.093	\N	\N	\N
49	hbiwk4i8ri6eoon8nmlu29yu	plugin::users-permissions.roles.read	{}	\N	{}	[]	2026-04-03 18:53:49.094	2026-04-03 18:53:49.094	2026-04-03 18:53:49.095	\N	\N	\N
50	ln8buok7tchl8pn7hnskh8lr	plugin::users-permissions.roles.update	{}	\N	{}	[]	2026-04-03 18:53:49.096	2026-04-03 18:53:49.096	2026-04-03 18:53:49.096	\N	\N	\N
51	ktxw3bgr0g9abhccr6lhroqq	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2026-04-03 18:53:49.097	2026-04-03 18:53:49.097	2026-04-03 18:53:49.097	\N	\N	\N
52	yilw3872qnwysp8otqudlp30	plugin::users-permissions.providers.read	{}	\N	{}	[]	2026-04-03 18:53:49.099	2026-04-03 18:53:49.099	2026-04-03 18:53:49.099	\N	\N	\N
53	hqlnkrjrk1rs4wzjg84myoje	plugin::users-permissions.providers.update	{}	\N	{}	[]	2026-04-03 18:53:49.1	2026-04-03 18:53:49.1	2026-04-03 18:53:49.1	\N	\N	\N
54	oqiv7nkmdylkxa7qt3mp50qi	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2026-04-03 18:53:49.102	2026-04-03 18:53:49.102	2026-04-03 18:53:49.102	\N	\N	\N
55	sbzbklfvkcfnix8divxb6hcd	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2026-04-03 18:53:49.104	2026-04-03 18:53:49.104	2026-04-03 18:53:49.104	\N	\N	\N
56	ji7c65tv6iin1ermsio472q5	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2026-04-03 18:53:49.105	2026-04-03 18:53:49.105	2026-04-03 18:53:49.105	\N	\N	\N
57	nm52z34op268ai22kq8d8n26	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2026-04-03 18:53:49.107	2026-04-03 18:53:49.107	2026-04-03 18:53:49.107	\N	\N	\N
58	oj3fb3a819tcgxlsz8deuxsi	admin::marketplace.read	{}	\N	{}	[]	2026-04-03 18:53:49.108	2026-04-03 18:53:49.108	2026-04-03 18:53:49.108	\N	\N	\N
59	b25e95zny7p6m3labjalmnp2	admin::webhooks.create	{}	\N	{}	[]	2026-04-03 18:53:49.109	2026-04-03 18:53:49.109	2026-04-03 18:53:49.109	\N	\N	\N
60	wvp5fhbv14bdx3dslhjqgt2k	admin::webhooks.read	{}	\N	{}	[]	2026-04-03 18:53:49.111	2026-04-03 18:53:49.111	2026-04-03 18:53:49.111	\N	\N	\N
61	aegak9rci9nzes3cv0yofhfg	admin::webhooks.update	{}	\N	{}	[]	2026-04-03 18:53:49.112	2026-04-03 18:53:49.112	2026-04-03 18:53:49.112	\N	\N	\N
62	x4odb2chkpn9b2enn719ognh	admin::webhooks.delete	{}	\N	{}	[]	2026-04-03 18:53:49.114	2026-04-03 18:53:49.114	2026-04-03 18:53:49.114	\N	\N	\N
63	esjgxldtllg1q4tboiv4vhku	admin::users.create	{}	\N	{}	[]	2026-04-03 18:53:49.115	2026-04-03 18:53:49.115	2026-04-03 18:53:49.115	\N	\N	\N
64	es3o36tquvwbbgs2vva5994a	admin::users.read	{}	\N	{}	[]	2026-04-03 18:53:49.116	2026-04-03 18:53:49.116	2026-04-03 18:53:49.116	\N	\N	\N
65	wk9vyn26bjrucojmv3d0y9y3	admin::users.update	{}	\N	{}	[]	2026-04-03 18:53:49.118	2026-04-03 18:53:49.118	2026-04-03 18:53:49.118	\N	\N	\N
66	mkfoqv20rnpig0f80x4hp989	admin::users.delete	{}	\N	{}	[]	2026-04-03 18:53:49.12	2026-04-03 18:53:49.12	2026-04-03 18:53:49.12	\N	\N	\N
67	fb5inkaknnveadbf4xpa6f4q	admin::roles.create	{}	\N	{}	[]	2026-04-03 18:53:49.121	2026-04-03 18:53:49.121	2026-04-03 18:53:49.121	\N	\N	\N
68	mmxqm4qref2pmsfpm1o1z73a	admin::roles.read	{}	\N	{}	[]	2026-04-03 18:53:49.123	2026-04-03 18:53:49.123	2026-04-03 18:53:49.123	\N	\N	\N
69	qwqbugcpu0t1mqp8wd60jig9	admin::roles.update	{}	\N	{}	[]	2026-04-03 18:53:49.125	2026-04-03 18:53:49.125	2026-04-03 18:53:49.125	\N	\N	\N
70	ioiax7lsoage0wwdea1jom18	admin::roles.delete	{}	\N	{}	[]	2026-04-03 18:53:49.127	2026-04-03 18:53:49.127	2026-04-03 18:53:49.127	\N	\N	\N
71	vwv8jfvpx0m33ejvxkl8s66y	admin::api-tokens.access	{}	\N	{}	[]	2026-04-03 18:53:49.129	2026-04-03 18:53:49.129	2026-04-03 18:53:49.129	\N	\N	\N
72	qcvz6jawskmcok84wkklgmwa	admin::api-tokens.create	{}	\N	{}	[]	2026-04-03 18:53:49.13	2026-04-03 18:53:49.13	2026-04-03 18:53:49.13	\N	\N	\N
73	tgttqb03mby8ms5c5wxza9lm	admin::api-tokens.read	{}	\N	{}	[]	2026-04-03 18:53:49.132	2026-04-03 18:53:49.132	2026-04-03 18:53:49.132	\N	\N	\N
74	rwjt4avfevhzmpvm8pf8toq7	admin::api-tokens.update	{}	\N	{}	[]	2026-04-03 18:53:49.133	2026-04-03 18:53:49.133	2026-04-03 18:53:49.133	\N	\N	\N
75	wt1r5onvl2g7w79zdi2bac5z	admin::api-tokens.regenerate	{}	\N	{}	[]	2026-04-03 18:53:49.135	2026-04-03 18:53:49.135	2026-04-03 18:53:49.135	\N	\N	\N
76	mw0peg4x8eefmp7e8he8xfmb	admin::api-tokens.delete	{}	\N	{}	[]	2026-04-03 18:53:49.137	2026-04-03 18:53:49.137	2026-04-03 18:53:49.137	\N	\N	\N
77	oab3qaqu2rep4e9eewd9fg1j	admin::project-settings.update	{}	\N	{}	[]	2026-04-03 18:53:49.138	2026-04-03 18:53:49.138	2026-04-03 18:53:49.138	\N	\N	\N
78	c9ngwjwwhtym8jcxxppdx737	admin::project-settings.read	{}	\N	{}	[]	2026-04-03 18:53:49.14	2026-04-03 18:53:49.14	2026-04-03 18:53:49.14	\N	\N	\N
79	qevfk5xeoraknpspktrpz878	admin::transfer.tokens.access	{}	\N	{}	[]	2026-04-03 18:53:49.141	2026-04-03 18:53:49.141	2026-04-03 18:53:49.141	\N	\N	\N
80	nmzrgmeh6fyh09nkdu5ar4gr	admin::transfer.tokens.create	{}	\N	{}	[]	2026-04-03 18:53:49.142	2026-04-03 18:53:49.142	2026-04-03 18:53:49.142	\N	\N	\N
81	ykwvn5c0gsxqyvpmqu39p66z	admin::transfer.tokens.read	{}	\N	{}	[]	2026-04-03 18:53:49.144	2026-04-03 18:53:49.144	2026-04-03 18:53:49.144	\N	\N	\N
82	rt90ig8kfncoh085tidm5uc7	admin::transfer.tokens.update	{}	\N	{}	[]	2026-04-03 18:53:49.145	2026-04-03 18:53:49.145	2026-04-03 18:53:49.145	\N	\N	\N
83	f6vc37irveojd8yri0on19yi	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2026-04-03 18:53:49.147	2026-04-03 18:53:49.147	2026-04-03 18:53:49.147	\N	\N	\N
84	gixwz6s0u6s7ubwpupz7s6h9	admin::transfer.tokens.delete	{}	\N	{}	[]	2026-04-03 18:53:49.148	2026-04-03 18:53:49.148	2026-04-03 18:53:49.148	\N	\N	\N
88	d8ugcp87paye3nchud2autxs	plugin::content-manager.explorer.delete	{}	api::hero-block.hero-block	{}	[]	2026-04-03 19:22:02.008	2026-04-03 19:22:02.008	2026-04-03 19:22:02.008	\N	\N	\N
89	rtuy80lpbl6ivb6latvwcqf3	plugin::content-manager.explorer.publish	{}	api::hero-block.hero-block	{}	[]	2026-04-03 19:22:02.01	2026-04-03 19:22:02.01	2026-04-03 19:22:02.01	\N	\N	\N
90	frrpced3g0s3337ag9gj18af	plugin::content-manager.explorer.create	{}	api::hero-block.hero-block	{"fields": ["eyebrow", "heading", "description", "primaryButtonLabel", "primaryButtonHref", "secondaryButtonLabel", "secondaryButtonHref"]}	[]	2026-04-03 19:36:29.28	2026-04-03 19:36:29.28	2026-04-03 19:36:29.281	\N	\N	\N
91	gzqaejmtubarpoxu2lc1pifd	plugin::content-manager.explorer.read	{}	api::hero-block.hero-block	{"fields": ["eyebrow", "heading", "description", "primaryButtonLabel", "primaryButtonHref", "secondaryButtonLabel", "secondaryButtonHref"]}	[]	2026-04-03 19:36:29.284	2026-04-03 19:36:29.284	2026-04-03 19:36:29.284	\N	\N	\N
92	xa5egc84jqe0oknr01bl3qby	plugin::content-manager.explorer.update	{}	api::hero-block.hero-block	{"fields": ["eyebrow", "heading", "description", "primaryButtonLabel", "primaryButtonHref", "secondaryButtonLabel", "secondaryButtonHref"]}	[]	2026-04-03 19:36:29.286	2026-04-03 19:36:29.286	2026-04-03 19:36:29.286	\N	\N	\N
96	u2zdq1uxu1rhxblwvt6r55do	plugin::content-manager.explorer.delete	{}	api::stats-block.stats-block	{}	[]	2026-04-03 19:41:20.502	2026-04-03 19:41:20.502	2026-04-03 19:41:20.502	\N	\N	\N
97	ae8kyhgzae35k4qvvlqfgxkk	plugin::content-manager.explorer.publish	{}	api::stats-block.stats-block	{}	[]	2026-04-03 19:41:20.504	2026-04-03 19:41:20.504	2026-04-03 19:41:20.504	\N	\N	\N
98	sfh51spzjyg0nqhcs40qjekh	plugin::content-manager.explorer.create	{}	api::stats-block.stats-block	{"fields": ["cards"]}	[]	2026-04-03 19:44:11.693	2026-04-03 19:44:11.693	2026-04-03 19:44:11.693	\N	\N	\N
99	v6wm8ggywsa2agjxnlr7320a	plugin::content-manager.explorer.read	{}	api::stats-block.stats-block	{"fields": ["cards"]}	[]	2026-04-03 19:44:11.696	2026-04-03 19:44:11.696	2026-04-03 19:44:11.696	\N	\N	\N
100	ajivpwhsiac5c43n3gufayzb	plugin::content-manager.explorer.update	{}	api::stats-block.stats-block	{"fields": ["cards"]}	[]	2026-04-03 19:44:11.697	2026-04-03 19:44:11.697	2026-04-03 19:44:11.698	\N	\N	\N
104	vf1nk73wspel091rsq44p3un	plugin::content-manager.explorer.delete	{}	api::team-member.team-member	{}	[]	2026-04-03 21:00:56.26	2026-04-03 21:00:56.26	2026-04-03 21:00:56.26	\N	\N	\N
105	h5prx9tgf63nd9s1upwcq67e	plugin::content-manager.explorer.publish	{}	api::team-member.team-member	{}	[]	2026-04-03 21:00:56.262	2026-04-03 21:00:56.262	2026-04-03 21:00:56.262	\N	\N	\N
106	clkb91n6pnrc9v1om821mfsr	plugin::content-manager.explorer.create	{}	api::team-section.team-section	{"fields": ["heading", "subheading"]}	[]	2026-04-03 21:01:21.88	2026-04-03 21:01:21.88	2026-04-03 21:01:21.88	\N	\N	\N
107	ii8ad6ks9zlqrapiaqxivo8z	plugin::content-manager.explorer.read	{}	api::team-section.team-section	{"fields": ["heading", "subheading"]}	[]	2026-04-03 21:01:21.884	2026-04-03 21:01:21.884	2026-04-03 21:01:21.884	\N	\N	\N
108	ikfl5k4pc6bs1f5bzj4w3ukj	plugin::content-manager.explorer.update	{}	api::team-section.team-section	{"fields": ["heading", "subheading"]}	[]	2026-04-03 21:01:21.886	2026-04-03 21:01:21.886	2026-04-03 21:01:21.886	\N	\N	\N
109	ijzrjcsumjprqa2juszyv2zh	plugin::content-manager.explorer.delete	{}	api::team-section.team-section	{}	[]	2026-04-03 21:01:21.888	2026-04-03 21:01:21.888	2026-04-03 21:01:21.888	\N	\N	\N
110	k2elu1paag87wmhq51d787vw	plugin::content-manager.explorer.publish	{}	api::team-section.team-section	{}	[]	2026-04-03 21:01:21.89	2026-04-03 21:01:21.89	2026-04-03 21:01:21.89	\N	\N	\N
111	oyddlmlvb85jykscdxjj83c4	plugin::content-manager.explorer.create	{}	api::services-section.services-section	{"fields": ["heading", "subheading"]}	[]	2026-04-03 21:43:23.118	2026-04-03 21:43:23.118	2026-04-03 21:43:23.118	\N	\N	\N
112	uolxus6pxj8h7aoq8sx3tegq	plugin::content-manager.explorer.read	{}	api::services-section.services-section	{"fields": ["heading", "subheading"]}	[]	2026-04-03 21:43:23.121	2026-04-03 21:43:23.121	2026-04-03 21:43:23.122	\N	\N	\N
113	mlybwuyvk8j03onzwossscgu	plugin::content-manager.explorer.update	{}	api::services-section.services-section	{"fields": ["heading", "subheading"]}	[]	2026-04-03 21:43:23.123	2026-04-03 21:43:23.123	2026-04-03 21:43:23.124	\N	\N	\N
114	ckggaod3vnapd0xrxq9riv7h	plugin::content-manager.explorer.delete	{}	api::services-section.services-section	{}	[]	2026-04-03 21:43:23.125	2026-04-03 21:43:23.125	2026-04-03 21:43:23.126	\N	\N	\N
115	yy8lrwx72xa0om0ckes5r6p3	plugin::content-manager.explorer.publish	{}	api::services-section.services-section	{}	[]	2026-04-03 21:43:23.128	2026-04-03 21:43:23.128	2026-04-03 21:43:23.128	\N	\N	\N
116	rkd0o6cz8jd9z002xcw85r6h	plugin::content-manager.explorer.create	{}	api::service-card.service-card	{"fields": ["title", "description", "link", "linkLabel", "icon", "isFeatured", "sortOrder"]}	[]	2026-04-03 21:43:29.771	2026-04-03 21:43:29.771	2026-04-03 21:43:29.771	\N	\N	\N
117	puk83elsbchianxt7eu959hm	plugin::content-manager.explorer.read	{}	api::service-card.service-card	{"fields": ["title", "description", "link", "linkLabel", "icon", "isFeatured", "sortOrder"]}	[]	2026-04-03 21:43:29.774	2026-04-03 21:43:29.774	2026-04-03 21:43:29.775	\N	\N	\N
118	h27vx4lswp4u5uts6hkvx8ft	plugin::content-manager.explorer.update	{}	api::service-card.service-card	{"fields": ["title", "description", "link", "linkLabel", "icon", "isFeatured", "sortOrder"]}	[]	2026-04-03 21:43:29.777	2026-04-03 21:43:29.777	2026-04-03 21:43:29.777	\N	\N	\N
119	t574t4idx73sl98zrh0jpve7	plugin::content-manager.explorer.delete	{}	api::service-card.service-card	{}	[]	2026-04-03 21:43:29.778	2026-04-03 21:43:29.778	2026-04-03 21:43:29.779	\N	\N	\N
120	wxhi28p6wxqx6m4qb36qo13g	plugin::content-manager.explorer.publish	{}	api::service-card.service-card	{}	[]	2026-04-03 21:43:29.782	2026-04-03 21:43:29.782	2026-04-03 21:43:29.782	\N	\N	\N
121	q603g0319x110x4uht5phsj4	plugin::content-manager.explorer.create	{}	api::diag-cta.diag-cta	{"fields": ["heading", "subheading", "buttonLabel", "buttonHref", "image"]}	[]	2026-04-04 08:06:19.208	2026-04-04 08:06:19.208	2026-04-04 08:06:19.208	\N	\N	\N
122	h8i12grl530noic77gmf9jbt	plugin::content-manager.explorer.read	{}	api::diag-cta.diag-cta	{"fields": ["heading", "subheading", "buttonLabel", "buttonHref", "image"]}	[]	2026-04-04 08:06:19.211	2026-04-04 08:06:19.211	2026-04-04 08:06:19.211	\N	\N	\N
123	tr55lyfti13vzopyob6cx82i	plugin::content-manager.explorer.update	{}	api::diag-cta.diag-cta	{"fields": ["heading", "subheading", "buttonLabel", "buttonHref", "image"]}	[]	2026-04-04 08:06:19.213	2026-04-04 08:06:19.213	2026-04-04 08:06:19.213	\N	\N	\N
124	gas39z9rtc8msgrt3ak6gh4r	plugin::content-manager.explorer.delete	{}	api::diag-cta.diag-cta	{}	[]	2026-04-04 08:06:19.216	2026-04-04 08:06:19.216	2026-04-04 08:06:19.216	\N	\N	\N
125	b7l1i2503sjmadflujt5mft5	plugin::content-manager.explorer.publish	{}	api::diag-cta.diag-cta	{}	[]	2026-04-04 08:06:19.219	2026-04-04 08:06:19.219	2026-04-04 08:06:19.219	\N	\N	\N
129	ca4yhixaruteh6wwerxicub1	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "phone", "company", "firstName", "lastName", "middleName"]}	[]	2026-04-04 11:10:52.965	2026-04-04 11:10:52.965	2026-04-04 11:10:52.966	\N	\N	\N
130	cmh7lybbrq5gm2liqpwymmix	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "phone", "company", "firstName", "lastName", "middleName"]}	[]	2026-04-04 11:10:52.971	2026-04-04 11:10:52.971	2026-04-04 11:10:52.972	\N	\N	\N
131	ltqp8p2zpuu1iadv6vvki5yz	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "phone", "company", "firstName", "lastName", "middleName"]}	[]	2026-04-04 11:10:52.974	2026-04-04 11:10:52.974	2026-04-04 11:10:52.974	\N	\N	\N
135	u6u506qs080gepv1ue0kl4nf	plugin::content-manager.explorer.delete	{}	api::document.document	{}	[]	2026-04-04 11:12:42.563	2026-04-04 11:12:42.563	2026-04-04 11:12:42.563	\N	\N	\N
136	fpxeyifqldc56vd0pdn1a23u	plugin::content-manager.explorer.publish	{}	api::document.document	{}	[]	2026-04-04 11:12:42.565	2026-04-04 11:12:42.565	2026-04-04 11:12:42.565	\N	\N	\N
137	z68ywa85i0ix9hon2g73ivl9	plugin::content-manager.explorer.create	{}	api::document.document	{"fields": ["project", "name", "docStatus", "file", "user"]}	[]	2026-04-04 11:39:03.812	2026-04-04 11:39:03.812	2026-04-04 11:39:03.812	\N	\N	\N
138	a2pj0plc85s61ech2vcu3ufx	plugin::content-manager.explorer.read	{}	api::document.document	{"fields": ["project", "name", "docStatus", "file", "user"]}	[]	2026-04-04 11:39:03.815	2026-04-04 11:39:03.815	2026-04-04 11:39:03.815	\N	\N	\N
139	ui58g117803uvjah3ta3fqbp	plugin::content-manager.explorer.update	{}	api::document.document	{"fields": ["project", "name", "docStatus", "file", "user"]}	[]	2026-04-04 11:39:03.817	2026-04-04 11:39:03.817	2026-04-04 11:39:03.817	\N	\N	\N
143	hetd6617oxrmmrztfv9jc638	plugin::content-manager.explorer.delete	{}	api::referral.referral	{}	[]	2026-04-04 12:04:11.985	2026-04-04 12:04:11.985	2026-04-04 12:04:11.986	\N	\N	\N
144	bac0q0bc6bnwgcby7v0dmc8n	plugin::content-manager.explorer.publish	{}	api::referral.referral	{}	[]	2026-04-04 12:04:11.987	2026-04-04 12:04:11.987	2026-04-04 12:04:11.987	\N	\N	\N
145	wjgwpg4jm1syg9h44lv8lox2	plugin::content-manager.explorer.create	{}	api::referral.referral	{"fields": ["inviterUserId", "contactPerson", "email", "phone", "company", "product", "status", "payout", "user"]}	[]	2026-04-04 12:40:54.162	2026-04-04 12:40:54.162	2026-04-04 12:40:54.162	\N	\N	\N
146	zsiaerm4ju5i8o05wx7pche9	plugin::content-manager.explorer.read	{}	api::referral.referral	{"fields": ["inviterUserId", "contactPerson", "email", "phone", "company", "product", "status", "payout", "user"]}	[]	2026-04-04 12:40:54.165	2026-04-04 12:40:54.165	2026-04-04 12:40:54.166	\N	\N	\N
147	zovg32kwrje3v6p0o28ocyq0	plugin::content-manager.explorer.update	{}	api::referral.referral	{"fields": ["inviterUserId", "contactPerson", "email", "phone", "company", "product", "status", "payout", "user"]}	[]	2026-04-04 12:40:54.167	2026-04-04 12:40:54.167	2026-04-04 12:40:54.167	\N	\N	\N
148	jv4sjvh9eorswhfugpbieg3r	plugin::content-manager.explorer.create	{}	api::about-page.about-page	{"fields": ["eyebrow", "heading", "headingAccent", "description", "badge1Text", "badge2Text", "sectionTitle", "backgroundImage", "principles.badge", "principles.title", "principles.paragraph1", "principles.paragraph2"]}	[]	2026-04-04 13:05:14.971	2026-04-04 13:05:14.971	2026-04-04 13:05:14.972	\N	\N	\N
149	eoxrww9f51ocj19nlq8bx6j8	plugin::content-manager.explorer.read	{}	api::about-page.about-page	{"fields": ["eyebrow", "heading", "headingAccent", "description", "badge1Text", "badge2Text", "sectionTitle", "backgroundImage", "principles.badge", "principles.title", "principles.paragraph1", "principles.paragraph2"]}	[]	2026-04-04 13:05:14.976	2026-04-04 13:05:14.976	2026-04-04 13:05:14.976	\N	\N	\N
150	rhelqqy90inbul0nnhkxijko	plugin::content-manager.explorer.update	{}	api::about-page.about-page	{"fields": ["eyebrow", "heading", "headingAccent", "description", "badge1Text", "badge2Text", "sectionTitle", "backgroundImage", "principles.badge", "principles.title", "principles.paragraph1", "principles.paragraph2"]}	[]	2026-04-04 13:05:14.978	2026-04-04 13:05:14.978	2026-04-04 13:05:14.978	\N	\N	\N
151	pb6t6r2cj04ja171m4u5qu55	plugin::content-manager.explorer.delete	{}	api::about-page.about-page	{}	[]	2026-04-04 13:05:14.981	2026-04-04 13:05:14.981	2026-04-04 13:05:14.981	\N	\N	\N
152	o0hm7b2uuz54iomt6t7ngmgn	plugin::content-manager.explorer.publish	{}	api::about-page.about-page	{}	[]	2026-04-04 13:05:14.982	2026-04-04 13:05:14.982	2026-04-04 13:05:14.983	\N	\N	\N
153	nsgmjw3ioshwu9dq6kzkmsj0	plugin::content-manager.explorer.create	{}	api::team-member.team-member	{"fields": ["name", "role", "description", "phone", "email", "contactHandle", "photo", "sortOrder"]}	[]	2026-04-06 12:03:33.31	2026-04-06 12:03:33.31	2026-04-06 12:03:33.31	\N	\N	\N
154	xz5fzqq6ez4qebrd29yjcb8l	plugin::content-manager.explorer.read	{}	api::team-member.team-member	{"fields": ["name", "role", "description", "phone", "email", "contactHandle", "photo", "sortOrder"]}	[]	2026-04-06 12:03:33.315	2026-04-06 12:03:33.315	2026-04-06 12:03:33.315	\N	\N	\N
155	o29e3u5a2ilaimifyqem8sux	plugin::content-manager.explorer.update	{}	api::team-member.team-member	{"fields": ["name", "role", "description", "phone", "email", "contactHandle", "photo", "sortOrder"]}	[]	2026-04-06 12:03:33.317	2026-04-06 12:03:33.317	2026-04-06 12:03:33.317	\N	\N	\N
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	3	1
13	13	3	2
14	14	3	3
15	15	3	4
16	16	3	5
17	17	3	6
18	18	3	7
19	19	3	8
20	20	3	9
21	21	3	10
22	22	1	1
24	24	1	3
26	26	1	5
28	28	1	7
29	29	1	8
30	30	1	9
31	31	1	10
32	32	1	11
33	33	1	12
34	34	1	13
35	35	1	14
36	36	1	15
37	37	1	16
38	38	1	17
39	39	1	18
40	40	1	19
41	41	1	20
42	42	1	21
43	43	1	22
44	44	1	23
45	45	1	24
46	46	1	25
47	47	1	26
48	48	1	27
49	49	1	28
50	50	1	29
51	51	1	30
52	52	1	31
53	53	1	32
54	54	1	33
55	55	1	34
56	56	1	35
57	57	1	36
58	58	1	37
59	59	1	38
60	60	1	39
61	61	1	40
62	62	1	41
63	63	1	42
64	64	1	43
65	65	1	44
66	66	1	45
67	67	1	46
68	68	1	47
69	69	1	48
70	70	1	49
71	71	1	50
72	72	1	51
73	73	1	52
74	74	1	53
75	75	1	54
76	76	1	55
77	77	1	56
78	78	1	57
79	79	1	58
80	80	1	59
81	81	1	60
82	82	1	61
83	83	1	62
84	84	1	63
88	88	1	67
89	89	1	68
90	90	1	69
91	91	1	70
92	92	1	71
96	96	1	75
97	97	1	76
98	98	1	77
99	99	1	78
100	100	1	79
104	104	1	83
105	105	1	84
106	106	1	85
107	107	1	86
108	108	1	87
109	109	1	88
110	110	1	89
111	111	1	90
112	112	1	91
113	113	1	92
114	114	1	93
115	115	1	94
116	116	1	95
117	117	1	96
118	118	1	97
119	119	1	98
120	120	1	99
121	121	1	100
122	122	1	101
123	123	1	102
124	124	1	103
125	125	1	104
129	129	1	105
130	130	1	106
131	131	1	107
135	135	1	111
136	136	1	112
137	137	1	113
138	138	1	114
139	139	1	115
143	143	1	119
144	144	1	120
145	145	1	121
146	146	1	122
147	147	1	123
148	148	1	124
149	149	1	125
150	150	1	126
151	151	1	127
152	152	1	128
153	153	1	129
154	154	1	130
155	155	1	131
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	uogp6llkvqjgfmu8t5gkxvvm	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2026-04-03 18:53:48.991	2026-04-03 18:53:48.991	2026-04-03 18:53:48.991	\N	\N	\N
2	w77t9xkt47dnjv4537mubudn	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2026-04-03 18:53:48.994	2026-04-03 18:53:48.994	2026-04-03 18:53:48.994	\N	\N	\N
3	btx3oudg1gtsrzk0l048r3ir	Author	strapi-author	Authors can manage the content they have created.	2026-04-03 18:53:48.995	2026-04-03 18:53:48.995	2026-04-03 18:53:48.995	\N	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	wrwztnc0dz4s3gs66wxhi8c1	Деним	Самойленко	\N	gundenis1@gmail.com	$2a$10$66UaHUPKiKX.CMgyL.SoiuXbkjDltShdAB.5rPtLf7cfIBLSwfK3W	\N	\N	t	f	\N	2026-04-03 19:00:30.665	2026-04-03 19:00:30.665	2026-04-03 19:00:30.665	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: components_blocks_photo_cards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.components_blocks_photo_cards (id, alt) FROM stdin;
1	alt
6	alt
\.


--
-- Data for Name: components_blocks_principles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.components_blocks_principles (id, badge, title, paragraph_1, paragraph_2) FROM stdin;
\.


--
-- Data for Name: components_blocks_stat_cards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.components_blocks_stat_cards (id, value, label) FROM stdin;
7	6-10	месяцев окупаемость
1	70%	высвобождение ресурсов отдела сбыта
4	×2	рост конверсии отдела продаж
8	70%	высвобождение ресурсов отдела сбыта
9	×2	рост конверсии отдела продаж
10	6-10	месяцев окупаемость
\.


--
-- Data for Name: diag_ctas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.diag_ctas (id, document_id, heading, subheading, button_label, button_href, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	knscriw9fulq4n4trboeagcb	Диагностика [ВАШИХ] Бизнес-Процессов	\N	Начать диагностику	#contact	2026-04-04 08:07:59.174	2026-04-04 08:07:59.174	\N	1	1	\N
2	knscriw9fulq4n4trboeagcb	Диагностика [ВАШИХ] Бизнес-Процессов	\N	Начать диагностику	#contact	2026-04-04 08:07:59.174	2026-04-04 08:07:59.174	2026-04-04 08:07:59.197	1	1	\N
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.documents (id, document_id, project, name, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, doc_status) FROM stdin;
1	xnnrrh4p8w3z13bh67m5g1nq	ыфв	выф	2026-04-04 11:39:11.3	2026-04-04 11:47:24.316	2026-04-04 11:47:24.288	1	1	\N	signed
\.


--
-- Data for Name: documents_user_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.documents_user_lnk (id, document_id, user_id) FROM stdin;
4	1	3
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files (id, document_id, name, alternative_text, caption, focal_point, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	la80vlh5ow2kh0pk66qf7rev	photo-hero.jpg	\N	\N	\N	285	300	{"thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_photo_hero_a2e71f83b3.jpg", "hash": "thumbnail_photo_hero_a2e71f83b3", "mime": "image/jpeg", "name": "thumbnail_photo-hero.jpg", "path": null, "size": 5.78, "width": 148, "height": 156, "sizeInBytes": 5780}}	photo_hero_a2e71f83b3	.jpg	image/jpeg	19.40	/uploads/photo_hero_a2e71f83b3.jpg	\N	local	\N	/	2026-04-03 19:45:54.834	2026-04-03 19:45:54.834	2026-04-03 19:45:54.834	1	1	\N
2	zy24hlrlbvpna31ofp8wbpr1	test.png	\N	\N	\N	190	186	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_test_f30b79e657.png", "hash": "thumbnail_test_f30b79e657", "mime": "image/png", "name": "thumbnail_test.png", "path": null, "size": 23.1, "width": 159, "height": 156, "sizeInBytes": 23101}}	test_f30b79e657	.png	image/png	4.01	/uploads/test_f30b79e657.png	\N	local	\N	/	2026-04-03 19:46:44.772	2026-04-03 19:46:44.772	2026-04-03 19:46:44.772	1	1	\N
3	tl7yp2ocqvjsosmrz7967c3q	chirt.png	\N	\N	\N	179	179	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_chirt_831ca14776.png", "hash": "thumbnail_chirt_831ca14776", "mime": "image/png", "name": "thumbnail_chirt.png", "path": null, "size": 11.28, "width": 156, "height": 156, "sizeInBytes": 11278}}	chirt_831ca14776	.png	image/png	1.93	/uploads/chirt_831ca14776.png	\N	local	\N	/	2026-04-03 20:56:39.93	2026-04-03 20:56:39.93	2026-04-03 20:56:39.931	1	1	\N
4	jshq1t6o9mjs283cowh89zqf	ruble.png	\N	\N	\N	158	179	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_ruble_8ba54d704e.png", "hash": "thumbnail_ruble_8ba54d704e", "mime": "image/png", "name": "thumbnail_ruble.png", "path": null, "size": 18.76, "width": 138, "height": 156, "sizeInBytes": 18764}}	ruble_8ba54d704e	.png	image/png	2.88	/uploads/ruble_8ba54d704e.png	\N	local	\N	/	2026-04-03 20:57:38.304	2026-04-03 20:57:49.466	2026-04-03 20:57:38.305	1	1	\N
5	hnefzau1les3j4sofidux4jo	man_1.png	\N	\N	\N	285	362	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_man_1_2ae318711c.png", "hash": "thumbnail_man_1_2ae318711c", "mime": "image/png", "name": "thumbnail_man_1.png", "path": null, "size": 27.08, "width": 123, "height": 156, "sizeInBytes": 27082}}	man_1_2ae318711c	.png	image/png	36.65	/uploads/man_1_2ae318711c.png	\N	local	\N	/	2026-04-03 21:02:26.54	2026-04-03 21:29:28.546	2026-04-03 21:02:26.54	1	1	\N
6	k254xgx7sgdb3dpj9agupgij	man_2.png	\N	\N	\N	314	372	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_man_2_cc946ed5c7.png", "hash": "thumbnail_man_2_cc946ed5c7", "mime": "image/png", "name": "thumbnail_man_2.png", "path": null, "size": 26.75, "width": 132, "height": 156, "sizeInBytes": 26754}}	man_2_cc946ed5c7	.png	image/png	40.28	/uploads/man_2_cc946ed5c7.png	\N	local	\N	/	2026-04-03 21:35:10.276	2026-04-03 21:35:10.276	2026-04-03 21:35:10.276	1	1	\N
7	eor09186mpaevxixn695p8gf	man_3.png	\N	\N	\N	293	372	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_man_3_54df3eb23e.png", "hash": "thumbnail_man_3_54df3eb23e", "mime": "image/png", "name": "thumbnail_man_3.png", "path": null, "size": 30.66, "width": 123, "height": 156, "sizeInBytes": 30659}}	man_3_54df3eb23e	.png	image/png	47.14	/uploads/man_3_54df3eb23e.png	\N	local	\N	/	2026-04-03 21:35:44.773	2026-04-03 21:35:44.773	2026-04-03 21:35:44.773	1	1	\N
9	fkmgeqwi142usb9gfncl64yb	icon_2.png	\N	\N	\N	28	21	\N	icon_2_9dc0f6546d	.png	image/png	0.32	/uploads/icon_2_9dc0f6546d.png	\N	local	\N	/	2026-04-03 22:31:14.869	2026-04-03 22:31:14.869	2026-04-03 22:31:14.869	1	1	\N
10	pf3guqczy8ytft0f8xaj8v8o	icon_3.png	\N	\N	\N	24	21	\N	icon_3_46f97059c4	.png	image/png	0.39	/uploads/icon_3_46f97059c4.png	\N	local	\N	/	2026-04-03 22:32:39.137	2026-04-03 22:32:39.137	2026-04-03 22:32:39.137	1	1	\N
8	gacwk5ut91zxm8ddcqmfh8nj	icon_1.png	\N	\N	\N	26	21	{}	icon_1_1f682f63a1	.png	image/png	0.31	/uploads/icon_1_1f682f63a1.png	\N	local	\N	/	2026-04-03 21:49:14.414	2026-04-03 22:33:24.965	2026-04-03 21:49:14.414	1	1	\N
11	zf6inptacd6lzqn5cfhkau9b	icon_4.svg	\N	\N	\N	24	18	\N	icon_4_02dbe8e7a9	.svg	image/svg+xml	2.65	/uploads/icon_4_02dbe8e7a9.svg	\N	local	\N	/	2026-04-03 22:39:11.122	2026-04-03 22:39:11.122	2026-04-03 22:39:11.122	1	1	\N
12	azox06h1fqw0z515ccsbb4cc	icon_5.svg	\N	\N	\N	21	19	\N	icon_5_94dfa26a83	.svg	image/svg+xml	2.41	/uploads/icon_5_94dfa26a83.svg	\N	local	\N	/	2026-04-03 22:40:18.554	2026-04-03 22:40:18.554	2026-04-03 22:40:18.554	1	1	\N
13	dlhokb8lnztb9rjal5di7b71	icon_6.svg	\N	\N	\N	19	23	\N	icon_6_5da36a84f7	.svg	image/svg+xml	2.49	/uploads/icon_6_5da36a84f7.svg	\N	local	\N	/	2026-04-03 22:41:24.524	2026-04-03 22:41:24.524	2026-04-03 22:41:24.524	1	1	\N
14	jkn9yd1124glnlixrtf3cqi6	logo_blurpng.png	\N	\N	\N	1104	1024	{"large": {"ext": ".png", "url": "/uploads/large_logo_blurpng_c2af2874a6.png", "hash": "large_logo_blurpng_c2af2874a6", "mime": "image/png", "name": "large_logo_blurpng.png", "path": null, "size": 585.73, "width": 1000, "height": 928, "sizeInBytes": 585728}, "small": {"ext": ".png", "url": "/uploads/small_logo_blurpng_c2af2874a6.png", "hash": "small_logo_blurpng_c2af2874a6", "mime": "image/png", "name": "small_logo_blurpng.png", "path": null, "size": 149.41, "width": 500, "height": 464, "sizeInBytes": 149408}, "medium": {"ext": ".png", "url": "/uploads/medium_logo_blurpng_c2af2874a6.png", "hash": "medium_logo_blurpng_c2af2874a6", "mime": "image/png", "name": "medium_logo_blurpng.png", "path": null, "size": 343.3, "width": 750, "height": 696, "sizeInBytes": 343297}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_logo_blurpng_c2af2874a6.png", "hash": "thumbnail_logo_blurpng_c2af2874a6", "mime": "image/png", "name": "thumbnail_logo_blurpng.png", "path": null, "size": 24.27, "width": 168, "height": 156, "sizeInBytes": 24273}}	logo_blurpng_c2af2874a6	.png	image/png	165.60	/uploads/logo_blurpng_c2af2874a6.png	\N	local	\N	/	2026-04-04 08:07:53.494	2026-04-04 08:07:53.494	2026-04-04 08:07:53.494	1	1	\N
15	z06h6k3zvsqzcynx55ux069f	Счёт_№27815886.pdf	\N	\N	\N	\N	\N	\N	Schyot_27815886_834df95e0f	.pdf	application/pdf	33.08	/uploads/Schyot_27815886_834df95e0f.pdf	\N	local	\N	/	2026-04-04 11:24:51.667	2026-04-04 11:24:51.667	2026-04-04 11:24:51.667	1	1	\N
16	cbbv06kmhovzo2ox5l9m9zh2	Rectangle 23.png	\N	\N	\N	1200	500	{"large": {"ext": ".png", "url": "/uploads/large_Rectangle_23_208b2d6eb6.png", "hash": "large_Rectangle_23_208b2d6eb6", "mime": "image/png", "name": "large_Rectangle 23.png", "path": null, "size": 805.52, "width": 1000, "height": 417, "sizeInBytes": 805520}, "small": {"ext": ".png", "url": "/uploads/small_Rectangle_23_208b2d6eb6.png", "hash": "small_Rectangle_23_208b2d6eb6", "mime": "image/png", "name": "small_Rectangle 23.png", "path": null, "size": 215.26, "width": 500, "height": 208, "sizeInBytes": 215255}, "medium": {"ext": ".png", "url": "/uploads/medium_Rectangle_23_208b2d6eb6.png", "hash": "medium_Rectangle_23_208b2d6eb6", "mime": "image/png", "name": "medium_Rectangle 23.png", "path": null, "size": 467.85, "width": 750, "height": 313, "sizeInBytes": 467845}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Rectangle_23_208b2d6eb6.png", "hash": "thumbnail_Rectangle_23_208b2d6eb6", "mime": "image/png", "name": "thumbnail_Rectangle 23.png", "path": null, "size": 59.05, "width": 245, "height": 102, "sizeInBytes": 59053}}	Rectangle_23_208b2d6eb6	.png	image/png	289.12	/uploads/Rectangle_23_208b2d6eb6.png	\N	local	\N	/	2026-04-06 12:03:09.452	2026-04-06 12:03:09.452	2026-04-06 12:03:09.452	1	1	\N
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
17	4	7	blocks.stat-card	backgroundImage	1
18	1	1	blocks.photo-card	photo	1
19	2	1	blocks.stat-card	backgroundImage	1
20	3	4	blocks.stat-card	backgroundImage	1
21	1	6	blocks.photo-card	photo	1
22	2	8	blocks.stat-card	backgroundImage	1
23	3	9	blocks.stat-card	backgroundImage	1
24	4	10	blocks.stat-card	backgroundImage	1
27	5	1	api::team-member.team-member	photo	1
28	5	3	api::team-member.team-member	photo	1
29	6	4	api::team-member.team-member	photo	1
30	6	5	api::team-member.team-member	photo	1
31	7	6	api::team-member.team-member	photo	1
32	7	7	api::team-member.team-member	photo	1
43	9	5	api::service-card.service-card	icon	1
44	9	8	api::service-card.service-card	icon	1
45	10	9	api::service-card.service-card	icon	1
46	10	11	api::service-card.service-card	icon	1
47	8	1	api::service-card.service-card	icon	1
48	8	12	api::service-card.service-card	icon	1
53	12	15	api::service-card.service-card	icon	1
54	12	17	api::service-card.service-card	icon	1
55	11	13	api::service-card.service-card	icon	1
56	11	18	api::service-card.service-card	icon	1
57	13	19	api::service-card.service-card	icon	1
58	13	20	api::service-card.service-card	icon	1
59	14	1	api::diag-cta.diag-cta	image	1
60	14	2	api::diag-cta.diag-cta	image	1
66	15	1	api::document.document	file	1
67	16	1	api::about-page.about-page	backgroundImage	1
68	16	2	api::about-page.about-page	backgroundImage	1
\.


--
-- Data for Name: hero_blocks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hero_blocks (id, document_id, eyebrow, description, primary_button_label, primary_button_href, secondary_button_label, secondary_button_href, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, heading) FROM stdin;
1	sfz0kmawlz8t26b2lm32uuq5	инженерное бюро цифровых решений	Проектируем и внедряем B2B-порталы, ERP, BI и CRM — решения, которые устраняют хаос в операционке и дают вам реальный контроль над бизнесом.	Начать диагностику	#contact	Наши услуги	#services	2026-04-03 19:23:41.104	2026-04-03 19:38:03.201	\N	1	1	\N	Строим системы, которые [Увеличивают] Маржинальность
11	sfz0kmawlz8t26b2lm32uuq5	инженерное бюро цифровых решений	Проектируем и внедряем B2B-порталы, ERP, BI и CRM — решения, которые устраняют хаос в операционке и дают вам реальный контроль над бизнесом.	Начать диагностику	#contact	Наши услуги	#services	2026-04-03 19:23:41.104	2026-04-03 19:38:03.201	2026-04-03 19:38:03.216	1	1	\N	Строим системы, которые [Увеличивают] Маржинальность
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	afycqd6w5j2eoqu1lq2ob30v	English (en)	en	2026-04-03 18:53:48.932	2026-04-03 18:53:48.932	2026-04-03 18:53:48.933	\N	\N	\N
\.


--
-- Data for Name: menu_services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.menu_services (id, document_id, title, slug, link, sort_order, is_active, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
3	vokinuhu8gd8zqw6e5jpzjau	B2B-порталы	b2-b-portaly	#services	0	t	2026-04-04 08:33:38.672	2026-04-04 08:33:38.672	\N	1	1	\N
4	vokinuhu8gd8zqw6e5jpzjau	B2B-порталы	b2-b-portaly	#services	0	t	2026-04-04 08:33:38.672	2026-04-04 08:33:38.672	2026-04-04 08:33:38.686	1	1	\N
5	biucln9tsqh1jw9tvnugvizk	BI-аналитика	bi-analitika	#services	0	t	2026-04-04 08:33:47.377	2026-04-04 08:33:47.377	\N	1	1	\N
6	biucln9tsqh1jw9tvnugvizk	BI-аналитика	bi-analitika	#services	0	t	2026-04-04 08:33:47.377	2026-04-04 08:33:47.377	2026-04-04 08:33:47.392	1	1	\N
7	qwm16p775ljyutzw6mru2qm3	Операционные ERP	operaczionnye-erp	#services	0	t	2026-04-04 08:33:55.951	2026-04-04 08:33:55.951	\N	1	1	\N
8	qwm16p775ljyutzw6mru2qm3	Операционные ERP	operaczionnye-erp	#services	0	t	2026-04-04 08:33:55.951	2026-04-04 08:33:55.951	2026-04-04 08:33:55.965	1	1	\N
9	pomcts8owk59lev95lrjhgvi	Кастомные CRM	menu-service	#services	0	t	2026-04-04 08:34:04.409	2026-04-04 08:34:04.409	\N	1	1	\N
10	pomcts8owk59lev95lrjhgvi	Кастомные CRM	menu-service	#services	0	t	2026-04-04 08:34:04.409	2026-04-04 08:34:04.409	2026-04-04 08:34:04.435	1	1	\N
11	qb00sxp26qbk8qsta35y1u6r	ERP для Ozon	erp-dlya-ozon	#services	0	t	2026-04-04 08:34:16	2026-04-04 08:34:16	\N	1	1	\N
12	qb00sxp26qbk8qsta35y1u6r	ERP для Ozon	erp-dlya-ozon	#services	0	t	2026-04-04 08:34:16	2026-04-04 08:34:16	2026-04-04 08:34:16.016	1	1	\N
13	k46m44o53ak62qbgl61gfk9h	Веб-разработка (R&D)	veb-razrabotka-r-and-d	#services	0	t	2026-04-04 08:34:22.331	2026-04-04 08:34:22.331	\N	1	1	\N
14	k46m44o53ak62qbgl61gfk9h	Веб-разработка (R&D)	veb-razrabotka-r-and-d	#services	0	t	2026-04-04 08:34:22.331	2026-04-04 08:34:22.331	2026-04-04 08:34:22.351	1	1	\N
\.


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.referrals (id, document_id, contact_person, email, phone, company, product, status, payout, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, inviter_user_id) FROM stdin;
1	obxnt99k0n7xs963gs6vjfjp	dsadsadas@mail.com	dsadsadas@mail.com	123321321	dsadsadas@mail.com	Не указан	in_progress	0	2026-04-04 12:42:16.848	2026-04-04 12:42:16.848	2026-04-04 12:42:16.846	\N	\N	\N	3
2	n9e8qsqsuxslmmlolp55akmp	Тест Реферал	lead@example.com	+70000000000	ООО Тест	Не указан	in_progress	0	2026-04-04 12:42:39.692	2026-04-04 12:42:39.692	2026-04-04 12:42:39.69	\N	\N	\N	3
\.


--
-- Data for Name: referrals_user_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.referrals_user_lnk (id, referral_id, user_id) FROM stdin;
\.


--
-- Data for Name: service_cards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_cards (id, document_id, title, description, link, link_label, is_featured, sort_order, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
13	f3dg2ub5cuzhkdc6w55jalf9	Кастомные CRM	Системы для сложных продаж, где Bitrix и Amo «жмут». Жёсткие рельсы для вашего отдела.	\N	Подробнее	f	4	2026-04-03 22:39:15.297	2026-04-03 22:40:36.48	\N	1	1	\N
18	f3dg2ub5cuzhkdc6w55jalf9	Кастомные CRM	Системы для сложных продаж, где Bitrix и Amo «жмут». Жёсткие рельсы для вашего отдела.	\N	Подробнее	f	4	2026-04-03 22:39:15.297	2026-04-03 22:40:36.48	2026-04-03 22:40:36.495	1	1	\N
19	qf02sqsff0vnhk8nrvpwkmd0	Веб-разработка (R&D)	Проектирование ИТ-продуктов с нуля под уникальные задачи. Беремся за то, от чего отказались другие.	\N	Подробнее	f	6	2026-04-03 22:41:27.045	2026-04-03 22:41:27.045	\N	1	1	\N
5	xw523xr58u2y8a39fchfp4a2	BI-аналитика	Цифровой штаб собственника: вся правда о деньгах в смартфоне. Консолидация всех подразделений.	\N	Подробнее	f	1	2026-04-03 22:31:18.108	2026-04-03 22:32:01.856	\N	1	1	\N
8	xw523xr58u2y8a39fchfp4a2	BI-аналитика	Цифровой штаб собственника: вся правда о деньгах в смартфоне. Консолидация всех подразделений.	\N	Подробнее	f	1	2026-04-03 22:31:18.108	2026-04-03 22:32:01.856	2026-04-03 22:32:01.875	1	1	\N
9	hon2bo9hfx381mzg3olho1nc	Операционные ERP	Управление сложным циклом: стройка, инжиниринг, сервис. Связываем офис, склад и полевых сотрудников.	\N	Подробнее	f	2	2026-04-03 22:32:19.545	2026-04-03 22:32:52.276	\N	1	1	\N
11	hon2bo9hfx381mzg3olho1nc	Операционные ERP	Управление сложным циклом: стройка, инжиниринг, сервис. Связываем офис, склад и полевых сотрудников.	\N	Подробнее	f	2	2026-04-03 22:32:19.545	2026-04-03 22:32:52.276	2026-04-03 22:32:52.323	1	1	\N
1	lq2pjbthjmqtz87ppbv2ouat	B2B-порталы	Автоматизация дилерских сетей: заказы и остатки 24/7. Ваш склад в кармане каждого дилера.	\N	Подробнее	t	0	2026-04-03 21:49:17.521	2026-04-03 22:33:26.038	\N	1	1	\N
12	lq2pjbthjmqtz87ppbv2ouat	B2B-порталы	Автоматизация дилерских сетей: заказы и остатки 24/7. Ваш склад в кармане каждого дилера.	\N	Подробнее	t	0	2026-04-03 21:49:17.521	2026-04-03 22:33:26.038	2026-04-03 22:33:26.079	1	1	\N
15	bd04bakwvox7l3hbu9qpaqv3	ERP для Ozon	Учёт внутреннего склада и чистой прибыли для крупных селлеров. Приватная система на вашем сервере.	\N	Подробнее	f	5	2026-04-03 22:40:22.031	2026-04-03 22:40:30.708	\N	1	1	\N
17	bd04bakwvox7l3hbu9qpaqv3	ERP для Ozon	Учёт внутреннего склада и чистой прибыли для крупных селлеров. Приватная система на вашем сервере.	\N	Подробнее	f	5	2026-04-03 22:40:22.031	2026-04-03 22:40:30.708	2026-04-03 22:40:30.717	1	1	\N
20	qf02sqsff0vnhk8nrvpwkmd0	Веб-разработка (R&D)	Проектирование ИТ-продуктов с нуля под уникальные задачи. Беремся за то, от чего отказались другие.	\N	Подробнее	f	6	2026-04-03 22:41:27.045	2026-04-03 22:41:27.045	2026-04-03 22:41:27.069	1	1	\N
\.


--
-- Data for Name: services_sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.services_sections (id, document_id, heading, subheading, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	ov5t67njtvlonhnyen6dtlfg	Цифровой фундамент для вашего бизнеса	\N	2026-04-03 21:58:51.413	2026-04-03 22:31:44.271	\N	1	1	\N
3	ov5t67njtvlonhnyen6dtlfg	Цифровой фундамент для вашего бизнеса	\N	2026-04-03 21:58:51.413	2026-04-03 22:31:44.271	2026-04-03 22:31:44.292	1	1	\N
\.


--
-- Data for Name: stats_blocks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_blocks (id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	crkdl6wct2wwdo8znw7ayner	2026-04-03 19:45:59.217	2026-04-03 20:57:54.956	\N	1	1	\N
6	crkdl6wct2wwdo8znw7ayner	2026-04-03 19:45:59.217	2026-04-03 20:57:54.956	2026-04-03 20:57:54.98	1	1	\N
\.


--
-- Data for Name: stats_blocks_cmps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stats_blocks_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
17	1	1	blocks.photo-card	cards	1
18	1	1	blocks.stat-card	cards	2
19	1	4	blocks.stat-card	cards	3
20	1	7	blocks.stat-card	cards	4
21	6	6	blocks.photo-card	cards	1
22	6	8	blocks.stat-card	cards	2
23	6	9	blocks.stat-card	cards	3
24	6	10	blocks.stat-card	cards	4
\.


--
-- Data for Name: strapi_ai_localization_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_ai_localization_jobs (id, content_type, related_document_id, source_locale, target_locales, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: strapi_ai_metadata_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_ai_metadata_jobs (id, status, created_at, completed_at) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	n16pw7e2wk2w2ms020xk4qie	Read Only	A default API token with read-only permissions, only used for accessing resources	read-only	6b2957fd90e59a1aac99be2f810d082d48f976ac2b6f9215e653ae978d7131c1a3aedab0294643c55a4f4ca89f0fedd26520f02f8be3367c8207b0ebfe5af13b	v1:78cc28727bf4d0259f41f06a4ca86f5a:9ea5c30f847c5d5e7d2b16a4e691b1ff30047b3422870f880749ff591b57ce49e13e2a44cc97700dbad724af3dc926d24dd335eaba2bd57c0069e32afd262d2d5e21f1c282790259e6a1eeabe009837bc5d22931c79e853a5efa9dfc796165e3dd0b5f126e6c4433bfe42a4494f9bb7b621624da125ab78696e19ab84b469a57b93fad9f1c70dca6754d8ba95f8d88b11c002dacf350fa17a890d5931365e0890f1046775e75748cf05d912efab97134fc3a7f12349f64c9fb3999d191e4aaa396171e6ac228d477cdcc3370bfbea0141a29c8fb06feca7b70c8f96dc2d78ed3672a7df33fde08a1af0819d7f791e79c6b8055278d0aaa520374742b0e3ca93b:8aaf2be89acc8aa37486914e855a3c7f	\N	\N	\N	2026-04-03 18:53:49.164	2026-04-03 18:53:49.164	2026-04-03 18:53:49.164	\N	\N	\N
2	r7jckwzfs4hj3c4x9pbvm1va	Full Access	A default API token with full access permissions, used for accessing or modifying resources	full-access	f39386f35e90080044fb1a126b32978a2a753b257acef6bdfa409704ecddbdeebaf3907932b8d08032c70b67cde293d12794de27bd50d4b7f3fe9ec58b16e36c	v1:f7595134ff6ab6b29076fcd76f3faf64:1fa0c6d6a1e3705d16c0fd495c4bea860b5118fe5356fda31bfb1138c62c7f24552163c54dea7618e548bb2914a27143c45b91627f7d66841d534d795a4c9b9890f3de13e33ee52766f892a5a71661ba58ef7bd0c4ab68cd25462e390df40580c9380a39fc3899fc82471b026bbfdea5ebeb5b7fde9906d5d71a3ebf8991b8b0bbe8a0dda9a13ff4ee4cfadd8f74946d424aa855455f6a802b0cc25b626491a24a5a0535503bc2245a26bd141d23497ac966eb9a2ef03ee4961dbbea83861a0ef3bd55843463fbec8b8982a39f26ac3cb08e105d635bb2d7bd32e50d4aa287870de9aa728c6282a7a5b6ab59701afcf7c942a835086ad43225a0b34d4886b8f0:def1b839a0e3476cc3cac4303961f439	\N	\N	\N	2026-04-03 18:53:49.169	2026-04-03 22:03:33.859	2026-04-03 18:53:49.169	\N	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
1	strapi_unidirectional-join-table-repair-ran	true	boolean	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"focalPoint":{"edit":{"label":"focalPoint","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"focalPoint","searchable":false,"sortable":false}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"related":{"edit":{},"list":{"label":"related","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6}],[{"name":"focalPoint","size":12}],[{"name":"width","size":4},{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::api::menu-service.menu-service	{"uid":"api::menu-service.menu-service","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"sortOrder","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"title":{"edit":{"label":"Название","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Название","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Адрес страницы (URL)","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Адрес страницы","searchable":true,"sortable":true}},"link":{"edit":{"label":"Ссылка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ссылка","searchable":true,"sortable":true}},"sortOrder":{"edit":{"label":"Порядок сортировки","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Порядок","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"Активен","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Активен","searchable":true,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","sortOrder","isActive"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"link","size":6},{"name":"sortOrder","size":3},{"name":"isActive","size":3}]]}}	object	\N	\N
18	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
46	plugin_content-manager_configuration_content_types::api::diag-cta.diag-cta	{"uid":"api::diag-cta.diag-cta","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"heading","defaultSortBy":"heading","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок (акцент в [скобках])","description":"","placeholder":"Диагностика [ВАШИХ] Бизнес-Процессов","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"subheading":{"edit":{"label":"Подзаголовок","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Подзаголовок","searchable":true,"sortable":false}},"buttonLabel":{"edit":{"label":"Текст кнопки","description":"","placeholder":"Начать диагностику","visible":true,"editable":true},"list":{"label":"Кнопка","searchable":false,"sortable":false}},"buttonHref":{"edit":{"label":"Ссылка кнопки","description":"","placeholder":"#contact","visible":true,"editable":true},"list":{"label":"Ссылка","searchable":false,"sortable":false}},"image":{"edit":{"label":"Изображение","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Изображение","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"heading","size":12}],[{"name":"subheading","size":12}],[{"name":"buttonLabel","size":6},{"name":"buttonHref","size":6}],[{"name":"image","size":12}]]}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"encryptedKey":{"edit":{"label":"encryptedKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"encryptedKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"encryptedKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
37	plugin_content_manager_configuration_content_types::api::team-member.team-member	{"uid":"api::team-member.team-member","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"sortOrder","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"name":{"edit":{"label":"Имя","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Имя","searchable":true,"sortable":true}},"role":{"edit":{"label":"Роль / направление","description":"","placeholder":"Продажи и стратегия","visible":true,"editable":true},"list":{"label":"Роль","searchable":true,"sortable":true}},"description":{"edit":{"label":"Короткое описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":true,"sortable":false}},"phone":{"edit":{"label":"Телефон","description":"","placeholder":"+7 999 123 45 67","visible":true,"editable":true},"list":{"label":"Телефон","searchable":true,"sortable":false}},"email":{"edit":{"label":"Email","description":"","placeholder":"name@basisthree.ru","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":false}},"contactHandle":{"edit":{"label":"Ник / ссылка","description":"Например: @ddvworks","placeholder":"@username","visible":true,"editable":true},"list":{"label":"Ник","searchable":true,"sortable":false}},"photo":{"edit":{"label":"Фото","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Фото","searchable":false,"sortable":false}},"sortOrder":{"edit":{"label":"Порядок","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Порядок","searchable":false,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","role","phone","email","sortOrder"],"edit":[[{"name":"name","size":6},{"name":"role","size":6}],[{"name":"description","size":12}],[{"name":"phone","size":4},{"name":"email","size":4},{"name":"contactHandle","size":4}],[{"name":"photo","size":6},{"name":"sortOrder","size":6}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
29	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
31	plugin_content-manager_configuration_content_types::api::hero-block.hero-block	{"uid":"api::hero-block.hero-block","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"eyebrow","defaultSortBy":"eyebrow","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"eyebrow":{"edit":{"label":"Надпись над заголовком","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Надпись над заголовком","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок (акцент оборачивай в [скобки])","description":"","placeholder":"Строим системы, которые [Увеличивают] Маржинальность","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"description":{"edit":{"label":"Описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":true,"sortable":true}},"primaryButtonLabel":{"edit":{"label":"Кнопка 1 — текст","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 1 — текст","searchable":true,"sortable":true}},"primaryButtonHref":{"edit":{"label":"Кнопка 1 — ссылка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 1 — ссылка","searchable":true,"sortable":true}},"secondaryButtonLabel":{"edit":{"label":"Кнопка 2 — текст","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 2 — текст","searchable":true,"sortable":true}},"secondaryButtonHref":{"edit":{"label":"Кнопка 2 — ссылка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 2 — ссылка","searchable":true,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","eyebrow"],"edit":[[{"name":"eyebrow","size":12}],[{"name":"heading","size":12}],[{"name":"description","size":12}],[{"name":"primaryButtonLabel","size":6},{"name":"primaryButtonHref","size":6}],[{"name":"secondaryButtonLabel","size":6},{"name":"secondaryButtonHref","size":6}]]}}	object	\N	\N
48	plugin_content-manager_configuration_content_types::api::document.document	{"uid":"api::document.document","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"project":{"edit":{"label":"Проект","visible":true,"editable":true},"list":{"label":"Проект","searchable":true,"sortable":true}},"name":{"edit":{"label":"Наименование документа","visible":true,"editable":true},"list":{"label":"Наименование","searchable":true,"sortable":true}},"docStatus":{"edit":{"label":"Состояние","visible":true,"editable":true},"list":{"label":"Состояние","searchable":false,"sortable":true}},"file":{"edit":{"label":"Файл (PDF)","visible":true,"editable":true},"list":{"label":"Файл","searchable":false,"sortable":false}},"user":{"edit":{"label":"Клиент","visible":true,"editable":true},"list":{"label":"Клиент","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","project","name","docStatus"],"edit":[[{"name":"project","size":6},{"name":"name","size":6}],[{"name":"docStatus","size":4},{"name":"user","size":8}],[{"name":"file","size":12}]]}}	object	\N	\N
21	plugin_content_manager_configuration_content_types::admin::session	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"userId","defaultSortBy":"userId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"userId":{"edit":{"label":"userId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"userId","searchable":true,"sortable":true}},"sessionId":{"edit":{"label":"sessionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sessionId","searchable":true,"sortable":true}},"childId":{"edit":{"label":"childId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"childId","searchable":true,"sortable":true}},"deviceId":{"edit":{"label":"deviceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"deviceId","searchable":true,"sortable":true}},"origin":{"edit":{"label":"origin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"origin","searchable":true,"sortable":true}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"absoluteExpiresAt":{"edit":{"label":"absoluteExpiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"absoluteExpiresAt","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","userId","sessionId","childId"],"edit":[[{"name":"userId","size":6},{"name":"sessionId","size":6}],[{"name":"childId","size":6},{"name":"deviceId","size":6}],[{"name":"origin","size":6},{"name":"expiresAt","size":6}],[{"name":"absoluteExpiresAt","size":6},{"name":"status","size":6}],[{"name":"type","size":6}]]},"uid":"admin::session"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
30	plugin_content_manager_configuration_content_types::api::hero-block.hero-block	{"uid":"api::hero-block.hero-block","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"eyebrow","defaultSortBy":"eyebrow","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"eyebrow":{"edit":{"label":"Надпись над заголовком","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Надпись над заголовком","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок (акцент оборачивай в [скобки])","description":"","placeholder":"Строим системы, которые [Увеличивают] Маржинальность","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"description":{"edit":{"label":"Описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":true,"sortable":true}},"primaryButtonLabel":{"edit":{"label":"Кнопка 1 — текст","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 1 — текст","searchable":true,"sortable":true}},"primaryButtonHref":{"edit":{"label":"Кнопка 1 — ссылка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 1 — ссылка","searchable":true,"sortable":true}},"secondaryButtonLabel":{"edit":{"label":"Кнопка 2 — текст","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 2 — текст","searchable":true,"sortable":true}},"secondaryButtonHref":{"edit":{"label":"Кнопка 2 — ссылка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Кнопка 2 — ссылка","searchable":true,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","eyebrow"],"edit":[[{"name":"eyebrow","size":12}],[{"name":"heading","size":12}],[{"name":"description","size":12}],[{"name":"primaryButtonLabel","size":6},{"name":"primaryButtonHref","size":6}],[{"name":"secondaryButtonLabel","size":6},{"name":"secondaryButtonHref","size":6}]]}}	object	\N	\N
22	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false,"aiMetadata":true}	object	\N	\N
23	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
25	plugin_i18n_default_locale	"en"	string	\N	\N
26	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
27	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
28	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
24	plugin_upload_metrics	{"weeklySchedule":"3 54 18 * * 5","lastWeeklyUpdate":1775231643381}	object	\N	\N
36	plugin_content_manager_configuration_components::blocks.stat-card	{"uid":"blocks.stat-card","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"value","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"value":{"edit":{"label":"Значение (цифра)","description":"Например: 98% или 5 лет","placeholder":"98%","visible":true,"editable":true},"list":{"label":"Значение","searchable":true,"sortable":false}},"label":{"edit":{"label":"Подпись","description":"Текст под цифрой","placeholder":"клиентов довольны","visible":true,"editable":true},"list":{"label":"Подпись","searchable":true,"sortable":false}},"backgroundImage":{"edit":{"label":"Фоновое изображение","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Фон","searchable":false,"sortable":false}}},"layouts":{"list":["id","value","label"],"edit":[[{"name":"value","size":6},{"name":"label","size":6}],[{"name":"backgroundImage","size":12}]]}}	object	\N	\N
20	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
34	plugin_content-manager_configuration_content_types::api::stats-block.stats-block	{"uid":"api::stats-block.stats-block","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"cards":{"edit":{"label":"Карточки","description":"Добавляй фото-карточки и карточки-показатели в нужном порядке","visible":true,"editable":true},"list":{"label":"Карточки","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"cards","size":12}]]}}	object	\N	\N
39	plugin_content-manager_configuration_content_types::api::team-member.team-member	{"uid":"api::team-member.team-member","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"sortOrder","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"name":{"edit":{"label":"Имя","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Имя","searchable":true,"sortable":true}},"role":{"edit":{"label":"Роль / направление","description":"","placeholder":"Продажи и стратегия","visible":true,"editable":true},"list":{"label":"Роль","searchable":true,"sortable":true}},"description":{"edit":{"label":"Короткое описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":true,"sortable":false}},"phone":{"edit":{"label":"Телефон","description":"","placeholder":"+7 999 123 45 67","visible":true,"editable":true},"list":{"label":"Телефон","searchable":true,"sortable":false}},"email":{"edit":{"label":"Email","description":"","placeholder":"name@basisthree.ru","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":false}},"contactHandle":{"edit":{"label":"Ник / ссылка","description":"Например: @ddvworks","placeholder":"@username","visible":true,"editable":true},"list":{"label":"Ник","searchable":true,"sortable":false}},"photo":{"edit":{"label":"Фото","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Фото","searchable":false,"sortable":false}},"sortOrder":{"edit":{"label":"Порядок","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Порядок","searchable":false,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","role","phone","email","sortOrder"],"edit":[[{"name":"name","size":6},{"name":"role","size":6}],[{"name":"description","size":12}],[{"name":"phone","size":4},{"name":"email","size":4},{"name":"contactHandle","size":4}],[{"name":"photo","size":6},{"name":"sortOrder","size":6}]]}}	object	\N	\N
2	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"phone":{"type":"string"},"company":{"type":"string"},"firstName":{"type":"string"},"lastName":{"type":"string"},"middleName":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","kind":"collectionType","__filename__":"schema.json","uid":"plugin::users-permissions.user","modelType":"contentType","__schema__":{"collectionName":"up_users","info":{"singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"phone":{"type":"string"},"company":{"type":"string"},"firstName":{"type":"string"},"lastName":{"type":"string"},"middleName":{"type":"string"}},"kind":"collectionType"},"modelName":"user"},"api::about-page.about-page":{"kind":"singleType","collectionName":"about_pages","info":{"singularName":"about-page","pluralName":"about-pages","displayName":"Страница «О компании»","description":"Контент страницы о компании"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"eyebrow":{"type":"string"},"heading":{"type":"string"},"headingAccent":{"type":"string"},"description":{"type":"text"},"badge1Text":{"type":"string"},"badge2Text":{"type":"string"},"sectionTitle":{"type":"string"},"backgroundImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"principles":{"type":"component","repeatable":true,"component":"blocks.principle"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::about-page.about-page","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"about_pages"}}},"apiName":"about-page","globalId":"AboutPage","uid":"api::about-page.about-page","modelType":"contentType","__schema__":{"collectionName":"about_pages","info":{"singularName":"about-page","pluralName":"about-pages","displayName":"Страница «О компании»","description":"Контент страницы о компании"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"eyebrow":{"type":"string"},"heading":{"type":"string"},"headingAccent":{"type":"string"},"description":{"type":"text"},"badge1Text":{"type":"string"},"badge2Text":{"type":"string"},"sectionTitle":{"type":"string"},"backgroundImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"principles":{"type":"component","repeatable":true,"component":"blocks.principle"}},"kind":"singleType"},"modelName":"about-page","actions":{},"lifecycles":{}},"api::diag-cta.diag-cta":{"kind":"singleType","collectionName":"diag_ctas","info":{"singularName":"diag-cta","pluralName":"diag-ctas","displayName":"Диагностика — призыв к действию","description":"Блок призыва к действию с диагностикой"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"heading":{"type":"string","required":true,"default":"Диагностика [ВАШИХ] Бизнес-Процессов"},"subheading":{"type":"text"},"buttonLabel":{"type":"string","default":"Начать диагностику"},"buttonHref":{"type":"string","default":"#contact"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::diag-cta.diag-cta","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"diag_ctas"}}},"apiName":"diag-cta","globalId":"DiagCta","uid":"api::diag-cta.diag-cta","modelType":"contentType","__schema__":{"collectionName":"diag_ctas","info":{"singularName":"diag-cta","pluralName":"diag-ctas","displayName":"Диагностика — призыв к действию","description":"Блок призыва к действию с диагностикой"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"heading":{"type":"string","required":true,"default":"Диагностика [ВАШИХ] Бизнес-Процессов"},"subheading":{"type":"text"},"buttonLabel":{"type":"string","default":"Начать диагностику"},"buttonHref":{"type":"string","default":"#contact"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]}},"kind":"singleType"},"modelName":"diag-cta","actions":{},"lifecycles":{}},"api::document.document":{"kind":"collectionType","collectionName":"documents","info":{"singularName":"document","pluralName":"documents","displayName":"Документы","description":"Документы клиентов по проектам"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"project":{"type":"string","required":true},"name":{"type":"string","required":true},"docStatus":{"type":"enumeration","enum":["pending_signature","signed","under_review"],"default":"under_review"},"file":{"type":"media","multiple":false,"required":false,"allowedTypes":["files"]},"user":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::document.document","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"documents"}}},"apiName":"document","globalId":"Document","uid":"api::document.document","modelType":"contentType","__schema__":{"collectionName":"documents","info":{"singularName":"document","pluralName":"documents","displayName":"Документы","description":"Документы клиентов по проектам"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"project":{"type":"string","required":true},"name":{"type":"string","required":true},"docStatus":{"type":"enumeration","enum":["pending_signature","signed","under_review"],"default":"under_review"},"file":{"type":"media","multiple":false,"required":false,"allowedTypes":["files"]},"user":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"}},"kind":"collectionType"},"modelName":"document","actions":{},"lifecycles":{}},"api::hero-block.hero-block":{"kind":"singleType","collectionName":"hero_blocks","info":{"singularName":"hero-block","pluralName":"hero-blocks","displayName":"Главный экран","description":"Контент героя на главной странице"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"eyebrow":{"type":"string","default":"инженерное бюро цифровых решений"},"heading":{"type":"string","required":true,"default":"Строим системы, которые [Увеличивают] Маржинальность"},"description":{"type":"text","required":true},"primaryButtonLabel":{"type":"string","default":"Начать диагностику"},"primaryButtonHref":{"type":"string","default":"#contact"},"secondaryButtonLabel":{"type":"string","default":"Наши услуги"},"secondaryButtonHref":{"type":"string","default":"#services"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::hero-block.hero-block","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"hero_blocks"}}},"apiName":"hero-block","globalId":"HeroBlock","uid":"api::hero-block.hero-block","modelType":"contentType","__schema__":{"collectionName":"hero_blocks","info":{"singularName":"hero-block","pluralName":"hero-blocks","displayName":"Главный экран","description":"Контент героя на главной странице"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"eyebrow":{"type":"string","default":"инженерное бюро цифровых решений"},"heading":{"type":"string","required":true,"default":"Строим системы, которые [Увеличивают] Маржинальность"},"description":{"type":"text","required":true},"primaryButtonLabel":{"type":"string","default":"Начать диагностику"},"primaryButtonHref":{"type":"string","default":"#contact"},"secondaryButtonLabel":{"type":"string","default":"Наши услуги"},"secondaryButtonHref":{"type":"string","default":"#services"}},"kind":"singleType"},"modelName":"hero-block","actions":{},"lifecycles":{}},"api::menu-service.menu-service":{"kind":"collectionType","collectionName":"menu_services","info":{"singularName":"menu-service","pluralName":"menu-services","displayName":"Меню — Услуги","description":"Пункты выпадающего меню в разделе Услуги"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"link":{"type":"string","default":"#services"},"sortOrder":{"type":"integer","default":0},"isActive":{"type":"boolean","default":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::menu-service.menu-service","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"menu_services"}}},"apiName":"menu-service","globalId":"MenuService","uid":"api::menu-service.menu-service","modelType":"contentType","__schema__":{"collectionName":"menu_services","info":{"singularName":"menu-service","pluralName":"menu-services","displayName":"Меню — Услуги","description":"Пункты выпадающего меню в разделе Услуги"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"link":{"type":"string","default":"#services"},"sortOrder":{"type":"integer","default":0},"isActive":{"type":"boolean","default":true}},"kind":"collectionType"},"modelName":"menu-service","actions":{},"lifecycles":{}},"api::referral.referral":{"kind":"collectionType","collectionName":"referrals","info":{"singularName":"referral","pluralName":"referrals","displayName":"Реферальная программа — запись","description":"Сделки и начисления по реферальной программе"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"inviterUserId":{"type":"integer","required":true},"contactPerson":{"type":"string","required":true},"email":{"type":"email"},"phone":{"type":"string"},"company":{"type":"string","required":true},"product":{"type":"string","required":true},"status":{"type":"enumeration","enum":["in_progress","contract_signed"],"default":"in_progress"},"payout":{"type":"integer","default":0},"user":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::referral.referral","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"referrals"}}},"apiName":"referral","globalId":"Referral","uid":"api::referral.referral","modelType":"contentType","__schema__":{"collectionName":"referrals","info":{"singularName":"referral","pluralName":"referrals","displayName":"Реферальная программа — запись","description":"Сделки и начисления по реферальной программе"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"inviterUserId":{"type":"integer","required":true},"contactPerson":{"type":"string","required":true},"email":{"type":"email"},"phone":{"type":"string"},"company":{"type":"string","required":true},"product":{"type":"string","required":true},"status":{"type":"enumeration","enum":["in_progress","contract_signed"],"default":"in_progress"},"payout":{"type":"integer","default":0},"user":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"}},"kind":"collectionType"},"modelName":"referral","actions":{},"lifecycles":{}},"api::service-card.service-card":{"kind":"collectionType","collectionName":"service_cards","info":{"singularName":"service-card","pluralName":"service-cards","displayName":"Услуги — карточка","description":"Карточки услуг на главной странице"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"description":{"type":"text"},"link":{"type":"string"},"linkLabel":{"type":"string","default":"Подробнее"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files"]},"isFeatured":{"type":"boolean","default":false},"sortOrder":{"type":"integer","default":0},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::service-card.service-card","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"service_cards"}}},"apiName":"service-card","globalId":"ServiceCard","uid":"api::service-card.service-card","modelType":"contentType","__schema__":{"collectionName":"service_cards","info":{"singularName":"service-card","pluralName":"service-cards","displayName":"Услуги — карточка","description":"Карточки услуг на главной странице"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true},"description":{"type":"text"},"link":{"type":"string"},"linkLabel":{"type":"string","default":"Подробнее"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files"]},"isFeatured":{"type":"boolean","default":false},"sortOrder":{"type":"integer","default":0}},"kind":"collectionType"},"modelName":"service-card","actions":{},"lifecycles":{}},"api::services-section.services-section":{"kind":"singleType","collectionName":"services_sections","info":{"singularName":"services-section","pluralName":"services-sections","displayName":"Услуги — секция","description":"Заголовок и подзаголовок секции услуг"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"heading":{"type":"string","required":true,"default":"Цифровой фундамент для вашего бизнеса"},"subheading":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::services-section.services-section","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"services_sections"}}},"apiName":"services-section","globalId":"ServicesSection","uid":"api::services-section.services-section","modelType":"contentType","__schema__":{"collectionName":"services_sections","info":{"singularName":"services-section","pluralName":"services-sections","displayName":"Услуги — секция","description":"Заголовок и подзаголовок секции услуг"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"heading":{"type":"string","required":true,"default":"Цифровой фундамент для вашего бизнеса"},"subheading":{"type":"text"}},"kind":"singleType"},"modelName":"services-section","actions":{},"lifecycles":{}},"api::stats-block.stats-block":{"kind":"singleType","collectionName":"stats_blocks","info":{"singularName":"stats-block","pluralName":"stats-blocks","displayName":"Блок статистики","description":"Ряд карточек: фото и/или показатели"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"cards":{"type":"dynamiczone","components":["blocks.photo-card","blocks.stat-card"],"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::stats-block.stats-block","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"stats_blocks"}}},"apiName":"stats-block","globalId":"StatsBlock","uid":"api::stats-block.stats-block","modelType":"contentType","__schema__":{"collectionName":"stats_blocks","info":{"singularName":"stats-block","pluralName":"stats-blocks","displayName":"Блок статистики","description":"Ряд карточек: фото и/или показатели"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"cards":{"type":"dynamiczone","components":["blocks.photo-card","blocks.stat-card"],"required":false}},"kind":"singleType"},"modelName":"stats-block","actions":{},"lifecycles":{}},"api::team-member.team-member":{"kind":"collectionType","collectionName":"team_members","info":{"singularName":"team-member","pluralName":"team-members","displayName":"Команда — участник","description":"Участники команды"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true},"role":{"type":"string","required":true},"description":{"type":"string"},"phone":{"type":"string"},"email":{"type":"email"},"contactHandle":{"type":"string"},"photo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"sortOrder":{"type":"integer","default":0},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::team-member.team-member","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"team_members"}}},"apiName":"team-member","globalId":"TeamMember","uid":"api::team-member.team-member","modelType":"contentType","__schema__":{"collectionName":"team_members","info":{"singularName":"team-member","pluralName":"team-members","displayName":"Команда — участник","description":"Участники команды"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true},"role":{"type":"string","required":true},"description":{"type":"string"},"phone":{"type":"string"},"email":{"type":"email"},"contactHandle":{"type":"string"},"photo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"sortOrder":{"type":"integer","default":0}},"kind":"collectionType"},"modelName":"team-member","actions":{},"lifecycles":{}},"api::team-section.team-section":{"kind":"singleType","collectionName":"team_sections","info":{"singularName":"team-section","pluralName":"team-sections","displayName":"Команда — секция","description":"Заголовок и описание секции команды"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"heading":{"type":"string","required":true,"default":"Три экспертизы — одна команда"},"subheading":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::team-section.team-section","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"team_sections"}}},"apiName":"team-section","globalId":"TeamSection","uid":"api::team-section.team-section","modelType":"contentType","__schema__":{"collectionName":"team_sections","info":{"singularName":"team-section","pluralName":"team-sections","displayName":"Команда — секция","description":"Заголовок и описание секции команды"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"heading":{"type":"string","required":true,"default":"Три экспертизы — одна команда"},"subheading":{"type":"text"}},"kind":"singleType"},"modelName":"team-section","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"},"admin::session":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::session","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_sessions"}}},"plugin":"admin","globalId":"AdminSession","uid":"admin::session","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"session"}}	object	\N	\N
35	plugin_content_manager_configuration_components::blocks.photo-card	{"uid":"blocks.photo-card","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"alt","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"photo":{"edit":{"label":"Фотография","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Фото","searchable":false,"sortable":false}},"alt":{"edit":{"label":"Альт-текст (описание)","description":"Используется для доступности и SEO","placeholder":"","visible":true,"editable":true},"list":{"label":"Альт-текст","searchable":true,"sortable":false}}},"layouts":{"list":["id","alt"],"edit":[[{"name":"photo","size":12}],[{"name":"alt","size":12}]]}}	object	\N	\N
43	plugin_content-manager_configuration_content_types::api::services-section.services-section	{"uid":"api::services-section.services-section","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"heading","defaultSortBy":"heading","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок секции","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"subheading":{"edit":{"label":"Подзаголовок / описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Подзаголовок","searchable":true,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"heading","size":12}],[{"name":"subheading","size":12}]]}}	object	\N	\N
51	plugin_content_manager_configuration_content_types::api::referral.referral	{"uid":"api::referral.referral","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"company","defaultSortBy":"id","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"inviterUserId":{"edit":{"label":"ID пригласившего пользователя","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ID пригласившего","searchable":true,"sortable":true}},"contactPerson":{"edit":{"label":"Контактное лицо","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Контактное лицо","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"phone":{"edit":{"label":"Телефон","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Телефон","searchable":true,"sortable":false}},"company":{"edit":{"label":"Компания","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Компания","searchable":true,"sortable":true}},"product":{"edit":{"label":"Продукт","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Продукт","searchable":true,"sortable":true}},"status":{"edit":{"label":"Статус","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Статус","searchable":true,"sortable":true}},"payout":{"edit":{"label":"Выплата (₽)","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Выплата","searchable":false,"sortable":true}},"user":{"edit":{"label":"Клиент","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Клиент","searchable":false,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","inviterUserId","contactPerson","company","product","status","payout"],"edit":[[{"name":"inviterUserId","size":4},{"name":"contactPerson","size":4},{"name":"company","size":4}],[{"name":"email","size":6},{"name":"phone","size":6}],[{"name":"product","size":4},{"name":"status","size":4},{"name":"payout","size":4}],[{"name":"user","size":12}]]}}	object	\N	\N
40	plugin_content-manager_configuration_content_types::api::team-section.team-section	{"uid":"api::team-section.team-section","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"heading","defaultSortBy":"heading","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок секции","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"subheading":{"edit":{"label":"Подзаголовок / описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Подзаголовок","searchable":true,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"heading","size":12}],[{"name":"subheading","size":12}]]}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"company":{"edit":{"label":"company","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"company","searchable":true,"sortable":true}},"firstName":{"edit":{"label":"firstName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstName","searchable":true,"sortable":true}},"lastName":{"edit":{"label":"lastName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastName","searchable":true,"sortable":true}},"middleName":{"edit":{"label":"middleName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"middleName","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}],[{"name":"phone","size":6},{"name":"company","size":6}],[{"name":"firstName","size":6},{"name":"lastName","size":6}],[{"name":"middleName","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
32	plugin_content-manager_configuration_content_types::api::menu-service.menu-service	{"uid":"api::menu-service.menu-service","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"sortOrder","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"title":{"edit":{"label":"Название","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Название","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Адрес страницы (URL)","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Адрес страницы","searchable":true,"sortable":true}},"link":{"edit":{"label":"Ссылка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ссылка","searchable":true,"sortable":true}},"sortOrder":{"edit":{"label":"Порядок сортировки","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Порядок","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"Активен","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Активен","searchable":true,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","sortOrder","isActive"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"link","size":6},{"name":"sortOrder","size":3},{"name":"isActive","size":3}]]}}	object	\N	\N
55	plugin_content-manager_configuration_content_types::api::about-page.about-page	{"uid":"api::about-page.about-page","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"heading","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"eyebrow":{"edit":{"label":"Надпись над заголовком","description":"Например: \\"О компании\\"","placeholder":"О компании","visible":true,"editable":true},"list":{"label":"Надпись","searchable":true,"sortable":false}},"heading":{"edit":{"label":"Заголовок (строка 1)","description":"Первая строка крупного заголовка","placeholder":"ИНЖЕНЕРНОЕ БЮРО","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":false}},"headingAccent":{"edit":{"label":"Заголовок (строка 2, акцент)","description":"Вторая строка — выделяется цветом","placeholder":"BASISTHREE","visible":true,"editable":true},"list":{"label":"Акцент","searchable":false,"sortable":false}},"description":{"edit":{"label":"Описание","description":"Текст под заголовком","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":false,"sortable":false}},"badge1Text":{"edit":{"label":"Бейдж 1 (место)","description":"","placeholder":"САНКТ-ПЕТЕРБУРГ","visible":true,"editable":true},"list":{"label":"Бейдж 1","searchable":false,"sortable":false}},"badge2Text":{"edit":{"label":"Бейдж 2 (география)","description":"","placeholder":"РАБОТАЕМ ПО ВСЕЙ РОССИИ","visible":true,"editable":true},"list":{"label":"Бейдж 2","searchable":false,"sortable":false}},"sectionTitle":{"edit":{"label":"Заголовок секции принципов","description":"","placeholder":"«ЦИФРОВОЙ ФУНДАМЕНТ»","visible":true,"editable":true},"list":{"label":"Секция","searchable":false,"sortable":false}},"backgroundImage":{"edit":{"label":"Фоновое изображение секции принципов","visible":true,"editable":true},"list":{"label":"Фон","searchable":false,"sortable":false}},"principles":{"edit":{"label":"Принципы","description":"Добавь 3 принципа компании","visible":true,"editable":true},"list":{"label":"Принципы","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"eyebrow","size":12}],[{"name":"heading","size":6},{"name":"headingAccent","size":6}],[{"name":"description","size":12}],[{"name":"badge1Text","size":6},{"name":"badge2Text","size":6}],[{"name":"sectionTitle","size":12}],[{"name":"backgroundImage","size":12}],[{"name":"principles","size":12}]]}}	object	\N	\N
56	plugin_content-manager_configuration_components::blocks.principle	{"uid":"blocks.principle","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"title","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"badge":{"edit":{"label":"Метка (напр. «Принцип 1»)","visible":true,"editable":true},"list":{"label":"Метка","searchable":false,"sortable":false}},"title":{"edit":{"label":"Заголовок принципа","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":false}},"paragraph1":{"edit":{"label":"Абзац 1","visible":true,"editable":true},"list":{"label":"Абзац 1","searchable":false,"sortable":false}},"paragraph2":{"edit":{"label":"Абзац 2","visible":true,"editable":true},"list":{"label":"Абзац 2","searchable":false,"sortable":false}}},"layouts":{"list":["id","title"],"edit":[[{"name":"badge","size":4},{"name":"title","size":8}],[{"name":"paragraph1","size":12}],[{"name":"paragraph2","size":12}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
49	plugin_content-manager_configuration_components::blocks.photo-card	{"uid":"blocks.photo-card","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"alt","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"photo":{"edit":{"label":"Фотография","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Фото","searchable":false,"sortable":false}},"alt":{"edit":{"label":"Альт-текст (описание)","description":"Используется для доступности и SEO","placeholder":"","visible":true,"editable":true},"list":{"label":"Альт-текст","searchable":true,"sortable":false}}},"layouts":{"list":["id","alt"],"edit":[[{"name":"photo","size":12}],[{"name":"alt","size":12}]]}}	object	\N	\N
53	plugin_content_manager_configuration_content_types::api::about-page.about-page	{"uid":"api::about-page.about-page","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"heading","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"eyebrow":{"edit":{"label":"Надпись над заголовком","description":"Например: \\"О компании\\"","placeholder":"О компании","visible":true,"editable":true},"list":{"label":"Надпись","searchable":true,"sortable":false}},"heading":{"edit":{"label":"Заголовок (строка 1)","description":"Первая строка крупного заголовка","placeholder":"ИНЖЕНЕРНОЕ БЮРО","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":false}},"headingAccent":{"edit":{"label":"Заголовок (строка 2, акцент)","description":"Вторая строка — выделяется цветом","placeholder":"BASISTHREE","visible":true,"editable":true},"list":{"label":"Акцент","searchable":false,"sortable":false}},"description":{"edit":{"label":"Описание","description":"Текст под заголовком","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":false,"sortable":false}},"badge1Text":{"edit":{"label":"Бейдж 1 (место)","description":"","placeholder":"САНКТ-ПЕТЕРБУРГ","visible":true,"editable":true},"list":{"label":"Бейдж 1","searchable":false,"sortable":false}},"badge2Text":{"edit":{"label":"Бейдж 2 (география)","description":"","placeholder":"РАБОТАЕМ ПО ВСЕЙ РОССИИ","visible":true,"editable":true},"list":{"label":"Бейдж 2","searchable":false,"sortable":false}},"sectionTitle":{"edit":{"label":"Заголовок секции принципов","description":"","placeholder":"«ЦИФРОВОЙ ФУНДАМЕНТ»","visible":true,"editable":true},"list":{"label":"Секция","searchable":false,"sortable":false}},"backgroundImage":{"edit":{"label":"Фоновое изображение секции принципов","visible":true,"editable":true},"list":{"label":"Фон","searchable":false,"sortable":false}},"principles":{"edit":{"label":"Принципы","description":"Добавь 3 принципа компании","visible":true,"editable":true},"list":{"label":"Принципы","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"eyebrow","size":12}],[{"name":"heading","size":6},{"name":"headingAccent","size":6}],[{"name":"description","size":12}],[{"name":"badge1Text","size":6},{"name":"badge2Text","size":6}],[{"name":"sectionTitle","size":12}],[{"name":"backgroundImage","size":12}],[{"name":"principles","size":12}]]}}	object	\N	\N
42	plugin_content_manager_configuration_content_types::api::service-card.service-card	{"uid":"api::service-card.service-card","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"sortOrder","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"title":{"edit":{"label":"Название услуги","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Название","searchable":true,"sortable":true}},"description":{"edit":{"label":"Описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":true,"sortable":false}},"link":{"edit":{"label":"Ссылка","description":"","placeholder":"/services/crm","visible":true,"editable":true},"list":{"label":"Ссылка","searchable":false,"sortable":false}},"linkLabel":{"edit":{"label":"Текст ссылки","description":"","placeholder":"Подробнее","visible":true,"editable":true},"list":{"label":"Текст ссылки","searchable":false,"sortable":false}},"icon":{"edit":{"label":"Иконка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Иконка","searchable":false,"sortable":false}},"isFeatured":{"edit":{"label":"Выделенная карточка (тёмный фон)","description":"Включи для тёмно-бирюзового варианта","visible":true,"editable":true},"list":{"label":"Выделена","searchable":false,"sortable":true}},"sortOrder":{"edit":{"label":"Порядок","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Порядок","searchable":false,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","isFeatured","sortOrder"],"edit":[[{"name":"title","size":8},{"name":"isFeatured","size":4}],[{"name":"description","size":12}],[{"name":"link","size":8},{"name":"linkLabel","size":4}],[{"name":"icon","size":6},{"name":"sortOrder","size":6}]]}}	object	\N	\N
44	plugin_content-manager_configuration_content_types::api::service-card.service-card	{"uid":"api::service-card.service-card","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"sortOrder","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"title":{"edit":{"label":"Название услуги","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Название","searchable":true,"sortable":true}},"description":{"edit":{"label":"Описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Описание","searchable":true,"sortable":false}},"link":{"edit":{"label":"Ссылка","description":"","placeholder":"/services/crm","visible":true,"editable":true},"list":{"label":"Ссылка","searchable":false,"sortable":false}},"linkLabel":{"edit":{"label":"Текст ссылки","description":"","placeholder":"Подробнее","visible":true,"editable":true},"list":{"label":"Текст ссылки","searchable":false,"sortable":false}},"icon":{"edit":{"label":"Иконка","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Иконка","searchable":false,"sortable":false}},"isFeatured":{"edit":{"label":"Выделенная карточка (тёмный фон)","description":"Включи для тёмно-бирюзового варианта","visible":true,"editable":true},"list":{"label":"Выделена","searchable":false,"sortable":true}},"sortOrder":{"edit":{"label":"Порядок","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Порядок","searchable":false,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","isFeatured","sortOrder"],"edit":[[{"name":"title","size":8},{"name":"isFeatured","size":4}],[{"name":"description","size":12}],[{"name":"link","size":8},{"name":"linkLabel","size":4}],[{"name":"icon","size":6},{"name":"sortOrder","size":6}]]}}	object	\N	\N
50	plugin_content-manager_configuration_components::blocks.stat-card	{"uid":"blocks.stat-card","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"value","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"value":{"edit":{"label":"Значение (цифра)","description":"Например: 98% или 5 лет","placeholder":"98%","visible":true,"editable":true},"list":{"label":"Значение","searchable":true,"sortable":false}},"label":{"edit":{"label":"Подпись","description":"Текст под цифрой","placeholder":"клиентов довольны","visible":true,"editable":true},"list":{"label":"Подпись","searchable":true,"sortable":false}},"backgroundImage":{"edit":{"label":"Фоновое изображение","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Фон","searchable":false,"sortable":false}}},"layouts":{"list":["id","value","label"],"edit":[[{"name":"value","size":6},{"name":"label","size":6}],[{"name":"backgroundImage","size":12}]]}}	object	\N	\N
38	plugin_content_manager_configuration_content_types::api::team-section.team-section	{"uid":"api::team-section.team-section","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"heading","defaultSortBy":"heading","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок секции","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"subheading":{"edit":{"label":"Подзаголовок / описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Подзаголовок","searchable":true,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"heading","size":12}],[{"name":"subheading","size":12}]]}}	object	\N	\N
33	plugin_content_manager_configuration_content_types::api::stats-block.stats-block	{"uid":"api::stats-block.stats-block","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"cards":{"edit":{"label":"Карточки","description":"Добавляй фото-карточки и карточки-показатели в нужном порядке","visible":true,"editable":true},"list":{"label":"Карточки","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"cards","size":12}]]}}	object	\N	\N
54	plugin_content-manager_configuration_content_types::api::referral.referral	{"uid":"api::referral.referral","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"company","defaultSortBy":"id","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"inviterUserId":{"edit":{"label":"ID пригласившего пользователя","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ID пригласившего","searchable":true,"sortable":true}},"contactPerson":{"edit":{"label":"Контактное лицо","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Контактное лицо","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"phone":{"edit":{"label":"Телефон","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Телефон","searchable":true,"sortable":false}},"company":{"edit":{"label":"Компания","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Компания","searchable":true,"sortable":true}},"product":{"edit":{"label":"Продукт","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Продукт","searchable":true,"sortable":true}},"status":{"edit":{"label":"Статус","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Статус","searchable":true,"sortable":true}},"payout":{"edit":{"label":"Выплата (₽)","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Выплата","searchable":false,"sortable":true}},"user":{"edit":{"label":"Клиент","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Клиент","searchable":false,"sortable":true}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","inviterUserId","contactPerson","company","product","status","payout"],"edit":[[{"name":"inviterUserId","size":4},{"name":"contactPerson","size":4},{"name":"company","size":4}],[{"name":"email","size":6},{"name":"phone","size":6}],[{"name":"product","size":4},{"name":"status","size":4},{"name":"payout","size":4}],[{"name":"user","size":12}]]}}	object	\N	\N
45	plugin_content_manager_configuration_content_types::api::diag-cta.diag-cta	{"uid":"api::diag-cta.diag-cta","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"heading","defaultSortBy":"heading","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок (акцент в [скобках])","description":"","placeholder":"Диагностика [ВАШИХ] Бизнес-Процессов","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"subheading":{"edit":{"label":"Подзаголовок","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Подзаголовок","searchable":true,"sortable":false}},"buttonLabel":{"edit":{"label":"Текст кнопки","description":"","placeholder":"Начать диагностику","visible":true,"editable":true},"list":{"label":"Кнопка","searchable":false,"sortable":false}},"buttonHref":{"edit":{"label":"Ссылка кнопки","description":"","placeholder":"#contact","visible":true,"editable":true},"list":{"label":"Ссылка","searchable":false,"sortable":false}},"image":{"edit":{"label":"Изображение","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Изображение","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"heading","size":12}],[{"name":"subheading","size":12}],[{"name":"buttonLabel","size":6},{"name":"buttonHref","size":6}],[{"name":"image","size":12}]]}}	object	\N	\N
47	plugin_content_manager_configuration_content_types::api::document.document	{"uid":"api::document.document","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"project":{"edit":{"label":"Проект","visible":true,"editable":true},"list":{"label":"Проект","searchable":true,"sortable":true}},"name":{"edit":{"label":"Наименование документа","visible":true,"editable":true},"list":{"label":"Наименование","searchable":true,"sortable":true}},"docStatus":{"edit":{"label":"Состояние","visible":true,"editable":true},"list":{"label":"Состояние","searchable":false,"sortable":true}},"file":{"edit":{"label":"Файл (PDF)","visible":true,"editable":true},"list":{"label":"Файл","searchable":false,"sortable":false}},"user":{"edit":{"label":"Клиент","visible":true,"editable":true},"list":{"label":"Клиент","searchable":false,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","project","name","docStatus"],"edit":[[{"name":"project","size":6},{"name":"name","size":6}],[{"name":"docStatus","size":4},{"name":"user","size":8}],[{"name":"file","size":12}]]}}	object	\N	\N
52	plugin_content_manager_configuration_components::blocks.principle	{"uid":"blocks.principle","settings":{"bulkable":false,"filterable":false,"searchable":false,"pageSize":10,"mainField":"title","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":false,"sortable":false}},"badge":{"edit":{"label":"Метка (напр. «Принцип 1»)","visible":true,"editable":true},"list":{"label":"Метка","searchable":false,"sortable":false}},"title":{"edit":{"label":"Заголовок принципа","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":false}},"paragraph1":{"edit":{"label":"Абзац 1","visible":true,"editable":true},"list":{"label":"Абзац 1","searchable":false,"sortable":false}},"paragraph2":{"edit":{"label":"Абзац 2","visible":true,"editable":true},"list":{"label":"Абзац 2","searchable":false,"sortable":false}}},"layouts":{"list":["id","title"],"edit":[[{"name":"badge","size":4},{"name":"title","size":8}],[{"name":"paragraph1","size":12}],[{"name":"paragraph2","size":12}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
41	plugin_content_manager_configuration_content_types::api::services-section.services-section	{"uid":"api::services-section.services-section","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"heading","defaultSortBy":"heading","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"ID","searchable":true,"sortable":true}},"heading":{"edit":{"label":"Заголовок секции","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Заголовок","searchable":true,"sortable":true}},"subheading":{"edit":{"label":"Подзаголовок / описание","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Подзаголовок","searchable":true,"sortable":false}},"createdAt":{"edit":{},"list":{"label":"createdAt","searchable":false,"sortable":false}},"updatedAt":{"edit":{},"list":{"label":"updatedAt","searchable":false,"sortable":false}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"createdBy":{"edit":{},"list":{"label":"createdBy","searchable":false,"sortable":false}},"updatedBy":{"edit":{},"list":{"label":"updatedBy","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":false,"sortable":false}}},"layouts":{"list":["id","heading"],"edit":[[{"name":"heading","size":12}],[{"name":"subheading","size":12}]]}}	object	\N	\N
19	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}},"publishedAt":{"edit":{},"list":{"label":"publishedAt","searchable":false,"sortable":false}},"locale":{"edit":{},"list":{"label":"locale","searchable":false,"sortable":false}},"localizations":{"edit":{},"list":{"label":"localizations","searchable":false,"sortable":false}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
20	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"focal_point","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"company","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"first_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"middle_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"about_pages_cmps","indexes":[{"name":"about_pages_field_idx","columns":["field"]},{"name":"about_pages_component_type_idx","columns":["component_type"]},{"name":"about_pages_entity_fk","columns":["entity_id"]},{"name":"about_pages_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"about_pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"about_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"about_pages","indexes":[{"name":"about_pages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"about_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"about_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"about_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"about_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"eyebrow","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"heading","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"heading_accent","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"badge_1_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"badge_2_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"section_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"diag_ctas","indexes":[{"name":"diag_ctas_documents_idx","columns":["document_id","locale","published_at"]},{"name":"diag_ctas_created_by_id_fk","columns":["created_by_id"]},{"name":"diag_ctas_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"diag_ctas_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"diag_ctas_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"heading","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subheading","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"button_label","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"button_href","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"documents","indexes":[{"name":"documents_documents_idx","columns":["document_id","locale","published_at"]},{"name":"documents_created_by_id_fk","columns":["created_by_id"]},{"name":"documents_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"documents_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"documents_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"project","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"doc_status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"hero_blocks","indexes":[{"name":"hero_blocks_documents_idx","columns":["document_id","locale","published_at"]},{"name":"hero_blocks_created_by_id_fk","columns":["created_by_id"]},{"name":"hero_blocks_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"hero_blocks_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"hero_blocks_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"eyebrow","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"heading","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"primary_button_label","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"primary_button_href","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"secondary_button_label","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"secondary_button_href","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"menu_services","indexes":[{"name":"menu_services_documents_idx","columns":["document_id","locale","published_at"]},{"name":"menu_services_created_by_id_fk","columns":["created_by_id"]},{"name":"menu_services_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menu_services_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menu_services_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sort_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"referrals","indexes":[{"name":"referrals_documents_idx","columns":["document_id","locale","published_at"]},{"name":"referrals_created_by_id_fk","columns":["created_by_id"]},{"name":"referrals_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"referrals_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"referrals_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"inviter_user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"contact_person","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"company","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"product","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"payout","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"service_cards","indexes":[{"name":"service_cards_documents_idx","columns":["document_id","locale","published_at"]},{"name":"service_cards_created_by_id_fk","columns":["created_by_id"]},{"name":"service_cards_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"service_cards_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"service_cards_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link_label","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_featured","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sort_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"services_sections","indexes":[{"name":"services_sections_documents_idx","columns":["document_id","locale","published_at"]},{"name":"services_sections_created_by_id_fk","columns":["created_by_id"]},{"name":"services_sections_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"services_sections_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"services_sections_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"heading","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subheading","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"stats_blocks_cmps","indexes":[{"name":"stats_blocks_field_idx","columns":["field"]},{"name":"stats_blocks_component_type_idx","columns":["component_type"]},{"name":"stats_blocks_entity_fk","columns":["entity_id"]},{"name":"stats_blocks_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"stats_blocks_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"stats_blocks","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"stats_blocks","indexes":[{"name":"stats_blocks_documents_idx","columns":["document_id","locale","published_at"]},{"name":"stats_blocks_created_by_id_fk","columns":["created_by_id"]},{"name":"stats_blocks_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"stats_blocks_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"stats_blocks_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"team_members","indexes":[{"name":"team_members_documents_idx","columns":["document_id","locale","published_at"]},{"name":"team_members_created_by_id_fk","columns":["created_by_id"]},{"name":"team_members_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"team_members_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"team_members_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"role","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"contact_handle","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sort_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"team_sections","indexes":[{"name":"team_sections_documents_idx","columns":["document_id","locale","published_at"]},{"name":"team_sections_created_by_id_fk","columns":["created_by_id"]},{"name":"team_sections_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"team_sections_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"team_sections_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"heading","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subheading","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"encrypted_key","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_sessions","indexes":[{"name":"strapi_sessions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"session_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"child_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"device_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"origin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"absolute_expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_blocks_stat_cards","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"value","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"label","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_blocks_principles","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"badge","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"paragraph_1","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"paragraph_2","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_blocks_photo_cards","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"alt","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_ai_metadata_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"completed_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_ai_localization_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"source_locale","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"target_locales","type":"jsonb","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"documents_user_lnk","indexes":[{"name":"documents_user_lnk_fk","columns":["document_id"]},{"name":"documents_user_lnk_ifk","columns":["user_id"]},{"name":"documents_user_lnk_uq","columns":["document_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"documents_user_lnk_fk","columns":["document_id"],"referencedColumns":["id"],"referencedTable":"documents","onDelete":"CASCADE"},{"name":"documents_user_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"referrals_user_lnk","indexes":[{"name":"referrals_user_lnk_fk","columns":["referral_id"]},{"name":"referrals_user_lnk_ifk","columns":["user_id"]},{"name":"referrals_user_lnk_uq","columns":["referral_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"referrals_user_lnk_fk","columns":["referral_id"],"referencedColumns":["id"],"referencedTable":"referrals","onDelete":"CASCADE"},{"name":"referrals_user_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"referral_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2026-04-06 12:03:33.051	df4b1561bed780e468e170cac3cf6c3e8f3b134e7e1bdbe2074ada7f6a38d240
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2026-04-03 18:53:48.358
2	5.0.0-02-created-document-id	2026-04-03 18:53:48.375
3	5.0.0-03-created-locale	2026-04-03 18:53:48.39
4	5.0.0-04-created-published-at	2026-04-03 18:53:48.405
5	5.0.0-05-drop-slug-fields-index	2026-04-03 18:53:48.42
6	5.0.0-06-add-document-id-indexes	2026-04-03 18:53:48.436
7	core::5.0.0-discard-drafts	2026-04-03 18:53:48.451
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_sessions (id, document_id, user_id, session_id, child_id, device_id, origin, expires_at, absolute_expires_at, status, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
17	vwchtejug2wl38o2zcsvuoru	1	1191063fede7a7d762be158664df68f6	\N	dc40f1f6-6edf-427a-ba8b-279089e93e39	admin	2026-04-06 14:24:32.229	2026-05-06 12:24:32.229	active	session	2026-04-06 12:24:32.229	2026-04-06 12:24:32.229	2026-04-06 12:24:32.229	\N	\N	\N
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team_members (id, document_id, name, role, description, sort_order, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, phone, email, contact_handle) FROM stdin;
1	p9vki7sglf84r2kh5z32scex	Дмитрий Дмитриев	Sales & Strategy	10 лет опыта. Рост конверсии в 2 раза.	0	2026-04-03 21:02:31.601	2026-04-03 21:29:29.439	\N	1	1	\N	+7 981 286 39 09	dmitriev@basisthree.ru	@ddvworks
3	p9vki7sglf84r2kh5z32scex	Дмитрий Дмитриев	Sales & Strategy	10 лет опыта. Рост конверсии в 2 раза.	0	2026-04-03 21:02:31.601	2026-04-03 21:29:29.439	2026-04-03 21:29:29.461	1	1	\N	+7 981 286 39 09	dmitriev@basisthree.ru	@ddvworks
4	ltapeqkxkwdqt9qbji553q47	Владимир Назаренко	Tech & Architecture	Сложные системы на C#, высокая нагрузка.	0	2026-04-03 21:35:15.309	2026-04-03 21:35:15.309	\N	1	1	\N	+7 921 286 39 09	nazarenko@basisthree.ru	@vladimir_n
5	ltapeqkxkwdqt9qbji553q47	Владимир Назаренко	Tech & Architecture	Сложные системы на C#, высокая нагрузка.	0	2026-04-03 21:35:15.309	2026-04-03 21:35:15.309	2026-04-03 21:35:15.333	1	1	\N	+7 921 286 39 09	nazarenko@basisthree.ru	@vladimir_n
6	dmus14wuhcjo2jk5dkyjcdni	Владимир Паль	Field & Operations	Внедрение на объектах и дисциплина персонала.	0	2026-04-03 21:35:49.93	2026-04-03 21:35:49.93	\N	1	1	\N	+7 931 286 39 09	pal@basisthree.ru	@vladimir_pal
7	dmus14wuhcjo2jk5dkyjcdni	Владимир Паль	Field & Operations	Внедрение на объектах и дисциплина персонала.	0	2026-04-03 21:35:49.93	2026-04-03 21:35:49.93	2026-04-03 21:35:49.958	1	1	\N	+7 931 286 39 09	pal@basisthree.ru	@vladimir_pal
\.


--
-- Data for Name: team_sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team_sections (id, document_id, heading, subheading, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	rk3dr8819k02brdqbjupn642	Три экспертизы — одна команда	За каждым проектом стоят три направления: стратегия продаж, инженерная архитектура и полевое внедрение. Мы работаем как единый механизм — без разрывов между консалтингом и реализацией.	2026-04-03 21:02:55.622	2026-04-03 21:02:55.622	\N	1	1	\N
2	rk3dr8819k02brdqbjupn642	Три экспертизы — одна команда	За каждым проектом стоят три направления: стратегия продаж, инженерная архитектура и полевое внедрение. Мы работаем как единый механизм — без разрывов между консалтингом и реализацией.	2026-04-03 21:02:55.622	2026-04-03 21:02:55.622	2026-04-03 21:02:55.639	1	1	\N
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	xvz2unty81avztwten1d4rk8	plugin::users-permissions.auth.logout	2026-04-03 18:53:48.962	2026-04-03 18:53:48.962	2026-04-03 18:53:48.962	\N	\N	\N
2	qz0d75hl934xomwzcm4l6mw8	plugin::users-permissions.user.me	2026-04-03 18:53:48.962	2026-04-03 18:53:48.962	2026-04-03 18:53:48.963	\N	\N	\N
3	w5himi489tdov6zhrwjgc8bf	plugin::users-permissions.auth.changePassword	2026-04-03 18:53:48.962	2026-04-03 18:53:48.962	2026-04-03 18:53:48.963	\N	\N	\N
4	j8imymfl3ac7n1nm7syul0kz	plugin::users-permissions.auth.callback	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
5	pewo4rv05b6cyfxz3tqzuxe1	plugin::users-permissions.auth.connect	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
6	q9p6iavnmopl8w6rwsy7v6al	plugin::users-permissions.auth.forgotPassword	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
7	req8lo9qs8ig9tb5spr6u0z5	plugin::users-permissions.auth.sendEmailConfirmation	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
8	lzkbl2uzhq5c12ywgl9mcpjl	plugin::users-permissions.auth.register	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
10	defij9ym4uw1fbe2zjqicr0m	plugin::users-permissions.auth.refresh	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
11	qkmw06x9ab7gkiwgmxasxkmk	plugin::users-permissions.auth.resetPassword	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
9	qhgsc3vbkywkx1xragtpzyg3	plugin::users-permissions.auth.emailConfirmation	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	2026-04-03 18:53:48.969	\N	\N	\N
12	kgscfk1vwmashdc0s7g51e9n	api::hero-block.hero-block.find	2026-04-03 21:50:19.996	2026-04-03 21:50:19.996	2026-04-03 21:50:19.996	\N	\N	\N
13	byhdo5ui08rbtwv7unndb0y6	api::menu-service.menu-service.find	2026-04-03 21:50:20	2026-04-03 21:50:20	2026-04-03 21:50:20	\N	\N	\N
14	vrj2xfau977p189abxtry3nf	api::menu-service.menu-service.findOne	2026-04-03 21:50:20.002	2026-04-03 21:50:20.002	2026-04-03 21:50:20.002	\N	\N	\N
15	i7qjek1wgzxqp44rds8wrhe7	api::stats-block.stats-block.find	2026-04-03 21:50:20.004	2026-04-03 21:50:20.004	2026-04-03 21:50:20.004	\N	\N	\N
16	w6bz9iqsde5esoow7hykzple	api::team-member.team-member.find	2026-04-03 21:50:20.005	2026-04-03 21:50:20.005	2026-04-03 21:50:20.006	\N	\N	\N
17	wz5m0twapghoutx50pleyfmx	api::team-member.team-member.findOne	2026-04-03 21:50:20.007	2026-04-03 21:50:20.007	2026-04-03 21:50:20.007	\N	\N	\N
18	bwn0w4i4jy98es7hxb3jbz8w	api::team-section.team-section.find	2026-04-03 21:50:20.009	2026-04-03 21:50:20.009	2026-04-03 21:50:20.009	\N	\N	\N
19	zx428oig126bq4fiqrvj6h3h	api::services-section.services-section.find	2026-04-03 21:50:20.01	2026-04-03 21:50:20.01	2026-04-03 21:50:20.011	\N	\N	\N
20	s4552t0ldp9jm3z0v30utacj	api::service-card.service-card.find	2026-04-03 21:50:20.012	2026-04-03 21:50:20.012	2026-04-03 21:50:20.012	\N	\N	\N
21	g24tb6o9cdv8tnbjopvywjpb	api::service-card.service-card.findOne	2026-04-03 21:50:20.014	2026-04-03 21:50:20.014	2026-04-03 21:50:20.014	\N	\N	\N
22	e50q7yrns11xl9cgjpbjtdrb	api::diag-cta.diag-cta.find	2026-04-04 08:07:22.451	2026-04-04 08:07:22.451	2026-04-04 08:07:22.452	\N	\N	\N
25	oi49z9r0m00jedflbey0aapd	plugin::users-permissions.user.update	2026-04-04 11:09:07.009	2026-04-04 11:09:07.009	2026-04-04 11:09:07.009	\N	\N	\N
32	x40c8a250gagpkxma12y5pro	api::document.document.find	2026-04-04 11:12:58.471	2026-04-04 11:12:58.471	2026-04-04 11:12:58.471	\N	\N	\N
33	ek5rt11qblpkagi8wycarf5m	api::document.document.findOne	2026-04-04 11:12:58.473	2026-04-04 11:12:58.473	2026-04-04 11:12:58.473	\N	\N	\N
51	a20c6jdb33bsmsgel8ub462g	api::referral.referral.find	2026-04-04 12:04:48.681	2026-04-04 12:04:48.681	2026-04-04 12:04:48.681	\N	\N	\N
52	ankhs46zpgb2x1zkj4ddjmie	api::referral.referral.findOne	2026-04-04 12:04:48.683	2026-04-04 12:04:48.683	2026-04-04 12:04:48.683	\N	\N	\N
53	9ff76a14c45bd0b5d6cf37ae	api::referral.referral.create	2026-04-04 09:37:34.799879	2026-04-04 09:37:34.799879	2026-04-04 09:37:34.799879	\N	\N	\N
64	lfjn5lij2sfz1pfzs3tjiju1	api::about-page.about-page.find	2026-04-04 13:06:01.68	2026-04-04 13:06:01.68	2026-04-04 13:06:01.68	\N	\N	\N
111	oj7tkfhxw1xwvezck7xijnok	plugin::users-permissions.user.updateMe	2026-04-06 12:30:08.922	2026-04-06 12:30:08.922	2026-04-06 12:30:08.922	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	2	1	1
6	5	2	1
2	1	1	1
4	6	2	1
3	3	1	1
5	4	2	1
7	7	2	2
8	10	2	1
9	8	2	2
11	9	2	2
10	11	2	2
12	12	2	3
13	13	2	4
14	14	2	5
15	15	2	6
16	16	2	7
17	17	2	8
18	18	2	9
19	19	2	10
20	20	2	11
21	21	2	12
22	22	2	13
25	25	1	3
32	32	1	5
33	33	1	6
51	51	1	8
52	52	1	9
53	53	1	10
64	64	2	14
111	111	1	11
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	c8we4xangy5g9zh3u2d4iwes	Authenticated	Default role given to authenticated user.	authenticated	2026-04-03 18:53:48.954	2026-04-03 18:53:48.954	2026-04-03 18:53:48.955	\N	\N	\N
2	d0ofitrtboxcegh19n7nne0f	Public	Default role given to unauthenticated user.	public	2026-04-03 18:53:48.957	2026-04-03 18:53:48.957	2026-04-03 18:53:48.957	\N	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, phone, company, first_name, last_name, middle_name) FROM stdin;
2	q1tuvd22j50yy9y6jijqig1r	Denis	test1@admin.com	local	$2a$10$ndC4gJN1pFlDVSCNuXgBbOQVsCPsR5qSLN8KucwrTXvmOE77ivvz2	\N	\N	t	f	2026-04-04 08:56:53.872	2026-04-04 08:56:53.872	2026-04-04 08:56:53.872	\N	\N	\N	\N	\N	\N	\N	\N
3	bgtlwg8c38czze30gv0nzngv	test2	test2@mail.com	local	$2a$10$UkDBcTAuglpEXENfiThQTew3RCwnMpWgG0ARpm.QscFlUhQk8f7E6	\N	\N	t	f	2026-04-04 09:04:54.586	2026-04-04 11:11:09.409	2026-04-04 09:04:54.587	\N	\N	\N	1231312	test22	test2	dsadaas12	21dsada
1	rw83tmasaaa98pm1ipj8ict0	test	test@test.com	local	$2a$10$ZUuFIq7g.3svx7y9adRK4uSlgCA.bHDc8dyu31t4WvKWWvV2OZeky	\N	\N	t	f	2026-04-04 08:54:33.273	2026-04-04 11:11:50.777	2026-04-04 08:54:33.273	\N	\N	\N	+7 999 000 00 00	ООО Тест	Иван	Иванов	Иванович
4	dxcy5265djlnyf0nwltabm1v	daasdda@mail.com	daasdda@mail.com	local	$2a$10$KiXPCa0eo9iZ/.aHBfdCfu1DhALsG8HZPC2XPpbSaRVzuYoNkb0Hm	\N	\N	t	f	2026-04-04 12:32:36.265	2026-04-04 12:32:36.305	2026-04-04 12:32:36.265	\N	\N	\N	32131321	daasdda@mail.com	\N	\N	\N
5	j63b9wb8a4lf1zzyh3mhm3pm	dsadsaads@mail.com	dsadsaads@mail.com	local	$2a$10$7w8RUD3qXYL2tjF2nT5G.O1buKYzPnudSS8IaOmfLgWSS1fLTK/jO	\N	\N	t	f	2026-04-04 12:34:21.121	2026-04-04 12:34:21.141	2026-04-04 12:34:21.121	\N	\N	\N	321312132	dsadsaads@mail.com	\N	\N	\N
6	ocbbal3m1okoovs79f1iu4p1	dsadsaas@mail.com	dsadsaas@mail.com	local	$2a$10$Oay.Yf8ORi/Z6DMgp2sn9Oi5DxGTj88gGMmP/wrRi0YECJzlSNMiq	\N	\N	t	f	2026-04-04 12:39:38.897	2026-04-04 12:39:38.951	2026-04-04 12:39:38.897	\N	\N	\N	123231	dsadsaas@mail.com	\N	\N	\N
7	ad2r53giowm78uyrgypg9um1	ref-test-1775295619	ref-test-1775295619@example.com	local	$2a$10$Czl/MK4AJ.tn6qjW93R.N.nNDqe5wZb2FpCMSaIl5ZCBluI3hZEo2	\N	\N	t	f	2026-04-04 12:40:19.563	2026-04-04 12:40:19.563	2026-04-04 12:40:19.563	\N	\N	\N	\N	\N	\N	\N	\N
8	qxh6m87i6dn83gp6lw6fi569	dsadsadas@mail.com	dsadsadas@mail.com	local	$2a$10$dupOIoT8u8AUKdaSgf0xaelyN0qlGevTQ.vKB6Q.rpxEJCCvNxB0W	\N	\N	t	f	2026-04-04 12:42:16.79	2026-04-04 12:42:16.824	2026-04-04 12:42:16.79	\N	\N	\N	123321321	dsadsadas@mail.com	\N	\N	\N
9	stl300uki7cfuzt7xuczs7pr	ref-test2-1775295759	ref-test2-1775295759@example.com	local	$2a$10$J8Ff/KACKbW/OPyUIJJJCemHlTCWCHvZ1/ElaZDQEk33Zv34KGMOi	\N	\N	t	f	2026-04-04 12:42:39.626	2026-04-04 12:42:39.626	2026-04-04 12:42:39.626	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
1	1	1	1
2	2	1	2
3	3	1	3
4	4	1	4
5	5	1	5
6	6	1	6
7	7	1	7
8	8	1	8
9	9	1	9
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- Name: about_pages_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.about_pages_cmps_id_seq', 1, false);


--
-- Name: about_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.about_pages_id_seq', 33, true);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 185, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 185, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 1, true);


--
-- Name: components_blocks_photo_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.components_blocks_photo_cards_id_seq', 6, true);


--
-- Name: components_blocks_principles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.components_blocks_principles_id_seq', 1, false);


--
-- Name: components_blocks_stat_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.components_blocks_stat_cards_id_seq', 10, true);


--
-- Name: diag_ctas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.diag_ctas_id_seq', 2, true);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.documents_id_seq', 1, true);


--
-- Name: documents_user_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.documents_user_lnk_id_seq', 4, true);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_id_seq', 48, true);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 99, true);


--
-- Name: hero_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hero_blocks_id_seq', 11, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: menu_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.menu_services_id_seq', 14, true);


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.referrals_id_seq', 2, true);


--
-- Name: referrals_user_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.referrals_user_lnk_id_seq', 1, false);


--
-- Name: service_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.service_cards_id_seq', 20, true);


--
-- Name: services_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_sections_id_seq', 3, true);


--
-- Name: stats_blocks_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_blocks_cmps_id_seq', 24, true);


--
-- Name: stats_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stats_blocks_id_seq', 6, true);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_ai_localization_jobs_id_seq', 1, false);


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_ai_metadata_jobs_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 56, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 52, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 7, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_sessions_id_seq', 17, true);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.team_members_id_seq', 7, true);


--
-- Name: team_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.team_sections_id_seq', 2, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 111, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 111, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_users_id_seq', 9, true);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 9, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: about_pages_cmps about_pages_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages_cmps
    ADD CONSTRAINT about_pages_cmps_pkey PRIMARY KEY (id);


--
-- Name: about_pages about_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages
    ADD CONSTRAINT about_pages_pkey PRIMARY KEY (id);


--
-- Name: about_pages_cmps about_pages_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages_cmps
    ADD CONSTRAINT about_pages_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: components_blocks_photo_cards components_blocks_photo_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components_blocks_photo_cards
    ADD CONSTRAINT components_blocks_photo_cards_pkey PRIMARY KEY (id);


--
-- Name: components_blocks_principles components_blocks_principles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components_blocks_principles
    ADD CONSTRAINT components_blocks_principles_pkey PRIMARY KEY (id);


--
-- Name: components_blocks_stat_cards components_blocks_stat_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components_blocks_stat_cards
    ADD CONSTRAINT components_blocks_stat_cards_pkey PRIMARY KEY (id);


--
-- Name: diag_ctas diag_ctas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diag_ctas
    ADD CONSTRAINT diag_ctas_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: documents_user_lnk documents_user_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_user_lnk
    ADD CONSTRAINT documents_user_lnk_pkey PRIMARY KEY (id);


--
-- Name: documents_user_lnk documents_user_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_user_lnk
    ADD CONSTRAINT documents_user_lnk_uq UNIQUE (document_id, user_id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: hero_blocks hero_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_blocks
    ADD CONSTRAINT hero_blocks_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: menu_services menu_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_services
    ADD CONSTRAINT menu_services_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: referrals_user_lnk referrals_user_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals_user_lnk
    ADD CONSTRAINT referrals_user_lnk_pkey PRIMARY KEY (id);


--
-- Name: referrals_user_lnk referrals_user_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals_user_lnk
    ADD CONSTRAINT referrals_user_lnk_uq UNIQUE (referral_id, user_id);


--
-- Name: service_cards service_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_cards
    ADD CONSTRAINT service_cards_pkey PRIMARY KEY (id);


--
-- Name: services_sections services_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_sections
    ADD CONSTRAINT services_sections_pkey PRIMARY KEY (id);


--
-- Name: stats_blocks_cmps stats_blocks_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks_cmps
    ADD CONSTRAINT stats_blocks_cmps_pkey PRIMARY KEY (id);


--
-- Name: stats_blocks stats_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks
    ADD CONSTRAINT stats_blocks_pkey PRIMARY KEY (id);


--
-- Name: stats_blocks_cmps stats_blocks_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks_cmps
    ADD CONSTRAINT stats_blocks_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: strapi_ai_localization_jobs strapi_ai_localization_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs
    ADD CONSTRAINT strapi_ai_localization_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_metadata_jobs strapi_ai_metadata_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs
    ADD CONSTRAINT strapi_ai_metadata_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_sessions strapi_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (id);


--
-- Name: team_sections team_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_sections
    ADD CONSTRAINT team_sections_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: about_pages_component_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX about_pages_component_type_idx ON public.about_pages_cmps USING btree (component_type);


--
-- Name: about_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX about_pages_created_by_id_fk ON public.about_pages USING btree (created_by_id);


--
-- Name: about_pages_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX about_pages_documents_idx ON public.about_pages USING btree (document_id, locale, published_at);


--
-- Name: about_pages_entity_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX about_pages_entity_fk ON public.about_pages_cmps USING btree (entity_id);


--
-- Name: about_pages_field_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX about_pages_field_idx ON public.about_pages_cmps USING btree (field);


--
-- Name: about_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX about_pages_updated_by_id_fk ON public.about_pages USING btree (updated_by_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: diag_ctas_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX diag_ctas_created_by_id_fk ON public.diag_ctas USING btree (created_by_id);


--
-- Name: diag_ctas_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX diag_ctas_documents_idx ON public.diag_ctas USING btree (document_id, locale, published_at);


--
-- Name: diag_ctas_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX diag_ctas_updated_by_id_fk ON public.diag_ctas USING btree (updated_by_id);


--
-- Name: documents_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_created_by_id_fk ON public.documents USING btree (created_by_id);


--
-- Name: documents_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_documents_idx ON public.documents USING btree (document_id, locale, published_at);


--
-- Name: documents_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_updated_by_id_fk ON public.documents USING btree (updated_by_id);


--
-- Name: documents_user_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_user_lnk_fk ON public.documents_user_lnk USING btree (document_id);


--
-- Name: documents_user_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_user_lnk_ifk ON public.documents_user_lnk USING btree (user_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: hero_blocks_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX hero_blocks_created_by_id_fk ON public.hero_blocks USING btree (created_by_id);


--
-- Name: hero_blocks_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX hero_blocks_documents_idx ON public.hero_blocks USING btree (document_id, locale, published_at);


--
-- Name: hero_blocks_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX hero_blocks_updated_by_id_fk ON public.hero_blocks USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: menu_services_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_services_created_by_id_fk ON public.menu_services USING btree (created_by_id);


--
-- Name: menu_services_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_services_documents_idx ON public.menu_services USING btree (document_id, locale, published_at);


--
-- Name: menu_services_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_services_updated_by_id_fk ON public.menu_services USING btree (updated_by_id);


--
-- Name: referrals_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX referrals_created_by_id_fk ON public.referrals USING btree (created_by_id);


--
-- Name: referrals_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX referrals_documents_idx ON public.referrals USING btree (document_id, locale, published_at);


--
-- Name: referrals_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX referrals_updated_by_id_fk ON public.referrals USING btree (updated_by_id);


--
-- Name: referrals_user_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX referrals_user_lnk_fk ON public.referrals_user_lnk USING btree (referral_id);


--
-- Name: referrals_user_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX referrals_user_lnk_ifk ON public.referrals_user_lnk USING btree (user_id);


--
-- Name: service_cards_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_cards_created_by_id_fk ON public.service_cards USING btree (created_by_id);


--
-- Name: service_cards_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_cards_documents_idx ON public.service_cards USING btree (document_id, locale, published_at);


--
-- Name: service_cards_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_cards_updated_by_id_fk ON public.service_cards USING btree (updated_by_id);


--
-- Name: services_sections_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_sections_created_by_id_fk ON public.services_sections USING btree (created_by_id);


--
-- Name: services_sections_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_sections_documents_idx ON public.services_sections USING btree (document_id, locale, published_at);


--
-- Name: services_sections_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_sections_updated_by_id_fk ON public.services_sections USING btree (updated_by_id);


--
-- Name: stats_blocks_component_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stats_blocks_component_type_idx ON public.stats_blocks_cmps USING btree (component_type);


--
-- Name: stats_blocks_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stats_blocks_created_by_id_fk ON public.stats_blocks USING btree (created_by_id);


--
-- Name: stats_blocks_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stats_blocks_documents_idx ON public.stats_blocks USING btree (document_id, locale, published_at);


--
-- Name: stats_blocks_entity_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stats_blocks_entity_fk ON public.stats_blocks_cmps USING btree (entity_id);


--
-- Name: stats_blocks_field_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stats_blocks_field_idx ON public.stats_blocks_cmps USING btree (field);


--
-- Name: stats_blocks_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stats_blocks_updated_by_id_fk ON public.stats_blocks USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_sessions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_created_by_id_fk ON public.strapi_sessions USING btree (created_by_id);


--
-- Name: strapi_sessions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_documents_idx ON public.strapi_sessions USING btree (document_id, locale, published_at);


--
-- Name: strapi_sessions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_updated_by_id_fk ON public.strapi_sessions USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: team_members_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_members_created_by_id_fk ON public.team_members USING btree (created_by_id);


--
-- Name: team_members_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_members_documents_idx ON public.team_members USING btree (document_id, locale, published_at);


--
-- Name: team_members_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_members_updated_by_id_fk ON public.team_members USING btree (updated_by_id);


--
-- Name: team_sections_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_sections_created_by_id_fk ON public.team_sections USING btree (created_by_id);


--
-- Name: team_sections_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_sections_documents_idx ON public.team_sections USING btree (document_id, locale, published_at);


--
-- Name: team_sections_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_sections_updated_by_id_fk ON public.team_sections USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: about_pages about_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages
    ADD CONSTRAINT about_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: about_pages_cmps about_pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages_cmps
    ADD CONSTRAINT about_pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.about_pages(id) ON DELETE CASCADE;


--
-- Name: about_pages about_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.about_pages
    ADD CONSTRAINT about_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: diag_ctas diag_ctas_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diag_ctas
    ADD CONSTRAINT diag_ctas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: diag_ctas diag_ctas_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diag_ctas
    ADD CONSTRAINT diag_ctas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: documents documents_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: documents documents_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: documents_user_lnk documents_user_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_user_lnk
    ADD CONSTRAINT documents_user_lnk_fk FOREIGN KEY (document_id) REFERENCES public.documents(id) ON DELETE CASCADE;


--
-- Name: documents_user_lnk documents_user_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_user_lnk
    ADD CONSTRAINT documents_user_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: hero_blocks hero_blocks_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_blocks
    ADD CONSTRAINT hero_blocks_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: hero_blocks hero_blocks_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hero_blocks
    ADD CONSTRAINT hero_blocks_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menu_services menu_services_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_services
    ADD CONSTRAINT menu_services_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menu_services menu_services_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_services
    ADD CONSTRAINT menu_services_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: referrals referrals_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: referrals referrals_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: referrals_user_lnk referrals_user_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals_user_lnk
    ADD CONSTRAINT referrals_user_lnk_fk FOREIGN KEY (referral_id) REFERENCES public.referrals(id) ON DELETE CASCADE;


--
-- Name: referrals_user_lnk referrals_user_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals_user_lnk
    ADD CONSTRAINT referrals_user_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: service_cards service_cards_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_cards
    ADD CONSTRAINT service_cards_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: service_cards service_cards_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_cards
    ADD CONSTRAINT service_cards_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: services_sections services_sections_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_sections
    ADD CONSTRAINT services_sections_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: services_sections services_sections_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_sections
    ADD CONSTRAINT services_sections_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: stats_blocks stats_blocks_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks
    ADD CONSTRAINT stats_blocks_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: stats_blocks_cmps stats_blocks_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks_cmps
    ADD CONSTRAINT stats_blocks_entity_fk FOREIGN KEY (entity_id) REFERENCES public.stats_blocks(id) ON DELETE CASCADE;


--
-- Name: stats_blocks stats_blocks_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats_blocks
    ADD CONSTRAINT stats_blocks_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: team_members team_members_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: team_members team_members_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: team_sections team_sections_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_sections
    ADD CONSTRAINT team_sections_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: team_sections team_sections_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_sections
    ADD CONSTRAINT team_sections_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict ozghG3ez4cWD6Fo2JcvXlSaHFdqkseNmj1p87gCXrcrEVg09ZoKQrfUepZ0ERZR

