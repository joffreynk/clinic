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
  id INT PRIMARY KEY FOREIGN KEY REFERENCES treatments(id),
  admitted_at date,
  patient_id INT FOREIGN KEY REFERENCES patients(id),
  status varchar(100)
);

--  create treatments table

CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type varchar(250),
  name varchar(200)
);

--  create invoice items table

CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price decimal,
  quantity INT,
  total_price decimal,
  invoice_id INT FOREIGN KEY REFERENCES invoices(id),
  treatment_id INT FOREIGN KEY REFERENCES treatments(id)
);