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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    discovery_year integer,
    number_of_observations integer,
    orbital_period_years numeric(10,2),
    is_periodic boolean NOT NULL,
    is_visible_from_earth boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(100) NOT NULL,
    distance_from_earth numeric(12,2),
    has_black_hole boolean NOT NULL,
    number_of_stars integer,
    discovery_year integer,
    is_active boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    discovery_year integer,
    orbital_period_days integer,
    diameter_km numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    is_tidally_locked boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    number_of_moons integer,
    discovery_year integer,
    planet_type character varying(100) NOT NULL,
    distance_from_star numeric(12,3),
    has_life boolean NOT NULL,
    has_rings boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer,
    age_million_years integer,
    star_type character varying(100) NOT NULL,
    mass_solar numeric(10,3),
    is_visible boolean NOT NULL,
    has_planets boolean NOT NULL,
    description text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 1758, 30, 75.30, true, true, 'Famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Encke', 1, 1786, 25, 3.30, true, true, 'Short-period comet');
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 1, 1995, 18, 2533.00, true, true, 'Bright long-period comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, true, 100000000, 1610, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, true, 1000000000, 964, true, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000.00, true, 40000000, 1654, true, 'Local Group galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 31100000.00, true, 100000000, 1781, true, 'Galaxy with a bright centre');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000000.00, true, 100000000, 1773, true, 'Galaxy with spiral arms');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53500000.00, true, 1000000000, 1781, true, 'Large elliptical galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0, 27, 3474.80, true, true, 'Moon of Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 1, 22.40, false, true, 'Moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 1, 12.40, false, true, 'Moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1610, 2, 3643.20, true, true, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1610, 4, 3121.60, true, true, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1610, 7, 5268.20, true, true, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1610, 17, 4820.60, true, true, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 1892, 1, 167.00, false, true, 'Small moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 1655, 16, 5149.50, true, true, 'Largest moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 1672, 5, 1527.60, true, true, 'Moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 1671, 79, 1468.60, true, true, 'Moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1684, 3, 1122.80, true, true, 'Moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1684, 2, 1062.20, true, true, 'Moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, 1789, 1, 504.20, true, true, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1787, 9, 1576.80, true, true, 'Moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1787, 13, 1522.80, true, true, 'Moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 1851, 3, 1157.80, true, true, 'Moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 1851, 4, 1169.40, true, true, 'Moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1846, 6, 2706.80, true, true, 'Largest moon of Neptune');
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 1949, 360, 340.00, false, false, 'Moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 1631, 'Terrestrial', 57.900, false, false, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 1610, 'Terrestrial', 108.200, false, false, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 0, 'Terrestrial', 149.600, true, false, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 1610, 'Terrestrial', 227.900, false, false, 'The Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 95, 1610, 'Gas Giant', 778.500, false, true, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 146, 1610, 'Gas Giant', 1434.000, false, true, 'Planet with large rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 27, 1781, 'Ice Giant', 2871.000, false, true, 'Ice giant planet');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 14, 1846, 'Ice Giant', 4495.000, false, true, 'Farthest major planet');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 0, 2016, 'Terrestrial', 7.500, false, false, 'Exoplanet');
INSERT INTO public.planet VALUES (10, 'Sirius Prime', 3, 2, 2020, 'Gas Giant', 350.000, false, true, 'Sample planet');
INSERT INTO public.planet VALUES (11, 'Kepler-90 i', 4, 0, 2017, 'Terrestrial', 180.000, false, false, 'Exoplanet');
INSERT INTO public.planet VALUES (12, 'Vega Prime', 6, 3, 2021, 'Gas Giant', 490.000, false, true, 'Sample planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 4600, 'Yellow Dwarf', 1.000, true, true, 'Star of the Solar System');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, 4850, 'Red Dwarf', 0.122, false, true, 'Closest star to the Sun');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, 242, 'Main Sequence', 2.063, true, true, 'Bright star');
INSERT INTO public.star VALUES (4, 'Kepler-90', 1, 6080, 2000, 'Yellow Dwarf', 1.200, false, true, 'Star with many planets');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 3500, 10, 'Red Supergiant', 16.500, true, false, 'Large red star');
INSERT INTO public.star VALUES (6, 'Vega', 1, 9602, 455, 'Main Sequence', 2.135, true, true, 'Bright star in Lyra');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

