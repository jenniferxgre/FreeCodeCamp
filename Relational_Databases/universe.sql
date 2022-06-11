--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    age_in_million_of_years integer,
    galaxy_types_id integer,
    diameter double precision
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    in_local_group boolean,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_million_of_years integer,
    planet_id integer,
    diameter double precision
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
    name character varying(50) NOT NULL,
    age_in_million_of_years integer,
    distance_from_earth_in_ls numeric(2,2),
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(50) NOT NULL,
    age_in_million_of_years integer,
    galaxy_id integer NOT NULL,
    diameter double precision
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Sombrerogalaxie', 145, 1, NULL);
INSERT INTO public.galaxy VALUES (2, 'Messier 81', 5273, 1, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 32', 634, 2, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 4125', 432, 2, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sculptor Galaxy', 387, 3, NULL);
INSERT INTO public.galaxy VALUES (6, 'Wolfe-Scheibe', 87, 3, NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiralgalaxie', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Elipsengalaxie', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Scheibengalaxie', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 1, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Moon 2', 2, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Moon 3', 3, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Moon 4', 4, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Moon 5', 5, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Moon 6', 6, 6, NULL);
INSERT INTO public.moon VALUES (7, 'Moon 7', 7, 7, NULL);
INSERT INTO public.moon VALUES (8, 'Moon 8', 8, 8, NULL);
INSERT INTO public.moon VALUES (9, 'Moon 9', 9, 9, NULL);
INSERT INTO public.moon VALUES (10, 'Moon 10', 10, 10, NULL);
INSERT INTO public.moon VALUES (11, 'Moon 11', 11, 11, NULL);
INSERT INTO public.moon VALUES (12, 'Moon 12', 12, 12, NULL);
INSERT INTO public.moon VALUES (13, 'Moon 13', 13, 1, NULL);
INSERT INTO public.moon VALUES (14, 'Moon 14', 14, 2, NULL);
INSERT INTO public.moon VALUES (15, 'Moon 15', 15, 3, NULL);
INSERT INTO public.moon VALUES (16, 'Moon 16', 16, 4, NULL);
INSERT INTO public.moon VALUES (17, 'Moon 17', 17, 5, NULL);
INSERT INTO public.moon VALUES (18, 'Moon 18', 18, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Moon 19', 19, 7, NULL);
INSERT INTO public.moon VALUES (20, 'Moon 20', 20, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Erde', 23, 0.08, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 63, 0.78, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 3, 0.89, false, false, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 5, 0.82, false, false, 2);
INSERT INTO public.planet VALUES (5, 'Uranus', 7, 0.65, false, false, 3);
INSERT INTO public.planet VALUES (6, 'Pluto', 6, 0.08, false, false, 3);
INSERT INTO public.planet VALUES (7, 'Neptun', 9, 0.87, true, false, 4);
INSERT INTO public.planet VALUES (8, 'Jupiter', 32, 0.40, true, true, 4);
INSERT INTO public.planet VALUES (9, 'Merkur', 8, 0.69, false, true, 5);
INSERT INTO public.planet VALUES (10, 'Planet X', 212, 0.42, false, false, 5);
INSERT INTO public.planet VALUES (11, 'Planet Y', 9, 0.23, false, true, 6);
INSERT INTO public.planet VALUES (12, 'Aplha Centrauri', 9283, 0.87, false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sombrero Stern', 5, 1, NULL);
INSERT INTO public.star VALUES (2, 'Messier Stern', 34, 2, NULL);
INSERT INTO public.star VALUES (3, 'Messier Stern 2', 7, 3, NULL);
INSERT INTO public.star VALUES (4, 'NGC Stern', 98, 4, NULL);
INSERT INTO public.star VALUES (5, 'Sculptor Stern', 3, 5, NULL);
INSERT INTO public.star VALUES (6, 'Wolfe Stern', 9, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key1 UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_centered_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_centered_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_centered_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_centered_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_containing_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_containing_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

