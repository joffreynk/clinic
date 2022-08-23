/*
    Create a database based on a diagram
*/
CREATE DATABASE clinic;

-- Create patient table

CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(250),
  date_of_birth date
);

-- Create medical histories

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at date,
  patient_id INT FOREIGN KEY REFERENCES patients(id),
  status varchar(100)
);

