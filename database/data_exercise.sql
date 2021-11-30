--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg100+1)
-- Dumped by pg_dump version 13.3

-- Started on 2021-11-29 01:42:06

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

DROP DATABASE "backend-db-jobpost";
--
-- TOC entry 2915 (class 1262 OID 16384)
-- Name: backend-db-jobpost; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE "backend-db-jobpost" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "backend-db-jobpost" OWNER TO admin;

\connect -reuse-previous=on "dbname='backend-db-jobpost'"

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
-- TOC entry 203 (class 1259 OID 16387)
-- Name: job_post; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.job_post (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    location character varying(150) NOT NULL,
    by_user character varying(255) NOT NULL,
    hourly_rate numeric(6,2),
    created_on timestamp without time zone DEFAULT now() NOT NULL,
    last_update timestamp without time zone
);


ALTER TABLE public.job_post OWNER TO admin;

--
-- TOC entry 202 (class 1259 OID 16385)
-- Name: job_post_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.job_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_post_id_seq OWNER TO admin;

--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 202
-- Name: job_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.job_post_id_seq OWNED BY public.job_post.id;


--
-- TOC entry 2778 (class 2604 OID 16390)
-- Name: job_post id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.job_post ALTER COLUMN id SET DEFAULT nextval('public.job_post_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 16387)
-- Dependencies: 203
-- Data for Name: job_post; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.job_post (id, title, description, location, by_user, hourly_rate, created_on, last_update) FROM stdin;
1	Software Engineer, Backend	About the job\nAt Pattern we're building our founding engineering team to power the company during our hyper growth stage.\n\n\nPattern is a technology-based staffing platform that connects gig workers with jobs around them, on demand, every single hour. Our platform gives businesses like retail chains and warehouses instant access to pre-screened, trained temporary workforce that makes staff management more transparent and efficient.\n\n\nThis is an exciting emerging space (you may see it referred to as digital staffing) that has seen significant interest and investment from venture capitalists. Pattern is one of the break-out companies in this space that is using technology to disrupt the existing, traditional staffing companies.\n\n\nPattern is operating in stealth mode. It has raised several million dollars in funding from venture capitalists. The company is experiencing exponential growth and every day is an exciting, fun, energizing day of work. There are fifty employees at the company across New York, Toronto and Vancouver.\n\n\nAbout the Role\n\n\nFrom day one, you'll work closely with a focused product team using React & Typescript on the frontend and Node & Typescript on the backend. You'll be a key technical contributor during product discovery and definition, and you'll own technical design, implementation and delivery for significant parts of the product.\n\n\nDuring your first year, you'll make foundational architecture and technology decisions while taking on a wide variety of product and technical challenges. As we scale, you'll have the opportunity to grow into either a technical leadership role at the staff level or an engineering management role.\n\n\nYour responsibilities include:\n\n\nMaking key contributions in solving our core problems, such as:\nCan we automate our shift dispatching systems based on the data we have?\nCan we make scheduling and managing workers incredibly simple?\nCan we develop tools to optimally utilize our inventory of gig workers?\nCan we build financial products for our gig workers?\nDesigning and implementing backend services, focused on future extensibility, reliability and ease of adoption\nContinuously push yourself and us to obsessively improve product quality, user experience, and efficient deliver\nHelp build a great product and engineering team dedicated to continuously delivering value to our customers\n\nYou are excited about this opportunity because you will...\n\n\nJoin a fast-growing startup and grow right along with us\nDeliver great products for our all our customers\nTake on significant technical challenges and have a large impact\nGet the chance to work on cutting-edge technologies and use world-class tooling to get the job done\nHave the ability to shape and improve our engineering culture\n\nWe are excited about you because...\n\n\nYou have 3+ years working as a backend software engineer\nYou are familiar with TypeORM (or other equivalent ORM), Relational Databases, NodeJS, TypeScript, Docker, Git and Pull Request flow (GitHub or GitLab or BitBucket)\nYou have experience building performant, maintainable, and scalable REST APIs\nYou have experience writing unit and integration tests\nYou are able to learn quickly, work independently, and consistently get stuff done\nYou are deeply dedicated to product and engineering excellence, with strong, well-considered opinions on the stuff that matters\nYou are obsessed about customers and their problems, and passionate about delivering the best product for them\nYou are an effective collaborator who routinely goes the extra mile to make other people successful\nYou have a solid understanding of programming fundamentals and computer systems\n\nWhy we might be a great fit for you:\n\n\nWe're taking on tough, systemic problems on both sides of the labor market that don't have easy solutions. You will have impact here.\nWe'll grant you a lot of autonomy and trust, and back it up with meaningful empowerment and support. You won't be held back here.\nWe care about outcomes, not output, and since we're all very mission-driven and work hard, we make sure our work is meaningful.\nWe care deeply about diversity and consider it absolutely critical to our success, and we do the hard work to make that true.\n\nWhy we might not be a fit for you:\n\n\nWe're obsessed with our customers, and that drives the bulk of our decisions. If you can't see yourself adopting that mindset, it won't work out.\nWe're an early stage company with great bones, but we have lots of rough edges. You need to be excited about building something from nothing.\nWe know where we're headed, but we're still figuring out how to get there. You need to be ok with plans and priorities shifting.\n\nCompensation and benefits:\n\n\nCompetitive salary and stock options\nUnlimited PTO with recommended minimums\nGenerous extended health and dental care\n\nWe are an equal opportunity employer and do not discriminate on the basis of race, religion, color, national origin, gender, sexual orientation, age, marital status, veteran status, or disability status.	Toronto (Remote)	Nafisa Chowdhury	10.50	2021-11-28 20:28:48.241686	\N
2	Staff Software Engineer	The Role\n\nWe are looking for a Staff Software Engineer to join our team. You will be responsible for defining/evaluating the technical design architecture and code to extract the flight contents at scale from hundreds of carriers from all over the world. We are looking for someone who is a natural problem solver, that is detail-oriented and can work both independently and collaboratively in a fast-paced environment. you’ll write the API integrations and complex algorithms making TripStack’s software solutions solid, scalable and at the same time fault tolerant. You'll innovate and influence the direction of the latest TripStack technologies.\n\n\nResponsibilities:\n\nDesign, write, review code for reliable, high-quality systems at scale serving millions of requests daily\nBe acutely familiar with tradeoffs that occur in distributed systems - consistency vs availability, data integrity in highly concurrent systems.\nProactively identify technology opportunities for the company, and push technical ideas, proposals, and plans to the entire organization and beyond\nBe responsible for good quality code with emphasis on test driven development and clean code\nWork cross-functionally with product managers, data scientists, to deliver high quality products.\nActively mentor the team on new and existing technologies, system design paradigms\nDesired Skills and Experience:\n\nBachelor's degree or higher in Computer Science or related technical field\n5+ years of experience in C# or .Net\n6+ years of experience and understanding of CS fundamentals including data structures, algorithms, and complexity analysis (time and space)\n5+ years of experience and understanding databases such as Postgres\n5+ years of experience and understanding of highly scalable caching/no-sql offerings like Redis, Bigtable, DynamoDB\n2+ years of experience and understanding of event processing platforms like Apache Kafka\n3+ years of experience building large scale, high-performance systems in a complex, multi-tiered, distributed environment\n5+ years of design and architecture knowledge as well as familiarity with object-oriented analysis and design patterns (OOA/OOD)\nProven track record of taking ownership and successfully delivering results\nProven track record of designing/architecting scalable, high availability distributed systems that serve internet traffic direct to consumers or businesses at scale (millions of requests per day)\nExperience with Restful API development\nExperience working in a UNIX/Linux environment\nUnderstanding of performance trade-offs, load balancing and operational issues\nAbility to clearly and concisely communicate with technical and non-technical stakeholders across all levels of the organization\nAdditional experience that would be considered an asset:\n\nExperience with Google Cloud Platform/AWS or other cloud providers & cloud native architecture\nExperience with Machine Learning concepts and model development\nExperience with Docker, Container Orchestration tools like Kubernetes\nExperience with code analysis tools like SonarQube\n\nWhat is takes to succeed here\n\nAmbition and dedication to make a difference and change the way people travel; Where we always play to each other's strength in a high performing team reaching for our common goal. We hold ourselves to the highest expectations, and move with a sense of urgency and hold ourselves accountable and win by staying true to what we believe in.	Canada (Remote)	James Rodriguez	25.35	2021-11-28 20:32:06.331624	\N
6	Sr android Dev	An amzing job !	Kiev	foo bar	15.99	2021-11-29 05:44:05.635	2021-11-29 01:31:48.484
\.


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 202
-- Name: job_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.job_post_id_seq', 6, true);


--
-- TOC entry 2781 (class 2606 OID 16396)
-- Name: job_post job_post_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.job_post
    ADD CONSTRAINT job_post_pkey PRIMARY KEY (id);


-- Completed on 2021-11-29 01:42:07

--
-- PostgreSQL database dump complete
--

