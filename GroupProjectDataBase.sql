-- Use the database
USE ha_crh06350;

-- Creating Tables with Foreign Keys

CREATE TABLE Hospital (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(45),
    hospital_address VARCHAR(45),
    hospital_phone INT,
    type VARCHAR(45)
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    hospital_id INT,
    department_head_id INT,
    department_name VARCHAR(45),
    department_phone INT,
    size INT,
    floor INT,
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id),
    FOREIGN KEY (department_head_id) REFERENCES Doctor(doctor_id)  -- reference department heads
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    department_id INT,
    doctor_name VARCHAR(45),
    doctor_phone INT,
    doctor_email VARCHAR(45),
    years_of_experience INT,
    salary INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    hospital_id INT,
    patient_name VARCHAR(45),
    patient_address VARCHAR(45),
    patient_email VARCHAR(45),
    patient_phone INT,
    sex VARCHAR(45),
    race VARCHAR(45),
    age INT,
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

CREATE TABLE Appointment (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason_for_appointment VARCHAR(45),
    PRIMARY KEY (patient_id, doctor_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    medication_name VARCHAR(45),
    dosage VARCHAR(45),
    price DECIMAL(6,2)
);

CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication_id INT,
    prescription_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (medication_id) REFERENCES Medication(medication_id)
);

-- Inserting Data

INSERT INTO Hospital VALUES 
(1, 'City Hospital', '123 Main St', 1234567890, 'General'),
(2, 'County Hospital', '456 Elm St', 2345678901, 'Specialty'),
(3, 'Regional Medical Center', '789 Oak St', 3456789012, 'General'),
(4, 'Metro Health', '321 Cedar Ave', 4567890123, 'Urgent Care'),
(5, 'Sunshine Hospital', '654 Maple St', 5678901234, 'Pediatric'),
(6, 'Suburban Clinic', '987 Walnut St', 6789012345, 'General'),
(7, 'University Hospital', '101 College Rd', 7890123456, 'Teaching'),
(8, 'Central City Hospital', '202 Capitol St', 8901234567, 'General'),
(9, 'Westside Medical', '303 West St', 9012345678, 'Specialty'),
(10, 'Eastside Clinic', '404 East St', 1230987654, 'General');

INSERT INTO Department VALUES 
(1, 1, 101, 'Cardiology', 1234567890, 50, 2),
(2, 1, 102, 'Neurology', 1234567891, 40, 3),
(3, 2, 103, 'Orthopedics', 2345678902, 30, 4),
(4, 3, 104, 'Pediatrics', 3456789013, 25, 1),
(5, 4, 105, 'Urgent Care', 4567890124, 35, 1),
(6, 5, 106, 'Neonatal', 5678901235, 20, 2),
(7, 6, 107, 'Dermatology', 6789012346, 15, 1),
(8, 7, 108, 'Oncology', 7890123457, 45, 3),
(9, 8, 109, 'Gastroenterology', 8901234568, 50, 5),
(10, 9, 110, 'Endocrinology', 9012345679, 60, 4);

INSERT INTO Doctor VALUES 
(101, 1, 'Dr. Smith', 1234567890, 'smith@hospital.com', 10, 200000),
(102, 2, 'Dr. Johnson', 1234567891, 'johnson@hospital.com', 15, 250000),
(103, 3, 'Dr. Lee', 2345678902, 'lee@hospital.com', 8, 180000),
(104, 4, 'Dr. Thompson', 3456789013, 'thompson@hospital.com', 12, 220000),
(105, 5, 'Dr. Wilson', 4567890124, 'wilson@hospital.com', 9, 210000),
(106, 6, 'Dr. White', 5678901235, 'white@hospital.com', 7, 170000),
(107, 7, 'Dr. Taylor', 6789012346, 'taylor@hospital.com', 11, 240000),
(108, 8, 'Dr. Harris', 7890123457, 'harris@hospital.com', 6, 160000),
(109, 9, 'Dr. Clark', 8901234568, 'clark@hospital.com', 20, 300000),
(110, 10, 'Dr. Baker', 9012345679, 'baker@hospital.com', 18, 290000);

INSERT INTO Patient VALUES 
(1001, 1, 'John Doe', '123 Maple St', 'johndoe@example.com', 1112223333, 'Male', 'White', 35),
(1002, 2, 'Jane Smith', '456 Pine St', 'janesmith@example.com', 2223334444, 'Female', 'Black', 28),
(1003, 1, 'Michael Brown', '789 Birch St', 'michaelbrown@example.com', 3334445555, 'Male', 'Hispanic', 40),
(1004, 3, 'Emily Davis', '321 Oak St', 'emilydavis@example.com', 4445556666, 'Female', 'Asian', 22),
(1005, 4, 'Robert Wilson', '654 Cedar St', 'robertwilson@example.com', 5556667777, 'Male', 'White', 50),
(1006, 5, 'Laura Taylor', '987 Walnut St', 'laurataylor@example.com', 6667778888, 'Female', 'Black', 34),
(1007, 6, 'David Martinez', '101 Elm St', 'davidmartinez@example.com', 7778889999, 'Male', 'Hispanic', 45),
(1008, 7, 'Sarah Clark', '202 Oak St', 'sarahclark@example.com', 8889990000, 'Female', 'White', 29),
(1009, 8, 'Brian Lewis', '303 Pine St', 'brianlewis@example.com', 9990001111, 'Male', 'Black', 37),
(1010, 9, 'Sophia Robinson', '404 Maple St', 'sophiarobinson@example.com', 0001112222, 'Female', 'Asian', 42);

INSERT INTO Appointment VALUES 
(1001, 101, '2023-09-15', 'Heart checkup'),
(1002, 102, '2023-09-16', 'Brain MRI'),
(1003, 101, '2023-09-17', 'Follow-up on heart issues'),
(1004, 104, '2023-09-18', 'Pediatric care'),
(1005, 105, '2023-09-19', 'Urgent care visit'),
(1006, 106, '2023-09-20', 'Neonatal care'),
(1007, 107, '2023-09-21', 'Skin rash treatment'),
(1008, 108, '2023-09-22', 'Oncology consultation'),
(1009, 109, '2023-09-23', 'Gastrointestinal issues'),
(1010, 110, '2023-09-24', 'Endocrine system checkup');

-- Queries

-- Simple Queries

-- Query 1 (Simple): List All Patients with Their Corresponding Hospital
-- Natural Language: Retrieve a list of all patients along with the hospitals they are associated with.
-- Managerial Justification: This query provides an overview of which hospital each patient is associated with. Managers can use this information to monitor hospital capacity, identify patients at specific locations, and manage resources efficiently.
SELECT p.patient_name, h.hospital_name
FROM Patient p
JOIN Hospital h ON p.hospital_id = h.hospital_id;



-- Query 2 (Simple): List All Medications Along with Their Price and Dosage
-- Natural Language: Retrieve all medications along with their price and dosage information.
-- Managerial Justification: This query provides an overview of the hospital’s medication inventory. Managers can use this information for inventory control and to ensure that medications are priced appropriately for patients.
SELECT medication_name, dosage, price
FROM Medication;



-- Query 3 (Simple): Count of Patients in Each Hospital
-- Natural Language: Find the total number of patients admitted to each hospital.
-- Managerial Justification: This query helps managers understand the distribution of patients across hospitals. It aids in hospital resource allocation, staff management, and decision-making regarding expansions or reallocations based on patient loads.
SELECT h.hospital_name, COUNT(p.patient_id) AS patient_count
FROM Hospital h
JOIN Patient p ON h.hospital_id = p.hospital_id
GROUP BY h.hospital_name;



-- Query 4 (Simple): Total Number of Appointments per Doctor
-- Natural Language: Retrieve the total number of appointments handled by each doctor.
-- Managerial Justification: This query helps managers assess the workload of each doctor. It is essential for workforce planning and determining whether doctors are overworked or underutilized.
SELECT d.doctor_name, COUNT(a.patient_id) AS total_appointments
FROM Appointment a
JOIN Doctor d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_name;



-- Complex Queries

-- Query 5 (Complex): Total Salary Paid to Doctors in Each Hospital
-- Natural Language: Find the total salary of doctors for each hospital.
-- Managerial Justification: This query helps managers assess the total salary expenditure on doctors for each hospital. It provides insights into hospital costs and helps in budgeting and financial planning.
SELECT h.hospital_name, SUM(d.salary) AS total_salary
FROM Hospital h
JOIN Department dep ON h.hospital_id = dep.hospital_id
JOIN Doctor d ON dep.department_id = d.department_id
GROUP BY h.hospital_name;



-- Query 6 (Complex): Average Medication Price Prescribed by Each Doctor
-- Natural Language: Calculate the average price of medications prescribed by each doctor.
-- Managerial Justification: This query helps managers monitor the average cost of medications prescribed by doctors, allowing them to identify trends and manage costs for both patients and the hospital.
SELECT d.doctor_name, AVG(m.price) AS avg_medication_price
FROM Prescription pr
JOIN Doctor d ON pr.doctor_id = d.doctor_id
JOIN Medication m ON pr.medication_id = m.medication_id
GROUP BY d.doctor_name;



-- Query 7 (Complex): Patients Who Have Never Been Prescribed a Medication
-- Natural Language: List patients who have never received a prescription.
-- Managerial Justification: This query identifies patients who may not have received proper follow-up care. Managers can use this data to ensure that all patients have received appropriate prescriptions and care when needed.
SELECT p.patient_name
FROM Patient p
WHERE NOT EXISTS (SELECT 1 FROM Prescription pr WHERE p.patient_id = pr.patient_id);


-- Query 8 (Complex): Total Number of Appointments by Department
-- Natural Language: Find the total number of appointments handled by each department.
-- Managerial Justification: This query helps managers assess the workload for each department. It provides insight into whether specific departments are under or overburdened and can guide resource allocation.
SELECT dep.department_name, COUNT(a.patient_id) AS total_appointments
FROM Appointment a
JOIN Doctor d ON a.doctor_id = d.doctor_id
JOIN Department dep ON d.department_id = dep.department_id
GROUP BY dep.department_name;



-- Query 9 (Complex): Doctors Who Have Prescribed More Than One Medication
-- Natural Language: Find doctors who have prescribed more than one type of medication.
-- Managerial Justification: This query identifies doctors who have prescribed a wider variety of medications. This may indicate a broader scope of care or more complex cases and can help managers analyze prescribing habits.
SELECT d.doctor_name, COUNT(DISTINCT m.medication_id) AS medication_count
FROM Prescription pr
JOIN Doctor d ON pr.doctor_id = d.doctor_id
JOIN Medication m ON pr.medication_id = m.medication_id
GROUP BY d.doctor_name
HAVING medication_count > 1;



-- Query 10 (Complex): Highest Earning Doctor in Each Department
-- Natural Language: Identify the doctor with the highest salary in each department.
-- Managerial Justification: This query is useful for managers in determining compensation strategies, analyzing how the highest-paid doctors are distributed across departments, and ensuring equitable pay across the organization.
SELECT dep.department_name, d.doctor_name, d.salary
FROM Doctor d
JOIN Department dep ON d.department_id = dep.department_id
WHERE d.salary = (SELECT MAX(d2.salary) FROM Doctor d2 WHERE d2.department_id = d.department_id);


