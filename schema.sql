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
);

--CREATE TREATMENTS TABLE 
CREATE TABLE treatments (
    id BIGINT PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

-- CREATE INVOICE_ITEMS 
CREATE TABLE invoice_items (
    id BIGINT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL
);

--Alter medical histories table
ALTER TABLE medical_histories
ADD CONSTRAINT FK_patients_medical_histories
FOREIGN KEY (patient_id)
REFERENCES patients(id);

--Add medical history id column to invoices and set as foreign key
ALTER TABLE invoices
ADD COLUMN medical_histories_id INT UNIQUE
REFERENCES medical_histories(id);

--Add invoice id column and set as foreign key
ALTER TABLE invoice_items
ADD COLUMN invoice_id INT
REFERENCES invoices(id);

--Add treatment id column and set as foreign key
ALTER TABLE invoice_items
ADD COLUMN treatment_id INT
REFERENCES treatments(id);

--create join table fro medical histories and treatments table
CREATE TABLE medical_histories_treatments (
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id),
  PRIMARY KEY (medical_histories_id, treatments_id)
);