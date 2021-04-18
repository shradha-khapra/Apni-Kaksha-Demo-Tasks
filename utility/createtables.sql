CREATE TABLE IF NOT EXISTS patient(
    id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(20),
    phone BIGINT(10) UNIQUE,
    password VARCHAR(20),
    problem VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS doctor(
    id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(20),
    phone BIGINT(10) UNIQUE,
    password VARCHAR(20),
    specialization VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS appointment(
    id_doctor VARCHAR(100),
    id_patient VARCHAR(100) ,
    name_patient VARCHAR(20),
    phone_patient BIGINT(10),
    problem_patient VARCHAR(150),
    status_patient VARCHAR(10)
    
);
