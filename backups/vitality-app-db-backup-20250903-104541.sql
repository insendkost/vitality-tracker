--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-1.pgdg120+1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-1.pgdg120+1)

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
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_configurations (
    id integer NOT NULL,
    config_key character varying(255) NOT NULL,
    config_value text,
    config_descr text,
    data_type character varying(50) DEFAULT 'string'::character varying,
    category character varying(100),
    is_encrypted boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(100),
    updated_by character varying(100)
);


ALTER TABLE public.app_configurations OWNER TO postgres;

--
-- Name: app_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_configurations_id_seq OWNER TO postgres;

--
-- Name: app_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_configurations_id_seq OWNED BY public.app_configurations.id;


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    id integer NOT NULL,
    app_user_id integer,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    user_type_id integer NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modified_by integer
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_id_seq OWNER TO postgres;

--
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_id_seq OWNED BY public.app_user.app_user_id;


--
-- Name: app_user_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_id_seq1 OWNER TO postgres;

--
-- Name: app_user_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_id_seq1 OWNED BY public.app_user.id;


--
-- Name: dic_app_user_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_app_user_types (
    id integer NOT NULL,
    type_dscr character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dic_app_user_types OWNER TO postgres;

--
-- Name: dic_app_user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_app_user_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_app_user_types_id_seq OWNER TO postgres;

--
-- Name: dic_app_user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_app_user_types_id_seq OWNED BY public.dic_app_user_types.id;


--
-- Name: dic_gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_gender (
    id integer NOT NULL,
    gender character varying(50) NOT NULL
);


ALTER TABLE public.dic_gender OWNER TO postgres;

--
-- Name: dic_gender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_gender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_gender_id_seq OWNER TO postgres;

--
-- Name: dic_gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_gender_id_seq OWNED BY public.dic_gender.id;


--
-- Name: dic_meal_plan_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_meal_plan_status (
    id integer NOT NULL,
    plan_status character varying(50)
);


ALTER TABLE public.dic_meal_plan_status OWNER TO postgres;

--
-- Name: dic_meal_plan_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_meal_plan_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_meal_plan_status_id_seq OWNER TO postgres;

--
-- Name: dic_meal_plan_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_meal_plan_status_id_seq OWNED BY public.dic_meal_plan_status.id;


--
-- Name: dic_meal_plan_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_meal_plan_type (
    id integer NOT NULL,
    plan_type_name character varying(50)
);


ALTER TABLE public.dic_meal_plan_type OWNER TO postgres;

--
-- Name: dic_meal_plan_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_meal_plan_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_meal_plan_type_id_seq OWNER TO postgres;

--
-- Name: dic_meal_plan_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_meal_plan_type_id_seq OWNED BY public.dic_meal_plan_type.id;


--
-- Name: dic_meal_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_meal_type (
    id integer NOT NULL,
    meal_type character varying(50)
);


ALTER TABLE public.dic_meal_type OWNER TO postgres;

--
-- Name: dic_meal_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_meal_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_meal_type_id_seq OWNER TO postgres;

--
-- Name: dic_meal_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_meal_type_id_seq OWNED BY public.dic_meal_type.id;


--
-- Name: dic_mood_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_mood_types (
    id integer NOT NULL,
    dscr character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dic_mood_types OWNER TO postgres;

--
-- Name: dic_mood_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_mood_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_mood_types_id_seq OWNER TO postgres;

--
-- Name: dic_mood_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_mood_types_id_seq OWNED BY public.dic_mood_types.id;


--
-- Name: dic_physical_activity_lvl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_physical_activity_lvl (
    id integer NOT NULL,
    type_dsc character varying(50) NOT NULL
);


ALTER TABLE public.dic_physical_activity_lvl OWNER TO postgres;

--
-- Name: dic_physical_activity_lvl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_physical_activity_lvl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_physical_activity_lvl_id_seq OWNER TO postgres;

--
-- Name: dic_physical_activity_lvl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_physical_activity_lvl_id_seq OWNED BY public.dic_physical_activity_lvl.id;


--
-- Name: dic_preferences_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_preferences_category (
    id integer NOT NULL,
    dscr character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dic_preferences_category OWNER TO postgres;

--
-- Name: dic_preferences_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_preferences_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_preferences_category_id_seq OWNER TO postgres;

--
-- Name: dic_preferences_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_preferences_category_id_seq OWNED BY public.dic_preferences_category.id;


--
-- Name: dic_sleep_quality_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_sleep_quality_type (
    id integer NOT NULL,
    dscr character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dic_sleep_quality_type OWNER TO postgres;

--
-- Name: dic_sleep_quality_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_sleep_quality_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_sleep_quality_type_id_seq OWNER TO postgres;

--
-- Name: dic_sleep_quality_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_sleep_quality_type_id_seq OWNED BY public.dic_sleep_quality_type.id;


--
-- Name: dic_workout_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dic_workout_types (
    id integer NOT NULL,
    type_dscr character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dic_workout_types OWNER TO postgres;

--
-- Name: dic_workout_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dic_workout_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dic_workout_types_id_seq OWNER TO postgres;

--
-- Name: dic_workout_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dic_workout_types_id_seq OWNED BY public.dic_workout_types.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    calories_per_100g double precision NOT NULL,
    protein_per_100g double precision DEFAULT 0.0,
    carbs_per_100g double precision DEFAULT 0.0,
    fat_per_100g double precision DEFAULT 0.0,
    fiber_per_100g double precision DEFAULT 0.0,
    sugar_per_100g double precision DEFAULT 0.0,
    sodium_per_100g double precision DEFAULT 0.0,
    category character varying(50),
    dish_type character varying(20) DEFAULT 'system'::character varying NOT NULL,
    serving_size_g double precision DEFAULT 100.0,
    serving_description character varying(100),
    created_by_user_id integer,
    is_active boolean DEFAULT true,
    is_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dishes OWNER TO postgres;

--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_id_seq OWNER TO postgres;

--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insights (
    id integer NOT NULL,
    notes jsonb NOT NULL,
    insight_date date DEFAULT CURRENT_DATE NOT NULL,
    insight_type character varying(50),
    title character varying(255),
    content text,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.insights OWNER TO postgres;

--
-- Name: insights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insights_id_seq OWNER TO postgres;

--
-- Name: insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insights_id_seq OWNED BY public.insights.id;


--
-- Name: mood_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mood_record (
    id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    intensity integer,
    notes text,
    user_id integer NOT NULL,
    mood_quality_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT mood_record_intensity_check CHECK (((intensity >= 1) AND (intensity <= 10)))
);


ALTER TABLE public.mood_record OWNER TO postgres;

--
-- Name: mood_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mood_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mood_record_id_seq OWNER TO postgres;

--
-- Name: mood_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mood_record_id_seq OWNED BY public.mood_record.id;


--
-- Name: nutrition_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nutrition_records (
    id integer NOT NULL,
    meal_dscr jsonb NOT NULL,
    calories double precision NOT NULL,
    proteins double precision NOT NULL,
    carbs double precision NOT NULL,
    fats double precision NOT NULL,
    datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    meal_type character varying(50),
    food_name character varying(255),
    notes text,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.nutrition_records OWNER TO postgres;

--
-- Name: nutrition_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nutrition_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nutrition_records_id_seq OWNER TO postgres;

--
-- Name: nutrition_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nutrition_records_id_seq OWNED BY public.nutrition_records.id;


--
-- Name: sleep_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sleep_record (
    id integer NOT NULL,
    duration double precision NOT NULL,
    datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    duration_hours double precision,
    notes text,
    user_id integer NOT NULL,
    sleep_quality_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sleep_record OWNER TO postgres;

--
-- Name: sleep_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sleep_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sleep_record_id_seq OWNER TO postgres;

--
-- Name: sleep_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sleep_record_id_seq OWNED BY public.sleep_record.id;


--
-- Name: user_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_configurations (
    id integer NOT NULL,
    app_user_id integer NOT NULL,
    configuration_data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_configurations OWNER TO postgres;

--
-- Name: user_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_configurations_id_seq OWNER TO postgres;

--
-- Name: user_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_configurations_id_seq OWNED BY public.user_configurations.id;


--
-- Name: user_daily_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_daily_activity (
    id integer NOT NULL,
    user_id integer NOT NULL,
    calories_consumed double precision,
    calories_burned double precision,
    steps integer,
    distance double precision,
    hours_sleep double precision,
    activity_date date DEFAULT CURRENT_DATE NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modified_by integer,
    CONSTRAINT check_calories_burned_positive CHECK (((calories_burned IS NULL) OR (calories_burned >= (0)::double precision))),
    CONSTRAINT check_calories_consumed_positive CHECK (((calories_consumed IS NULL) OR (calories_consumed >= (0)::double precision))),
    CONSTRAINT check_distance_positive CHECK (((distance IS NULL) OR (distance >= (0)::double precision))),
    CONSTRAINT check_sleep_valid CHECK (((hours_sleep IS NULL) OR ((hours_sleep >= (0)::double precision) AND (hours_sleep <= (24)::double precision)))),
    CONSTRAINT check_steps_positive CHECK (((steps IS NULL) OR (steps >= 0)))
);


ALTER TABLE public.user_daily_activity OWNER TO postgres;

--
-- Name: user_daily_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_daily_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_daily_activity_id_seq OWNER TO postgres;

--
-- Name: user_daily_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_daily_activity_id_seq OWNED BY public.user_daily_activity.id;


--
-- Name: user_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_data (
    id integer NOT NULL,
    user_id integer NOT NULL,
    height double precision,
    weight double precision,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_of_birth date,
    user_activity integer DEFAULT 0,
    user_gender integer,
    modified_by integer
);


ALTER TABLE public.user_data OWNER TO postgres;

--
-- Name: user_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_data_id_seq OWNER TO postgres;

--
-- Name: user_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_data_id_seq OWNED BY public.user_data.id;


--
-- Name: user_detailed_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_detailed_data (
    id integer NOT NULL,
    user_id integer NOT NULL,
    phone_number character varying(20) NOT NULL,
    city character varying(100),
    country character varying(100),
    street character varying(255),
    home_number character varying(20),
    postal_code character varying(20),
    user_app_code character varying(50),
    preferred_language character varying(10) DEFAULT 'en'::character varying,
    timezone character varying(50) DEFAULT 'UTC'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modified_by integer
);


ALTER TABLE public.user_detailed_data OWNER TO postgres;

--
-- Name: user_detailed_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_detailed_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_detailed_data_id_seq OWNER TO postgres;

--
-- Name: user_detailed_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_detailed_data_id_seq OWNED BY public.user_detailed_data.id;


--
-- Name: user_favorite_dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_favorite_dishes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    dish_id integer NOT NULL,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_favorite_dishes OWNER TO postgres;

--
-- Name: user_favorite_dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_favorite_dishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_favorite_dishes_id_seq OWNER TO postgres;

--
-- Name: user_favorite_dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_favorite_dishes_id_seq OWNED BY public.user_favorite_dishes.id;


--
-- Name: user_meal_plan_meals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_meal_plan_meals (
    id integer NOT NULL,
    meal_plan_id integer NOT NULL,
    day_number smallint NOT NULL,
    meal_type integer DEFAULT 4 NOT NULL,
    recipe_id integer,
    food_name character varying(255) NOT NULL,
    portion_size character varying(100),
    calories numeric(6,2),
    protein_g numeric(6,2),
    carbs_g numeric(6,2),
    fat_g numeric(6,2),
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_meal_plan_meals OWNER TO postgres;

--
-- Name: user_meal_plan_meals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_meal_plan_meals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_meal_plan_meals_id_seq OWNER TO postgres;

--
-- Name: user_meal_plan_meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_meal_plan_meals_id_seq OWNED BY public.user_meal_plan_meals.id;


--
-- Name: user_meal_plan_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_meal_plan_progress (
    id integer NOT NULL,
    meal_plan_id integer NOT NULL,
    user_id integer NOT NULL,
    record_date date NOT NULL,
    weight numeric(5,2),
    body_fat_percentage numeric(4,2),
    notes text,
    adherence_score smallint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT user_meal_plan_progress_adherence_score_check CHECK (((adherence_score >= 0) AND (adherence_score <= 100)))
);


ALTER TABLE public.user_meal_plan_progress OWNER TO postgres;

--
-- Name: user_meal_plan_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_meal_plan_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_meal_plan_progress_id_seq OWNER TO postgres;

--
-- Name: user_meal_plan_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_meal_plan_progress_id_seq OWNED BY public.user_meal_plan_progress.id;


--
-- Name: user_meals_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_meals_plan (
    id integer NOT NULL,
    user_id integer NOT NULL,
    plan_name character varying(255) NOT NULL,
    description text,
    plan_type integer DEFAULT 5 NOT NULL,
    duration_days integer DEFAULT 7 NOT NULL,
    start_date date NOT NULL,
    end_date date,
    daily_calories integer,
    daily_protein_g numeric(6,2),
    daily_carbs_g numeric(6,2),
    daily_fat_g numeric(6,2),
    daily_fiber_g numeric(6,2),
    plan_status integer DEFAULT 2 NOT NULL,
    is_template boolean DEFAULT false,
    meals_per_day smallint DEFAULT 3 NOT NULL,
    include_snacks boolean DEFAULT false,
    dietary_restrictions jsonb,
    excluded_ingredients jsonb,
    preferred_cuisines jsonb,
    current_weight numeric(5,2),
    target_weight numeric(5,2),
    activity_level integer DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by integer,
    modified_by integer
);


ALTER TABLE public.user_meals_plan OWNER TO postgres;

--
-- Name: user_meals_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_meals_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_meals_plan_id_seq OWNER TO postgres;

--
-- Name: user_meals_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_meals_plan_id_seq OWNED BY public.user_meals_plan.id;


--
-- Name: user_scheduled_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_scheduled_activities (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activity_name character varying(255) NOT NULL,
    activity_description text,
    activity_from timestamp without time zone NOT NULL,
    activity_to timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modified_by integer,
    is_completed boolean DEFAULT false,
    CONSTRAINT check_activtiy_time_order CHECK ((activity_to > activity_from))
);


ALTER TABLE public.user_scheduled_activities OWNER TO postgres;

--
-- Name: user_scheduled_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_scheduled_activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_scheduled_activities_id_seq OWNER TO postgres;

--
-- Name: user_scheduled_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_scheduled_activities_id_seq OWNED BY public.user_scheduled_activities.id;


--
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_sessions (
    id integer NOT NULL,
    session_token character varying(255) NOT NULL,
    user_id integer NOT NULL,
    is_active boolean DEFAULT true,
    ip_address inet,
    user_agent text,
    last_activity timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    expires_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    device_type character varying(50),
    location_country character varying(2),
    location_city character varying(100)
);


ALTER TABLE public.user_sessions OWNER TO postgres;

--
-- Name: user_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_sessions_id_seq OWNER TO postgres;

--
-- Name: user_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_sessions_id_seq OWNED BY public.user_sessions.id;


--
-- Name: weight_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weight_history (
    id integer NOT NULL,
    user_id integer NOT NULL,
    weight double precision NOT NULL,
    recorded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    notes text
);


ALTER TABLE public.weight_history OWNER TO postgres;

--
-- Name: weight_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weight_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weight_history_id_seq OWNER TO postgres;

--
-- Name: weight_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weight_history_id_seq OWNED BY public.weight_history.id;


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workouts (
    id integer NOT NULL,
    workout_data jsonb NOT NULL,
    duration_minutes integer NOT NULL,
    workout_date date DEFAULT CURRENT_DATE NOT NULL,
    workout_time time without time zone DEFAULT CURRENT_TIME,
    calories_burned integer,
    notes text,
    user_id integer NOT NULL,
    workout_type_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT workouts_calories_burned_check CHECK ((calories_burned >= 0)),
    CONSTRAINT workouts_duration_minutes_check CHECK ((duration_minutes > 0))
);


ALTER TABLE public.workouts OWNER TO postgres;

--
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workouts_id_seq OWNER TO postgres;

--
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workouts_id_seq OWNED BY public.workouts.id;


--
-- Name: app_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_configurations ALTER COLUMN id SET DEFAULT nextval('public.app_configurations_id_seq'::regclass);


--
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_id_seq1'::regclass);


--
-- Name: app_user app_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user ALTER COLUMN app_user_id SET DEFAULT nextval('public.app_user_id_seq'::regclass);


--
-- Name: dic_app_user_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_app_user_types ALTER COLUMN id SET DEFAULT nextval('public.dic_app_user_types_id_seq'::regclass);


--
-- Name: dic_gender id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_gender ALTER COLUMN id SET DEFAULT nextval('public.dic_gender_id_seq'::regclass);


--
-- Name: dic_meal_plan_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_meal_plan_status ALTER COLUMN id SET DEFAULT nextval('public.dic_meal_plan_status_id_seq'::regclass);


--
-- Name: dic_meal_plan_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_meal_plan_type ALTER COLUMN id SET DEFAULT nextval('public.dic_meal_plan_type_id_seq'::regclass);


--
-- Name: dic_meal_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_meal_type ALTER COLUMN id SET DEFAULT nextval('public.dic_meal_type_id_seq'::regclass);


--
-- Name: dic_mood_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_mood_types ALTER COLUMN id SET DEFAULT nextval('public.dic_mood_types_id_seq'::regclass);


--
-- Name: dic_physical_activity_lvl id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_physical_activity_lvl ALTER COLUMN id SET DEFAULT nextval('public.dic_physical_activity_lvl_id_seq'::regclass);


--
-- Name: dic_preferences_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_preferences_category ALTER COLUMN id SET DEFAULT nextval('public.dic_preferences_category_id_seq'::regclass);


--
-- Name: dic_sleep_quality_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_sleep_quality_type ALTER COLUMN id SET DEFAULT nextval('public.dic_sleep_quality_type_id_seq'::regclass);


--
-- Name: dic_workout_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_workout_types ALTER COLUMN id SET DEFAULT nextval('public.dic_workout_types_id_seq'::regclass);


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: insights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights ALTER COLUMN id SET DEFAULT nextval('public.insights_id_seq'::regclass);


--
-- Name: mood_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mood_record ALTER COLUMN id SET DEFAULT nextval('public.mood_record_id_seq'::regclass);


--
-- Name: nutrition_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_records ALTER COLUMN id SET DEFAULT nextval('public.nutrition_records_id_seq'::regclass);


--
-- Name: sleep_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sleep_record ALTER COLUMN id SET DEFAULT nextval('public.sleep_record_id_seq'::regclass);


--
-- Name: user_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_configurations ALTER COLUMN id SET DEFAULT nextval('public.user_configurations_id_seq'::regclass);


--
-- Name: user_daily_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activity ALTER COLUMN id SET DEFAULT nextval('public.user_daily_activity_id_seq'::regclass);


--
-- Name: user_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data ALTER COLUMN id SET DEFAULT nextval('public.user_data_id_seq'::regclass);


--
-- Name: user_detailed_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detailed_data ALTER COLUMN id SET DEFAULT nextval('public.user_detailed_data_id_seq'::regclass);


--
-- Name: user_favorite_dishes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorite_dishes ALTER COLUMN id SET DEFAULT nextval('public.user_favorite_dishes_id_seq'::regclass);


--
-- Name: user_meal_plan_meals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meal_plan_meals ALTER COLUMN id SET DEFAULT nextval('public.user_meal_plan_meals_id_seq'::regclass);


--
-- Name: user_meal_plan_progress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meal_plan_progress ALTER COLUMN id SET DEFAULT nextval('public.user_meal_plan_progress_id_seq'::regclass);


--
-- Name: user_meals_plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meals_plan ALTER COLUMN id SET DEFAULT nextval('public.user_meals_plan_id_seq'::regclass);


--
-- Name: user_scheduled_activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_scheduled_activities ALTER COLUMN id SET DEFAULT nextval('public.user_scheduled_activities_id_seq'::regclass);


--
-- Name: user_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions ALTER COLUMN id SET DEFAULT nextval('public.user_sessions_id_seq'::regclass);


--
-- Name: weight_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weight_history ALTER COLUMN id SET DEFAULT nextval('public.weight_history_id_seq'::regclass);


--
-- Name: workouts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts ALTER COLUMN id SET DEFAULT nextval('public.workouts_id_seq'::regclass);


--
-- Data for Name: app_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_configurations (id, config_key, config_value, config_descr, data_type, category, is_encrypted, created_at, updated_at, created_by, updated_by) FROM stdin;
1	app_name	MyApplication	Application display name	string	general	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
2	maintenance_mode	false	Enable/disable maintenance mode	boolean	system	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
3	max_file_upload_size	10485760	Maximum file upload size in bytes (10MB)	integer	system	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
4	email_smtp_host	smtp.gmail.com	SMTP server hostname	string	email	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
5	email_smtp_port	587	SMTP server port	integer	email	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
6	feature_dark_mode	true	Enable dark mode feature	boolean	features	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
7	api_rate_limit	100	API requests per minute limit	integer	security	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
8	session_timeout	1800	Session timeout in seconds (30 min)	integer	security	f	2025-07-21 20:08:20.297986	2025-07-21 20:08:20.297986	\N	\N
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (id, app_user_id, username, email, password_hash, user_type_id, is_active, created_at, updated_at, modified_by) FROM stdin;
1	1000	john_doe	john.doe@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	1	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
2	1001	jane_smith	jane.smith@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	1	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
3	1002	mike_wilson	mike.wilson@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	2	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
4	1003	sarah_jones	sarah.jones@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	1	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
5	1004	alex_brown	alex.brown@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	3	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
6	1005	emma_davis	emma.davis@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	1	f	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
7	1006	chris_taylor	chris.taylor@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	2	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
8	1007	lisa_anderson	lisa.anderson@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	1	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
9	1008	tom_martinez	tom.martinez@example.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	1	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
10	1009	admin_user	admin@fitness-app.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	3	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
11	1010	test_user_1	test1@test.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	4	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
12	1011	test_user_2	test2@test.com	$2b$12$LQv3c1yqBwlNnZgOSPxLke7sO3.p6vJNLLGhMJJZhxPt.1vXNRj2m	4	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
13	1012	test_user_3	test3@test.com	$2b$12$LQv3c1yqBwlNnZgOSPxLke7sO3.p6vJNLLGhMJJZhxPt.1vXNRj2m	4	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
14	1013	qa_tester	qa@test.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	4	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
15	1014	demo_user	demo@test.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	4	t	2025-07-21 20:08:20.331605	2025-07-21 20:08:20.331605	\N
37	1036	system_user_test_1	system.user_test_1@system.com	$2b$12$LQv3c1yqBwEUYdz.sYjYsOuuMo7.VfV1TtYXvHuPH5.9TBYjzQm4K	3	t	2025-08-31 17:53:32.365441	2025-08-31 17:53:32.365441	\N
38	1037	system_user_test_2	system.user_test_2@system.com	$2b$12$LQv3c1yqBwEUYdz.sYjYsOuuMo7.VfV1TtYXvHuPH5.9TBYjzQm4K	3	t	2025-08-31 17:56:41.915203	2025-08-31 17:56:41.915203	\N
34	1033	system_user	system.user@system.com	$2b$12$xxnMghSbYYfTXJHXQuN12.OW4pNN0AZcGllAgIIbz7mQuYPaoq1iK	3	t	2025-08-31 17:46:50.391536	2025-08-31 17:46:50.391536	\N
42	1038	d_admin	d_admin@system.com	$2b$12$GX7PcR8eaiS/ldvqK3yM7.XNUAzNBbwuOwr6HXuvzjwYoYYhuKgOu	6	t	2025-09-02 19:35:51.455075	2025-09-02 19:35:51.455075	\N
\.


--
-- Data for Name: dic_app_user_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_app_user_types (id, type_dscr, created_at) FROM stdin;
1	Regular	2025-07-21 20:08:20.29131
2	Premium	2025-07-21 20:08:20.29131
3	Admin	2025-07-21 20:08:20.29131
4	TestUser	2025-07-21 20:08:20.29131
5	System_User	2025-08-31 18:00:17.846312
6	System_Admin	2025-09-02 19:31:22.595218
\.


--
-- Data for Name: dic_gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_gender (id, gender) FROM stdin;
1	Male
2	Female
3	Other
\.


--
-- Data for Name: dic_meal_plan_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_meal_plan_status (id, plan_status) FROM stdin;
1	Draft
2	Active
3	Completed
4	Paused
5	Cancelled
\.


--
-- Data for Name: dic_meal_plan_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_meal_plan_type (id, plan_type_name) FROM stdin;
1	Weight Loss
2	Weight Gain
3	Maintenance
4	Muscle Building
5	Custom
\.


--
-- Data for Name: dic_meal_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_meal_type (id, meal_type) FROM stdin;
1	Breakfast
2	Lunch
3	Dinner
4	Snack
\.


--
-- Data for Name: dic_mood_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_mood_types (id, dscr, created_at) FROM stdin;
1	Very Happy	2025-07-21 20:08:20.295521
2	Happy	2025-07-21 20:08:20.295521
3	Content	2025-07-21 20:08:20.295521
4	Neutral	2025-07-21 20:08:20.295521
5	Anxious	2025-07-21 20:08:20.295521
6	Sad	2025-07-21 20:08:20.295521
7	Very Sad	2025-07-21 20:08:20.295521
8	Stressed	2025-07-21 20:08:20.295521
9	Energetic	2025-07-21 20:08:20.295521
10	Tired	2025-07-21 20:08:20.295521
\.


--
-- Data for Name: dic_physical_activity_lvl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_physical_activity_lvl (id, type_dsc) FROM stdin;
1	Sedentary
2	Lightly Active
3	Moderately Active
4	Very Active
5	Extremely Active
6	test
\.


--
-- Data for Name: dic_preferences_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_preferences_category (id, dscr, created_at) FROM stdin;
1	preferences	2025-07-21 20:08:20.296792
2	notifications	2025-07-21 20:08:20.296792
\.


--
-- Data for Name: dic_sleep_quality_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_sleep_quality_type (id, dscr, created_at) FROM stdin;
1	Excellent	2025-07-21 20:08:20.29463
2	Good	2025-07-21 20:08:20.29463
3	Fair	2025-07-21 20:08:20.29463
4	Poor	2025-07-21 20:08:20.29463
5	Very Poor	2025-07-21 20:08:20.29463
\.


--
-- Data for Name: dic_workout_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dic_workout_types (id, type_dscr, created_at) FROM stdin;
1	Cardio	2025-07-21 20:08:20.293464
2	Strength Training	2025-07-21 20:08:20.293464
3	Flexibility	2025-07-21 20:08:20.293464
4	HIIT	2025-07-21 20:08:20.293464
5	Yoga	2025-07-21 20:08:20.293464
6	Pilates	2025-07-21 20:08:20.293464
7	Swimming	2025-07-21 20:08:20.293464
8	Running	2025-07-21 20:08:20.293464
9	Cycling	2025-07-21 20:08:20.293464
10	CrossFit	2025-07-21 20:08:20.293464
11	Dance	2025-07-21 20:08:20.293464
12	Martial Arts	2025-07-21 20:08:20.293464
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dishes (id, name, description, calories_per_100g, protein_per_100g, carbs_per_100g, fat_per_100g, fiber_per_100g, sugar_per_100g, sodium_per_100g, category, dish_type, serving_size_g, serving_description, created_by_user_id, is_active, is_verified, created_at, updated_at) FROM stdin;
1	Oatmeal (cooked)	Plain cooked oatmeal	68	2.4	12	1.4	1.7	0	0	breakfast	system	150	1 cup	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
2	Scrambled Eggs	Basic scrambled eggs	154	11	1.1	11.2	0	0	0	breakfast	system	120	2 large eggs	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
3	Greek Yogurt (plain)	Plain Greek yogurt	100	10	3.6	5	0	0	0	breakfast	system	170	1 cup	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
4	Banana	Fresh banana	89	1.1	22.8	0.3	2.6	0	0	breakfast	system	120	1 medium	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
5	Whole Wheat Toast	Whole wheat bread slice	247	13	41	4.2	7	0	0	breakfast	system	28	1 slice	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
6	Grilled Chicken Breast	Skinless, boneless chicken breast	165	31	0	3.6	0	0	0	main_course	system	150	1 breast	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
7	Salmon Fillet	Atlantic salmon fillet	208	25.4	0	12.4	0	0	0	main_course	system	150	1 fillet	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
8	Ground Beef (lean)	90% lean ground beef	176	25	0	8	0	0	0	main_course	system	100	100g serving	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
9	Tofu (firm)	Firm tofu	144	17.3	3	8.7	2.3	0	0	main_course	system	100	100g serving	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
10	Broccoli	Fresh broccoli	34	2.8	7	0.4	2.6	0	0	side_dish	system	100	1 cup chopped	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
11	Spinach	Fresh spinach leaves	23	2.9	3.6	0.4	2.2	0	0	salad	system	30	1 cup	\N	t	t	2025-07-21 23:13:52.448669	2025-07-21 23:13:52.448669
\.


--
-- Data for Name: insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insights (id, notes, insight_date, insight_type, title, content, user_id, created_at) FROM stdin;
\.


--
-- Data for Name: mood_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mood_record (id, "timestamp", intensity, notes, user_id, mood_quality_id, created_at) FROM stdin;
\.


--
-- Data for Name: nutrition_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nutrition_records (id, meal_dscr, calories, proteins, carbs, fats, datetime, meal_type, food_name, notes, user_id, created_at) FROM stdin;
\.


--
-- Data for Name: sleep_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sleep_record (id, duration, datetime, start_time, end_time, duration_hours, notes, user_id, sleep_quality_id, created_at) FROM stdin;
\.


--
-- Data for Name: user_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_configurations (id, app_user_id, configuration_data, created_at, updated_at) FROM stdin;
1	1001	{"preferences": {"theme": "dark", "language": "en", "timezone": "America/New_York"}, "notifications": {"push": false, "email": true}}	2025-07-21 20:08:20.335438	2025-07-21 20:08:20.335438
2	1002	{"preferences": {"theme": "light", "language": "es"}, "notifications": {"email": false}}	2025-07-21 20:08:20.335438	2025-07-21 20:08:20.335438
\.


--
-- Data for Name: user_daily_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_daily_activity (id, user_id, calories_consumed, calories_burned, steps, distance, hours_sleep, activity_date, created_at, updated_at, modified_by) FROM stdin;
\.


--
-- Data for Name: user_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_data (id, user_id, height, weight, created_at, updated_at, date_of_birth, user_activity, user_gender, modified_by) FROM stdin;
5	1001	175.5	70.2	2025-08-31 17:37:36.18747	2025-08-31 17:37:36.18747	1990-05-15	3	1	\N
3	1000	185.5	77.1	2025-08-31 17:01:10.877845	2025-09-02 20:01:32.382633	1994-04-01	3	1	\N
\.


--
-- Data for Name: user_detailed_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_detailed_data (id, user_id, phone_number, city, country, street, home_number, postal_code, user_app_code, preferred_language, timezone, created_at, updated_at, modified_by) FROM stdin;
\.


--
-- Data for Name: user_favorite_dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_favorite_dishes (id, user_id, dish_id, added_at) FROM stdin;
\.


--
-- Data for Name: user_meal_plan_meals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_meal_plan_meals (id, meal_plan_id, day_number, meal_type, recipe_id, food_name, portion_size, calories, protein_g, carbs_g, fat_g, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_meal_plan_progress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_meal_plan_progress (id, meal_plan_id, user_id, record_date, weight, body_fat_percentage, notes, adherence_score, created_at) FROM stdin;
\.


--
-- Data for Name: user_meals_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_meals_plan (id, user_id, plan_name, description, plan_type, duration_days, start_date, end_date, daily_calories, daily_protein_g, daily_carbs_g, daily_fat_g, daily_fiber_g, plan_status, is_template, meals_per_day, include_snacks, dietary_restrictions, excluded_ingredients, preferred_cuisines, current_weight, target_weight, activity_level, created_at, updated_at, created_by, modified_by) FROM stdin;
\.


--
-- Data for Name: user_scheduled_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_scheduled_activities (id, user_id, activity_name, activity_description, activity_from, activity_to, created_at, updated_at, modified_by, is_completed) FROM stdin;
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_sessions (id, session_token, user_id, is_active, ip_address, user_agent, last_activity, created_at, updated_at, expires_at, device_type, location_country, location_city) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMCIsImV4cCI6MTc1MzEzOTM1NH0.W1rsL2A7Z2eduiWDLtTgcHdpZ7QhrUj6U0goA8UB5Jw	10	t	\N	\N	2025-07-21 20:09:14.08739	2025-07-21 20:09:14.094413	2025-07-21 20:09:14.08739	2025-07-21 23:09:14.094416	\N	\N	\N
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzNCIsImV4cCI6MTc1NjY3NzYxMH0.M6ljSni0Ca5Yai-IaE0DiIE86aYAjRoF0Sz4KQ6Fxxc	34	t	\N	\N	2025-08-31 19:00:10.135923	2025-08-31 19:00:10.136914	2025-08-31 19:00:10.135923	2025-08-31 22:00:10.136915	\N	\N	\N
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZXhwIjoxNzU2Njc3NTc1fQ.CogV-CcndK8cedpi4RnT0jJrQjeYDjiLuxbEKeya-m4	1	f	\N	\N	2025-08-31 18:59:35.018345	2025-08-31 18:59:35.024469	2025-09-02 18:05:48.37581	2025-08-31 21:59:35.024473	\N	\N	\N
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZXhwIjoxNzU2ODQ3MTQ4fQ.MSAneS1oxsRbf8WmT0q9QeNzwtWzR0uv7l9YFlX534w	1	f	\N	\N	2025-09-02 18:05:48.758354	2025-09-02 18:05:48.764237	2025-09-02 18:43:15.981175	2025-09-02 21:05:48.764239	\N	\N	\N
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZXhwIjoxNzU2ODQ5Mzk2fQ.YnN8RqTBFAqqw2dsVclpHjCqNKQePvejUtj1dX_AmBM	1	f	\N	\N	2025-09-02 18:43:16.370329	2025-09-02 18:43:16.375975	2025-09-02 19:06:34.113905	2025-09-02 21:43:16.375977	\N	\N	\N
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZXhwIjoxNzU2ODUwNzk0fQ.zwElhcEaCABNCackbgFRYmmSfP1kHYcJshEkf-kxPRQ	1	f	\N	\N	2025-09-02 19:06:34.499208	2025-09-02 19:06:34.503465	2025-09-02 19:35:01.899285	2025-09-02 22:06:34.503469	\N	\N	\N
7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1IiwiZXhwIjoxNzU2ODUyNTIwfQ.awmlGOm6nnEnC9mH34H0KHCmtEJE35PY1ltBidZMx7o	5	t	\N	\N	2025-09-02 19:35:20.709292	2025-09-02 19:35:20.710169	2025-09-02 19:35:20.709292	2025-09-02 22:35:20.71017	\N	\N	\N
8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MiIsImV4cCI6MTc1Njg1Mjk4MH0.NqEdQRWwAeZINLIH9qArbU0XeQCim4elqnSihJEsd8Y	42	f	\N	\N	2025-09-02 19:43:00.31818	2025-09-02 19:43:00.322983	2025-09-02 19:45:47.99718	2025-09-02 22:43:00.322987	\N	\N	\N
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MiIsImV4cCI6MTc1Njg1MzE0OH0.leQ7MTWpbI1ChezjTA-VOZgRkOuYeDRJO2QdBfNaGOw	42	f	\N	\N	2025-09-02 19:45:48.390194	2025-09-02 19:45:48.394488	2025-09-02 19:56:26.568634	2025-09-02 22:45:48.394492	\N	\N	\N
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MiIsImV4cCI6MTc1Njg1Mzc4Nn0.htiNa4WdIzBqlMg0_khyeglwhfNKwPOZIqI3hRfTbzU	42	f	\N	\N	2025-09-02 19:56:26.952686	2025-09-02 19:56:26.956694	2025-09-02 20:01:16.2661	2025-09-02 22:56:26.956695	\N	\N	\N
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MiIsImV4cCI6MTc1Njg1NDA3Nn0.O_AAamuTIeyXOO7ZAb4dlmPPqFh9zGq1FlxJPTzP9aQ	42	t	\N	\N	2025-09-02 20:01:16.657686	2025-09-02 20:01:16.661596	2025-09-02 20:01:16.657686	2025-09-02 23:01:16.661598	\N	\N	\N
\.


--
-- Data for Name: weight_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weight_history (id, user_id, weight, recorded_at, notes) FROM stdin;
1	1	74.2	2025-09-02 19:22:01.792267	Post-vacation weight check
2	1	75.1	2025-09-02 19:25:36.719819	Post-vacation weight fix
3	1	75.5	2025-09-02 19:26:33.480024	After morning workout
4	1	77.1	2025-09-02 20:01:32.38265	Weight update
\.


--
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workouts (id, workout_data, duration_minutes, workout_date, workout_time, calories_burned, notes, user_id, workout_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: app_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_configurations_id_seq', 33, true);


--
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_id_seq', 1038, true);


--
-- Name: app_user_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_id_seq1', 42, true);


--
-- Name: dic_app_user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_app_user_types_id_seq', 35, true);


--
-- Name: dic_gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_gender_id_seq', 3, true);


--
-- Name: dic_meal_plan_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_meal_plan_status_id_seq', 5, true);


--
-- Name: dic_meal_plan_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_meal_plan_type_id_seq', 5, true);


--
-- Name: dic_meal_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_meal_type_id_seq', 4, true);


--
-- Name: dic_mood_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_mood_types_id_seq', 33, true);


--
-- Name: dic_physical_activity_lvl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_physical_activity_lvl_id_seq', 6, true);


--
-- Name: dic_preferences_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_preferences_category_id_seq', 33, true);


--
-- Name: dic_sleep_quality_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_sleep_quality_type_id_seq', 33, true);


--
-- Name: dic_workout_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dic_workout_types_id_seq', 33, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dishes_id_seq', 11, true);


--
-- Name: insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insights_id_seq', 1, false);


--
-- Name: mood_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mood_record_id_seq', 1, false);


--
-- Name: nutrition_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nutrition_records_id_seq', 1, false);


--
-- Name: sleep_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sleep_record_id_seq', 1, false);


--
-- Name: user_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_configurations_id_seq', 33, true);


--
-- Name: user_daily_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_daily_activity_id_seq', 1, false);


--
-- Name: user_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_data_id_seq', 5, true);


--
-- Name: user_detailed_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_detailed_data_id_seq', 1, false);


--
-- Name: user_favorite_dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_favorite_dishes_id_seq', 1, false);


--
-- Name: user_meal_plan_meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_meal_plan_meals_id_seq', 1, false);


--
-- Name: user_meal_plan_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_meal_plan_progress_id_seq', 1, false);


--
-- Name: user_meals_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_meals_plan_id_seq', 1, false);


--
-- Name: user_scheduled_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_scheduled_activities_id_seq', 1, false);


--
-- Name: user_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_sessions_id_seq', 11, true);


--
-- Name: weight_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weight_history_id_seq', 4, true);


--
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workouts_id_seq', 1, false);


--
-- Name: app_configurations app_configurations_config_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_configurations
    ADD CONSTRAINT app_configurations_config_key_key UNIQUE (config_key);


--
-- Name: app_configurations app_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_configurations
    ADD CONSTRAINT app_configurations_pkey PRIMARY KEY (id);


--
-- Name: app_user app_user_app_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_app_user_id_key UNIQUE (app_user_id);


--
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: app_user app_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_username_key UNIQUE (username);


--
-- Name: dic_app_user_types dic_app_user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_app_user_types
    ADD CONSTRAINT dic_app_user_types_pkey PRIMARY KEY (id);


--
-- Name: dic_app_user_types dic_app_user_types_type_dscr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_app_user_types
    ADD CONSTRAINT dic_app_user_types_type_dscr_key UNIQUE (type_dscr);


--
-- Name: dic_gender dic_gender_gender_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_gender
    ADD CONSTRAINT dic_gender_gender_key UNIQUE (gender);


--
-- Name: dic_gender dic_gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_gender
    ADD CONSTRAINT dic_gender_pkey PRIMARY KEY (id);


--
-- Name: dic_meal_plan_status dic_meal_plan_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_meal_plan_status
    ADD CONSTRAINT dic_meal_plan_status_pkey PRIMARY KEY (id);


--
-- Name: dic_meal_plan_type dic_meal_plan_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_meal_plan_type
    ADD CONSTRAINT dic_meal_plan_type_pkey PRIMARY KEY (id);


--
-- Name: dic_meal_type dic_meal_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_meal_type
    ADD CONSTRAINT dic_meal_type_pkey PRIMARY KEY (id);


--
-- Name: dic_mood_types dic_mood_types_dscr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_mood_types
    ADD CONSTRAINT dic_mood_types_dscr_key UNIQUE (dscr);


--
-- Name: dic_mood_types dic_mood_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_mood_types
    ADD CONSTRAINT dic_mood_types_pkey PRIMARY KEY (id);


--
-- Name: dic_physical_activity_lvl dic_physical_activity_lvl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_physical_activity_lvl
    ADD CONSTRAINT dic_physical_activity_lvl_pkey PRIMARY KEY (id);


--
-- Name: dic_physical_activity_lvl dic_physical_activity_lvl_type_dsc_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_physical_activity_lvl
    ADD CONSTRAINT dic_physical_activity_lvl_type_dsc_key UNIQUE (type_dsc);


--
-- Name: dic_preferences_category dic_preferences_category_dscr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_preferences_category
    ADD CONSTRAINT dic_preferences_category_dscr_key UNIQUE (dscr);


--
-- Name: dic_preferences_category dic_preferences_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_preferences_category
    ADD CONSTRAINT dic_preferences_category_pkey PRIMARY KEY (id);


--
-- Name: dic_sleep_quality_type dic_sleep_quality_type_dscr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_sleep_quality_type
    ADD CONSTRAINT dic_sleep_quality_type_dscr_key UNIQUE (dscr);


--
-- Name: dic_sleep_quality_type dic_sleep_quality_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_sleep_quality_type
    ADD CONSTRAINT dic_sleep_quality_type_pkey PRIMARY KEY (id);


--
-- Name: dic_workout_types dic_workout_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_workout_types
    ADD CONSTRAINT dic_workout_types_pkey PRIMARY KEY (id);


--
-- Name: dic_workout_types dic_workout_types_type_dscr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dic_workout_types
    ADD CONSTRAINT dic_workout_types_type_dscr_key UNIQUE (type_dscr);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: insights insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights
    ADD CONSTRAINT insights_pkey PRIMARY KEY (id);


--
-- Name: mood_record mood_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mood_record
    ADD CONSTRAINT mood_record_pkey PRIMARY KEY (id);


--
-- Name: nutrition_records nutrition_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_records
    ADD CONSTRAINT nutrition_records_pkey PRIMARY KEY (id);


--
-- Name: sleep_record sleep_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sleep_record
    ADD CONSTRAINT sleep_record_pkey PRIMARY KEY (id);


--
-- Name: user_meal_plan_progress unique_daily_progress; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meal_plan_progress
    ADD CONSTRAINT unique_daily_progress UNIQUE (meal_plan_id, user_id, record_date);


--
-- Name: user_meal_plan_meals unique_meal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meal_plan_meals
    ADD CONSTRAINT unique_meal UNIQUE (meal_plan_id, day_number, meal_type);


--
-- Name: user_configurations unique_user_config; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_configurations
    ADD CONSTRAINT unique_user_config UNIQUE (app_user_id);


--
-- Name: user_daily_activity unique_user_daily_activity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activity
    ADD CONSTRAINT unique_user_daily_activity UNIQUE (user_id, activity_date);


--
-- Name: user_favorite_dishes unique_user_favorite_dish; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorite_dishes
    ADD CONSTRAINT unique_user_favorite_dish UNIQUE (user_id, dish_id);


--
-- Name: user_configurations user_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_configurations
    ADD CONSTRAINT user_configurations_pkey PRIMARY KEY (id);


--
-- Name: user_daily_activity user_daily_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activity
    ADD CONSTRAINT user_daily_activity_pkey PRIMARY KEY (id);


--
-- Name: user_data user_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (id);


--
-- Name: user_data user_data_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_user_id_key UNIQUE (user_id);


--
-- Name: user_detailed_data user_detailed_data_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detailed_data
    ADD CONSTRAINT user_detailed_data_phone_number_key UNIQUE (phone_number);


--
-- Name: user_detailed_data user_detailed_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detailed_data
    ADD CONSTRAINT user_detailed_data_pkey PRIMARY KEY (id);


--
-- Name: user_detailed_data user_detailed_data_user_app_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detailed_data
    ADD CONSTRAINT user_detailed_data_user_app_code_key UNIQUE (user_app_code);


--
-- Name: user_detailed_data user_detailed_data_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detailed_data
    ADD CONSTRAINT user_detailed_data_user_id_key UNIQUE (user_id);


--
-- Name: user_favorite_dishes user_favorite_dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorite_dishes
    ADD CONSTRAINT user_favorite_dishes_pkey PRIMARY KEY (id);


--
-- Name: user_meal_plan_meals user_meal_plan_meals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meal_plan_meals
    ADD CONSTRAINT user_meal_plan_meals_pkey PRIMARY KEY (id);


--
-- Name: user_meal_plan_progress user_meal_plan_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meal_plan_progress
    ADD CONSTRAINT user_meal_plan_progress_pkey PRIMARY KEY (id);


--
-- Name: user_meals_plan user_meals_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meals_plan
    ADD CONSTRAINT user_meals_plan_pkey PRIMARY KEY (id);


--
-- Name: user_meals_plan user_meals_plan_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meals_plan
    ADD CONSTRAINT user_meals_plan_user_id_key UNIQUE (user_id);


--
-- Name: user_scheduled_activities user_scheduled_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_scheduled_activities
    ADD CONSTRAINT user_scheduled_activities_pkey PRIMARY KEY (id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (id);


--
-- Name: user_sessions user_sessions_session_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_session_token_key UNIQUE (session_token);


--
-- Name: weight_history weight_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weight_history
    ADD CONSTRAINT weight_history_pkey PRIMARY KEY (id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- Name: idx_app_config_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_app_config_category ON public.app_configurations USING btree (category);


--
-- Name: idx_app_config_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_app_config_key ON public.app_configurations USING btree (config_key);


--
-- Name: idx_app_user_app_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_app_user_app_user_id ON public.app_user USING btree (app_user_id);


--
-- Name: idx_dishes_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_active ON public.dishes USING btree (is_active);


--
-- Name: idx_dishes_calories; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_calories ON public.dishes USING btree (calories_per_100g);


--
-- Name: idx_dishes_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_category ON public.dishes USING btree (category);


--
-- Name: idx_dishes_created_by_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_created_by_user ON public.dishes USING btree (created_by_user_id);


--
-- Name: idx_dishes_dish_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_dish_type ON public.dishes USING btree (dish_type);


--
-- Name: idx_dishes_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_name ON public.dishes USING btree (name);


--
-- Name: idx_dishes_protein; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_protein ON public.dishes USING btree (protein_per_100g);


--
-- Name: idx_insights_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_insights_type ON public.insights USING btree (insight_type);


--
-- Name: idx_insights_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_insights_user_id ON public.insights USING btree (user_id);


--
-- Name: idx_mood_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mood_timestamp ON public.mood_record USING btree ("timestamp");


--
-- Name: idx_mood_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mood_type ON public.mood_record USING btree (mood_quality_id);


--
-- Name: idx_mood_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mood_user_id ON public.mood_record USING btree (user_id);


--
-- Name: idx_nutrition_datetime; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nutrition_datetime ON public.nutrition_records USING btree (datetime);


--
-- Name: idx_nutrition_meal_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nutrition_meal_type ON public.nutrition_records USING btree (meal_type);


--
-- Name: idx_nutrition_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nutrition_user_id ON public.nutrition_records USING btree (user_id);


--
-- Name: idx_sessions_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sessions_active ON public.user_sessions USING btree (is_active);


--
-- Name: idx_sessions_expires; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sessions_expires ON public.user_sessions USING btree (expires_at);


--
-- Name: idx_sessions_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sessions_token ON public.user_sessions USING btree (session_token);


--
-- Name: idx_sessions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sessions_user_id ON public.user_sessions USING btree (user_id);


--
-- Name: idx_sleep_datetime; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sleep_datetime ON public.sleep_record USING btree (datetime);


--
-- Name: idx_sleep_quality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sleep_quality ON public.sleep_record USING btree (sleep_quality_id);


--
-- Name: idx_sleep_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sleep_user_id ON public.sleep_record USING btree (user_id);


--
-- Name: idx_user_config_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_config_user_id ON public.user_configurations USING btree (app_user_id);


--
-- Name: idx_user_configurations_data; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_configurations_data ON public.user_configurations USING gin (configuration_data);


--
-- Name: idx_user_daily_activity_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_daily_activity_date ON public.user_daily_activity USING btree (activity_date);


--
-- Name: idx_user_daily_activity_user_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_daily_activity_user_date ON public.user_daily_activity USING btree (user_id, activity_date);


--
-- Name: idx_user_daily_activity_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_daily_activity_user_id ON public.user_daily_activity USING btree (user_id);


--
-- Name: idx_user_detailed_data_country_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_detailed_data_country_city ON public.user_detailed_data USING btree (country, city);


--
-- Name: idx_user_detailed_data_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_detailed_data_phone ON public.user_detailed_data USING btree (phone_number);


--
-- Name: idx_user_detailed_data_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_detailed_data_user_id ON public.user_detailed_data USING btree (user_id);


--
-- Name: idx_user_favorite_dishes_dish_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_favorite_dishes_dish_id ON public.user_favorite_dishes USING btree (dish_id);


--
-- Name: idx_user_favorite_dishes_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_favorite_dishes_user_id ON public.user_favorite_dishes USING btree (user_id);


--
-- Name: idx_user_meals_plan_meal_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_meals_plan_meal_id ON public.user_meals_plan USING btree (id);


--
-- Name: idx_user_meals_plan_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_meals_plan_user_id ON public.user_meals_plan USING btree (user_id);


--
-- Name: idx_user_scheduled_activities_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_scheduled_activities_time ON public.user_scheduled_activities USING btree (activity_from, activity_to);


--
-- Name: idx_user_scheduled_activities_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_scheduled_activities_user_id ON public.user_scheduled_activities USING btree (user_id);


--
-- Name: idx_users_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_active ON public.app_user USING btree (is_active);


--
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_email ON public.app_user USING btree (email);


--
-- Name: idx_users_user_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_user_type ON public.app_user USING btree (user_type_id);


--
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_username ON public.app_user USING btree (username);


--
-- Name: idx_weight_history_recorded; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_weight_history_recorded ON public.weight_history USING btree (recorded_at);


--
-- Name: idx_weight_history_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_weight_history_user_id ON public.weight_history USING btree (user_id);


--
-- Name: idx_workouts_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_workouts_created_at ON public.workouts USING btree (created_at DESC);


--
-- Name: idx_workouts_description_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_workouts_description_gin ON public.workouts USING btree (workout_data);


--
-- Name: idx_workouts_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_workouts_type ON public.workouts USING btree (workout_type_id);


--
-- Name: idx_workouts_user_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_workouts_user_date ON public.workouts USING btree (user_id, workout_date DESC);


--
-- Name: workouts update_workouts_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_workouts_updated_at BEFORE UPDATE ON public.workouts FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: app_user app_user_user_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_user_type_id_fkey FOREIGN KEY (user_type_id) REFERENCES public.dic_app_user_types(id);


--
-- Name: dishes dishes_created_by_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_created_by_user_id_fkey FOREIGN KEY (created_by_user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- Name: user_daily_activity fk_user_daily_activity_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activity
    ADD CONSTRAINT fk_user_daily_activity_user FOREIGN KEY (user_id) REFERENCES public.app_user(app_user_id);


--
-- Name: workouts fk_workout_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT fk_workout_type FOREIGN KEY (workout_type_id) REFERENCES public.dic_workout_types(id) ON DELETE RESTRICT;


--
-- Name: workouts fk_workout_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT fk_workout_user FOREIGN KEY (user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- Name: insights insights_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights
    ADD CONSTRAINT insights_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: mood_record mood_record_mood_quality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mood_record
    ADD CONSTRAINT mood_record_mood_quality_id_fkey FOREIGN KEY (mood_quality_id) REFERENCES public.dic_mood_types(id);


--
-- Name: mood_record mood_record_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mood_record
    ADD CONSTRAINT mood_record_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: nutrition_records nutrition_records_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_records
    ADD CONSTRAINT nutrition_records_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: sleep_record sleep_record_sleep_quality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sleep_record
    ADD CONSTRAINT sleep_record_sleep_quality_id_fkey FOREIGN KEY (sleep_quality_id) REFERENCES public.dic_sleep_quality_type(id);


--
-- Name: sleep_record sleep_record_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sleep_record
    ADD CONSTRAINT sleep_record_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: user_configurations user_configurations_app_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_configurations
    ADD CONSTRAINT user_configurations_app_user_id_fkey FOREIGN KEY (app_user_id) REFERENCES public.app_user(app_user_id) ON DELETE CASCADE;


--
-- Name: user_data user_data_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(app_user_id);


--
-- Name: user_favorite_dishes user_favorite_dishes_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorite_dishes
    ADD CONSTRAINT user_favorite_dishes_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id) ON DELETE CASCADE;


--
-- Name: user_favorite_dishes user_favorite_dishes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorite_dishes
    ADD CONSTRAINT user_favorite_dishes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- Name: user_sessions user_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- Name: weight_history weight_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weight_history
    ADD CONSTRAINT weight_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- PostgreSQL database dump complete
--

