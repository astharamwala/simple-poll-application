--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-1.pgdg18.04+1)

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
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: poll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poll (
    poll_id integer NOT NULL,
    author_id integer
);


ALTER TABLE public.poll OWNER TO postgres;

--
-- Name: poll_poll_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poll_poll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poll_poll_id_seq OWNER TO postgres;

--
-- Name: poll_poll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poll_poll_id_seq OWNED BY public.poll.poll_id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: poll poll_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll ALTER COLUMN poll_id SET DEFAULT nextval('public.poll_poll_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, name) FROM stdin;
1	Miguel de Cervantes
2	Charles Dickens
3	J.R.R. Tolkien
4	Antoine de Saint-Exuper
\.


--
-- Data for Name: poll; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poll (poll_id, author_id) FROM stdin;
1	1
2	1
3	1
4	2
5	2
6	4
7	4
8	4
9	4
10	4
11	4
12	4
13	4
14	4
15	3
16	1
17	4
18	1
19	4
20	2
21	3
22	4
23	4
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 4, true);


--
-- Name: poll_poll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poll_poll_id_seq', 23, true);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: poll poll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll
    ADD CONSTRAINT poll_pkey PRIMARY KEY (poll_id);


--
-- Name: poll fk_author; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll
    ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- PostgreSQL database dump complete
--

