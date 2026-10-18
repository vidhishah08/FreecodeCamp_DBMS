--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Vidhi', 1, 12);
INSERT INTO public.users VALUES (3, 'user_1792339573347', 2, 724);
INSERT INTO public.users VALUES (13, 'user_1792340399741', 2, 1);
INSERT INTO public.users VALUES (2, 'user_1792339573348', 5, 59);
INSERT INTO public.users VALUES (12, 'user_1792340399742', 5, 1);
INSERT INTO public.users VALUES (25, 'user_1792340783443', 2, 698);
INSERT INTO public.users VALUES (5, 'user_1792339684381', 2, 106);
INSERT INTO public.users VALUES (4, 'user_1792339684382', 5, 151);
INSERT INTO public.users VALUES (15, 'user_1792340437479', 2, 458);
INSERT INTO public.users VALUES (24, 'user_1792340783444', 5, 77);
INSERT INTO public.users VALUES (7, 'user_1792339910643', 2, 143);
INSERT INTO public.users VALUES (14, 'user_1792340437480', 5, 100);
INSERT INTO public.users VALUES (6, 'user_1792339910644', 5, 224);
INSERT INTO public.users VALUES (17, 'user_1792340509737', 2, 351);
INSERT INTO public.users VALUES (9, 'user_1792340109300', 2, 152);
INSERT INTO public.users VALUES (16, 'user_1792340509738', 5, 100);
INSERT INTO public.users VALUES (27, 'user_1792340891002', 2, 834);
INSERT INTO public.users VALUES (8, 'user_1792340109301', 5, 218);
INSERT INTO public.users VALUES (26, 'user_1792340891003', 5, 274);
INSERT INTO public.users VALUES (11, 'user_1792340247356', 2, 101);
INSERT INTO public.users VALUES (19, 'user_1792340552684', 2, 717);
INSERT INTO public.users VALUES (10, 'user_1792340247357', 5, 90);
INSERT INTO public.users VALUES (18, 'user_1792340552685', 5, 298);
INSERT INTO public.users VALUES (21, 'user_1792340602619', 2, 593);
INSERT INTO public.users VALUES (20, 'user_1792340602620', 5, 19);
INSERT INTO public.users VALUES (23, 'user_1792340645465', 2, 954);
INSERT INTO public.users VALUES (22, 'user_1792340645466', 5, 189);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 27, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

