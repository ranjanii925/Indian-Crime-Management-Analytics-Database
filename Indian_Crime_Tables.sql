DROP DATABASE IF EXISTS indian_crime_db;
CREATE DATABASE indian_crime_db;
USE indian_crime_db;

-- 1. STATES
CREATE TABLE states (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL,
    region VARCHAR(50),
    capital_est_year INT
);
select*from states;
select count(*)from states;
-- 2. DISTRICTS
CREATE TABLE districts (
    district_id INT PRIMARY KEY,
    district_name VARCHAR(100) NOT NULL,
    state_id INT,
    population INT,
    FOREIGN KEY (state_id) REFERENCES states(state_id)
);
select*from districts;
select count(*)from districts;


-- 3. DEPARTMENTS
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    established_year INT
);
select*from departments;
select count(*) from departments;

-- 4. POLICE STATIONS
CREATE TABLE police_stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(150) NOT NULL,
    district_id INT,
    contact_number VARCHAR(20),
    staff_strength INT,
    FOREIGN KEY (district_id) REFERENCES districts(district_id)
);
select * from police_stations;
select count(*)from police_stations;
-- 5. OFFICERS
CREATE TABLE officers (
    officer_id INT PRIMARY KEY,
    officer_name VARCHAR(100) NOT NULL,
    gender CHAR(1),
    rank_ VARCHAR(50),
    station_id INT,
    department_id INT,
    joining_date DATE,
    contact_number VARCHAR(20),
    FOREIGN KEY (station_id) REFERENCES police_stations(station_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
select * from officers;
select count(*)from officers;

-- 6. CRIME TYPES
CREATE TABLE crime_types (
    crime_type_id INT PRIMARY KEY,
    crime_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    severity VARCHAR(20)
);
select*from crime_types;
select count(*)from crime_types;

-- 7. CRIMINALS
CREATE TABLE criminals (
    criminal_id INT PRIMARY KEY,
    criminal_name VARCHAR(100) NOT NULL,
    gender CHAR(1),
    age INT,
    hometown VARCHAR(100),
    current_status VARCHAR(30),
    prior_convictions INT
);

select * from criminals;
select count(*) from criminals;

-- 8. VICTIMS
CREATE TABLE victims (
    victim_id INT PRIMARY KEY,
    victim_name VARCHAR(100) NOT NULL,
    gender CHAR(1),
    age INT,
    city VARCHAR(100),
    contact_number VARCHAR(20)
);

select*from victims;
select count(*)from victims;

-- 9. CASES (FIR)
CREATE TABLE cases (
    case_id INT PRIMARY KEY,
    fir_number VARCHAR(30) UNIQUE,
    date_filed DATE,
    station_id INT,
    crime_type_id INT,
    investigating_officer_id INT,
    victim_id INT,
    case_status VARCHAR(30),
    FOREIGN KEY (station_id) REFERENCES police_stations(station_id),
    FOREIGN KEY (crime_type_id) REFERENCES crime_types(crime_type_id),
    FOREIGN KEY (investigating_officer_id) REFERENCES officers(officer_id),
    FOREIGN KEY (victim_id) REFERENCES victims(victim_id)
);
select * from officers;
select*from cases;
select*from criminals;
select count(*)from cases;

-- 10. ARRESTS
CREATE TABLE arrests (
    arrest_id INT PRIMARY KEY,
    case_id INT,
    criminal_id INT,
    arresting_officer_id INT,
    arrest_date DATE,
    bail_granted VARCHAR(5),
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (criminal_id) REFERENCES criminals(criminal_id),
    FOREIGN KEY (arresting_officer_id) REFERENCES officers(officer_id)
);

select*from arrests;
select count(*)from arrests ;

-- 11. WEAPONS
CREATE TABLE weapons (
    weapon_id INT PRIMARY KEY,
    case_id INT,
    weapon_type VARCHAR(50),
    recovery_status VARCHAR(20),
    FOREIGN KEY (case_id) REFERENCES cases(case_id)
);
select*from weapons;
select count(*)from weapons;

-- 12. EVIDENCE
CREATE TABLE evidence (
    evidence_id INT PRIMARY KEY,
    case_id INT,
    evidence_type VARCHAR(50),
    collected_date DATE,
    analysis_status VARCHAR(30),
    FOREIGN KEY (case_id) REFERENCES cases(case_id)
);

select*from evidence;
select count(*)from evidence;

-- 13. WITNESSES
CREATE TABLE witnesses (
    witness_id INT PRIMARY KEY,
    witness_name VARCHAR(100) NOT NULL,
    case_id INT,
    contact_number VARCHAR(20),
    reliability_status VARCHAR(20),
    FOREIGN KEY (case_id) REFERENCES cases(case_id)
);

select*from witnesses;
select count(*)from witnesses;

-- 14. COURTS
CREATE TABLE courts (
    court_id INT PRIMARY KEY,
    court_name VARCHAR(150) NOT NULL,
    district_id INT,
    court_type VARCHAR(50),
    FOREIGN KEY (district_id) REFERENCES districts(district_id)
);

select*from courts;
select count(*)from courts;

-- 15. JUDGES
CREATE TABLE judges (
    judge_id INT PRIMARY KEY,
    judge_name VARCHAR(100) NOT NULL,
    court_id INT,
    years_of_experience INT,
    FOREIGN KEY (court_id) REFERENCES courts(court_id)
);

select*from judges;
select count(*)from judges;

-- 16. HEARINGS
CREATE TABLE hearings (
    hearing_id INT PRIMARY KEY,
    case_id INT,
    court_id INT,
    judge_id INT,
    hearing_date DATE,
    hearing_status VARCHAR(20),
    FOREIGN KEY (case_id) REFERENCES cases(case_id),
    FOREIGN KEY (court_id) REFERENCES courts(court_id),
    FOREIGN KEY (judge_id) REFERENCES judges(judge_id)
);

select*from hearings;
select count(*)from hearings;

-- 17. VERDICTS
CREATE TABLE verdicts (
    verdict_id INT PRIMARY KEY,
    hearing_id INT,
    verdict_type VARCHAR(30),
    sentence VARCHAR(100),
    verdict_date DATE,
    FOREIGN KEY (hearing_id) REFERENCES hearings(hearing_id)
);
select*from verdicts;
select count(*)from verdicts;
-- 18. VEHICLES
CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    registration_number VARCHAR(20),
    vehicle_type VARCHAR(30),
    case_id INT,
    vehicle_status VARCHAR(30),
    FOREIGN KEY (case_id) REFERENCES cases(case_id)
);
select*from vehicles ;
select count(*)from vehicles ;


-- 19. STOLEN PROPERTY
CREATE TABLE stolen_property (
    property_id INT PRIMARY KEY,
    case_id INT,
    property_type VARCHAR(50),
    estimated_value_inr INT,
    recovery_status VARCHAR(20),
    FOREIGN KEY (case_id) REFERENCES cases(case_id)
);

select*from stolen_property  ;
select*from vehicles;
select count(*)from stolen_property  ;

-- 20. COMPLAINTS
CREATE TABLE complaints (
    complaint_id INT PRIMARY KEY,
    station_id INT,
    victim_id INT,
    complaint_date DATE,
    complaint_status VARCHAR(30),
    FOREIGN KEY (station_id) REFERENCES police_stations(station_id),
    FOREIGN KEY (victim_id) REFERENCES victims(victim_id)
);
select * from complaints;





