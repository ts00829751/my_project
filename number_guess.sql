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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: user_list; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_list (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.user_list OWNER TO freecodecamp;

--
-- Name: user_list_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_list_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_list_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_list_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_list_user_id_seq OWNED BY public.user_list.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: user_list user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_list ALTER COLUMN user_id SET DEFAULT nextval('public.user_list_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 1);
INSERT INTO public.games VALUES (2, 3, 5);
INSERT INTO public.games VALUES (3, 5, 127);
INSERT INTO public.games VALUES (4, 6, 463);
INSERT INTO public.games VALUES (5, 5, 150);
INSERT INTO public.games VALUES (6, 5, 8);
INSERT INTO public.games VALUES (7, 5, 174);
INSERT INTO public.games VALUES (8, 7, 49);
INSERT INTO public.games VALUES (9, 8, 509);
INSERT INTO public.games VALUES (10, 7, 299);
INSERT INTO public.games VALUES (11, 7, 102);
INSERT INTO public.games VALUES (12, 7, 806);
INSERT INTO public.games VALUES (13, 9, 1);
INSERT INTO public.games VALUES (14, 9, 3);
INSERT INTO public.games VALUES (15, 10, 517);
INSERT INTO public.games VALUES (16, 11, 425);
INSERT INTO public.games VALUES (17, 10, 994);
INSERT INTO public.games VALUES (18, 10, 594);
INSERT INTO public.games VALUES (19, 10, 593);
INSERT INTO public.games VALUES (20, 12, 4);
INSERT INTO public.games VALUES (21, 13, 775);
INSERT INTO public.games VALUES (22, 13, 805);
INSERT INTO public.games VALUES (23, 14, 975);
INSERT INTO public.games VALUES (24, 14, 104);
INSERT INTO public.games VALUES (25, 13, 527);
INSERT INTO public.games VALUES (26, 13, 982);
INSERT INTO public.games VALUES (27, 13, 917);
INSERT INTO public.games VALUES (28, 15, 723);
INSERT INTO public.games VALUES (29, 15, 200);
INSERT INTO public.games VALUES (30, 16, 538);
INSERT INTO public.games VALUES (31, 16, 866);
INSERT INTO public.games VALUES (32, 15, 837);
INSERT INTO public.games VALUES (33, 15, 853);
INSERT INTO public.games VALUES (34, 15, 491);


--
-- Data for Name: user_list; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_list VALUES (1, 'user_1781254278663');
INSERT INTO public.user_list VALUES (2, 'user_1781254278662');
INSERT INTO public.user_list VALUES (3, 'user_test');
INSERT INTO public.user_list VALUES (5, 'user_1781511094716');
INSERT INTO public.user_list VALUES (6, 'user_1781511094715');
INSERT INTO public.user_list VALUES (7, 'user_1781511262802');
INSERT INTO public.user_list VALUES (8, 'user_1781511262801');
INSERT INTO public.user_list VALUES (9, 'test');
INSERT INTO public.user_list VALUES (10, 'user_1781511851861');
INSERT INTO public.user_list VALUES (11, 'user_1781511851860');
INSERT INTO public.user_list VALUES (12, 'test_2');
INSERT INTO public.user_list VALUES (13, 'user_1781512054870');
INSERT INTO public.user_list VALUES (14, 'user_1781512054869');
INSERT INTO public.user_list VALUES (15, 'user_1781512429024');
INSERT INTO public.user_list VALUES (16, 'user_1781512429023');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 34, true);


--
-- Name: user_list_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_list_user_id_seq', 16, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: user_list user_list_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_list
    ADD CONSTRAINT user_list_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_list(user_id);


--
-- PostgreSQL database dump complete
--

