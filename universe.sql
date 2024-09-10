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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    constellation character varying,
    constellation_id integer,
    galaxy_type character varying,
    has_life boolean
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
    name character varying NOT NULL,
    planet character varying,
    planet_id integer,
    orbital_semi_major_axis_in_km integer
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
    name character varying NOT NULL,
    star character varying,
    star_id integer,
    planet_type character varying,
    dist_from_sun_in_millions_of_miles numeric,
    equatorial_diameter_in_miles integer,
    has_life boolean
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
    name character varying NOT NULL,
    galaxy character varying,
    galaxy_id integer,
    star_type character varying,
    constellation character varying,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Gemini', 'Gemini is one of the constellations of the zodiac and is located in the northern celestial hemisphere. It was one of the 48 constellations described by the 2nd century AD astronomer Ptolemy, and it remains one of the 88 modern constellations today. Its name is Latin for twins, and it is associated with the twins Castor and Pollux in Greek mythology. Its old astronomical symbol is  (♊︎)');
INSERT INTO public.constellation VALUES (2, 'Orion', 'Orion is a prominent set of stars visible during winter in the northern celestial hemisphere. It is one of the 88 modern constellations; it was among the 48 constellations listed by the 2nd-century astronomer Ptolemy. It is named after a hunter in Greek mythology.');
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'Ursa Major, also known as the Great Bear, is a constellation in the northern sky, whose associated mythology likely dates back into prehistory. Its Latin name means "greater (or larger) bear", referring to and contrasting it with nearby Ursa Minor, the lesser bear.[1] In antiquity, it was one of the original 48 constellations listed by Ptolemy in the 2nd century AD, drawing on earlier works by Greek, Egyptian, Babylonian, and Assyrian astronomers.[2] Today it is the third largest of the 88 modern constellations.');
INSERT INTO public.constellation VALUES (4, 'Centaurus', 'Centaurus /sɛnˈtɔːrəs, -ˈtɑːr-/ is a bright constellation in the southern sky. One of the largest constellations, Centaurus was included among the 48 constellations listed by the 2nd-century astronomer Ptolemy, and it remains one of the 88 modern constellations. In Greek mythology, Centaurus represents a centaur; a creature that is half human, half horse (another constellation named after a centaur is one from the zodiac: Sagittarius). Notable stars include Alpha Centauri, the nearest star system to the Solar System, its neighbour in the sky Beta Centauri, and HR 5171, one of the largest stars yet discovered. The constellation also contains Omega Centauri, the brightest globular cluster as visible from Earth and the largest identified in the Milky Way, possibly a remnant of a dwarf galaxy.');
INSERT INTO public.constellation VALUES (5, 'Canis Major', 'Canis Major is a constellation in the southern celestial hemisphere. In the second century, it was included in Ptolemy`s 48 constellations, and is counted among the 88 modern constellations. Its name is Latin for "greater dog" in contrast to Canis Minor, the "lesser dog"; both figures are commonly represented as following the constellation of Orion the hunter through the sky. The Milky Way passes through Canis Major and several open clusters lie within its borders, most notably M41.');
INSERT INTO public.constellation VALUES (6, 'Sagittarius', 'Sagittarius is one of the constellations of the zodiac and is located in the Southern celestial hemisphere. It is one of the 48 constellations listed by the 2nd-century astronomer Ptolemy and remains one of the 88 modern constellations. Its old astronomical symbol is  (♐︎). Its name is Latin for "archer". Sagittarius is commonly represented as a centaur drawing a bow. It lies between Scorpius and Ophiuchus to the west and Capricornus and Microscopium to the east.');
INSERT INTO public.constellation VALUES (7, 'Sculptor', 'Sculptor is a faint constellation in the southern sky. It represents a sculptor. It was introduced by Nicolas Louis de Lacaille in the 18th century. He originally named it Apparatus Sculptoris (the sculptor`s studio), but the name was later shortened.');
INSERT INTO public.constellation VALUES (8, 'Andromeda', 'Andromeda is one of the 48 constellations listed by the 2nd-century Greco-Roman astronomer Ptolemy, and one of the 88 modern constellations. Located in the northern celestial hemisphere, it is named for Andromeda, daughter of Cassiopeia, in the Greek myth, who was chained to a rock to be eaten by the sea monster Cetus. Andromeda is most prominent during autumn evenings in the Northern Hemisphere, along with several other constellations named for characters in the Perseus myth. Because of its northern declination, Andromeda is visible only north of 40° south latitude; for observers farther south, it lies below the horizon. It is one of the largest constellations, with an area of 722 square degrees. This is over 1,400 times the size of the full moon, 55% of the size of the largest constellation, Hydra, and over 10 times the size of the smallest constellation, Crux.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Sagittarius', 6, 'barred spiral', true);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda', 8, 'barred spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Sculptor', 7, 'lenticular ring', false);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'Ursa Major', 3, 'starburst', false);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'Ursa Major', 3, 'unbarred spiral', false);
INSERT INTO public.galaxy VALUES (5, 'Backward', 'Centaurus', 4, 'unbarred spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Earth', 3, 384399);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 4, 9380);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 4, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter', 5, 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 5, 671100);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter', 5, 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 5, 1882700);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Saturn', 6, 185540);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn', 6, 238040);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Saturn', 6, 527070);
INSERT INTO public.moon VALUES (12, 'Ariel', 'Uranus', 7, 190900);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'Uranus', 7, 266000);
INSERT INTO public.moon VALUES (14, 'Titania', 'Uranus', 7, 436300);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Uranus', 7, 583500);
INSERT INTO public.moon VALUES (16, 'Triton', 'Neptune', 8, 354800);
INSERT INTO public.moon VALUES (17, 'Nereid', 'Neptune', 8, 5513820);
INSERT INTO public.moon VALUES (18, 'Naiad', 'Neptune', 8, 48224);
INSERT INTO public.moon VALUES (19, 'Thalassa', 'Neptune', 8, 50075);
INSERT INTO public.moon VALUES (20, 'Charon', 'Pluto', 9, 19591);
INSERT INTO public.moon VALUES (10, 'Titan', 'Saturn', 6, 1221870);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The Sun', 1, 'terrestrial', 36, 3023, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'The Sun', 1, 'terrestrial', 67.2, 7521, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'The Sun', 1, 'terrestrial', 93, 7926, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Sun', 1, 'terrestrial', 141.6, 4221, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The Sun', 1, 'gas giant', 483.7, 88846, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The Sun', 1, 'gas giant', 889.8, 74898, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The Sun', 1, 'ice giant', 1800, 31763, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The Sun', 1, 'ice giant', 2800, 30775, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 'The Sun', 1, 'dwarf', 3670, 1477, false);
INSERT INTO public.planet VALUES (10, 'Eris', 'The Sun', 1, 'dwarf', 6300, 1445, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 'The Sun', 1, 'dwarf', 4000, 1080, false);
INSERT INTO public.planet VALUES (12, 'Makemake', 'The Sun', 1, 'dwarf', 4300, 891, false);
INSERT INTO public.planet VALUES (13, 'Ceres', 'The Sun', 1, 'dwarf', 257, 599, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'Milky Way', 2, 'yellow dwarf', 'none', NULL);
INSERT INTO public.star VALUES (5, 'Pollux', 'Milky Way', 2, 'red giant', 'Gemini', 1);
INSERT INTO public.star VALUES (6, 'Alnilam', 'Milky Way', 2, 'blue supergiant', 'Orion', 2);
INSERT INTO public.star VALUES (4, 'Polaris', 'Milky Way', 2, 'yellow supergiant', 'Ursa Major', 3);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Milky Way', 2, 'red dwarf', 'Centaurus', 4);
INSERT INTO public.star VALUES (3, 'Sirius', 'Milky Way', 2, 'white dwarf', 'Canis Major', 5);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

