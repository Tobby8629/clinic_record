-- CREATE NEW DATABASE
CREATE DATABASE clinic_record;

--CREATE PATIENT TABLE 
CREATE TABLE patients (
 id BIGINT PRIMARY KEY,
 name VARCHAR,
 date_of_birth DATE
);

--CREATE INVOICES TABLE 
CREATE TABLE invoices (
    id BIGINT PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP
);

--CREATE MEDICAL_HISTORIES TABLE 
CREATE TABLE medical_histories (
    id BIGINT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR
)

--CREATE TREATMENTS TABLE 
CREATE TABLE treatments (
    id BIGINT PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
)

-- CREATE INVOICE_ITEMS 
CREATE TABLE invoice_items (
    id BIGINT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL
);