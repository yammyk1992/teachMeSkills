--
-- PostgreSQL database dump
--

-- Dumped from database version 10.20
-- Dumped by pg_dump version 10.20

-- Started on 2022-04-24 19:06:29

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
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 2839
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 5 (class 2615 OID 16532)
-- Name: MYSQL; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "MYSQL";


ALTER SCHEMA "MYSQL" OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16539)
-- Name: comments; Type: TABLE; Schema: MYSQL; Owner: postgres
--

CREATE TABLE "MYSQL".comments (
    id integer NOT NULL,
    text text,
    user_id integer,
    post_id integer
);


ALTER TABLE "MYSQL".comments OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE comments; Type: COMMENT; Schema: MYSQL; Owner: postgres
--

COMMENT ON TABLE "MYSQL".comments IS 'Add the comments';


--
-- TOC entry 200 (class 1259 OID 16565)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: MYSQL; Owner: postgres
--

ALTER TABLE "MYSQL".comments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "MYSQL".comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 197 (class 1259 OID 16536)
-- Name: likes; Type: TABLE; Schema: MYSQL; Owner: postgres
--

CREATE TABLE "MYSQL".likes (
    id integer NOT NULL,
    user_id integer,
    post_id integer
);


ALTER TABLE "MYSQL".likes OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE likes; Type: COMMENT; Schema: MYSQL; Owner: postgres
--

COMMENT ON TABLE "MYSQL".likes IS 'Add the likes';


--
-- TOC entry 201 (class 1259 OID 16567)
-- Name: likes_id_seq; Type: SEQUENCE; Schema: MYSQL; Owner: postgres
--

ALTER TABLE "MYSQL".likes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "MYSQL".likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 199 (class 1259 OID 16542)
-- Name: posts; Type: TABLE; Schema: MYSQL; Owner: postgres
--

CREATE TABLE "MYSQL".posts (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE "MYSQL".posts OWNER TO postgres;

--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE posts; Type: COMMENT; Schema: MYSQL; Owner: postgres
--

COMMENT ON TABLE "MYSQL".posts IS 'Add the posts ';


--
-- TOC entry 202 (class 1259 OID 16569)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: MYSQL; Owner: postgres
--

ALTER TABLE "MYSQL".posts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "MYSQL".posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 16571)
-- Name: users; Type: TABLE; Schema: MYSQL; Owner: postgres
--

CREATE TABLE "MYSQL".users (
    id integer NOT NULL,
    name text,
    age integer,
    gender text,
    nationality text
);


ALTER TABLE "MYSQL".users OWNER TO postgres;

--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE users; Type: COMMENT; Schema: MYSQL; Owner: postgres
--

COMMENT ON TABLE "MYSQL".users IS 'Add the users';


--
-- TOC entry 204 (class 1259 OID 16579)
-- Name: users_id_seq; Type: SEQUENCE; Schema: MYSQL; Owner: postgres
--

ALTER TABLE "MYSQL".users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "MYSQL".users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2827 (class 0 OID 16539)
-- Dependencies: 198
-- Data for Name: comments; Type: TABLE DATA; Schema: MYSQL; Owner: postgres
--

COPY "MYSQL".comments (id, text, user_id, post_id) FROM stdin;
2	С праздником и тебя друг!!!	1	6
3	Я тоже был в Испании!	2	3
4	И я был в Испании!!!	5	3
\.


--
-- TOC entry 2826 (class 0 OID 16536)
-- Dependencies: 197
-- Data for Name: likes; Type: TABLE DATA; Schema: MYSQL; Owner: postgres
--

COPY "MYSQL".likes (id, user_id, post_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	3	4
6	5	6
\.


--
-- TOC entry 2828 (class 0 OID 16542)
-- Dependencies: 199
-- Data for Name: posts; Type: TABLE DATA; Schema: MYSQL; Owner: postgres
--

COPY "MYSQL".posts (id, title, description, user_id) FROM stdin;
1	Я поел!	Кушал яблоки и творог!\n	1
2	Я поиграл в футбол!	Забил три гола!!!	1
3	Я ездил в Испанию!\n	Посмотрел футбол на Камп Ноу!	2
4	У меня родилась двойня!	Я назвал своих малышей Вася и Света!	3
6	Завтра праздник Свелой Пасхи!	Всех поздравляю с праздником Великой Пасхи!!!	6
\.


--
-- TOC entry 2832 (class 0 OID 16571)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: MYSQL; Owner: postgres
--

COPY "MYSQL".users (id, name, age, gender, nationality) FROM stdin;
1	Вася	12	м	Азербайджанец
2	Петя	32	м	Финн
3	Жора	12	м	Грузин
5	Джон	14	м\n	Американец
6	Давид	67	м	Ирландец
7	Маша	3	ж	Вьетнамка
\.


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 200
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: MYSQL; Owner: postgres
--

SELECT pg_catalog.setval('"MYSQL".comments_id_seq', 4, true);


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 201
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: MYSQL; Owner: postgres
--

SELECT pg_catalog.setval('"MYSQL".likes_id_seq', 6, true);


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 202
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: MYSQL; Owner: postgres
--

SELECT pg_catalog.setval('"MYSQL".posts_id_seq', 6, true);


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: MYSQL; Owner: postgres
--

SELECT pg_catalog.setval('"MYSQL".users_id_seq', 7, true);


--
-- TOC entry 2695 (class 2606 OID 16562)
-- Name: comments pk_comments; Type: CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".comments
    ADD CONSTRAINT pk_comments PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 16560)
-- Name: likes pk_likes; Type: CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".likes
    ADD CONSTRAINT pk_likes PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 16558)
-- Name: posts pk_posts; Type: CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".posts
    ADD CONSTRAINT pk_posts PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 16593)
-- Name: users pk_users; Type: CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 16621)
-- Name: comments fk2_comments; Type: FK CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".comments
    ADD CONSTRAINT fk2_comments FOREIGN KEY (post_id) REFERENCES "MYSQL".posts(id) NOT VALID;


--
-- TOC entry 2702 (class 2606 OID 16611)
-- Name: comments fk_comments; Type: FK CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".comments
    ADD CONSTRAINT fk_comments FOREIGN KEY (user_id) REFERENCES "MYSQL".users(id) NOT VALID;


--
-- TOC entry 2700 (class 2606 OID 16606)
-- Name: likes fk_likes; Type: FK CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".likes
    ADD CONSTRAINT fk_likes FOREIGN KEY (user_id) REFERENCES "MYSQL".users(id) NOT VALID;


--
-- TOC entry 2701 (class 2606 OID 16616)
-- Name: likes fk_likes2; Type: FK CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".likes
    ADD CONSTRAINT fk_likes2 FOREIGN KEY (post_id) REFERENCES "MYSQL".posts(id) NOT VALID;


--
-- TOC entry 2704 (class 2606 OID 16626)
-- Name: posts fk_posts; Type: FK CONSTRAINT; Schema: MYSQL; Owner: postgres
--

ALTER TABLE ONLY "MYSQL".posts
    ADD CONSTRAINT fk_posts FOREIGN KEY (user_id) REFERENCES "MYSQL".users(id) NOT VALID;


-- Completed on 2022-04-24 19:06:30

--
-- PostgreSQL database dump complete
--

