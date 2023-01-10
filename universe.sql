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
    name character varying(20) NOT NULL,
    distance_from_earth_ly integer,
    stellar_mass numeric,
    magnitude numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: manmade_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.manmade_mission (
    manmade_mission_id integer NOT NULL,
    name character varying(30),
    unmanned boolean NOT NULL
);


ALTER TABLE public.manmade_mission OWNER TO freecodecamp;

--
-- Name: manmade_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.manmade_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manmade_mission_id_seq OWNER TO freecodecamp;

--
-- Name: manmade_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.manmade_mission_id_seq OWNED BY public.manmade_mission.manmade_mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    moon_size_ranking text,
    mass integer NOT NULL,
    distance_from_planet_km integer NOT NULL,
    planet character varying(30) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    num_of_moons integer NOT NULL,
    in_milky_way_galaxy boolean NOT NULL,
    galaxy character varying(20) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    size_times_the_sun numeric,
    galaxy character varying(20),
    distance_from_earth_ly numeric NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: manmade_mission manmade_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.manmade_mission ALTER COLUMN manmade_mission_id SET DEFAULT nextval('public.manmade_mission_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 1150000000000, -20.9);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, 2000000000000000000000000000000000000000000, 3.4);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 31000000, 160000000000, 8.4);
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 17300000, NULL, 8.52);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 3200000, 50000000000, 5.72);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 20900000, NULL, 7.9);


--
-- Data for Name: manmade_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.manmade_mission VALUES (1, 'Lunar Landing', false);
INSERT INTO public.manmade_mission VALUES (2, 'Vostok 1', false);
INSERT INTO public.manmade_mission VALUES (3, 'Sojourner', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'first', 7, 400632, 'Earth');
INSERT INTO public.moon VALUES (2, 'Deimos', 'second', 1, 23460, 'Mars');
INSERT INTO public.moon VALUES (3, 'Phobos', 'first', 1, 6000, 'Mars');
INSERT INTO public.moon VALUES (4, 'Io', 'third', 1, 421600, 'Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 'fourth', 1, 670900, 'Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 'first', 1, 1070000, 'Jupiter');
INSERT INTO public.moon VALUES (7, 'Callisto', 'second', 1, 1883000, 'Jupiter');
INSERT INTO public.moon VALUES (8, 'Leda', 'seventeenth', 1, 11094000, 'Jupiter');
INSERT INTO public.moon VALUES (9, 'Thebe', 'seventh', 1, 221900, 'Jupiter');
INSERT INTO public.moon VALUES (10, 'Miranda', 'fifth', 1, 129900, 'Uranus');
INSERT INTO public.moon VALUES (11, 'Oberon', 'second', 1, 583500, 'Uranus');
INSERT INTO public.moon VALUES (12, 'Ariel', 'fourth', 1, 190900, 'Uranus');
INSERT INTO public.moon VALUES (13, 'Titania', 'first', 1, 436300, 'Uranus');
INSERT INTO public.moon VALUES (14, 'Umbriel', 'third', 1, 26600, 'Uranus');
INSERT INTO public.moon VALUES (15, 'Trinculo', 'last', 1, 8505200, 'Uranus');
INSERT INTO public.moon VALUES (16, 'Triton', 'first', 1, 354800, 'Neptune');
INSERT INTO public.moon VALUES (17, 'Proteus', 'second', 1, 117600, 'Neptune');
INSERT INTO public.moon VALUES (18, 'Nereid', 'third', 1, 5513400, 'Neptune');
INSERT INTO public.moon VALUES (19, 'Larissa', 'fourth', 1, 73600, 'Neptune');
INSERT INTO public.moon VALUES (20, 'Galatea', 'fifth', 1, 62000, 'Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, true, 'Milky Way');
INSERT INTO public.planet VALUES (2, 'Venus', 0, true, 'Milky Way');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'Milky Way');
INSERT INTO public.planet VALUES (4, 'Mars', 2, true, 'Milky Way');
INSERT INTO public.planet VALUES (5, 'Jupiter', 80, true, 'Milky Way');
INSERT INTO public.planet VALUES (6, 'Saturn', 83, true, 'Milky Way');
INSERT INTO public.planet VALUES (7, 'Uranus', 27, true, 'Milky Way');
INSERT INTO public.planet VALUES (8, 'Neptune', 14, true, 'Milky Way');
INSERT INTO public.planet VALUES (9, 'Pluto', 5, true, 'Milky Way');
INSERT INTO public.planet VALUES (10, 'PA-99-N2', 0, false, 'Andromeda');
INSERT INTO public.planet VALUES (11, 'Kepler-186 f', 0, true, 'Milky Way');
INSERT INTO public.planet VALUES (12, 'Kepler-16b', 1, true, 'Milky Way');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'UY Scuti', 1700, 'Milky Way', 5219, 1);
INSERT INTO public.star VALUES (4, 'VY Canis Majoris', 1420, 'Milky Way', 3900, 1);
INSERT INTO public.star VALUES (1, 'V354', 1520, 'Milky Way', 9000, 1);
INSERT INTO public.star VALUES (2, 'RW Cephei', 1535, 'Milky Way', 3500, 1);
INSERT INTO public.star VALUES (7, 'Alpha Andromedae', 2.7, 'Andromeda', 97, 2);
INSERT INTO public.star VALUES (8, 'Beta Andromedae', 100, 'Andromeda', 197, 2);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: manmade_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.manmade_mission_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: galaxy foo; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT foo UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: manmade_mission manmade_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.manmade_mission
    ADD CONSTRAINT manmade_mission_pkey PRIMARY KEY (manmade_mission_id);


--
-- Name: manmade_mission manmade_unqiue; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.manmade_mission
    ADD CONSTRAINT manmade_unqiue UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: galaxy u; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT u UNIQUE (name);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

