--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: item_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_status (
    id integer,
    date date
);


ALTER TABLE public.item_status OWNER TO postgres;

--
-- Name: mood_tracker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mood_tracker (
    username character varying(50) NOT NULL,
    date date NOT NULL,
    mood character varying(255)
);


ALTER TABLE public.mood_tracker OWNER TO postgres;

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


ALTER SEQUENCE public.todo_items_id_seq OWNER TO postgres;

--
-- Name: todo_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.todo_items_id_seq OWNED BY public.todo_items.id;


--
-- Name: todo_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.todo_items ALTER COLUMN id SET DEFAULT nextval('public.todo_items_id_seq'::regclass);


--
-- Data for Name: item_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_status (id, date) FROM stdin;
\.


--
-- Data for Name: mood_tracker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mood_tracker (username, date, mood) FROM stdin;
\.


--
-- Data for Name: todo_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.todo_items (id, title, begindate, enddate, repeat, type, username) FROM stdin;
7	go for a coffee as break from boredom	2024-08-15	2024-08-31	monthly	home	fran
8	cry	2024-08-15	2024-08-15	weekly	office	fran
11	cry because Lilly is not there	2024-08-17	2024-08-31	weekly	office	fran
16	miss mönchy until he gets home	2024-08-18	9999-12-31	daily	office	Samuel
17	miss lilly	2024-08-20	2024-09-06	daily	home	Samuel
21	dishes	2024-08-19	9999-12-31	weekly	home	NSCFRX
22	sleep with open eyes	2024-08-20	9999-12-31	daily	office	NSCFRX
23	vacuum	2024-08-17	2024-08-17	never	home	NSCFRX
28	dishes	2024-08-20	9999-12-31	daily	home	NSCFRX
\.


--
-- Name: todo_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.todo_items_id_seq', 28, true);


--
-- Name: todo_items todo_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.todo_items
    ADD CONSTRAINT todo_items_pkey PRIMARY KEY (id);


--
-- Name: item_status item_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_status
    ADD CONSTRAINT item_status_id_fkey FOREIGN KEY (id) REFERENCES public.todo_items(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

