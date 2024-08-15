--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: todo_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.todo_items (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    begindate date DEFAULT CURRENT_DATE NOT NULL,
    enddate date,
    repeat character varying(50) DEFAULT 'never'::character varying NOT NULL,
    type character varying(50) DEFAULT 'office'::character varying NOT NULL,
    status character(1) DEFAULT 'N'::bpchar NOT NULL,
    username character varying(100) NOT NULL
);


ALTER TABLE public.todo_items OWNER TO postgres;

--
-- Name: todo_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.todo_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todo_items_id_seq OWNER TO postgres;

--
-- Name: todo_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.todo_items_id_seq OWNED BY public.todo_items.id;


--
-- Name: todo_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.todo_items ALTER COLUMN id SET DEFAULT nextval('public.todo_items_id_seq'::regclass);


--
-- Data for Name: todo_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.todo_items (id, title, begindate, enddate, repeat, type, status, username) FROM stdin;
5	pretend to work	2024-08-15	\N	never	office	D	fran
6	watch paint dry	2024-08-15	\N	never	office	N	fran
8	cry	2024-08-15	2024-08-15	weekly	office	N	fran
9	wait for Lilly	2024-08-15	2024-09-06	daily	home	N	fran
3	clean kitchen	2024-08-15	2024-08-29	weekly	home	D	fran
7	go for a coffee as break from boredom	2024-08-15	2024-08-31	monthly	home	N	fran
2	dishes	2024-08-15	2024-08-30	weekly	home	D	fran
\.


--
-- Name: todo_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.todo_items_id_seq', 10, true);


--
-- Name: todo_items todo_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.todo_items
    ADD CONSTRAINT todo_items_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

