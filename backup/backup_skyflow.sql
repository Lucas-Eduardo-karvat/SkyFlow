--
-- PostgreSQL database dump
--

\restrict PEAchS0Td0r67wX7eA8dnPRqPqLoqxLEAwtPhqbau56Ncz05TvQHhDsn1gLRo2u

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: listar_reservas(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.listar_reservas()
    LANGUAGE plpgsql
    AS $$
DECLARE
    r RECORD;

    cur CURSOR FOR
        SELECT localizador, status
        FROM reservas;
BEGIN

    OPEN cur;

    LOOP
        FETCH cur INTO r;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Reserva: %, Status: %',
            r.localizador,
            r.status;

    END LOOP;

    CLOSE cur;

END;
$$;


ALTER PROCEDURE public.listar_reservas() OWNER TO postgres;

--
-- Name: registrar_historico(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.registrar_historico() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

    INSERT INTO historico_reservas (
        reserva_id,
        operacao,
        status_antigo,
        status_novo,
        data_alteracao
    )
    VALUES (
        OLD.id,
        'UPDATE',
        OLD.status,
        NEW.status,
        CURRENT_TIMESTAMP
    );

    RETURN NEW;

END;
$$;


ALTER FUNCTION public.registrar_historico() OWNER TO postgres;

--
-- Name: reservar_assento(character varying, bigint, bigint, bigint, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.reservar_assento(IN p_localizador character varying, IN p_passageiro bigint, IN p_voo bigint, IN p_assento bigint, IN p_valor numeric)
    LANGUAGE plpgsql
    AS $$

BEGIN

    IF EXISTS (

        SELECT 1

        FROM assentos

        WHERE id=p_assento

        AND disponivel=false

    )

    THEN

        RAISE EXCEPTION 'Assento indisponível';

    END IF;

    INSERT INTO reservas(

        localizador,

        passageiro_id,

        voo_id,

        assento_id,

        valor_pago,

        status

    )

    VALUES(

        p_localizador,

        p_passageiro,

        p_voo,

        p_assento,

        p_valor,

        'CONFIRMADA'

    );

    UPDATE assentos

    SET disponivel=false

    WHERE id=p_assento;

END;

$$;


ALTER PROCEDURE public.reservar_assento(IN p_localizador character varying, IN p_passageiro bigint, IN p_voo bigint, IN p_assento bigint, IN p_valor numeric) OWNER TO postgres;

--
-- Name: validar_voo_cancelado(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_voo_cancelado() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    status_voo VARCHAR(20);
BEGIN

    SELECT status
    INTO status_voo
    FROM voos
    WHERE id = NEW.voo_id;

    IF status_voo = 'CANCELADO' THEN
        RAISE EXCEPTION 'Não é permitido reservar um voo cancelado.';
    END IF;

    RETURN NEW;

END;
$$;


ALTER FUNCTION public.validar_voo_cancelado() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aeronaves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aeronaves (
    id bigint NOT NULL,
    modelo character varying(100) NOT NULL,
    fabricante character varying(100) NOT NULL,
    capacidade integer NOT NULL,
    companhia_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT aeronaves_capacidade_check CHECK ((capacidade > 0))
);


ALTER TABLE public.aeronaves OWNER TO postgres;

--
-- Name: aeronaves_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aeronaves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aeronaves_id_seq OWNER TO postgres;

--
-- Name: aeronaves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aeronaves_id_seq OWNED BY public.aeronaves.id;


--
-- Name: aeroportos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aeroportos (
    id bigint NOT NULL,
    codigo_iata character(3) NOT NULL,
    nome character varying(150) NOT NULL,
    cidade character varying(100) NOT NULL,
    estado character varying(100),
    pais character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.aeroportos OWNER TO postgres;

--
-- Name: aeroportos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aeroportos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aeroportos_id_seq OWNER TO postgres;

--
-- Name: aeroportos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aeroportos_id_seq OWNED BY public.aeroportos.id;


--
-- Name: assentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assentos (
    id bigint NOT NULL,
    voo_id bigint NOT NULL,
    numero character varying(5) NOT NULL,
    classe_id bigint NOT NULL,
    disponivel boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.assentos OWNER TO postgres;

--
-- Name: assentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assentos_id_seq OWNER TO postgres;

--
-- Name: assentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assentos_id_seq OWNED BY public.assentos.id;


--
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    id bigint NOT NULL,
    nome character varying(50) NOT NULL,
    descricao text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classes_id_seq OWNER TO postgres;

--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- Name: companhias_aereas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companhias_aereas (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL,
    codigo_iata character(2) NOT NULL,
    pais character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.companhias_aereas OWNER TO postgres;

--
-- Name: companhias_aereas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companhias_aereas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companhias_aereas_id_seq OWNER TO postgres;

--
-- Name: companhias_aereas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companhias_aereas_id_seq OWNED BY public.companhias_aereas.id;


--
-- Name: escalas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.escalas (
    id bigint NOT NULL,
    voo_id bigint NOT NULL,
    aeroporto_id bigint NOT NULL,
    ordem integer NOT NULL,
    horario_chegada timestamp without time zone,
    horario_saida timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.escalas OWNER TO postgres;

--
-- Name: escalas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.escalas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.escalas_id_seq OWNER TO postgres;

--
-- Name: escalas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.escalas_id_seq OWNED BY public.escalas.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: historico_reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_reservas (
    id bigint NOT NULL,
    reserva_id bigint NOT NULL,
    operacao character varying(30) NOT NULL,
    status_antigo character varying(20),
    status_novo character varying(20),
    usuario_alteracao character varying(100),
    data_alteracao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.historico_reservas OWNER TO postgres;

--
-- Name: historico_reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historico_reservas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historico_reservas_id_seq OWNER TO postgres;

--
-- Name: historico_reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historico_reservas_id_seq OWNED BY public.historico_reservas.id;


--
-- Name: voos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voos (
    id bigint NOT NULL,
    numero_voo character varying(20) NOT NULL,
    origem_id bigint NOT NULL,
    destino_id bigint NOT NULL,
    aeronave_id bigint NOT NULL,
    data_partida timestamp without time zone NOT NULL,
    data_chegada timestamp without time zone NOT NULL,
    preco numeric(10,2) NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT voos_status_check CHECK (((status)::text = ANY ((ARRAY['AGENDADO'::character varying, 'CANCELADO'::character varying, 'FINALIZADO'::character varying])::text[])))
);


ALTER TABLE public.voos OWNER TO postgres;

--
-- Name: vw_voos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_voos AS
 SELECT v.id,
    v.numero_voo,
    o.cidade AS origem,
    d.cidade AS destino,
    v.data_partida,
    v.data_chegada,
    v.preco,
    v.status
   FROM ((public.voos v
     JOIN public.aeroportos o ON ((o.id = v.origem_id)))
     JOIN public.aeroportos d ON ((d.id = v.destino_id)));


ALTER VIEW public.vw_voos OWNER TO postgres;

--
-- Name: mv_voos_agendados; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.mv_voos_agendados AS
 SELECT id,
    numero_voo,
    origem,
    destino,
    data_partida,
    data_chegada,
    preco,
    status
   FROM public.vw_voos
  WHERE ((status)::text = 'AGENDADO'::text)
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.mv_voos_agendados OWNER TO postgres;

--
-- Name: passageiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passageiros (
    id bigint NOT NULL,
    nome character varying(150) NOT NULL,
    cpf character varying(14) NOT NULL,
    email character varying(150) NOT NULL,
    telefone character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.passageiros OWNER TO postgres;

--
-- Name: passageiros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passageiros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passageiros_id_seq OWNER TO postgres;

--
-- Name: passageiros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passageiros_id_seq OWNED BY public.passageiros.id;


--
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id bigint NOT NULL,
    localizador character varying(20) NOT NULL,
    passageiro_id bigint NOT NULL,
    voo_id bigint NOT NULL,
    assento_id bigint NOT NULL,
    data_reserva timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    valor_pago numeric(10,2),
    status character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reservas_status_check CHECK (((status)::text = ANY ((ARRAY['CONFIRMADA'::character varying, 'CANCELADA'::character varying, 'CHECKIN'::character varying])::text[])))
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservas_id_seq OWNER TO postgres;

--
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


--
-- Name: voos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.voos_id_seq OWNER TO postgres;

--
-- Name: voos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voos_id_seq OWNED BY public.voos.id;


--
-- Name: vw_assentos_disponiveis; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_assentos_disponiveis AS
 SELECT a.id,
    a.numero,
    c.nome AS classe,
    v.numero_voo
   FROM ((public.assentos a
     JOIN public.classes c ON ((c.id = a.classe_id)))
     JOIN public.voos v ON ((v.id = a.voo_id)))
  WHERE (a.disponivel = true);


ALTER VIEW public.vw_assentos_disponiveis OWNER TO postgres;

--
-- Name: vw_reservas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_reservas AS
 SELECT r.id,
    r.localizador,
    p.nome AS passageiro,
    v.numero_voo,
    a.numero AS assento,
    r.status,
    r.valor_pago,
    r.data_reserva
   FROM (((public.reservas r
     JOIN public.passageiros p ON ((p.id = r.passageiro_id)))
     JOIN public.voos v ON ((v.id = r.voo_id)))
     JOIN public.assentos a ON ((a.id = r.assento_id)));


ALTER VIEW public.vw_reservas OWNER TO postgres;

--
-- Name: aeronaves id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeronaves ALTER COLUMN id SET DEFAULT nextval('public.aeronaves_id_seq'::regclass);


--
-- Name: aeroportos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeroportos ALTER COLUMN id SET DEFAULT nextval('public.aeroportos_id_seq'::regclass);


--
-- Name: assentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assentos ALTER COLUMN id SET DEFAULT nextval('public.assentos_id_seq'::regclass);


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: companhias_aereas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companhias_aereas ALTER COLUMN id SET DEFAULT nextval('public.companhias_aereas_id_seq'::regclass);


--
-- Name: escalas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalas ALTER COLUMN id SET DEFAULT nextval('public.escalas_id_seq'::regclass);


--
-- Name: historico_reservas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_reservas ALTER COLUMN id SET DEFAULT nextval('public.historico_reservas_id_seq'::regclass);


--
-- Name: passageiros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passageiros ALTER COLUMN id SET DEFAULT nextval('public.passageiros_id_seq'::regclass);


--
-- Name: reservas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);


--
-- Name: voos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos ALTER COLUMN id SET DEFAULT nextval('public.voos_id_seq'::regclass);


--
-- Data for Name: aeronaves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aeronaves (id, modelo, fabricante, capacidade, companhia_id, created_at) FROM stdin;
1	A320neo	Airbus	174	1	2026-06-20 09:34:12.247658
2	Boeing 737-800	Boeing	186	2	2026-06-20 09:34:12.247658
3	Embraer E195-E2	Embraer	136	3	2026-06-20 09:34:12.247658
4	Airbus A321neo	Airbus	220	1	2026-06-20 09:34:12.247658
5	Boeing 737 MAX 8	Boeing	176	2	2026-06-20 09:34:12.247658
6	ATR 72-600	ATR	70	3	2026-06-20 09:34:12.247658
\.


--
-- Data for Name: aeroportos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aeroportos (id, codigo_iata, nome, cidade, estado, pais, created_at) FROM stdin;
1	GRU	Aeroporto Internacional de Guarulhos	Guarulhos	SP	Brasil	2026-06-20 09:34:12.247658
2	CGH	Aeroporto de Congonhas	São Paulo	SP	Brasil	2026-06-20 09:34:12.247658
3	VCP	Aeroporto Internacional de Viracopos	Campinas	SP	Brasil	2026-06-20 09:34:12.247658
4	BSB	Aeroporto Internacional de Brasília	Brasília	DF	Brasil	2026-06-20 09:34:12.247658
5	GIG	Aeroporto Internacional do Galeão	Rio de Janeiro	RJ	Brasil	2026-06-20 09:34:12.247658
6	SDU	Aeroporto Santos Dumont	Rio de Janeiro	RJ	Brasil	2026-06-20 09:34:12.247658
7	CNF	Aeroporto Internacional de Confins	Belo Horizonte	MG	Brasil	2026-06-20 09:34:12.247658
8	SSA	Aeroporto Internacional de Salvador	Salvador	BA	Brasil	2026-06-20 09:34:12.247658
9	REC	Aeroporto Internacional do Recife	Recife	PE	Brasil	2026-06-20 09:34:12.247658
10	FOR	Aeroporto Internacional Pinto Martins	Fortaleza	CE	Brasil	2026-06-20 09:34:12.247658
\.


--
-- Data for Name: assentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assentos (id, voo_id, numero, classe_id, disponivel, created_at) FROM stdin;
9	9	E1	1	t	2026-06-20 09:34:12.280043
10	10	E1	1	t	2026-06-20 09:34:12.280043
13	3	E2	1	t	2026-06-20 09:34:12.280043
14	4	E2	1	t	2026-06-20 09:34:12.280043
15	5	E2	1	t	2026-06-20 09:34:12.280043
16	6	E2	1	t	2026-06-20 09:34:12.280043
17	7	E2	1	t	2026-06-20 09:34:12.280043
18	8	E2	1	t	2026-06-20 09:34:12.280043
19	9	E2	1	t	2026-06-20 09:34:12.280043
20	10	E2	1	t	2026-06-20 09:34:12.280043
21	1	E3	1	t	2026-06-20 09:34:12.280043
22	2	E3	1	t	2026-06-20 09:34:12.280043
23	3	E3	1	t	2026-06-20 09:34:12.280043
24	4	E3	1	t	2026-06-20 09:34:12.280043
25	5	E3	1	t	2026-06-20 09:34:12.280043
26	6	E3	1	t	2026-06-20 09:34:12.280043
27	7	E3	1	t	2026-06-20 09:34:12.280043
28	8	E3	1	t	2026-06-20 09:34:12.280043
29	9	E3	1	t	2026-06-20 09:34:12.280043
30	10	E3	1	t	2026-06-20 09:34:12.280043
31	1	E4	1	t	2026-06-20 09:34:12.280043
32	2	E4	1	t	2026-06-20 09:34:12.280043
33	3	E4	1	t	2026-06-20 09:34:12.280043
34	4	E4	1	t	2026-06-20 09:34:12.280043
35	5	E4	1	t	2026-06-20 09:34:12.280043
36	6	E4	1	t	2026-06-20 09:34:12.280043
37	7	E4	1	t	2026-06-20 09:34:12.280043
38	8	E4	1	t	2026-06-20 09:34:12.280043
39	9	E4	1	t	2026-06-20 09:34:12.280043
40	10	E4	1	t	2026-06-20 09:34:12.280043
41	1	E5	1	t	2026-06-20 09:34:12.280043
42	2	E5	1	t	2026-06-20 09:34:12.280043
43	3	E5	1	t	2026-06-20 09:34:12.280043
44	4	E5	1	t	2026-06-20 09:34:12.280043
45	5	E5	1	t	2026-06-20 09:34:12.280043
46	6	E5	1	t	2026-06-20 09:34:12.280043
47	7	E5	1	t	2026-06-20 09:34:12.280043
48	8	E5	1	t	2026-06-20 09:34:12.280043
49	9	E5	1	t	2026-06-20 09:34:12.280043
50	10	E5	1	t	2026-06-20 09:34:12.280043
51	1	E6	1	t	2026-06-20 09:34:12.280043
52	2	E6	1	t	2026-06-20 09:34:12.280043
53	3	E6	1	t	2026-06-20 09:34:12.280043
54	4	E6	1	t	2026-06-20 09:34:12.280043
55	5	E6	1	t	2026-06-20 09:34:12.280043
56	6	E6	1	t	2026-06-20 09:34:12.280043
57	7	E6	1	t	2026-06-20 09:34:12.280043
58	8	E6	1	t	2026-06-20 09:34:12.280043
59	9	E6	1	t	2026-06-20 09:34:12.280043
60	10	E6	1	t	2026-06-20 09:34:12.280043
61	1	E7	1	t	2026-06-20 09:34:12.280043
62	2	E7	1	t	2026-06-20 09:34:12.280043
63	3	E7	1	t	2026-06-20 09:34:12.280043
64	4	E7	1	t	2026-06-20 09:34:12.280043
65	5	E7	1	t	2026-06-20 09:34:12.280043
66	6	E7	1	t	2026-06-20 09:34:12.280043
67	7	E7	1	t	2026-06-20 09:34:12.280043
68	8	E7	1	t	2026-06-20 09:34:12.280043
69	9	E7	1	t	2026-06-20 09:34:12.280043
70	10	E7	1	t	2026-06-20 09:34:12.280043
71	1	E8	1	t	2026-06-20 09:34:12.280043
72	2	E8	1	t	2026-06-20 09:34:12.280043
73	3	E8	1	t	2026-06-20 09:34:12.280043
74	4	E8	1	t	2026-06-20 09:34:12.280043
75	5	E8	1	t	2026-06-20 09:34:12.280043
76	6	E8	1	t	2026-06-20 09:34:12.280043
77	7	E8	1	t	2026-06-20 09:34:12.280043
78	8	E8	1	t	2026-06-20 09:34:12.280043
79	9	E8	1	t	2026-06-20 09:34:12.280043
80	10	E8	1	t	2026-06-20 09:34:12.280043
81	1	E9	1	t	2026-06-20 09:34:12.280043
82	2	E9	1	t	2026-06-20 09:34:12.280043
83	3	E9	1	t	2026-06-20 09:34:12.280043
84	4	E9	1	t	2026-06-20 09:34:12.280043
85	5	E9	1	t	2026-06-20 09:34:12.280043
86	6	E9	1	t	2026-06-20 09:34:12.280043
87	7	E9	1	t	2026-06-20 09:34:12.280043
88	8	E9	1	t	2026-06-20 09:34:12.280043
89	9	E9	1	t	2026-06-20 09:34:12.280043
90	10	E9	1	t	2026-06-20 09:34:12.280043
91	1	E10	1	t	2026-06-20 09:34:12.280043
92	2	E10	1	t	2026-06-20 09:34:12.280043
93	3	E10	1	t	2026-06-20 09:34:12.280043
94	4	E10	1	t	2026-06-20 09:34:12.280043
95	5	E10	1	t	2026-06-20 09:34:12.280043
96	6	E10	1	t	2026-06-20 09:34:12.280043
97	7	E10	1	t	2026-06-20 09:34:12.280043
98	8	E10	1	t	2026-06-20 09:34:12.280043
99	9	E10	1	t	2026-06-20 09:34:12.280043
100	10	E10	1	t	2026-06-20 09:34:12.280043
101	1	X1	2	t	2026-06-20 09:34:12.280043
102	2	X1	2	t	2026-06-20 09:34:12.280043
103	3	X1	2	t	2026-06-20 09:34:12.280043
104	4	X1	2	t	2026-06-20 09:34:12.280043
105	5	X1	2	t	2026-06-20 09:34:12.280043
106	6	X1	2	t	2026-06-20 09:34:12.280043
107	7	X1	2	t	2026-06-20 09:34:12.280043
108	8	X1	2	t	2026-06-20 09:34:12.280043
109	9	X1	2	t	2026-06-20 09:34:12.280043
110	10	X1	2	t	2026-06-20 09:34:12.280043
111	1	X2	2	t	2026-06-20 09:34:12.280043
112	2	X2	2	t	2026-06-20 09:34:12.280043
113	3	X2	2	t	2026-06-20 09:34:12.280043
114	4	X2	2	t	2026-06-20 09:34:12.280043
115	5	X2	2	t	2026-06-20 09:34:12.280043
116	6	X2	2	t	2026-06-20 09:34:12.280043
117	7	X2	2	t	2026-06-20 09:34:12.280043
118	8	X2	2	t	2026-06-20 09:34:12.280043
119	9	X2	2	t	2026-06-20 09:34:12.280043
120	10	X2	2	t	2026-06-20 09:34:12.280043
121	1	X3	2	t	2026-06-20 09:34:12.280043
122	2	X3	2	t	2026-06-20 09:34:12.280043
123	3	X3	2	t	2026-06-20 09:34:12.280043
124	4	X3	2	t	2026-06-20 09:34:12.280043
125	5	X3	2	t	2026-06-20 09:34:12.280043
126	6	X3	2	t	2026-06-20 09:34:12.280043
127	7	X3	2	t	2026-06-20 09:34:12.280043
128	8	X3	2	t	2026-06-20 09:34:12.280043
129	9	X3	2	t	2026-06-20 09:34:12.280043
130	10	X3	2	t	2026-06-20 09:34:12.280043
131	1	X4	2	t	2026-06-20 09:34:12.280043
132	2	X4	2	t	2026-06-20 09:34:12.280043
133	3	X4	2	t	2026-06-20 09:34:12.280043
134	4	X4	2	t	2026-06-20 09:34:12.280043
135	5	X4	2	t	2026-06-20 09:34:12.280043
136	6	X4	2	t	2026-06-20 09:34:12.280043
137	7	X4	2	t	2026-06-20 09:34:12.280043
138	8	X4	2	t	2026-06-20 09:34:12.280043
139	9	X4	2	t	2026-06-20 09:34:12.280043
140	10	X4	2	t	2026-06-20 09:34:12.280043
141	1	X5	2	t	2026-06-20 09:34:12.280043
142	2	X5	2	t	2026-06-20 09:34:12.280043
143	3	X5	2	t	2026-06-20 09:34:12.280043
144	4	X5	2	t	2026-06-20 09:34:12.280043
145	5	X5	2	t	2026-06-20 09:34:12.280043
146	6	X5	2	t	2026-06-20 09:34:12.280043
147	7	X5	2	t	2026-06-20 09:34:12.280043
148	8	X5	2	t	2026-06-20 09:34:12.280043
149	9	X5	2	t	2026-06-20 09:34:12.280043
150	10	X5	2	t	2026-06-20 09:34:12.280043
151	1	X6	2	t	2026-06-20 09:34:12.280043
152	2	X6	2	t	2026-06-20 09:34:12.280043
153	3	X6	2	t	2026-06-20 09:34:12.280043
154	4	X6	2	t	2026-06-20 09:34:12.280043
155	5	X6	2	t	2026-06-20 09:34:12.280043
156	6	X6	2	t	2026-06-20 09:34:12.280043
157	7	X6	2	t	2026-06-20 09:34:12.280043
158	8	X6	2	t	2026-06-20 09:34:12.280043
159	9	X6	2	t	2026-06-20 09:34:12.280043
160	10	X6	2	t	2026-06-20 09:34:12.280043
161	1	X7	2	t	2026-06-20 09:34:12.280043
162	2	X7	2	t	2026-06-20 09:34:12.280043
163	3	X7	2	t	2026-06-20 09:34:12.280043
164	4	X7	2	t	2026-06-20 09:34:12.280043
165	5	X7	2	t	2026-06-20 09:34:12.280043
166	6	X7	2	t	2026-06-20 09:34:12.280043
167	7	X7	2	t	2026-06-20 09:34:12.280043
168	8	X7	2	t	2026-06-20 09:34:12.280043
169	9	X7	2	t	2026-06-20 09:34:12.280043
170	10	X7	2	t	2026-06-20 09:34:12.280043
171	1	X8	2	t	2026-06-20 09:34:12.280043
172	2	X8	2	t	2026-06-20 09:34:12.280043
173	3	X8	2	t	2026-06-20 09:34:12.280043
174	4	X8	2	t	2026-06-20 09:34:12.280043
175	5	X8	2	t	2026-06-20 09:34:12.280043
176	6	X8	2	t	2026-06-20 09:34:12.280043
177	7	X8	2	t	2026-06-20 09:34:12.280043
178	8	X8	2	t	2026-06-20 09:34:12.280043
179	9	X8	2	t	2026-06-20 09:34:12.280043
180	10	X8	2	t	2026-06-20 09:34:12.280043
181	1	X9	2	t	2026-06-20 09:34:12.280043
182	2	X9	2	t	2026-06-20 09:34:12.280043
183	3	X9	2	t	2026-06-20 09:34:12.280043
184	4	X9	2	t	2026-06-20 09:34:12.280043
185	5	X9	2	t	2026-06-20 09:34:12.280043
186	6	X9	2	t	2026-06-20 09:34:12.280043
187	7	X9	2	t	2026-06-20 09:34:12.280043
188	8	X9	2	t	2026-06-20 09:34:12.280043
189	9	X9	2	t	2026-06-20 09:34:12.280043
190	10	X9	2	t	2026-06-20 09:34:12.280043
191	1	X10	2	t	2026-06-20 09:34:12.280043
192	2	X10	2	t	2026-06-20 09:34:12.280043
193	3	X10	2	t	2026-06-20 09:34:12.280043
194	4	X10	2	t	2026-06-20 09:34:12.280043
195	5	X10	2	t	2026-06-20 09:34:12.280043
196	6	X10	2	t	2026-06-20 09:34:12.280043
197	7	X10	2	t	2026-06-20 09:34:12.280043
198	8	X10	2	t	2026-06-20 09:34:12.280043
199	9	X10	2	t	2026-06-20 09:34:12.280043
200	10	X10	2	t	2026-06-20 09:34:12.280043
201	1	P1	3	t	2026-06-20 09:34:12.280043
202	2	P1	3	t	2026-06-20 09:34:12.280043
203	3	P1	3	t	2026-06-20 09:34:12.280043
204	4	P1	3	t	2026-06-20 09:34:12.280043
205	5	P1	3	t	2026-06-20 09:34:12.280043
206	6	P1	3	t	2026-06-20 09:34:12.280043
207	7	P1	3	t	2026-06-20 09:34:12.280043
208	8	P1	3	t	2026-06-20 09:34:12.280043
209	9	P1	3	t	2026-06-20 09:34:12.280043
210	10	P1	3	t	2026-06-20 09:34:12.280043
211	1	P2	3	t	2026-06-20 09:34:12.280043
212	2	P2	3	t	2026-06-20 09:34:12.280043
213	3	P2	3	t	2026-06-20 09:34:12.280043
214	4	P2	3	t	2026-06-20 09:34:12.280043
215	5	P2	3	t	2026-06-20 09:34:12.280043
216	6	P2	3	t	2026-06-20 09:34:12.280043
217	7	P2	3	t	2026-06-20 09:34:12.280043
218	8	P2	3	t	2026-06-20 09:34:12.280043
219	9	P2	3	t	2026-06-20 09:34:12.280043
220	10	P2	3	t	2026-06-20 09:34:12.280043
221	1	P3	3	t	2026-06-20 09:34:12.280043
222	2	P3	3	t	2026-06-20 09:34:12.280043
223	3	P3	3	t	2026-06-20 09:34:12.280043
224	4	P3	3	t	2026-06-20 09:34:12.280043
225	5	P3	3	t	2026-06-20 09:34:12.280043
226	6	P3	3	t	2026-06-20 09:34:12.280043
227	7	P3	3	t	2026-06-20 09:34:12.280043
228	8	P3	3	t	2026-06-20 09:34:12.280043
229	9	P3	3	t	2026-06-20 09:34:12.280043
230	10	P3	3	t	2026-06-20 09:34:12.280043
231	1	P4	3	t	2026-06-20 09:34:12.280043
232	2	P4	3	t	2026-06-20 09:34:12.280043
233	3	P4	3	t	2026-06-20 09:34:12.280043
234	4	P4	3	t	2026-06-20 09:34:12.280043
235	5	P4	3	t	2026-06-20 09:34:12.280043
236	6	P4	3	t	2026-06-20 09:34:12.280043
237	7	P4	3	t	2026-06-20 09:34:12.280043
238	8	P4	3	t	2026-06-20 09:34:12.280043
239	9	P4	3	t	2026-06-20 09:34:12.280043
240	10	P4	3	t	2026-06-20 09:34:12.280043
241	1	P5	3	t	2026-06-20 09:34:12.280043
242	2	P5	3	t	2026-06-20 09:34:12.280043
243	3	P5	3	t	2026-06-20 09:34:12.280043
244	4	P5	3	t	2026-06-20 09:34:12.280043
245	5	P5	3	t	2026-06-20 09:34:12.280043
246	6	P5	3	t	2026-06-20 09:34:12.280043
247	7	P5	3	t	2026-06-20 09:34:12.280043
248	8	P5	3	t	2026-06-20 09:34:12.280043
249	9	P5	3	t	2026-06-20 09:34:12.280043
250	10	P5	3	t	2026-06-20 09:34:12.280043
251	1	P6	3	t	2026-06-20 09:34:12.280043
252	2	P6	3	t	2026-06-20 09:34:12.280043
253	3	P6	3	t	2026-06-20 09:34:12.280043
254	4	P6	3	t	2026-06-20 09:34:12.280043
255	5	P6	3	t	2026-06-20 09:34:12.280043
256	6	P6	3	t	2026-06-20 09:34:12.280043
257	7	P6	3	t	2026-06-20 09:34:12.280043
258	8	P6	3	t	2026-06-20 09:34:12.280043
259	9	P6	3	t	2026-06-20 09:34:12.280043
260	10	P6	3	t	2026-06-20 09:34:12.280043
261	1	P7	3	t	2026-06-20 09:34:12.280043
262	2	P7	3	t	2026-06-20 09:34:12.280043
263	3	P7	3	t	2026-06-20 09:34:12.280043
264	4	P7	3	t	2026-06-20 09:34:12.280043
265	5	P7	3	t	2026-06-20 09:34:12.280043
266	6	P7	3	t	2026-06-20 09:34:12.280043
267	7	P7	3	t	2026-06-20 09:34:12.280043
268	8	P7	3	t	2026-06-20 09:34:12.280043
269	9	P7	3	t	2026-06-20 09:34:12.280043
270	10	P7	3	t	2026-06-20 09:34:12.280043
271	1	P8	3	t	2026-06-20 09:34:12.280043
272	2	P8	3	t	2026-06-20 09:34:12.280043
273	3	P8	3	t	2026-06-20 09:34:12.280043
274	4	P8	3	t	2026-06-20 09:34:12.280043
275	5	P8	3	t	2026-06-20 09:34:12.280043
276	6	P8	3	t	2026-06-20 09:34:12.280043
277	7	P8	3	t	2026-06-20 09:34:12.280043
278	8	P8	3	t	2026-06-20 09:34:12.280043
279	9	P8	3	t	2026-06-20 09:34:12.280043
280	10	P8	3	t	2026-06-20 09:34:12.280043
281	1	P9	3	t	2026-06-20 09:34:12.280043
282	2	P9	3	t	2026-06-20 09:34:12.280043
283	3	P9	3	t	2026-06-20 09:34:12.280043
284	4	P9	3	t	2026-06-20 09:34:12.280043
285	5	P9	3	t	2026-06-20 09:34:12.280043
286	6	P9	3	t	2026-06-20 09:34:12.280043
287	7	P9	3	t	2026-06-20 09:34:12.280043
288	8	P9	3	t	2026-06-20 09:34:12.280043
289	9	P9	3	t	2026-06-20 09:34:12.280043
290	10	P9	3	t	2026-06-20 09:34:12.280043
291	1	P10	3	t	2026-06-20 09:34:12.280043
292	2	P10	3	t	2026-06-20 09:34:12.280043
293	3	P10	3	t	2026-06-20 09:34:12.280043
294	4	P10	3	t	2026-06-20 09:34:12.280043
295	5	P10	3	t	2026-06-20 09:34:12.280043
296	6	P10	3	t	2026-06-20 09:34:12.280043
297	7	P10	3	t	2026-06-20 09:34:12.280043
298	8	P10	3	t	2026-06-20 09:34:12.280043
299	9	P10	3	t	2026-06-20 09:34:12.280043
300	10	P10	3	t	2026-06-20 09:34:12.280043
1	1	E1	1	f	2026-06-20 09:34:12.280043
2	2	E1	1	f	2026-06-20 09:34:12.280043
3	3	E1	1	f	2026-06-20 09:34:12.280043
4	4	E1	1	f	2026-06-20 09:34:12.280043
5	5	E1	1	f	2026-06-20 09:34:12.280043
6	6	E1	1	f	2026-06-20 09:34:12.280043
7	7	E1	1	f	2026-06-20 09:34:12.280043
8	8	E1	1	f	2026-06-20 09:34:12.280043
11	1	E2	1	f	2026-06-20 09:34:12.280043
12	2	E2	1	f	2026-06-20 09:34:12.280043
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (id, nome, descricao, created_at) FROM stdin;
1	ECONOMICA	Classe econômica	2026-06-20 09:34:12.247658
2	EXECUTIVA	Classe executiva	2026-06-20 09:34:12.247658
3	PRIMEIRA_CLASSE	Primeira classe	2026-06-20 09:34:12.247658
\.


--
-- Data for Name: companhias_aereas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companhias_aereas (id, nome, codigo_iata, pais, created_at) FROM stdin;
1	LATAM Airlines	LA	Brasil	2026-06-20 09:34:12.247658
2	GOL Linhas Aéreas	G3	Brasil	2026-06-20 09:34:12.247658
3	Azul Linhas Aéreas	AD	Brasil	2026-06-20 09:34:12.247658
\.


--
-- Data for Name: escalas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.escalas (id, voo_id, aeroporto_id, ordem, horario_chegada, horario_saida, created_at) FROM stdin;
1	4	8	1	2026-07-01 14:00:00	2026-07-01 14:30:00	2026-06-20 09:34:12.271226
2	3	4	1	2026-07-01 08:30:00	2026-07-01 09:00:00	2026-06-20 09:34:12.271226
3	7	4	1	2026-07-03 11:20:00	2026-07-03 11:50:00	2026-06-20 09:34:12.271226
4	7	8	2	2026-07-03 12:40:00	2026-07-03 13:00:00	2026-06-20 09:34:12.271226
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	criação banco	SQL	V1__criação_banco.sql	33477957	postgres	2026-06-20 09:34:12.173731	41	t
2	2	insert initial data	SQL	V2__insert_initial_data.sql	1462245111	postgres	2026-06-20 09:34:12.24126	5	t
3	3	insert voos	SQL	V3__insert_voos.sql	-1344397513	postgres	2026-06-20 09:34:12.256305	3	t
4	4	insert escalas	SQL	V4__insert_escalas.sql	-1583285671	postgres	2026-06-20 09:34:12.268018	2	t
5	5	insert assentos	SQL	V5__insert_assentos.sql	-766598394	postgres	2026-06-20 09:34:12.276248	7	t
6	6	insert passageiros	SQL	V6__insert_passageiros.sql	-706306974	postgres	2026-06-20 09:34:12.290091	3	t
7	7	insert reservas	SQL	V7__insert_reservas.sql	544152074	postgres	2026-06-20 09:34:12.29889	7	t
8	8	create indexes	SQL	V8__create_indexes.sql	-668850065	postgres	2026-06-20 09:34:12.313893	8	t
9	9	create views	SQL	V9__create_views.sql	1439560401	postgres	2026-06-20 09:34:12.327641	2	t
10	10	create views reservas	SQL	V10__create_views_reservas.sql	1562181130	postgres	2026-06-20 09:34:12.334942	3	t
11	11	creatte view voos	SQL	V11__creatte_view_voos.sql	1008667109	postgres	2026-06-20 09:34:12.343794	2	t
12	12	create materialized views	SQL	V12__create_materialized_views.sql	1097144789	postgres	2026-06-20 09:34:12.351165	2	t
13	13	create procedures	SQL	V13__create_procedures.sql	-1719219473	postgres	2026-06-20 09:34:12.358057	3	t
14	14	create triggers	SQL	V14__create_triggers.sql	-1936122225	postgres	2026-06-20 09:34:12.367359	2	t
15	15	create roles	SQL	V15__create_roles.sql	1326865709	postgres	2026-06-20 09:34:12.375165	14	t
\.


--
-- Data for Name: historico_reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_reservas (id, reserva_id, operacao, status_antigo, status_novo, usuario_alteracao, data_alteracao) FROM stdin;
1	1	UPDATE	CONFIRMADA	CANCELADA	\N	2026-06-20 09:55:54.629446
\.


--
-- Data for Name: passageiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passageiros (id, nome, cpf, email, telefone, created_at) FROM stdin;
1	João Silva	11111111111	joao@email.com	11999990001	2026-06-20 09:34:12.292849
2	Maria Souza	22222222222	maria@email.com	11999990002	2026-06-20 09:34:12.292849
3	Pedro Santos	33333333333	pedro@email.com	11999990003	2026-06-20 09:34:12.292849
4	Ana Lima	44444444444	ana@email.com	11999990004	2026-06-20 09:34:12.292849
5	Carlos Oliveira	55555555555	carlos@email.com	11999990005	2026-06-20 09:34:12.292849
6	Fernanda Costa	66666666666	fernanda@email.com	11999990006	2026-06-20 09:34:12.292849
7	Lucas Almeida	77777777777	lucas@email.com	11999990007	2026-06-20 09:34:12.292849
8	Juliana Rocha	88888888888	juliana@email.com	11999990008	2026-06-20 09:34:12.292849
9	Gabriel Martins	99999999999	gabriel@email.com	11999990009	2026-06-20 09:34:12.292849
10	Camila Ferreira	12312312312	camila@email.com	11999990010	2026-06-20 09:34:12.292849
\.


--
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id, localizador, passageiro_id, voo_id, assento_id, data_reserva, valor_pago, status, created_at) FROM stdin;
2	ABC002	2	1	11	2026-06-20 09:34:12.30337	450.00	CONFIRMADA	2026-06-20 09:34:12.30337
3	ABC003	3	2	2	2026-06-20 09:34:12.30337	620.00	CONFIRMADA	2026-06-20 09:34:12.30337
4	ABC004	4	2	12	2026-06-20 09:34:12.30337	620.00	CHECKIN	2026-06-20 09:34:12.30337
5	ABC005	5	3	3	2026-06-20 09:34:12.30337	580.00	CONFIRMADA	2026-06-20 09:34:12.30337
6	ABC006	6	4	4	2026-06-20 09:34:12.30337	700.00	CONFIRMADA	2026-06-20 09:34:12.30337
7	ABC007	7	5	5	2026-06-20 09:34:12.30337	430.00	CONFIRMADA	2026-06-20 09:34:12.30337
8	ABC008	8	6	6	2026-06-20 09:34:12.30337	320.00	CHECKIN	2026-06-20 09:34:12.30337
9	ABC009	9	7	7	2026-06-20 09:34:12.30337	780.00	CONFIRMADA	2026-06-20 09:34:12.30337
10	ABC010	10	8	8	2026-06-20 09:34:12.30337	390.00	CANCELADA	2026-06-20 09:34:12.30337
1	ABC001	1	1	1	2026-06-20 09:34:12.30337	450.00	CANCELADA	2026-06-20 09:34:12.30337
\.


--
-- Data for Name: voos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voos (id, numero_voo, origem_id, destino_id, aeronave_id, data_partida, data_chegada, preco, status, created_at) FROM stdin;
1	LA1001	1	5	1	2026-07-01 08:00:00	2026-07-01 09:00:00	450.00	AGENDADO	2026-06-20 09:34:12.261556
2	G31002	1	8	2	2026-07-01 09:30:00	2026-07-01 12:00:00	620.00	AGENDADO	2026-06-20 09:34:12.261556
3	AD1003	3	9	3	2026-07-01 07:00:00	2026-07-01 10:20:00	580.00	AGENDADO	2026-06-20 09:34:12.261556
4	LA1004	4	10	4	2026-07-01 13:00:00	2026-07-01 15:10:00	700.00	AGENDADO	2026-06-20 09:34:12.261556
5	G31005	5	1	2	2026-07-02 18:00:00	2026-07-02 19:10:00	430.00	AGENDADO	2026-06-20 09:34:12.261556
6	AD1006	9	8	6	2026-07-02 14:00:00	2026-07-02 15:40:00	320.00	AGENDADO	2026-06-20 09:34:12.261556
7	LA1007	7	10	1	2026-07-03 10:00:00	2026-07-03 13:30:00	780.00	AGENDADO	2026-06-20 09:34:12.261556
8	G31008	2	4	5	2026-07-03 06:00:00	2026-07-03 07:30:00	390.00	FINALIZADO	2026-06-20 09:34:12.261556
9	AD1009	10	3	3	2026-07-04 16:00:00	2026-07-04 19:00:00	610.00	AGENDADO	2026-06-20 09:34:12.261556
10	LA1010	8	5	4	2026-07-05 11:00:00	2026-07-05 13:00:00	560.00	CANCELADO	2026-06-20 09:34:12.261556
\.


--
-- Name: aeronaves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aeronaves_id_seq', 6, true);


--
-- Name: aeroportos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aeroportos_id_seq', 10, true);


--
-- Name: assentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assentos_id_seq', 300, true);


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classes_id_seq', 3, true);


--
-- Name: companhias_aereas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companhias_aereas_id_seq', 3, true);


--
-- Name: escalas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.escalas_id_seq', 4, true);


--
-- Name: historico_reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historico_reservas_id_seq', 1, true);


--
-- Name: passageiros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passageiros_id_seq', 10, true);


--
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 12, true);


--
-- Name: voos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voos_id_seq', 10, true);


--
-- Name: aeronaves aeronaves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeronaves
    ADD CONSTRAINT aeronaves_pkey PRIMARY KEY (id);


--
-- Name: aeroportos aeroportos_codigo_iata_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeroportos
    ADD CONSTRAINT aeroportos_codigo_iata_key UNIQUE (codigo_iata);


--
-- Name: aeroportos aeroportos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeroportos
    ADD CONSTRAINT aeroportos_pkey PRIMARY KEY (id);


--
-- Name: assentos assentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assentos
    ADD CONSTRAINT assentos_pkey PRIMARY KEY (id);


--
-- Name: classes classes_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_nome_key UNIQUE (nome);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: companhias_aereas companhias_aereas_codigo_iata_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companhias_aereas
    ADD CONSTRAINT companhias_aereas_codigo_iata_key UNIQUE (codigo_iata);


--
-- Name: companhias_aereas companhias_aereas_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companhias_aereas
    ADD CONSTRAINT companhias_aereas_nome_key UNIQUE (nome);


--
-- Name: companhias_aereas companhias_aereas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companhias_aereas
    ADD CONSTRAINT companhias_aereas_pkey PRIMARY KEY (id);


--
-- Name: escalas escalas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalas
    ADD CONSTRAINT escalas_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: historico_reservas historico_reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_reservas
    ADD CONSTRAINT historico_reservas_pkey PRIMARY KEY (id);


--
-- Name: passageiros passageiros_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passageiros
    ADD CONSTRAINT passageiros_cpf_key UNIQUE (cpf);


--
-- Name: passageiros passageiros_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passageiros
    ADD CONSTRAINT passageiros_email_key UNIQUE (email);


--
-- Name: passageiros passageiros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passageiros
    ADD CONSTRAINT passageiros_pkey PRIMARY KEY (id);


--
-- Name: reservas reservas_localizador_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_localizador_key UNIQUE (localizador);


--
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- Name: assentos uk_assento_voo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assentos
    ADD CONSTRAINT uk_assento_voo UNIQUE (id, voo_id);


--
-- Name: assentos uk_numero_assento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assentos
    ADD CONSTRAINT uk_numero_assento UNIQUE (voo_id, numero);


--
-- Name: escalas uk_ordem_escala; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalas
    ADD CONSTRAINT uk_ordem_escala UNIQUE (voo_id, ordem);


--
-- Name: reservas uk_reserva_assento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT uk_reserva_assento UNIQUE (assento_id);


--
-- Name: voos voos_numero_voo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT voos_numero_voo_key UNIQUE (numero_voo);


--
-- Name: voos voos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT voos_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_assentos_disponivel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assentos_disponivel ON public.assentos USING btree (disponivel);


--
-- Name: idx_reservas_passageiro; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reservas_passageiro ON public.reservas USING btree (passageiro_id);


--
-- Name: idx_reservas_voo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reservas_voo ON public.reservas USING btree (voo_id);


--
-- Name: idx_voos_data_partida; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_voos_data_partida ON public.voos USING btree (data_partida);


--
-- Name: idx_voos_destino; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_voos_destino ON public.voos USING btree (destino_id);


--
-- Name: idx_voos_origem; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_voos_origem ON public.voos USING btree (origem_id);


--
-- Name: reservas trg_historico_reserva; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_historico_reserva AFTER UPDATE OF status ON public.reservas FOR EACH ROW EXECUTE FUNCTION public.registrar_historico();


--
-- Name: reservas trg_validar_voo_cancelado; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_validar_voo_cancelado BEFORE INSERT ON public.reservas FOR EACH ROW EXECUTE FUNCTION public.validar_voo_cancelado();


--
-- Name: aeronaves fk_aeronave_companhia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeronaves
    ADD CONSTRAINT fk_aeronave_companhia FOREIGN KEY (companhia_id) REFERENCES public.companhias_aereas(id);


--
-- Name: assentos fk_assento_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assentos
    ADD CONSTRAINT fk_assento_classe FOREIGN KEY (classe_id) REFERENCES public.classes(id);


--
-- Name: assentos fk_assento_voo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assentos
    ADD CONSTRAINT fk_assento_voo FOREIGN KEY (voo_id) REFERENCES public.voos(id) ON DELETE CASCADE;


--
-- Name: escalas fk_escala_aeroporto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalas
    ADD CONSTRAINT fk_escala_aeroporto FOREIGN KEY (aeroporto_id) REFERENCES public.aeroportos(id);


--
-- Name: escalas fk_escala_voo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalas
    ADD CONSTRAINT fk_escala_voo FOREIGN KEY (voo_id) REFERENCES public.voos(id) ON DELETE CASCADE;


--
-- Name: historico_reservas fk_historico_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_reservas
    ADD CONSTRAINT fk_historico_reserva FOREIGN KEY (reserva_id) REFERENCES public.reservas(id) ON DELETE CASCADE;


--
-- Name: reservas fk_reserva_assento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_reserva_assento FOREIGN KEY (assento_id) REFERENCES public.assentos(id);


--
-- Name: reservas fk_reserva_assento_voo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_reserva_assento_voo FOREIGN KEY (assento_id, voo_id) REFERENCES public.assentos(id, voo_id);


--
-- Name: reservas fk_reserva_passageiro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_reserva_passageiro FOREIGN KEY (passageiro_id) REFERENCES public.passageiros(id);


--
-- Name: reservas fk_reserva_voo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_reserva_voo FOREIGN KEY (voo_id) REFERENCES public.voos(id);


--
-- Name: voos fk_voo_aeronave; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT fk_voo_aeronave FOREIGN KEY (aeronave_id) REFERENCES public.aeronaves(id);


--
-- Name: voos fk_voo_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT fk_voo_destino FOREIGN KEY (destino_id) REFERENCES public.aeroportos(id);


--
-- Name: voos fk_voo_origem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT fk_voo_origem FOREIGN KEY (origem_id) REFERENCES public.aeroportos(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO atendente;
GRANT USAGE ON SCHEMA public TO supervisor;
GRANT USAGE ON SCHEMA public TO cliente;


--
-- Name: TABLE aeronaves; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.aeronaves TO atendente;
GRANT ALL ON TABLE public.aeronaves TO supervisor;
GRANT SELECT ON TABLE public.aeronaves TO cliente;


--
-- Name: SEQUENCE aeronaves_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.aeronaves_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.aeronaves_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.aeronaves_id_seq TO cliente;


--
-- Name: TABLE aeroportos; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.aeroportos TO atendente;
GRANT ALL ON TABLE public.aeroportos TO supervisor;
GRANT SELECT ON TABLE public.aeroportos TO cliente;


--
-- Name: SEQUENCE aeroportos_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.aeroportos_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.aeroportos_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.aeroportos_id_seq TO cliente;


--
-- Name: TABLE assentos; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.assentos TO atendente;
GRANT ALL ON TABLE public.assentos TO supervisor;
GRANT SELECT ON TABLE public.assentos TO cliente;


--
-- Name: SEQUENCE assentos_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.assentos_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.assentos_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.assentos_id_seq TO cliente;


--
-- Name: TABLE classes; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.classes TO atendente;
GRANT ALL ON TABLE public.classes TO supervisor;
GRANT SELECT ON TABLE public.classes TO cliente;


--
-- Name: SEQUENCE classes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.classes_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.classes_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.classes_id_seq TO cliente;


--
-- Name: TABLE companhias_aereas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.companhias_aereas TO atendente;
GRANT ALL ON TABLE public.companhias_aereas TO supervisor;
GRANT SELECT ON TABLE public.companhias_aereas TO cliente;


--
-- Name: SEQUENCE companhias_aereas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.companhias_aereas_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.companhias_aereas_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.companhias_aereas_id_seq TO cliente;


--
-- Name: TABLE escalas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.escalas TO atendente;
GRANT ALL ON TABLE public.escalas TO supervisor;
GRANT SELECT ON TABLE public.escalas TO cliente;


--
-- Name: SEQUENCE escalas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.escalas_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.escalas_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.escalas_id_seq TO cliente;


--
-- Name: TABLE flyway_schema_history; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.flyway_schema_history TO supervisor;


--
-- Name: TABLE historico_reservas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.historico_reservas TO atendente;
GRANT ALL ON TABLE public.historico_reservas TO supervisor;
GRANT SELECT ON TABLE public.historico_reservas TO cliente;


--
-- Name: SEQUENCE historico_reservas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.historico_reservas_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.historico_reservas_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.historico_reservas_id_seq TO cliente;


--
-- Name: TABLE voos; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.voos TO atendente;
GRANT ALL ON TABLE public.voos TO supervisor;
GRANT SELECT ON TABLE public.voos TO cliente;


--
-- Name: TABLE vw_voos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_voos TO supervisor;


--
-- Name: TABLE mv_voos_agendados; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.mv_voos_agendados TO supervisor;


--
-- Name: TABLE passageiros; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.passageiros TO atendente;
GRANT ALL ON TABLE public.passageiros TO supervisor;
GRANT SELECT,INSERT,UPDATE ON TABLE public.passageiros TO cliente;


--
-- Name: SEQUENCE passageiros_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.passageiros_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.passageiros_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.passageiros_id_seq TO cliente;


--
-- Name: TABLE reservas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.reservas TO atendente;
GRANT ALL ON TABLE public.reservas TO supervisor;
GRANT SELECT,INSERT ON TABLE public.reservas TO cliente;


--
-- Name: SEQUENCE reservas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.reservas_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.reservas_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.reservas_id_seq TO cliente;


--
-- Name: SEQUENCE voos_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.voos_id_seq TO atendente;
GRANT ALL ON SEQUENCE public.voos_id_seq TO supervisor;
GRANT SELECT,USAGE ON SEQUENCE public.voos_id_seq TO cliente;


--
-- Name: TABLE vw_assentos_disponiveis; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_assentos_disponiveis TO supervisor;


--
-- Name: TABLE vw_reservas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_reservas TO supervisor;


--
-- Name: mv_voos_agendados; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: postgres
--

REFRESH MATERIALIZED VIEW public.mv_voos_agendados;


--
-- PostgreSQL database dump complete
--

\unrestrict PEAchS0Td0r67wX7eA8dnPRqPqLoqxLEAwtPhqbau56Ncz05TvQHhDsn1gLRo2u

