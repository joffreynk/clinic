/*
    Create a database based on a diagram
*/
CREATE DATABASE clinic;

\c clinic;

-- Create patient table

CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(250),
  date_of_birth date
);

--  create treatments table

CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type varchar(250),
  name varchar(200)
);

-- Create medical histories

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at date,
  status varchar(100),
  patient_id INT,
  CONSTRAINT patientid_ref FOREIGN KEY(patient_id) REFERENCES patients(id)
);

--  create invoices table

CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount decimal,
  generated_at date,
  payed_at date,
  medical_history_id INT,
  CONSTRAINT medical_histories_ref FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE UNIQUE INDEX medical_history_index ON invoices(medical_history_id);

--  create invoice items table

CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price decimal,
  quantity INT,
  total_price decimal,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT invoices_ref FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  CONSTRAINT treatments_ref FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

-- create an intermmediate table for medical_history and treatments

CREATE TABLE treatments_medical_history(
  medical_history_id INT,
  treatment_id INT,
  CONSTRAINT medical_history_ref FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
  CONSTRAINT treatment_ref FOREIGN KEY(treatment_id) REFERENCES treatments(id),
  PRIMARY KEY (medical_history_id, treatment_id)
);

