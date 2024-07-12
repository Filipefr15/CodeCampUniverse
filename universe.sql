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
    name character varying(50),
    age_in_millions_of_year numeric,
    how_is_life_there text,
    how_many_species integer,
    distance_from_earth integer NOT NULL,
    rotation_speed integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    is_spherical boolean,
    age_in_millions_of_year numeric,
    how_is_life_there text,
    how_many_species integer,
    distance_from_earth integer NOT NULL,
    rotation_speed integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: necessary; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.necessary (
    name character varying(50) NOT NULL,
    necessary_id integer NOT NULL,
    necessary_unique integer
);


ALTER TABLE public.necessary OWNER TO freecodecamp;

--
-- Name: necessary_necessary_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.necessary_necessary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.necessary_necessary_id_seq OWNER TO freecodecamp;

--
-- Name: necessary_necessary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.necessary_necessary_id_seq OWNED BY public.necessary.necessary_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    is_spherical boolean,
    age_in_millions_of_year numeric,
    how_is_life_there text,
    how_many_species integer,
    distance_from_earth integer NOT NULL,
    rotation_speed integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    is_spherical boolean,
    age_in_millions_of_year numeric,
    how_is_life_there text,
    how_many_species integer,
    distance_from_earth integer NOT NULL,
    rotation_speed integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: necessary necessary_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.necessary ALTER COLUMN necessary_id SET DEFAULT nextval('public.necessary_necessary_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, '100000', NULL, NULL, 99999999, 0, 460);
INSERT INTO public.galaxy VALUES (2, '10000', NULL, NULL, 99999999, 0, 460);
INSERT INTO public.galaxy VALUES (3, '9', NULL, NULL, 99999999, 0, 460);
INSERT INTO public.galaxy VALUES (4, '99', NULL, NULL, 99999999, 0, 460);
INSERT INTO public.galaxy VALUES (5, '899', NULL, NULL, 99999999, 0, 460);
INSERT INTO public.galaxy VALUES (6, '8199', NULL, NULL, 99999999, 0, 460);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO public.moon VALUES (2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO public.moon VALUES (3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO public.moon VALUES (4, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO public.moon VALUES (5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO public.moon VALUES (6, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO public.moon VALUES (7, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO public.moon VALUES (8, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (9, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (10, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (11, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (12, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (13, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (14, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (15, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (16, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (17, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (18, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (19, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (20, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (21, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (22, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (23, NULL, NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO public.moon VALUES (24, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (25, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (26, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (27, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (28, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (29, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (30, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (31, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (32, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (33, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO public.moon VALUES (34, NULL, NULL, NULL, NULL, NULL, 1, 1, 3);


--
-- Data for Name: necessary; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.necessary VALUES ('1', 1, 1);
INSERT INTO public.necessary VALUES ('2', 2, 2);
INSERT INTO public.necessary VALUES ('3', 3, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (2, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (3, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (4, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (5, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (6, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (7, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (8, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (9, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (10, NULL, NULL, NULL, NULL, NULL, 10, 10, 1);
INSERT INTO public.planet VALUES (11, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (12, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (13, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (14, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (15, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (16, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (17, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (18, NULL, NULL, NULL, NULL, NULL, 10, 10, 2);
INSERT INTO public.planet VALUES (19, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (20, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (21, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (22, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (23, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (24, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (25, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (26, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);
INSERT INTO public.planet VALUES (27, NULL, NULL, NULL, NULL, NULL, 10, 10, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, NULL, NULL, NULL, NULL, NULL, 100, 5000, 1);
INSERT INTO public.star VALUES (2, NULL, NULL, NULL, NULL, NULL, 100, 5000, 1);
INSERT INTO public.star VALUES (3, NULL, NULL, NULL, NULL, NULL, 100, 5000, 5);
INSERT INTO public.star VALUES (4, NULL, NULL, NULL, NULL, NULL, 100, 5000, 6);
INSERT INTO public.star VALUES (5, NULL, NULL, NULL, NULL, NULL, 100, 50000, 6);
INSERT INTO public.star VALUES (6, NULL, NULL, NULL, NULL, NULL, 100, 50000, 2);
INSERT INTO public.star VALUES (7, NULL, NULL, NULL, NULL, NULL, 100, 50000, 2);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 1, false);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 34, true);


--
-- Name: necessary_necessary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.necessary_necessary_id_seq', 1, false);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 27, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 7, true);


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
-- Name: necessary necessary_necessary_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.necessary
    ADD CONSTRAINT necessary_necessary_unique_key UNIQUE (necessary_unique);


--
-- Name: necessary necessary_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.necessary
    ADD CONSTRAINT necessary_pkey PRIMARY KEY (necessary_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

