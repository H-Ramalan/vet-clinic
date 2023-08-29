CREATE TABLE patients (id INT PRIMARY KEY, name VARCHAR(70), date_of_birth DATE);
CREATE TABLE medical_histories (id INT PRIMARY KEY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(50), FOREIGN KEY (patient_id) REFERENCES patients(id));
CREATE TABLE treatments (id INT PRIMARY KEY, type VARCHAR(50),name VARCHAR(50));
CREATE TABLE invoices (id INT PRIMARY KEY, total_amount DECIMAL(10,2), generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT, FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id));
CREATE TABLE invoice_items (id INT PRIMARY KEY,unit_price DECIMAL, quantity INT, total_price DECIMAL,invoice_id INT, treatment_id INT, FOREIGN KEY (invoice_id) REFERENCES invoices(id), FOREIGN KEY (treatment_id) REFERENCES treatments(id));