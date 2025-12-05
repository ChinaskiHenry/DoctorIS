--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7
-- Dumped by pg_dump version 16.0

-- Started on 2025-12-05 09:55:17

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 148998)
-- Name: appointment; Type: TABLE; Schema: public; Owner: 23ipp11
--

CREATE TABLE public.appointment (
    appointment_id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    appointment_date date NOT NULL
);


ALTER TABLE public.appointment OWNER TO "23ipp11";

--
-- TOC entry 206 (class 1259 OID 148996)
-- Name: appointment_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: 23ipp11
--

ALTER TABLE public.appointment ALTER COLUMN appointment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.appointment_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 148979)
-- Name: doctor; Type: TABLE; Schema: public; Owner: 23ipp11
--

CREATE TABLE public.doctor (
    doctor_id integer NOT NULL,
    speciality_id integer NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    middle_name character varying(100),
    phone character varying(11)
);


ALTER TABLE public.doctor OWNER TO "23ipp11";

--
-- TOC entry 210 (class 1259 OID 150318)
-- Name: doctor_auth; Type: TABLE; Schema: public; Owner: 23ipp11
--

CREATE TABLE public.doctor_auth (
    doctor_id integer NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.doctor_auth OWNER TO "23ipp11";

--
-- TOC entry 202 (class 1259 OID 148977)
-- Name: doctor_doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: 23ipp11
--

ALTER TABLE public.doctor ALTER COLUMN doctor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.doctor_doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 149015)
-- Name: medical_card; Type: TABLE; Schema: public; Owner: 23ipp11
--

CREATE TABLE public.medical_card (
    record_id integer NOT NULL,
    patient_id integer NOT NULL,
    diagnosis text NOT NULL,
    prescriptions text NOT NULL,
    doctor_notes text NOT NULL
);


ALTER TABLE public.medical_card OWNER TO "23ipp11";

--
-- TOC entry 208 (class 1259 OID 149013)
-- Name: medicalrecord_record_id_seq; Type: SEQUENCE; Schema: public; Owner: 23ipp11
--

ALTER TABLE public.medical_card ALTER COLUMN record_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.medicalrecord_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 148991)
-- Name: patient; Type: TABLE; Schema: public; Owner: 23ipp11
--

CREATE TABLE public.patient (
    patient_id integer NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    middle_name character varying(100) NOT NULL,
    date_of_birth date NOT NULL,
    passport_data character varying(10) NOT NULL,
    phone character varying(11) NOT NULL
);


ALTER TABLE public.patient OWNER TO "23ipp11";

--
-- TOC entry 204 (class 1259 OID 148989)
-- Name: patient_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: 23ipp11
--

ALTER TABLE public.patient ALTER COLUMN patient_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.patient_patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 201 (class 1259 OID 148972)
-- Name: speciality; Type: TABLE; Schema: public; Owner: 23ipp11
--

CREATE TABLE public.speciality (
    speciality_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.speciality OWNER TO "23ipp11";

--
-- TOC entry 200 (class 1259 OID 148970)
-- Name: speciality_speciality_id_seq; Type: SEQUENCE; Schema: public; Owner: 23ipp11
--

ALTER TABLE public.speciality ALTER COLUMN speciality_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.speciality_speciality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3028 (class 0 OID 148998)
-- Dependencies: 207
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: 23ipp11
--

COPY public.appointment (appointment_id, patient_id, doctor_id, appointment_date) FROM stdin;
6	1	1	2025-12-01
7	2	2	2025-12-12
8	3	3	2025-12-07
9	4	4	2025-09-09
10	5	5	2025-12-10
\.


--
-- TOC entry 3024 (class 0 OID 148979)
-- Dependencies: 203
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: 23ipp11
--

COPY public.doctor (doctor_id, speciality_id, last_name, first_name, middle_name, phone) FROM stdin;
1	1	Корнилов	Роман	Павлович	79397991322
2	2	Лобанов	Семен	Сергеевич	79287815445
3	3	Романенко	Глеб	Викторович	79643324574
4	4	Гмырина	Светлана	Алексеевна	79629987214
5	5	Косинова	Надежда	Андреевна	79214873319
\.


--
-- TOC entry 3031 (class 0 OID 150318)
-- Dependencies: 210
-- Data for Name: doctor_auth; Type: TABLE DATA; Schema: public; Owner: 23ipp11
--

COPY public.doctor_auth (doctor_id, login, password) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 149015)
-- Dependencies: 209
-- Data for Name: medical_card; Type: TABLE DATA; Schema: public; Owner: 23ipp11
--

COPY public.medical_card (record_id, patient_id, diagnosis, prescriptions, doctor_notes) FROM stdin;
1	1	Параноидная шизофрения	Консультация психиатра	Бред преследования и вербальные галлюцинации
2	2	Синдром сухого глаза	Капли «Оксиал» 	Длительная работа за компьютером
3	3	Артериальная гипертензия	Холтер АД	Курит, ожирение первой степени
4	4	Уточнённая паховая грыжа	Герниопластика	Грыжа вправимая, риск ущемления
5	5	Перикоронит	Удаление зуба	Острая боль в восьмерке
\.


--
-- TOC entry 3026 (class 0 OID 148991)
-- Dependencies: 205
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: 23ipp11
--

COPY public.patient (patient_id, last_name, first_name, middle_name, date_of_birth, passport_data, phone) FROM stdin;
1	Лошкин	Петр	Васильевич	2000-09-21	1118723922	79215423381
2	Баринов	Виктор	Петрович	1994-12-22	2491302044	79394822662
3	Шлепкин	Даниил	Игоревич	1984-06-20	6423456213	79589883614
4	Редискина	Ольга	Павловна	2001-05-01	6546231647	79215457590
5	Разина	Полина	Сергеевна	2007-06-27	1119423582	74959550583
\.


--
-- TOC entry 3022 (class 0 OID 148972)
-- Dependencies: 201
-- Data for Name: speciality; Type: TABLE DATA; Schema: public; Owner: 23ipp11
--

COPY public.speciality (speciality_id, name) FROM stdin;
1	Психиатр
2	Стоматолог
3	Хирург
4	Терапевт
5	Офтальмолог
\.


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 206
-- Name: appointment_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 23ipp11
--

SELECT pg_catalog.setval('public.appointment_appointment_id_seq', 10, true);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 202
-- Name: doctor_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 23ipp11
--

SELECT pg_catalog.setval('public.doctor_doctor_id_seq', 1, true);


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 208
-- Name: medicalrecord_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 23ipp11
--

SELECT pg_catalog.setval('public.medicalrecord_record_id_seq', 1, false);


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 204
-- Name: patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 23ipp11
--

SELECT pg_catalog.setval('public.patient_patient_id_seq', 1, false);


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 200
-- Name: speciality_speciality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 23ipp11
--

SELECT pg_catalog.setval('public.speciality_speciality_id_seq', 2, true);


--
-- TOC entry 2879 (class 2606 OID 149002)
-- Name: appointment appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (appointment_id);


--
-- TOC entry 2883 (class 2606 OID 150324)
-- Name: doctor_auth doctor_auth_login_key; Type: CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.doctor_auth
    ADD CONSTRAINT doctor_auth_login_key UNIQUE (login);


--
-- TOC entry 2885 (class 2606 OID 150322)
-- Name: doctor_auth doctor_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.doctor_auth
    ADD CONSTRAINT doctor_auth_pkey PRIMARY KEY (doctor_id);


--
-- TOC entry 2875 (class 2606 OID 148983)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (doctor_id);


--
-- TOC entry 2881 (class 2606 OID 149022)
-- Name: medical_card medicalrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.medical_card
    ADD CONSTRAINT medicalrecord_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2877 (class 2606 OID 148995)
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 2873 (class 2606 OID 148976)
-- Name: speciality speciality_pkey; Type: CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.speciality
    ADD CONSTRAINT speciality_pkey PRIMARY KEY (speciality_id);


--
-- TOC entry 2887 (class 2606 OID 149008)
-- Name: appointment fk_appointment_doctor; Type: FK CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_appointment_doctor FOREIGN KEY (doctor_id) REFERENCES public.doctor(doctor_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2888 (class 2606 OID 149003)
-- Name: appointment fk_appointment_patient; Type: FK CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_appointment_patient FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2890 (class 2606 OID 150325)
-- Name: doctor_auth fk_doctor_auth_doctor; Type: FK CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.doctor_auth
    ADD CONSTRAINT fk_doctor_auth_doctor FOREIGN KEY (doctor_id) REFERENCES public.doctor(doctor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2886 (class 2606 OID 148984)
-- Name: doctor fk_doctor_speciality; Type: FK CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT fk_doctor_speciality FOREIGN KEY (speciality_id) REFERENCES public.speciality(speciality_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2889 (class 2606 OID 149023)
-- Name: medical_card fk_medicalrecord_patient; Type: FK CONSTRAINT; Schema: public; Owner: 23ipp11
--

ALTER TABLE ONLY public.medical_card
    ADD CONSTRAINT fk_medicalrecord_patient FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-12-05 09:55:17

--
-- PostgreSQL database dump complete
--

