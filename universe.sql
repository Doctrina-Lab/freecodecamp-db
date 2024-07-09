--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    diameter_in_kiloparsecs numeric(4,2) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_info (
    planet_info_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer NOT NULL
);


ALTER TABLE public.planet_info OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_info_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_info_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_info_planet_info_id_seq OWNED BY public.planet_info.planet_info_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_info planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info ALTER COLUMN planet_info_id SET DEFAULT nextval('public.planet_info_planet_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda Galaxy ...', 10000, 46.56);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', 'Canis Major Dwarf Galaxy', 7000, 1.50);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A.', 'Cygnus A. ...', 3000000, 4.00);
INSERT INTO public.galaxy VALUES (4, 'Maffei I and II', 'Maffei I and II ...', 1000, 0.40);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 'Magellanic Clouds ...', 1100, 9.86);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'Milky Way ...', 13600, 30.00);
INSERT INTO public.galaxy VALUES (7, '7', '7...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (8, '8', '8...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (9, '9', '9...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (10, '10', '10...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (11, '11', '11...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (12, '12', '12...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (13, '13', '13...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (14, '14', '14...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (15, '15', '15...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (16, '16', '16...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (17, '17', '17...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (18, '18', '18...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (19, '19', '19...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (20, '20', '20...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (21, '21', '21...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (22, '22', '22...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (23, '23', '23...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (24, '24', '24...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (25, '25', '25...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (26, '26', '26...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (27, '27', '27...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (28, '28', '28...', 1000, 5.00);
INSERT INTO public.galaxy VALUES (29, '29', '29...', 1000, 5.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1', 1, false, '1...', 10000);
INSERT INTO public.moon VALUES (3, '3', 3, false, '3...', 10000);
INSERT INTO public.moon VALUES (4, '4', 4, false, '4...', 10000);
INSERT INTO public.moon VALUES (5, '5', 5, false, '5...', 10000);
INSERT INTO public.moon VALUES (6, '6', 6, false, '6...', 10000);
INSERT INTO public.moon VALUES (7, '7', 7, false, '7...', 10000);
INSERT INTO public.moon VALUES (9, '9', 9, false, '9...', 10000);
INSERT INTO public.moon VALUES (10, '10', 10, false, '10...', 10000);
INSERT INTO public.moon VALUES (11, '11', 11, false, '11...', 10000);
INSERT INTO public.moon VALUES (12, '12', 12, false, '12...', 10000);
INSERT INTO public.moon VALUES (13, '13', 13, false, '13...', 10000);
INSERT INTO public.moon VALUES (14, '14', 14, false, '14...', 10000);
INSERT INTO public.moon VALUES (15, '15', 15, false, '15...', 10000);
INSERT INTO public.moon VALUES (16, '16', 16, false, '16...', 10000);
INSERT INTO public.moon VALUES (17, '17', 17, false, '17...', 10000);
INSERT INTO public.moon VALUES (18, '18', 18, false, '18...', 10000);
INSERT INTO public.moon VALUES (19, '19', 19, false, '19...', 10000);
INSERT INTO public.moon VALUES (20, '20', 20, false, '20...', 10000);
INSERT INTO public.moon VALUES (21, '21', 21, false, '21...', 10000);
INSERT INTO public.moon VALUES (24, '24', 24, false, '24...', 10000);
INSERT INTO public.moon VALUES (25, '25', 25, false, '25...', 10000);
INSERT INTO public.moon VALUES (26, '26', 26, false, '26...', 10000);
INSERT INTO public.moon VALUES (27, '27', 27, false, '27...', 10000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 'Mercury...', 500);
INSERT INTO public.planet VALUES (3, 'Venus', 2, false, 'Venus...', 500);
INSERT INTO public.planet VALUES (4, 'Earth', 3, false, 'Earth...', 500);
INSERT INTO public.planet VALUES (5, 'Mars', 4, false, 'Mars...', 500);
INSERT INTO public.planet VALUES (6, '5', 5, false, '5...', 500);
INSERT INTO public.planet VALUES (7, '6', 6, false, '6...', 500);
INSERT INTO public.planet VALUES (9, '8', 8, false, '8...', 1000);
INSERT INTO public.planet VALUES (10, '9', 9, false, '9...', 1000);
INSERT INTO public.planet VALUES (11, '10', 10, false, '10...', 1000);
INSERT INTO public.planet VALUES (12, '11', 11, false, '11...', 1000);
INSERT INTO public.planet VALUES (13, '12', 12, false, '12...', 1000);
INSERT INTO public.planet VALUES (14, '13', 13, false, '13...', 1000);
INSERT INTO public.planet VALUES (15, '14', 14, false, '14...', 1000);
INSERT INTO public.planet VALUES (16, '15', 15, false, '15...', 1000);
INSERT INTO public.planet VALUES (17, '16', 16, false, '16...', 1000);
INSERT INTO public.planet VALUES (18, '17', 17, false, '17...', 1000);
INSERT INTO public.planet VALUES (19, '18', 18, false, '18...', 1000);
INSERT INTO public.planet VALUES (20, '19', 19, false, '19...', 1000);
INSERT INTO public.planet VALUES (21, '20', 20, false, '20...', 1000);
INSERT INTO public.planet VALUES (24, '21', 21, false, '21...', 1000);
INSERT INTO public.planet VALUES (25, '22', 22, false, '22...', 1000);
INSERT INTO public.planet VALUES (26, '23', 23, false, '23...', 1000);
INSERT INTO public.planet VALUES (27, '24', 24, false, '24...', 1000);
INSERT INTO public.planet VALUES (28, '25', 25, false, '25...', 1000);
INSERT INTO public.planet VALUES (29, '26', 26, false, '26...', 1000);
INSERT INTO public.planet VALUES (30, '27', 27, false, '27...', 1000);
INSERT INTO public.planet VALUES (31, '28', 28, false, '28...', 1000);
INSERT INTO public.planet VALUES (32, '29', 29, false, '29...', 1000);


--
-- Data for Name: planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_info VALUES (1, 1, '1...', 1000);
INSERT INTO public.planet_info VALUES (2, 3, '3...', 1000);
INSERT INTO public.planet_info VALUES (3, 4, '4...', 1000);
INSERT INTO public.planet_info VALUES (4, 5, '5...', 1000);
INSERT INTO public.planet_info VALUES (5, 6, '6...', 1000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Some start in Andromeda Galaxy', 1, 'Some star in Andromeda Galaxy', 500);
INSERT INTO public.star VALUES (2, 'Some start in Canis Major', 2, 'Some star in Canis Major', 200);
INSERT INTO public.star VALUES (3, 'Some start in Cygnus', 3, 'Some star in Cygnus', 300);
INSERT INTO public.star VALUES (4, 'Some start in Maffei', 4, 'Some star in Maffei ...', 800);
INSERT INTO public.star VALUES (5, 'Some start in Magellanic', 5, 'Some star in Magellanic Clouds ...', 700);
INSERT INTO public.star VALUES (6, 'Sun', 6, 'Sun ...', 4600);
INSERT INTO public.star VALUES (8, '7', 7, '7...', 1000);
INSERT INTO public.star VALUES (9, '8', 8, '8...', 1000);
INSERT INTO public.star VALUES (10, '9', 9, '9...', 1000);
INSERT INTO public.star VALUES (11, '10', 10, '10...', 1000);
INSERT INTO public.star VALUES (12, '11', 11, '11...', 1000);
INSERT INTO public.star VALUES (13, '12', 12, '12...', 1000);
INSERT INTO public.star VALUES (14, '13', 13, '13...', 1000);
INSERT INTO public.star VALUES (15, '14', 14, '14...', 1000);
INSERT INTO public.star VALUES (16, '15', 15, '15...', 1000);
INSERT INTO public.star VALUES (17, '16', 16, '16...', 1000);
INSERT INTO public.star VALUES (18, '17', 17, '17...', 1000);
INSERT INTO public.star VALUES (19, '18', 18, '18...', 1000);
INSERT INTO public.star VALUES (20, '19', 19, '19...', 1000);
INSERT INTO public.star VALUES (21, '20', 20, '20...', 1000);
INSERT INTO public.star VALUES (22, '21', 21, '21...', 1000);
INSERT INTO public.star VALUES (23, '22', 22, '22...', 1000);
INSERT INTO public.star VALUES (24, '23', 23, '23...', 1000);
INSERT INTO public.star VALUES (25, '24', 24, '24...', 1000);
INSERT INTO public.star VALUES (26, '25', 25, '25...', 1000);
INSERT INTO public.star VALUES (27, '26', 26, '26...', 1000);
INSERT INTO public.star VALUES (28, '27', 27, '27...', 1000);
INSERT INTO public.star VALUES (29, '28', 28, '28...', 1000);
INSERT INTO public.star VALUES (30, '29', 29, '29...', 1000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 29, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_info_planet_info_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 30, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_info planet_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_name_key UNIQUE (name);


--
-- Name: planet_info planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_pkey PRIMARY KEY (planet_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_info planet_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
