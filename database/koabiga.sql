PGDMP                      }            koabiga    17.5    17.5 ∙    ¡           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            «           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            »           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            ░           1262    16847    koabiga    DATABASE     é   CREATE DATABASE koabiga WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE koabiga;
                     root    false                        3079    17170    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                        false            ▒           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                             false    2            ⌠            1259    31236 
   activity_logs    TABLE     S  CREATE TABLE public.activity_logs (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    action character varying(255) NOT NULL,
    description text NOT NULL,
    ip_address character varying(255),
    user_agent text,
    metadata json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE public.activity_logs;
       public         heap r       root    false            ≤            1259    31235    activity_logs_id_seq    SEQUENCE     }   CREATE SEQUENCE public.activity_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.activity_logs_id_seq;
       public               root    false    244            ▓           0    0    activity_logs_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.activity_logs_id_seq OWNED BY public.activity_logs.id;
          public               root    false    243            α            1259    31090    cache    TABLE     ü   CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache;
       public         heap r       root    false            ß            1259    31097    cache_locks    TABLE     Ö   CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache_locks;
       public         heap r       root    false            ≥            1259    31212    crops    TABLE       CREATE TABLE public.crops (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    crop_name character varying(255),
    type character varying(255) NOT NULL,
    crop_type character varying(255),
    variety character varying(255),
    planting_date date,
    expected_harvest_date date,
    area_planted numeric(8,2),
    seed_quantity numeric(8,2),
    land_id bigint,
    unit_id bigint,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.crops;
       public         heap r       root    false            ±            1259    31211    crops_id_seq    SEQUENCE     u   CREATE SEQUENCE public.crops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.crops_id_seq;
       public               root    false    242            │           0    0    crops_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.crops_id_seq OWNED BY public.crops.id;
          public               root    false    241            ⁿ            1259    31371 
   error_logs    TABLE     «  CREATE TABLE public.error_logs (
    id bigint NOT NULL,
    user_id bigint,
    level character varying(255) DEFAULT 'error'::character varying NOT NULL,
    message text NOT NULL,
    stack_trace text,
    file character varying(255),
    line integer,
    context json,
    resolved boolean DEFAULT false NOT NULL,
    resolved_at timestamp(0) without time zone,
    resolved_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT error_logs_level_check CHECK (((level)::text = ANY ((ARRAY['error'::character varying, 'warning'::character varying, 'info'::character varying, 'debug'::character varying])::text[])))
);
    DROP TABLE public.error_logs;
       public         heap r       root    false            √            1259    31370    error_logs_id_seq    SEQUENCE     z   CREATE SEQUENCE public.error_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.error_logs_id_seq;
       public               root    false    252            ┤           0    0    error_logs_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.error_logs_id_seq OWNED BY public.error_logs.id;
          public               root    false    251            µ            1259    31122    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap r       root    false            σ            1259    31121    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public               root    false    230            ╡           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public               root    false    229            ·            1259    31341    fee_applications    TABLE     Ä  CREATE TABLE public.fee_applications (
    id bigint NOT NULL,
    fee_rule_id bigint NOT NULL,
    user_id bigint NOT NULL,
    unit_id bigint,
    amount numeric(10,2) NOT NULL,
    due_date date NOT NULL,
    paid_date date,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    notes text,
    metadata json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT fee_applications_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'overdue'::character varying, 'cancelled'::character varying])::text[])))
);
 $   DROP TABLE public.fee_applications;
       public         heap r       root    false            ∙            1259    31340    fee_applications_id_seq    SEQUENCE     Ç   CREATE SEQUENCE public.fee_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.fee_applications_id_seq;
       public               root    false    250            ╢           0    0    fee_applications_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.fee_applications_id_seq OWNED BY public.fee_applications.id;
          public               root    false    249                       1259    31480    fee_rule_unit_assignments    TABLE     4  CREATE TABLE public.fee_rule_unit_assignments (
    id bigint NOT NULL,
    fee_rule_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    custom_amount numeric(10,2),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 -   DROP TABLE public.fee_rule_unit_assignments;
       public         heap r       root    false                       1259    31479     fee_rule_unit_assignments_id_seq    SEQUENCE     ë   CREATE SEQUENCE public.fee_rule_unit_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.fee_rule_unit_assignments_id_seq;
       public               root    false    260            ╖           0    0     fee_rule_unit_assignments_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.fee_rule_unit_assignments_id_seq OWNED BY public.fee_rule_unit_assignments.id;
          public               root    false    259            Φ            1259    31134 	   fee_rules    TABLE     ▒  CREATE TABLE public.fee_rules (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    amount numeric(10,2) NOT NULL,
    frequency character varying(255) NOT NULL,
    unit character varying(255) NOT NULL,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    applicable_to character varying(255) NOT NULL,
    description text NOT NULL,
    effective_date date NOT NULL,
    created_by character varying(255),
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.fee_rules;
       public         heap r       root    false            τ            1259    31133    fee_rules_id_seq    SEQUENCE     y   CREATE SEQUENCE public.fee_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.fee_rules_id_seq;
       public               root    false    232            ╕           0    0    fee_rules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.fee_rules_id_seq OWNED BY public.fee_rules.id;
          public               root    false    231                       1259    31451    form_submissions    TABLE     ë  CREATE TABLE public.form_submissions (
    id bigint NOT NULL,
    form_id bigint NOT NULL,
    user_id bigint NOT NULL,
    data json NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    submitted_at timestamp(0) without time zone,
    reviewed_at timestamp(0) without time zone,
    reviewed_by bigint,
    comments text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT form_submissions_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'approved'::character varying, 'rejected'::character varying])::text[])))
);
 $   DROP TABLE public.form_submissions;
       public         heap r       root    false                       1259    31450    form_submissions_id_seq    SEQUENCE     Ç   CREATE SEQUENCE public.form_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.form_submissions_id_seq;
       public               root    false    258            ╣           0    0    form_submissions_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.form_submissions_id_seq OWNED BY public.form_submissions.id;
          public               root    false    257            Ω            1259    31148    forms    TABLE     ^  CREATE TABLE public.forms (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    type character varying(255) DEFAULT 'request'::character varying NOT NULL,
    category character varying(255) DEFAULT 'other'::character varying NOT NULL,
    description text,
    fields json,
    target_roles json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    target_units json,
    unit_id bigint,
    user_id bigint,
    assigned_to bigint,
    due_date date,
    submitted_at timestamp(0) without time zone,
    CONSTRAINT forms_status_check CHECK (((status)::text = ANY ((ARRAY['draft'::character varying, 'active'::character varying, 'inactive'::character varying])::text[])))
);
    DROP TABLE public.forms;
       public         heap r       root    false            Θ            1259    31147    forms_id_seq    SEQUENCE     u   CREATE SEQUENCE public.forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.forms_id_seq;
       public               root    false    234            ║           0    0    forms_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.forms_id_seq OWNED BY public.forms.id;
          public               root    false    233            Σ            1259    31114    job_batches    TABLE     d  CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
    DROP TABLE public.job_batches;
       public         heap r       root    false            π            1259    31105    jobs    TABLE     °   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap r       root    false            Γ            1259    31104    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public               root    false    227            ╗           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public               root    false    226            ≡            1259    31193    lands    TABLE     g  CREATE TABLE public.lands (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    area numeric(8,2),
    location character varying(255),
    soil_type character varying(255),
    user_id bigint NOT NULL,
    unit_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.lands;
       public         heap r       root    false            ∩            1259    31192    lands_id_seq    SEQUENCE     u   CREATE SEQUENCE public.lands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.lands_id_seq;
       public               root    false    240            ╝           0    0    lands_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.lands_id_seq OWNED BY public.lands.id;
          public               root    false    239            ÷            1259    31252    login_sessions    TABLE     ∞  CREATE TABLE public.login_sessions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    session_id character varying(255) NOT NULL,
    ip_address character varying(255),
    user_agent text,
    is_active boolean DEFAULT true NOT NULL,
    login_at timestamp(0) without time zone NOT NULL,
    logout_at timestamp(0) without time zone,
    last_activity_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 "   DROP TABLE public.login_sessions;
       public         heap r       root    false            ⌡            1259    31251    login_sessions_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.login_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.login_sessions_id_seq;
       public               root    false    246            ╜           0    0    login_sessions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.login_sessions_id_seq OWNED BY public.login_sessions.id;
          public               root    false    245                        1259    31426    member_fees    TABLE     ≤  CREATE TABLE public.member_fees (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    fee_rule_id bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    paid_amount numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    payment_date timestamp(0) without time zone,
    payment_method character varying(255),
    reference_number character varying(255),
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    notes text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT member_fees_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'partial'::character varying, 'cancelled'::character varying])::text[])))
);
    DROP TABLE public.member_fees;
       public         heap r       root    false                         1259    31425    member_fees_id_seq    SEQUENCE     {   CREATE SEQUENCE public.member_fees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.member_fees_id_seq;
       public               root    false    256            ╛           0    0    member_fees_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.member_fees_id_seq OWNED BY public.member_fees.id;
          public               root    false    255            █            1259    31057 
   migrations    TABLE     ç   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap r       root    false            ┌            1259    31056    migrations_id_seq    SEQUENCE     ë   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public               root    false    219            ┐           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public               root    false    218            ■            1259    31396    pages    TABLE     ─  CREATE TABLE public.pages (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'member'::character varying NOT NULL,
    description text,
    features json,
    permissions json,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    icon character varying(50),
    sort_order integer DEFAULT 0 NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    created_by bigint,
    updated_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pages_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'unit_leader'::character varying, 'member'::character varying])::text[]))),
    CONSTRAINT pages_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'draft'::character varying, 'inactive'::character varying])::text[])))
);
    DROP TABLE public.pages;
       public         heap r       root    false            ²            1259    31395    pages_id_seq    SEQUENCE     u   CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pages_id_seq;
       public               root    false    254            └           0    0    pages_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;
          public               root    false    253            ▐            1259    31074    password_reset_tokens    TABLE     │   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap r       root    false                       1259    39705    produces    TABLE     ¼  CREATE TABLE public.produces (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    quantity numeric(10,2),
    unit character varying(50),
    harvest_date date,
    quality_grade character varying(50),
    crop_id bigint,
    land_id bigint,
    unit_id bigint,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.produces;
       public         heap r       root    false                       1259    39704    produces_id_seq    SEQUENCE     x   CREATE SEQUENCE public.produces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produces_id_seq;
       public               root    false    262            ┴           0    0    produces_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produces_id_seq OWNED BY public.produces.id;
          public               root    false    261            °            1259    31292    reports    TABLE       CREATE TABLE public.reports (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    type character varying(255) DEFAULT 'activity'::character varying NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    submitted_at timestamp(0) without time zone,
    approved_at timestamp(0) without time zone,
    approved_by bigint,
    unit_id bigint,
    user_id bigint NOT NULL,
    metadata json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT reports_status_check CHECK (((status)::text = ANY ((ARRAY['draft'::character varying, 'pending'::character varying, 'approved'::character varying, 'rejected'::character varying])::text[]))),
    CONSTRAINT reports_type_check CHECK (((type)::text = ANY ((ARRAY['crop'::character varying, 'land'::character varying, 'produce'::character varying, 'financial'::character varying, 'activity'::character varying, 'other'::character varying])::text[])))
);
    DROP TABLE public.reports;
       public         heap r       root    false            ≈            1259    31291    reports_id_seq    SEQUENCE     w   CREATE SEQUENCE public.reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reports_id_seq;
       public               root    false    248            ┬           0    0    reports_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;
          public               root    false    247            ▀            1259    31081    sessions    TABLE     ╫   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap r       root    false            ∞            1259    31159    units    TABLE       CREATE TABLE public.units (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    zone_id bigint,
    leader_id bigint,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT units_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);
    DROP TABLE public.units;
       public         heap r       root    false            δ            1259    31158    units_id_seq    SEQUENCE     u   CREATE SEQUENCE public.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.units_id_seq;
       public               root    false    236            ├           0    0    units_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;
          public               root    false    235            ▌            1259    31064    users    TABLE     π  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    christian_name character varying(255),
    family_name character varying(255),
    phone character varying(10),
    id_passport character varying(255),
    role character varying(255) DEFAULT 'member'::character varying NOT NULL,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    pin character varying(255),
    unit_id bigint,
    zone_id bigint,
    last_login_at timestamp(0) without time zone,
    last_activity_at timestamp(0) without time zone,
    bio text,
    avatar character varying(255),
    national_id character varying(25),
    gender character varying(255),
    secondary_phone character varying(10),
    CONSTRAINT chk_phone_format CHECK (((phone)::text ~ '^07[0-9]{8}$'::text)),
    CONSTRAINT chk_secondary_phone_format CHECK (((secondary_phone IS NULL) OR ((secondary_phone)::text ~ '^07[0-9]{8}$'::text))),
    CONSTRAINT users_gender_check CHECK (((gender)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying])::text[]))),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'unit_leader'::character varying, 'zone_leader'::character varying, 'member'::character varying])::text[]))),
    CONSTRAINT users_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying, 'suspended'::character varying])::text[])))
);
    DROP TABLE public.users;
       public         heap r       root    false            ▄            1259    31063    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               root    false    221            ─           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               root    false    220            ε            1259    31174    zones    TABLE       CREATE TABLE public.zones (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    leader_id bigint,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    location character varying(255),
    CONSTRAINT zones_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);
    DROP TABLE public.zones;
       public         heap r       root    false            φ            1259    31173    zones_id_seq    SEQUENCE     u   CREATE SEQUENCE public.zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.zones_id_seq;
       public               root    false    238            ┼           0    0    zones_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;
          public               root    false    237            2           2604    31239    activity_logs id    DEFAULT     t   ALTER TABLE ONLY public.activity_logs ALTER COLUMN id SET DEFAULT nextval('public.activity_logs_id_seq'::regclass);
 ?   ALTER TABLE public.activity_logs ALTER COLUMN id DROP DEFAULT;
       public               root    false    243    244    244            1           2604    31215    crops id    DEFAULT     d   ALTER TABLE ONLY public.crops ALTER COLUMN id SET DEFAULT nextval('public.crops_id_seq'::regclass);
 7   ALTER TABLE public.crops ALTER COLUMN id DROP DEFAULT;
       public               root    false    242    241    242            :           2604    31374 
   error_logs id    DEFAULT     n   ALTER TABLE ONLY public.error_logs ALTER COLUMN id SET DEFAULT nextval('public.error_logs_id_seq'::regclass);
 <   ALTER TABLE public.error_logs ALTER COLUMN id DROP DEFAULT;
       public               root    false    251    252    252            #           2604    31125    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public               root    false    229    230    230            8           2604    31344    fee_applications id    DEFAULT     z   ALTER TABLE ONLY public.fee_applications ALTER COLUMN id SET DEFAULT nextval('public.fee_applications_id_seq'::regclass);
 B   ALTER TABLE public.fee_applications ALTER COLUMN id DROP DEFAULT;
       public               root    false    249    250    250            G           2604    31483    fee_rule_unit_assignments id    DEFAULT     î   ALTER TABLE ONLY public.fee_rule_unit_assignments ALTER COLUMN id SET DEFAULT nextval('public.fee_rule_unit_assignments_id_seq'::regclass);
 K   ALTER TABLE public.fee_rule_unit_assignments ALTER COLUMN id DROP DEFAULT;
       public               root    false    259    260    260            %           2604    31137    fee_rules id    DEFAULT     l   ALTER TABLE ONLY public.fee_rules ALTER COLUMN id SET DEFAULT nextval('public.fee_rules_id_seq'::regclass);
 ;   ALTER TABLE public.fee_rules ALTER COLUMN id DROP DEFAULT;
       public               root    false    232    231    232            E           2604    31454    form_submissions id    DEFAULT     z   ALTER TABLE ONLY public.form_submissions ALTER COLUMN id SET DEFAULT nextval('public.form_submissions_id_seq'::regclass);
 B   ALTER TABLE public.form_submissions ALTER COLUMN id DROP DEFAULT;
       public               root    false    257    258    258            (           2604    31151    forms id    DEFAULT     d   ALTER TABLE ONLY public.forms ALTER COLUMN id SET DEFAULT nextval('public.forms_id_seq'::regclass);
 7   ALTER TABLE public.forms ALTER COLUMN id DROP DEFAULT;
       public               root    false    233    234    234            "           2604    31108    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public               root    false    226    227    227            0           2604    31196    lands id    DEFAULT     d   ALTER TABLE ONLY public.lands ALTER COLUMN id SET DEFAULT nextval('public.lands_id_seq'::regclass);
 7   ALTER TABLE public.lands ALTER COLUMN id DROP DEFAULT;
       public               root    false    240    239    240            3           2604    31255    login_sessions id    DEFAULT     v   ALTER TABLE ONLY public.login_sessions ALTER COLUMN id SET DEFAULT nextval('public.login_sessions_id_seq'::regclass);
 @   ALTER TABLE public.login_sessions ALTER COLUMN id DROP DEFAULT;
       public               root    false    246    245    246            B           2604    31429    member_fees id    DEFAULT     p   ALTER TABLE ONLY public.member_fees ALTER COLUMN id SET DEFAULT nextval('public.member_fees_id_seq'::regclass);
 =   ALTER TABLE public.member_fees ALTER COLUMN id DROP DEFAULT;
       public               root    false    255    256    256                       2604    31060 
   migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public               root    false    218    219    219            =           2604    31399    pages id    DEFAULT     d   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public               root    false    254    253    254            I           2604    39708    produces id    DEFAULT     j   ALTER TABLE ONLY public.produces ALTER COLUMN id SET DEFAULT nextval('public.produces_id_seq'::regclass);
 :   ALTER TABLE public.produces ALTER COLUMN id DROP DEFAULT;
       public               root    false    262    261    262            5           2604    31295 
   reports id    DEFAULT     h   ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);
 9   ALTER TABLE public.reports ALTER COLUMN id DROP DEFAULT;
       public               root    false    248    247    248            ,           2604    31162    units id    DEFAULT     d   ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);
 7   ALTER TABLE public.units ALTER COLUMN id DROP DEFAULT;
       public               root    false    236    235    236                       2604    31067    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               root    false    221    220    221            .           2604    31177    zones id    DEFAULT     d   ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);
 7   ALTER TABLE public.zones ALTER COLUMN id DROP DEFAULT;
       public               root    false    237    238    238            ÿ          0    31236 
   activity_logs 
   TABLE DATA           â   COPY public.activity_logs (id, user_id, action, description, ip_address, user_agent, metadata, created_at, updated_at) FROM stdin;
    public               root    false    244            ä          0    31090    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public               root    false    224            à          0    31097    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public               root    false    225            û          0    31212    crops 
   TABLE DATA           ─   COPY public.crops (id, name, crop_name, type, crop_type, variety, planting_date, expected_harvest_date, area_planted, seed_quantity, land_id, unit_id, user_id, created_at, updated_at) FROM stdin;
    public               root    false    242            á          0    31371 
   error_logs 
   TABLE DATA           ƒ   COPY public.error_logs (id, user_id, level, message, stack_trace, file, line, context, resolved, resolved_at, resolved_by, created_at, updated_at) FROM stdin;
    public               root    false    252            è          0    31122    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public               root    false    230            ₧          0    31341    fee_applications 
   TABLE DATA           ¢   COPY public.fee_applications (id, fee_rule_id, user_id, unit_id, amount, due_date, paid_date, status, notes, metadata, created_at, updated_at) FROM stdin;
    public               root    false    250            ¿          0    31480    fee_rule_unit_assignments 
   TABLE DATA              COPY public.fee_rule_unit_assignments (id, fee_rule_id, unit_id, custom_amount, is_active, created_at, updated_at) FROM stdin;
    public               root    false    260            î          0    31134 	   fee_rules 
   TABLE DATA           ╝   COPY public.fee_rules (id, name, type, amount, frequency, unit, status, applicable_to, description, effective_date, created_by, is_deleted, created_at, updated_at, deleted_at) FROM stdin;
    public               root    false    232            ª          0    31451    form_submissions 
   TABLE DATA           ÿ   COPY public.form_submissions (id, form_id, user_id, data, status, submitted_at, reviewed_at, reviewed_by, comments, created_at, updated_at) FROM stdin;
    public               root    false    258            Ä          0    31148    forms 
   TABLE DATA           ╚   COPY public.forms (id, name, title, type, category, description, fields, target_roles, created_at, updated_at, status, target_units, unit_id, user_id, assigned_to, due_date, submitted_at) FROM stdin;
    public               root    false    234            ê          0    31114    job_batches 
   TABLE DATA           û   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public               root    false    228            ç          0    31105    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public               root    false    227            ö          0    31193    lands 
   TABLE DATA           {   COPY public.lands (id, name, description, area, location, soil_type, user_id, unit_id, created_at, updated_at) FROM stdin;
    public               root    false    240            Ü          0    31252    login_sessions 
   TABLE DATA           ú   COPY public.login_sessions (id, user_id, session_id, ip_address, user_agent, is_active, login_at, logout_at, last_activity_at, created_at, updated_at) FROM stdin;
    public               root    false    246            ñ          0    31426    member_fees 
   TABLE DATA           ½   COPY public.member_fees (id, user_id, fee_rule_id, amount, paid_amount, payment_date, payment_method, reference_number, status, notes, created_at, updated_at) FROM stdin;
    public               root    false    256                      0    31057 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public               root    false    219            ó          0    31396    pages 
   TABLE DATA           »   COPY public.pages (id, title, path, role, description, features, permissions, status, icon, sort_order, is_public, created_by, updated_by, created_at, updated_at) FROM stdin;
    public               root    false    254            é          0    31074    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public               root    false    222            ¬          0    39705    produces 
   TABLE DATA           ó   COPY public.produces (id, name, description, quantity, unit, harvest_date, quality_grade, crop_id, land_id, unit_id, user_id, created_at, updated_at) FROM stdin;
    public               root    false    262            £          0    31292    reports 
   TABLE DATA           ú   COPY public.reports (id, title, description, type, status, submitted_at, approved_at, approved_by, unit_id, user_id, metadata, created_at, updated_at) FROM stdin;
    public               root    false    248            â          0    31081    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public               root    false    223            É          0    31159    units 
   TABLE DATA           p   COPY public.units (id, name, code, description, zone_id, leader_id, status, created_at, updated_at) FROM stdin;
    public               root    false    236            ü          0    31064    users 
   TABLE DATA             COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, christian_name, family_name, phone, id_passport, role, status, pin, unit_id, zone_id, last_login_at, last_activity_at, bio, avatar, national_id, gender, secondary_phone) FROM stdin;
    public               root    false    221            Æ          0    31174    zones 
   TABLE DATA           q   COPY public.zones (id, name, code, description, leader_id, status, created_at, updated_at, location) FROM stdin;
    public               root    false    238            ╞           0    0    activity_logs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.activity_logs_id_seq', 27, true);
          public               root    false    243            ╟           0    0    crops_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.crops_id_seq', 1, false);
          public               root    false    241            ╚           0    0    error_logs_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.error_logs_id_seq', 1, false);
          public               root    false    251            ╔           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public               root    false    229            ╩           0    0    fee_applications_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.fee_applications_id_seq', 1, false);
          public               root    false    249            ╦           0    0     fee_rule_unit_assignments_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.fee_rule_unit_assignments_id_seq', 1, false);
          public               root    false    259            ╠           0    0    fee_rules_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.fee_rules_id_seq', 6, true);
          public               root    false    231            ═           0    0    form_submissions_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.form_submissions_id_seq', 1, false);
          public               root    false    257            ╬           0    0    forms_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.forms_id_seq', 4, true);
          public               root    false    233            ╧           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public               root    false    226            ╨           0    0    lands_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.lands_id_seq', 1, false);
          public               root    false    239            ╤           0    0    login_sessions_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.login_sessions_id_seq', 15, true);
          public               root    false    245            ╥           0    0    member_fees_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.member_fees_id_seq', 1, false);
          public               root    false    255            ╙           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 26, true);
          public               root    false    218            ╘           0    0    pages_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.pages_id_seq', 1, false);
          public               root    false    253            ╒           0    0    produces_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.produces_id_seq', 1, false);
          public               root    false    261            ╓           0    0    reports_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reports_id_seq', 1, false);
          public               root    false    247            ╫           0    0    units_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.units_id_seq', 5, true);
          public               root    false    235            ╪           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public               root    false    220            ┘           0    0    zones_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.zones_id_seq', 11, true);
          public               root    false    237            ò           2606    31243     activity_logs activity_logs_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.activity_logs DROP CONSTRAINT activity_logs_pkey;
       public                 root    false    244            s           2606    31103    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public                 root    false    225            q           2606    31096    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public                 root    false    224            Æ           2606    31219    crops crops_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.crops DROP CONSTRAINT crops_pkey;
       public                 root    false    242            ¬           2606    31381    error_logs error_logs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.error_logs
    ADD CONSTRAINT error_logs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.error_logs DROP CONSTRAINT error_logs_pkey;
       public                 root    false    252            z           2606    31130    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public                 root    false    230            |           2606    31132 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public                 root    false    230            Ñ           2606    31350 &   fee_applications fee_applications_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.fee_applications
    ADD CONSTRAINT fee_applications_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.fee_applications DROP CONSTRAINT fee_applications_pkey;
       public                 root    false    250            ┐           2606    31498 N   fee_rule_unit_assignments fee_rule_unit_assignments_fee_rule_id_unit_id_unique 
   CONSTRAINT     Ö   ALTER TABLE ONLY public.fee_rule_unit_assignments
    ADD CONSTRAINT fee_rule_unit_assignments_fee_rule_id_unit_id_unique UNIQUE (fee_rule_id, unit_id);
 x   ALTER TABLE ONLY public.fee_rule_unit_assignments DROP CONSTRAINT fee_rule_unit_assignments_fee_rule_id_unit_id_unique;
       public                 root    false    260    260            ┴           2606    31486 8   fee_rule_unit_assignments fee_rule_unit_assignments_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.fee_rule_unit_assignments
    ADD CONSTRAINT fee_rule_unit_assignments_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.fee_rule_unit_assignments DROP CONSTRAINT fee_rule_unit_assignments_pkey;
       public                 root    false    260                       2606    31143    fee_rules fee_rules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.fee_rules
    ADD CONSTRAINT fee_rules_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.fee_rules DROP CONSTRAINT fee_rules_pkey;
       public                 root    false    232            ╗           2606    31460 &   form_submissions form_submissions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.form_submissions DROP CONSTRAINT form_submissions_pkey;
       public                 root    false    258            â           2606    31157    forms forms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.forms DROP CONSTRAINT forms_pkey;
       public                 root    false    234            x           2606    31120    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public                 root    false    228            u           2606    31112    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public                 root    false    227            É           2606    31200    lands lands_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.lands
    ADD CONSTRAINT lands_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.lands DROP CONSTRAINT lands_pkey;
       public                 root    false    240            Ö           2606    31260 "   login_sessions login_sessions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.login_sessions
    ADD CONSTRAINT login_sessions_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.login_sessions DROP CONSTRAINT login_sessions_pkey;
       public                 root    false    246            ╖           2606    31436    member_fees member_fees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.member_fees
    ADD CONSTRAINT member_fees_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.member_fees DROP CONSTRAINT member_fees_pkey;
       public                 root    false    256            [           2606    31062    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public                 root    false    219            »           2606    31424    pages pages_path_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_path_unique UNIQUE (path);
 A   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_path_unique;
       public                 root    false    254            ▒           2606    31409    pages pages_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_pkey;
       public                 root    false    254            k           2606    31080 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public                 root    false    222            ┼           2606    39712    produces produces_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.produces
    ADD CONSTRAINT produces_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.produces DROP CONSTRAINT produces_pkey;
       public                 root    false    262            ¥           2606    31303    reports reports_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reports DROP CONSTRAINT reports_pkey;
       public                 root    false    248            n           2606    31087    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public                 root    false    223            à           2606    31172    units units_code_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_code_unique UNIQUE (code);
 A   ALTER TABLE ONLY public.units DROP CONSTRAINT units_code_unique;
       public                 root    false    236            ê           2606    31168    units units_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.units DROP CONSTRAINT units_pkey;
       public                 root    false    236            ]           2606    31073    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public                 root    false    221            _           2606    31290    users users_id_passport_unique 
   CONSTRAINT     `   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_passport_unique UNIQUE (id_passport);
 H   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_passport_unique;
       public                 root    false    221            b           2606    39740    users users_phone_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_unique UNIQUE (phone);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_unique;
       public                 root    false    221            d           2606    31071    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 root    false    221            g           2606    39742 "   users users_secondary_phone_unique 
   CONSTRAINT     h   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_secondary_phone_unique UNIQUE (secondary_phone);
 L   ALTER TABLE ONLY public.users DROP CONSTRAINT users_secondary_phone_unique;
       public                 root    false    221            ï           2606    31191    zones zones_code_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_code_unique UNIQUE (code);
 A   ALTER TABLE ONLY public.zones DROP CONSTRAINT zones_code_unique;
       public                 root    false    238            Ä           2606    31183    zones zones_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.zones DROP CONSTRAINT zones_pkey;
       public                 root    false    238            ô           1259    31250    activity_logs_action_index    INDEX     V   CREATE INDEX activity_logs_action_index ON public.activity_logs USING btree (action);
 .   DROP INDEX public.activity_logs_action_index;
       public                 root    false    244            û           1259    31249 &   activity_logs_user_id_created_at_index    INDEX     o   CREATE INDEX activity_logs_user_id_created_at_index ON public.activity_logs USING btree (user_id, created_at);
 :   DROP INDEX public.activity_logs_user_id_created_at_index;
       public                 root    false    244    244            ¿           1259    31392    error_logs_level_resolved_index    INDEX     a   CREATE INDEX error_logs_level_resolved_index ON public.error_logs USING btree (level, resolved);
 3   DROP INDEX public.error_logs_level_resolved_index;
       public                 root    false    252    252            ½           1259    31394    error_logs_resolved_index    INDEX     T   CREATE INDEX error_logs_resolved_index ON public.error_logs USING btree (resolved);
 -   DROP INDEX public.error_logs_resolved_index;
       public                 root    false    252            ¼           1259    31393 #   error_logs_user_id_created_at_index    INDEX     i   CREATE INDEX error_logs_user_id_created_at_index ON public.error_logs USING btree (user_id, created_at);
 7   DROP INDEX public.error_logs_user_id_created_at_index;
       public                 root    false    252    252            ó           1259    31369    fee_applications_due_date_index    INDEX     `   CREATE INDEX fee_applications_due_date_index ON public.fee_applications USING btree (due_date);
 3   DROP INDEX public.fee_applications_due_date_index;
       public                 root    false    250            ú           1259    31368 )   fee_applications_fee_rule_id_status_index    INDEX     u   CREATE INDEX fee_applications_fee_rule_id_status_index ON public.fee_applications USING btree (fee_rule_id, status);
 =   DROP INDEX public.fee_applications_fee_rule_id_status_index;
       public                 root    false    250    250            ª           1259    31367 %   fee_applications_unit_id_status_index    INDEX     m   CREATE INDEX fee_applications_unit_id_status_index ON public.fee_applications USING btree (unit_id, status);
 9   DROP INDEX public.fee_applications_unit_id_status_index;
       public                 root    false    250    250            º           1259    31366 %   fee_applications_user_id_status_index    INDEX     m   CREATE INDEX fee_applications_user_id_status_index ON public.fee_applications USING btree (user_id, status);
 9   DROP INDEX public.fee_applications_user_id_status_index;
       public                 root    false    250    250            ┬           1259    31499 1   fee_rule_unit_assignments_unit_id_is_active_index    INDEX     à   CREATE INDEX fee_rule_unit_assignments_unit_id_is_active_index ON public.fee_rule_unit_assignments USING btree (unit_id, is_active);
 E   DROP INDEX public.fee_rule_unit_assignments_unit_id_is_active_index;
       public                 root    false    260    260            }           1259    31146    fee_rules_is_deleted_index    INDEX     V   CREATE INDEX fee_rules_is_deleted_index ON public.fee_rules USING btree (is_deleted);
 .   DROP INDEX public.fee_rules_is_deleted_index;
       public                 root    false    232            Ç           1259    31144 %   fee_rules_status_effective_date_index    INDEX     m   CREATE INDEX fee_rules_status_effective_date_index ON public.fee_rules USING btree (status, effective_date);
 9   DROP INDEX public.fee_rules_status_effective_date_index;
       public                 root    false    232    232            ü           1259    31145    fee_rules_type_status_index    INDEX     Y   CREATE INDEX fee_rules_type_status_index ON public.fee_rules USING btree (type, status);
 /   DROP INDEX public.fee_rules_type_status_index;
       public                 root    false    232    232            ╣           1259    31476 %   form_submissions_form_id_status_index    INDEX     m   CREATE INDEX form_submissions_form_id_status_index ON public.form_submissions USING btree (form_id, status);
 9   DROP INDEX public.form_submissions_form_id_status_index;
       public                 root    false    258    258            ╝           1259    31478 #   form_submissions_submitted_at_index    INDEX     h   CREATE INDEX form_submissions_submitted_at_index ON public.form_submissions USING btree (submitted_at);
 7   DROP INDEX public.form_submissions_submitted_at_index;
       public                 root    false    258            ╜           1259    31477 %   form_submissions_user_id_status_index    INDEX     m   CREATE INDEX form_submissions_user_id_status_index ON public.form_submissions USING btree (user_id, status);
 9   DROP INDEX public.form_submissions_user_id_status_index;
       public                 root    false    258    258            v           1259    31113    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public                 root    false    227            ù           1259    31268    login_sessions_login_at_index    INDEX     \   CREATE INDEX login_sessions_login_at_index ON public.login_sessions USING btree (login_at);
 1   DROP INDEX public.login_sessions_login_at_index;
       public                 root    false    246            Ü           1259    31267    login_sessions_session_id_index    INDEX     `   CREATE INDEX login_sessions_session_id_index ON public.login_sessions USING btree (session_id);
 3   DROP INDEX public.login_sessions_session_id_index;
       public                 root    false    246            ¢           1259    31266 &   login_sessions_user_id_is_active_index    INDEX     o   CREATE INDEX login_sessions_user_id_is_active_index ON public.login_sessions USING btree (user_id, is_active);
 :   DROP INDEX public.login_sessions_user_id_is_active_index;
       public                 root    false    246    246            ┤           1259    31448 $   member_fees_fee_rule_id_status_index    INDEX     k   CREATE INDEX member_fees_fee_rule_id_status_index ON public.member_fees USING btree (fee_rule_id, status);
 8   DROP INDEX public.member_fees_fee_rule_id_status_index;
       public                 root    false    256    256            ╡           1259    31449    member_fees_payment_date_index    INDEX     ^   CREATE INDEX member_fees_payment_date_index ON public.member_fees USING btree (payment_date);
 2   DROP INDEX public.member_fees_payment_date_index;
       public                 root    false    256            ╕           1259    31447     member_fees_user_id_status_index    INDEX     c   CREATE INDEX member_fees_user_id_status_index ON public.member_fees USING btree (user_id, status);
 4   DROP INDEX public.member_fees_user_id_status_index;
       public                 root    false    256    256            ¡           1259    31421    pages_is_public_status_index    INDEX     [   CREATE INDEX pages_is_public_status_index ON public.pages USING btree (is_public, status);
 0   DROP INDEX public.pages_is_public_status_index;
       public                 root    false    254    254            ▓           1259    31420    pages_role_status_index    INDEX     Q   CREATE INDEX pages_role_status_index ON public.pages USING btree (role, status);
 +   DROP INDEX public.pages_role_status_index;
       public                 root    false    254    254            │           1259    31422    pages_sort_order_index    INDEX     N   CREATE INDEX pages_sort_order_index ON public.pages USING btree (sort_order);
 *   DROP INDEX public.pages_sort_order_index;
       public                 root    false    254            ├           1259    39733 #   produces_crop_id_harvest_date_index    INDEX     i   CREATE INDEX produces_crop_id_harvest_date_index ON public.produces USING btree (crop_id, harvest_date);
 7   DROP INDEX public.produces_crop_id_harvest_date_index;
       public                 root    false    262    262            ╞           1259    39736    produces_quality_grade_index    INDEX     Z   CREATE INDEX produces_quality_grade_index ON public.produces USING btree (quality_grade);
 0   DROP INDEX public.produces_quality_grade_index;
       public                 root    false    262            ╟           1259    39734 #   produces_unit_id_harvest_date_index    INDEX     i   CREATE INDEX produces_unit_id_harvest_date_index ON public.produces USING btree (unit_id, harvest_date);
 7   DROP INDEX public.produces_unit_id_harvest_date_index;
       public                 root    false    262    262            ╚           1259    39735 #   produces_user_id_harvest_date_index    INDEX     i   CREATE INDEX produces_user_id_harvest_date_index ON public.produces USING btree (user_id, harvest_date);
 7   DROP INDEX public.produces_user_id_harvest_date_index;
       public                 root    false    262    262            ₧           1259    31319    reports_status_type_index    INDEX     U   CREATE INDEX reports_status_type_index ON public.reports USING btree (status, type);
 -   DROP INDEX public.reports_status_type_index;
       public                 root    false    248    248            ƒ           1259    31322    reports_submitted_at_index    INDEX     V   CREATE INDEX reports_submitted_at_index ON public.reports USING btree (submitted_at);
 .   DROP INDEX public.reports_submitted_at_index;
       public                 root    false    248            á           1259    31320    reports_unit_id_status_index    INDEX     [   CREATE INDEX reports_unit_id_status_index ON public.reports USING btree (unit_id, status);
 0   DROP INDEX public.reports_unit_id_status_index;
       public                 root    false    248    248            í           1259    31321    reports_user_id_status_index    INDEX     [   CREATE INDEX reports_user_id_status_index ON public.reports USING btree (user_id, status);
 0   DROP INDEX public.reports_user_id_status_index;
       public                 root    false    248    248            l           1259    31089    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public                 root    false    223            o           1259    31088    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public                 root    false    223            å           1259    31170    units_leader_id_status_index    INDEX     [   CREATE INDEX units_leader_id_status_index ON public.units USING btree (leader_id, status);
 0   DROP INDEX public.units_leader_id_status_index;
       public                 root    false    236    236            ë           1259    31169    units_zone_id_status_index    INDEX     W   CREATE INDEX units_zone_id_status_index ON public.units USING btree (zone_id, status);
 .   DROP INDEX public.units_zone_id_status_index;
       public                 root    false    236    236            `           1259    31286    users_last_activity_at_index    INDEX     Z   CREATE INDEX users_last_activity_at_index ON public.users USING btree (last_activity_at);
 0   DROP INDEX public.users_last_activity_at_index;
       public                 root    false    221            e           1259    31283    users_role_status_index    INDEX     Q   CREATE INDEX users_role_status_index ON public.users USING btree (role, status);
 +   DROP INDEX public.users_role_status_index;
       public                 root    false    221    221            h           1259    31284    users_unit_id_status_index    INDEX     W   CREATE INDEX users_unit_id_status_index ON public.users USING btree (unit_id, status);
 .   DROP INDEX public.users_unit_id_status_index;
       public                 root    false    221    221            i           1259    31285    users_zone_id_status_index    INDEX     W   CREATE INDEX users_zone_id_status_index ON public.users USING btree (zone_id, status);
 .   DROP INDEX public.users_zone_id_status_index;
       public                 root    false    221    221            î           1259    31189    zones_leader_id_status_index    INDEX     [   CREATE INDEX zones_leader_id_status_index ON public.zones USING btree (leader_id, status);
 0   DROP INDEX public.zones_leader_id_status_index;
       public                 root    false    238    238            ╓           2606    31244 +   activity_logs activity_logs_user_id_foreign 
   FK CONSTRAINT     £   ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.activity_logs DROP CONSTRAINT activity_logs_user_id_foreign;
       public               root    false    244    4964    221            ╙           2606    31220    crops crops_land_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_land_id_foreign FOREIGN KEY (land_id) REFERENCES public.lands(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.crops DROP CONSTRAINT crops_land_id_foreign;
       public               root    false    240    5008    242            ╘           2606    31225    crops crops_unit_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.crops DROP CONSTRAINT crops_unit_id_foreign;
       public               root    false    242    236    5000            ╒           2606    31230    crops crops_user_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.crops DROP CONSTRAINT crops_user_id_foreign;
       public               root    false    4964    242    221            ▐           2606    31387 )   error_logs error_logs_resolved_by_foreign 
   FK CONSTRAINT     ƒ   ALTER TABLE ONLY public.error_logs
    ADD CONSTRAINT error_logs_resolved_by_foreign FOREIGN KEY (resolved_by) REFERENCES public.users(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.error_logs DROP CONSTRAINT error_logs_resolved_by_foreign;
       public               root    false    4964    252    221            ▀           2606    31382 %   error_logs error_logs_user_id_foreign 
   FK CONSTRAINT     ù   ALTER TABLE ONLY public.error_logs
    ADD CONSTRAINT error_logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY public.error_logs DROP CONSTRAINT error_logs_user_id_foreign;
       public               root    false    4964    221    252            █           2606    31351 5   fee_applications fee_applications_fee_rule_id_foreign 
   FK CONSTRAINT     «   ALTER TABLE ONLY public.fee_applications
    ADD CONSTRAINT fee_applications_fee_rule_id_foreign FOREIGN KEY (fee_rule_id) REFERENCES public.fee_rules(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.fee_applications DROP CONSTRAINT fee_applications_fee_rule_id_foreign;
       public               root    false    232    4991    250            ▄           2606    31361 1   fee_applications fee_applications_unit_id_foreign 
   FK CONSTRAINT     ó   ALTER TABLE ONLY public.fee_applications
    ADD CONSTRAINT fee_applications_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.fee_applications DROP CONSTRAINT fee_applications_unit_id_foreign;
       public               root    false    250    5000    236            ▌           2606    31356 1   fee_applications fee_applications_user_id_foreign 
   FK CONSTRAINT     ó   ALTER TABLE ONLY public.fee_applications
    ADD CONSTRAINT fee_applications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.fee_applications DROP CONSTRAINT fee_applications_user_id_foreign;
       public               root    false    250    221    4964            τ           2606    31487 G   fee_rule_unit_assignments fee_rule_unit_assignments_fee_rule_id_foreign 
   FK CONSTRAINT     └   ALTER TABLE ONLY public.fee_rule_unit_assignments
    ADD CONSTRAINT fee_rule_unit_assignments_fee_rule_id_foreign FOREIGN KEY (fee_rule_id) REFERENCES public.fee_rules(id) ON DELETE CASCADE;
 q   ALTER TABLE ONLY public.fee_rule_unit_assignments DROP CONSTRAINT fee_rule_unit_assignments_fee_rule_id_foreign;
       public               root    false    260    4991    232            Φ           2606    31492 C   fee_rule_unit_assignments fee_rule_unit_assignments_unit_id_foreign 
   FK CONSTRAINT     ┤   ALTER TABLE ONLY public.fee_rule_unit_assignments
    ADD CONSTRAINT fee_rule_unit_assignments_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.fee_rule_unit_assignments DROP CONSTRAINT fee_rule_unit_assignments_unit_id_foreign;
       public               root    false    236    5000    260            Σ           2606    31461 1   form_submissions form_submissions_form_id_foreign 
   FK CONSTRAINT     ó   ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_form_id_foreign FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.form_submissions DROP CONSTRAINT form_submissions_form_id_foreign;
       public               root    false    234    258    4995            σ           2606    31471 5   form_submissions form_submissions_reviewed_by_foreign 
   FK CONSTRAINT     ½   ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_reviewed_by_foreign FOREIGN KEY (reviewed_by) REFERENCES public.users(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY public.form_submissions DROP CONSTRAINT form_submissions_reviewed_by_foreign;
       public               root    false    221    4964    258            µ           2606    31466 1   form_submissions form_submissions_user_id_foreign 
   FK CONSTRAINT     ó   ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.form_submissions DROP CONSTRAINT form_submissions_user_id_foreign;
       public               root    false    258    221    4964            ╦           2606    31335    forms forms_assigned_to_foreign 
   FK CONSTRAINT     ò   ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_assigned_to_foreign FOREIGN KEY (assigned_to) REFERENCES public.users(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.forms DROP CONSTRAINT forms_assigned_to_foreign;
       public               root    false    4964    221    234            ╠           2606    31325    forms forms_unit_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.forms DROP CONSTRAINT forms_unit_id_foreign;
       public               root    false    236    234    5000            ═           2606    31330    forms forms_user_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.forms DROP CONSTRAINT forms_user_id_foreign;
       public               root    false    221    234    4964            ╤           2606    31206    lands lands_unit_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.lands
    ADD CONSTRAINT lands_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.lands DROP CONSTRAINT lands_unit_id_foreign;
       public               root    false    5000    236    240            ╥           2606    31201    lands lands_user_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.lands
    ADD CONSTRAINT lands_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.lands DROP CONSTRAINT lands_user_id_foreign;
       public               root    false    240    4964    221            ╫           2606    31261 -   login_sessions login_sessions_user_id_foreign 
   FK CONSTRAINT     ₧   ALTER TABLE ONLY public.login_sessions
    ADD CONSTRAINT login_sessions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.login_sessions DROP CONSTRAINT login_sessions_user_id_foreign;
       public               root    false    246    221    4964            Γ           2606    31442 +   member_fees member_fees_fee_rule_id_foreign 
   FK CONSTRAINT     ñ   ALTER TABLE ONLY public.member_fees
    ADD CONSTRAINT member_fees_fee_rule_id_foreign FOREIGN KEY (fee_rule_id) REFERENCES public.fee_rules(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.member_fees DROP CONSTRAINT member_fees_fee_rule_id_foreign;
       public               root    false    4991    232    256            π           2606    31437 '   member_fees member_fees_user_id_foreign 
   FK CONSTRAINT     ÿ   ALTER TABLE ONLY public.member_fees
    ADD CONSTRAINT member_fees_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.member_fees DROP CONSTRAINT member_fees_user_id_foreign;
       public               root    false    221    4964    256            α           2606    31410    pages pages_created_by_foreign 
   FK CONSTRAINT     ô   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_created_by_foreign;
       public               root    false    221    254    4964            ß           2606    31415    pages pages_updated_by_foreign 
   FK CONSTRAINT     ô   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_updated_by_foreign;
       public               root    false    221    4964    254            Θ           2606    39713 !   produces produces_crop_id_foreign 
   FK CONSTRAINT     Æ   ALTER TABLE ONLY public.produces
    ADD CONSTRAINT produces_crop_id_foreign FOREIGN KEY (crop_id) REFERENCES public.crops(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.produces DROP CONSTRAINT produces_crop_id_foreign;
       public               root    false    242    5010    262            Ω           2606    39718 !   produces produces_land_id_foreign 
   FK CONSTRAINT     Æ   ALTER TABLE ONLY public.produces
    ADD CONSTRAINT produces_land_id_foreign FOREIGN KEY (land_id) REFERENCES public.lands(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.produces DROP CONSTRAINT produces_land_id_foreign;
       public               root    false    5008    262    240            δ           2606    39723 !   produces produces_unit_id_foreign 
   FK CONSTRAINT     Æ   ALTER TABLE ONLY public.produces
    ADD CONSTRAINT produces_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.produces DROP CONSTRAINT produces_unit_id_foreign;
       public               root    false    236    262    5000            ∞           2606    39728 !   produces produces_user_id_foreign 
   FK CONSTRAINT     Æ   ALTER TABLE ONLY public.produces
    ADD CONSTRAINT produces_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.produces DROP CONSTRAINT produces_user_id_foreign;
       public               root    false    221    262    4964            ╪           2606    31304 #   reports reports_approved_by_foreign 
   FK CONSTRAINT     Ö   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_approved_by_foreign FOREIGN KEY (approved_by) REFERENCES public.users(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.reports DROP CONSTRAINT reports_approved_by_foreign;
       public               root    false    221    4964    248            ┘           2606    31309    reports reports_unit_id_foreign 
   FK CONSTRAINT     É   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.reports DROP CONSTRAINT reports_unit_id_foreign;
       public               root    false    5000    248    236            ┌           2606    31314    reports reports_user_id_foreign 
   FK CONSTRAINT     É   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.reports DROP CONSTRAINT reports_user_id_foreign;
       public               root    false    4964    221    248            ╬           2606    31505    units units_leader_id_foreign 
   FK CONSTRAINT     æ   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_leader_id_foreign FOREIGN KEY (leader_id) REFERENCES public.users(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.units DROP CONSTRAINT units_leader_id_foreign;
       public               root    false    236    221    4964            ╧           2606    31500    units units_zone_id_foreign 
   FK CONSTRAINT     î   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.units DROP CONSTRAINT units_zone_id_foreign;
       public               root    false    238    236    5006            ╔           2606    31273    users users_unit_id_foreign 
   FK CONSTRAINT     ì   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_unit_id_foreign;
       public               root    false    221    236    5000            ╩           2606    31278    users users_zone_id_foreign 
   FK CONSTRAINT     ì   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_zone_id_foreign FOREIGN KEY (zone_id) REFERENCES public.zones(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_zone_id_foreign;
       public               root    false    221    5006    238            ╨           2606    31184    zones zones_leader_id_foreign 
   FK CONSTRAINT     æ   ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_leader_id_foreign FOREIGN KEY (leader_id) REFERENCES public.users(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.zones DROP CONSTRAINT zones_leader_id_foreign;
       public               root    false    221    238    4964            ÿ     x£▌ÿ╧k█0╟╧~àÄ-¼Ä▐╙█╩)█aâ&9l╜⌠Æ╞j'Ω┌%«Y╢┐~JµÆ
ä╩╪∙╞·≡òƒ₧ì	&U≤ΦΩdR>╗Ü∙±ú-Ö╡▌ri█÷í½¬_	Rûr`2k~╗¬ZîT╩┘┼╘╒▌z╠&u╣j\╔t╩╟ln╫]╦√╪╣¬═╛NT>┐dôùù╩▐┌√k≈:R"Kàf╫_nf╙¼rOû}╢╦ºµÆ}·▒j₧φE╛}g│µ▐Uû}[<,V«┐3╣¢'─I]±∞
Cnä6¬1áA°IaC─Pⁿ─q~[r~Öyêüäƒ"├UêüÇÄF≡âl~Ö┴"─ äåDêAqÆ▀¡½╦µg╦µ7~┼oΣ<╨r╠╓Z■┐╥?\╚╫
1@>ê░╝î╥!~î+-a╕?1─ √╓ñΘ^ô∩¡]φdⁿ⌡╗╡Q╛,Σ!xZ#rvB#ÑQ<─ ed╤m╩ÖT!xZÅqf═╕4▓8╪o≈PGìƒ╣≥ò╦É1└╙┌ç≤╦hâ┌≡"─ ≤╪ó╔±πhzUg░¥╕╠╛ó÷ê╟Ma°¢hzä±┘╨¢╨3 JD┐╨ªvQεu▐δJ█┤cç [÷HDû
·mRe│cα▒ê╦Fl─╬F┼û═▀Ö½è¡╪⌠╩╟U`╟Ç▓D╞e#═µ5íâ╗ ■ ≡╔▄      ä   
   x£ï╤πΓΓ ┼ ⌐      à   
   x£ï╤πΓΓ ┼ ⌐      û   
   x£ï╤πΓΓ ┼ ⌐      á   
   x£ï╤πΓΓ ┼ ⌐      è   
   x£ï╤πΓΓ ┼ ⌐      ₧   
   x£ï╤πΓΓ ┼ ⌐      ¿   
   x£ï╤πΓΓ ┼ ⌐      î   ÿ  x£Ñô]k├ å»Oàá%I¢z7╪â}▒n∞f¼₧&25¥Üû■√⌐∙ha▌┼π1çù╟'Ü┬╒£╝[Z"╣CΘK╚ôYÆÇ¬╡½ΣvhHà╠Qâ@Ö{ Æ▓P¿6h,<╢mdïH╢╡!!ü410╠┌íªÜ!dI╢ÿ&⌐`}┤╣µJh╪å/∙4YN╙£$∙jæ¡≥⌠Γ┌τ╙$â█∩F∞jG^²@e╟~▓<╨s*:vNÅ`Yà╝æ╚í╤┬)∞7íëÿ6Ñ▀ -ì`ìtì±ïg▒>═|ñ÷╥╨ⁿ}/ªfh¡╨eä▐
%DhÅ[8C╡
₧k±╧δ·╧√
°T▐0$ûJ┤¥⌠∙8ΘX╗┌⌠ç─╢sH#⌠±½S═Üì`Dí≤fä╛@√{I0W╘∞╤│±₧╜ú^î▒¥├¢±ç»wφ║╥$∩Zcßä┬nâ┬ô`ìç∙Yπ4⌠æ>`á÷]ñ∩jy≤qû»α▐Q╥≡»O╖q■τmΣån]╟ⁿδ>èSöW╖,Ωε@ùc─~╬&ô╔WτD=      ª   
   x£ï╤πΓΓ ┼ ⌐      Ä   Σ  x£╡T╤N█0}v┐┬╩ôÇ╡▌*ñ╛!i½╩ÿªiEnrI╜9Np£▓2±∩≤╡¥4em┌J!╡╛≈°≈·°⌠H
ΘT¿ ßàVL≤LÆ╧╢F┐4j⌠"S)YA╣¥⌠>S╘5AqÖP	Å╘⌡¬3¬g@YóxT
]*&h)╣&╖╔RåA4Sf+g2┤à├@/r¼k°¡═J░)│<½`tΣ`
J« åZòpΣéE0╦D╩└?HsZsS╦²|X½▐│öïE╗Σà┼∞úτX ╦gÖ▄,3╞.ò8▒¡:▌ô∩■»)└π0gEægJoö╣:ƒL▐Ä=jW9≈│«╬⌐╣πJüJ╖≈∙Ä▄xÖí å≡;╥∩÷G▌ôú▐Çv├≈²ßá╖╢╞"═τ@&#ⁿ∩∙╧╔¿╙'é╔84B<æ)HM>Ö5=¡╫╞ù%Ü( ë°ª
m]ê
║$▓m<le═å¡ª¼▓~z÷{
═á╒≥¬₧┌¼≡├5wí╖<
^ªÇ-yδ_S1ƒÜ6=╕äH`±f╗╧Ä╗▌&╜Å
/5
å«⌐aºìo▐à╚æ,╟°(éßmpc╖√δε^┴M∩Hñ▓|5▐╬Le[╕ß«═╤å▌ériâφeûí^{îí■>	å°ùybe, µ╦░B_ªσR╞ƒ2f
╩#\>╬Ç![₧iª3└Nd¢ú╟µÉÇfSa╦≈¬Σ║0≈╖<▐£)z╤>âo5hτ1T╝═d5»ƒ{3▌ÿå_╒	δQ⌠▄╒W_<ó╨rB╝φ1ìl G⌡ ì■₧╠ÿÜ¢α3^╟ä&ùniîn█[▄╢<▓Θo¼πt|ï.8ê╕áÿ_╣╩Γ2éå┼}Ñ▌σc┌╟Φ₧w╜╫[cτ&+ò┘ê«┌)qÉq┼»╒≡Z=Tìt¢àJ⌠Ü^ä₧╡╒H╫L/+0=°ò∞ƒ╬FTáfóîúZFuφp⌠ú╟╡╦Rà°▄▌╖i²-▓f│±5r{r▄Θt■└1âÑ      ê   
   x£ï╤πΓΓ ┼ ⌐      ç   
   x£ï╤πΓΓ ┼ ⌐      ö   
   x£ï╤πΓΓ ┼ ⌐      Ü   ╖  x£═ù╦ÆóX@╫≥,╗#ª¡√Ç{üZ!%α|!ZFoPEPΣδ╗ªUZ╒─,fX¥╚╕'2ô6`c`╗íuté╦E╦│æÿÄ<J┬ε··"o:[K├½Tσÿ▀5 óMP^░a─EE╬▀∞╖~░╧≥gV▐»ô8X│ñ	₧Y╙═│╦│¡,ê╓O╞Xµ≤;+æ;sù╜ }Γ1mb┬~δΘû╤ ïìé╨e5w╞▀Yeô─;≈	bß╫π k─╦ r┘ëπ9I≡Of#m Ç°Ç■Ç<üäë─ïìƒµC\æ1¿⌠╤v│■ü╙F╢mⁿémLxu▄Gçxô┴"╜*Ö4Ñµ>8,Ax∩π
Wd.}G#u0╒vµ⌡cA∞Äö╤u╪ëöU[\lî\_σC>║╠δ∩?¿Å7\æ1\ΘÅÆ]█:⌡[▐kñεZ╫5₧╦(#▌8të├⌡
╗∩ÑgG¼╗*aßüÅ_╕"c°╥ç┐≈Θ╒W╛ó	ÖW∞.ûφ┤H»ΓqáMáΘLá╝₧┤jεâGα∩}╝ßèî!ÑÅ■(±H¼º±é'ë
ui"æ
>sç■tW,r.╕·PkPP┬αúÅ▀╕"chΘ#pº"-╕└~┘σ8∞═çWƒ╖╨1╢╬¢X╗úºCgVwTéw≤π7«╚í⌠▒å[5┐h╓Γ%Z⌡╕┴ub┐δΓ∙à╧≤\╖vpB╡B▄Ü√Çóä≡╜Å7\æ1σÉltíl$▌Vp@ï8═~*Z·~⌠Ü╓·┤]A√3│`┐Ä/'╓┤╩>╝╔(ß₧┘£p ^┴╫gGσ≡C≈g├╦	╨╪t:¥╘Lû₧ûaε╨T▒¼╘▐m▒*½\G╡│qP≤b(O─ôçBJ\æ1σôZ)]Z║╓¡éâg3█t╡⌡R9≤óæ«╚m─┼╫ ▒╝woÅ%P▐≡π╦Ä*─}Ü╦└█.Ωuíäßä₧ÉÄô░º╠"╪▀rQp¥╤╨≥.÷d:╗éO╦π┐╢üá─q εcÇ╨¡┘9■Åq_Σ2≡╢ë÷
ε$/╞7:╖≡╝W²4\$Σ⌡É─╙ä7ößx▐ìδaâ░Çô╕r╠ë∩_û║ä╕?╞}æ╦└█:Uò╕wÜττeO╪ƒ╚α∞¢├sF£SHAÿ
É\╨▒Ä{Zml	Æw]Q2*!≡╤╞ú╕/rx█B10Dp┘.±╤öm╗│¢CΣ╔½╪LDz-L╖ê°⌡▒A%Nx≈¢Q2Qw6┼}æ╦ⁿl2≤7£%z      ñ   
   x£ï╤πΓΓ ┼ ⌐         ▓  x£môßn¼ à»╙0╕╗∩╥dé:δ┌*╘¢╗}·óφ
╕5ä─Σ;╠ß╠ '!╨∩┌>¬=¢ÖiÖ╪O4¢¬τ°┬¼M}τö/ >┴W┼╒	j%IABü─²└3∙Ñτδ_°L 6o╬,_└²╘┼vs╧/αn≤╦┘ñ⌠%é╟äzc¢^#ê░÷nî êH¬░$α∙IÜzε■u≤âz╫&
8(ñè&\█YÜxÜ:g	fÆRò(╚4
}:Su¡í[╟²Ω▐
2
├¿aO╞≤Φ|"¿£╒B╦¡╚╨;╢Ñ┌⌡╦`╖*yƒ@gJ╠:┌o╞▒∩j3τw*s$"÷▐∙Cjτ╟M¢⌠.9)rαíb┐ÜJ°k╬½├<╥┤T[⌐{╣H«╝Nⁿ6ñdé▓╡█$jä\]«Ω5ΩPÅMƒⁿ°Θf6µê⌐Aâ╥¢¼w?Θ«Ætα▒└d ╩░+▐h┌╘┐'G¿2ß%╝=╡τφ]│╘{Uá╬ay*£ⁿƒ╞0═[Ω┘╢≤¥┬ZGXf╥½ä≡2Wâ╫╬6╞?h╝ç+û┼√[Q▀A¬ê=      ó   
   x£ï╤πΓΓ ┼ ⌐      é   
   x£ï╤πΓΓ ┼ ⌐      ¬   
   x£ï╤πΓΓ ┼ ⌐      £   
   x£ï╤πΓΓ ┼ ⌐      â   £  x£φ[[Åú:║}εⁿèz£æÄ║╣'hkB┬%$6îk^╕%\L 	IÇ_¿«₧╜gtt¬╗Å·¿¬ñVñBe╟\╛o}k-lG╫┬¢Zf╩i£╫π|╜U┌"âWτQ
┌°qàΣ`╤Γ╙?ß'û¢fª√	4cAi⌠Eⁿ╠<²═/Ni≤╕>A⌠─N▌<M
Æ≡╟S/	Z╢-═ⁿ,▐▌æƒµÑº┐m
v ⌡Dï*{╥│ñj■■┤╩/M¥}a∙┼╫+0Ontê.┼╖!ƒB╘î╓⌐¡2ö6Tfb«úq▒Ö'c├ÇuS8jÄ²¬z╪u?ª¼f#/c╒ù:Ç@s3≥1µ@ML¿YZ½»πE½0ëa╥┤ª≈4 à┼⌐@φs▀8⌡▒I²(,H`¼ñM¥3⌐▒övâ|ì9ÿ╟z~Ox[▓╓╦X╔yóWwóπ"⌡ô{┬ß1ßΦ²∙>É`┘G«a ¢M┘σV╣æ▓»τmèÿδ½ù╢σ╘╞N╧	ªkë46≤Θ┘╙│╦çÇ∙╟'v.rΓ£ey╢▒¬î┴µ╥╬ïsª-GÜ«oÅ¥îîô÷ö^╦ä┼ƒ╪╖M ZΓ0τlüº⌐ñû┬⌠╘µ▒GX%U≥ê╟£#:m ½≥ûƒ»áíφCñ╤⌠%q∞≤°XùOæ/R┴Φëa¡Ä░╓*óâ!,═┌B÷ O z8¥r!kΘ8ç║7éu%X╛=%╝Ü■|ÅΩs┬ƒ─£Vª:σó└º─┤S╤åàú╩M╟τδ≈ q}¥v─▌╠#╘⌠p⌠êÆû▐≡8%8
 M¿▄Æ╒╦w₧█-⌠g√0ÇN╫Öε┴¢»U▒Oo/ ì[δ┌¡╛éaxëτ3@Σ+Y²ÉoÇ╜æ y±║¥Ç╟╩ ì$r│ÿ{₧µ╦ì·Ñ ï Üw+ä:\ù╝╢╘äìåoN±┐âfW£n²O╦SzÖn Iz╞
╠·█⌡I|RnM┐ g).α AáëÜ²$É ª+KU{╫╚╡░f9Φ5¼ºi$⌡`Σ½bçtgîx▓¡s⌠╝┬T9┘├i⌠~H	√«Ç4ùf«zû≈N_++^q]
wα:╞╪Å¥D═L╜╩u╖é±ƒ║æ▄.⌠╦Γ3╦f╛╦Θ╕å-Y+C├┤£≤ë∩öq╒q0H/h$l4*ExR{╚¿"~û╙├ƒΓ⌠0└╠s⌠~5ƒ╧efª╦c{Ä▌⌐>≈╣«═7
7¬╟╣║Zn∙[s9_╧µ≥Üσ%~╗┌|5ôÑτkí╟U|2ª╣╗╬u?hED½Gxj+ù│Gm╒ÿ*æSÖâ½╖bΓ■l&┴w3It╢ìvΩK█_»╩╥Bb3g:G┼πí≈7[ε∞├\¬╠tX/≤Mët>┘▓┌▓δG░└∩|w
)ad▓≡âDL0aR┐╜Ç
^P╒±╨s╢╛æ░Rç¼äì√û[9Ç¬ ╪PÇÑ*╛é¥Ç─╩3ßÜ4║;
sp8F┐ç#╠+KÄW²ε╒cì╞zÉα]╥≤*▒╫$░O┌:─┌=DÄσ√b`i┌>±pÖae;íé±ⁿ+c│┤╦*mïÿÄF/π *∙┐h@ÿ┌┌°Σ╨╕v(y±å£2ô¼¢√Äδ∩!º]úëa╙u#Çëv\w}│%£:¥.≥àëΣº╠ΘµD≥µs┘╦ì~Σ;S│█né╦5_,ª:X≤ÿùD═┘qmπ7ÆE:;\▌tF_}8·ü>╢"₧Rú¥ö▀Ö▐¼║{]εR║ÄuVïNëÄτ▒aƒyßhÜ┐σïBy-ñ■²X¿Ω▀²╚2;#C▓_öeß≡╦╝5ⁿ~L╢@UòÄ|bî½n:K±6∩{^ $|≤ ║ÿ;^ε&ò\╢c:└k;╖"ô█░àêôº^V╦v·╙≥¡KrΣ?╦Y│8Wâwg£σU╔┬A{╧⌡3u╜rOßMKÑ9∩µ½Å'Ç	qóÉ·∞¼í09cZ±Jδ╕L
¼îU▒≈½¬≈
╚ñ:▄[εo┴°Ä`╚#╧└tæ─@M╜v═B6φò=∞7tò¿2╔Ao$²^ñÅα├	åσ≈╖ên╚3Y¥Æ¼bw₧AD─¢úM≤;╨╡¥ú"¬ë·¡bSRä┼[
F⌡°A┐*é⌡╗≥½23∙╒ª╣('d)NòñZt/â┼nK²\╚hT╫å╗╖{do.»Rìe╪B:ªæ=┌"^c76≡hÅ─Ä}▄Γ*╬	JÿµLñÖ\Φ514éV┐⌐µ╗%╬g▒3^oΦ£è═Jq╣╫Φ¡^Æ{bÖj╧U≤ò╥ù┴ú▀}<ü┬=Lä¿ÜCBqG╞ëCy:B£ë~ é┌}v┬%:æ╒o╘|_á8Nÿ±÷ÑV╤uºB¬╒╩É≥┴r:
5@kJæ░±ε╨▌#∙├	öç0Dδ┤Ç(2├₧#öwæí÷Y╨b¢*"≡aτ¿ä╟Tσ\⌡╩eo+Pô°LáJOxO┼ëï┘)\└┼ß>Z▓RaW≥ìƒ^î#µójµ÷▒╖òx_─±╟úG╟jªwwG5▌ÿq╘░╠æσ╦b─▓m¥rN3=A<▀╔z3└▀■°{ó┼1é4ô├≤v⌐µ@9╟±)▒Wz≥X>tü
Å▌┬ÿk5(`∙Ω:╟≡Z÷∞
_!π@»,^kå╦;┴ßVªO8%åóZücA6E└7í²Æ=ε9Üñε≤ä;╛D▓ⁿ3Æ≈X╖ ¡╛Eá╞ⁿ┐E@>╪ °≤iYVÿ
╟└ÑTs{┐û¡å¿ûU┼═£nàæé╡tï±]╓╚½QF#,▒Gv[q╛Üù1#╖1¬╞╚╧/Ç:n¬τ╗N₧τì▒₧÷^ë^±½ú,╔Γ\ÿ5¢░,/ï≤²¬,MCYöΣ
╘xo¡╙µ2»;n╜≈╞|ìë▐üUFj#└áyxò╢│ñ▄─▌JLíê╪ëcGêHë╖└P╪ág¢Oⁿ▐YºT┐├:┐▐╥bv╨Ö
≡6D∙}4üºΣ²r~<██╬∩DeàzCû^ß╛╦║{}εFmCÿ'═99\╢V≡┤ a┌K::Nªª«Åc<b{Ä<ûà├;G╔¢k╙─#[O╟∙Ç½Σ╕╥╖├X?Ä⌐b¡P>[║╦┬╚eù⌐½|8ky║e²╩·u╫fj~%U┌Oα⌐▌╝ =w2┐m▄▓├áÑ¿6]∩M╫+v▓╝?dìƒ┐ ₧¼±⌠gªù═:#Q╦º▌╡kτ╛▀─▄▐M£¡╝╡-XφNJε╓Å~b▀0╟ß)╡Äo╔ñ╖Oah½iWóπ╬⌡╚=⌠Σ
╘t@┐EΩ╥
7ƒ┘╤╣
V┘
Äç╛ΓU╘∙╨∙╫·║-*Yù(y}½G█êÑ{<ªmZ╥[Ωà#≥L¿╜+æK½╬┴╡ ä■u \k%∙╫.─ƒ
∩{óq%■─Qü9εⁿ■N╕»╡. z*═·òêxÑ,²├Γ╕C▌₧█σNYδ/Årô╒┼mV⌡]f≥U¢5¿"Húb¬C¥<&¡░	|xÜ─Ä+[┤╜d⌠u
S«{^:R∞ ¢┐g9±dN║Ñ┌≈∙q4└Çùτàφ▒uRñΓ¡ò╟n°.úⁿj╜DúBm£»°«┌6!═≈«w|├1]═Q]>E┘┌¼ⁿ2┼Ä«`ÿ°█°d▓µ3gg;√rÉúkê(]4╢╨b╚╔┬bo┘■Φ╒#Θàb8>ÿg▓l┐+æ▐φ"è²XºÜ├¬ß.≤α:╤(½>£▐φ ö≡ÇIÑ░b½o∩oo┤cv∙░╨≥Gv╠>ª≤?▐Å╔ÜÇ$3│¥▐í¿m┬í±Φy⌠K┤/Σ½▌<·√Ñ╟kµz.ê╣r∩Æ^5YY},Uf<├⌐/-<e½6Q╩⌡<Ö£δπï_▒╜δiy╩┴ô[-ä≡≈å«∩╥Å└3│"≤Σ∙(x]J½≤~∞▌╠ε▄á{NTƒ#╓█G■çú╚ªTC8G≥'┐╩.Ñiÿ2&
∞1σòJΣaJ∞ d}⌠╤[.îKî?▓>ƒ<α╝ú⌡∙g ╔│ö-╡■í#▓ª╔VX/▓¿9Ü<─╛∩
T│ε\ùE÷ü┤câtÇ│┘╠'N=¡¼╡╗πÖ+╣ii╫░Ljìó7Æ┌├ⁿ╨/? 
╟w$ûò°┘╡}▐èUÖ¿VX,┤│{ë├═f╗▌g∙┤╨£δDî╡■x:û4GÑ"B╜ⁿô .╜y|┼·T│ ^Ä╬⌐▌╗Ωå│}|C*┘&Uí▀sò▀¥ßfEq÷╧╧│┘∞┐ƒÄ╠╤      É   h   x£3Σ═╦,Qp╠)╚HΣ500ΣtL/╩L.═))-J╠Q(Iªσ) ⌐2Σî±πLL.╔,Kσ4202╒50╫54U00╡21▓2▒─&╞e▒╞)╡lï>[└èî╚░$FÅïï cK7î      ü   ⌡  x£uÉKôó0F╫ßW╕p█Hä╒ê┌╛PGmƒe╒TΣ%┌≥░ü_? ú5╬╪u│╕∙R799┤]╙
k■9▒0╦₧┐⌡?ⁿ33\¢±√s vcPGYó║c7Ü||Sk╨Θ£«n┤o\∙╔Ñ╡rºÆ¥Ω₧»╙₧ ╛¥V║╕∙▓[ç\N╩y$ ΘMÉ▀ ⌐AAæºü*╤
T8é¼@äEë╚σ
╔╔ì-V₧│}∞^¡ö┘]çÆ7≈Vf├}:│⌡öXΓ¡7Öv╨╝≡╘▓CmöÅ√b╝╡g)¢T╓éWY±|▒ qCêv┤
>·çÅA╙	,│╓7Bµ╕`σÄw½▌7.[²├┼!C"jm╢ñδ$₧Æ≡±Xë∙nΦ╕ìÅΦΦw╝╝δì∞e|^*ƒ▒&≤ ║D*F*ö^f7$pG*hEÖbQ╩;+0■9X∙∞sΣ
j¥/¢«Ö²dì,╨ε╨╚╢8?8Y0▀á└\;Q─╙t┘Oì	ÇEUéεÜdæ(┼a*êΦ!+èî╩A╨4≈T[D%A┘~cHW>G$ûP#Dë╒╥Nδª▀¢XW¥«hcålE▓¼╡▀G█ⁿJ╥^Φ╘█L₧I5AREñJ≡╔V1TíPqÇG┼~ú╣[yⁿΦ╒Φ½∞o╗1╖π9Ä√
cφà      Æ   |   x£3Σ⌠╦/*╔Pê╩╧Kσ⌠ïé≡Rï≥╙ï2ôKsJJïs¬@▓1~£ë╔%Öe⌐£FFª║µ║åª
ªV&FV&ûX┼bⁿ╕î8â≤KaµGAxT4▀ÿ╙5▒╕b╝kÿCE╙M8├SaªçGü9T4=FÅïï ▒iL     
