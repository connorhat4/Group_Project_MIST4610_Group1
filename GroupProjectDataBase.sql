-- Use the database

USE ha_jip46096;


-- Creating Tables with Foreign Keys


-- Creating the Hospital table
CREATE TABLE Hospital (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(45),
    hospital_address VARCHAR(45),
    hospital_phone BIGINT,  -- BIGINT to avoid out-of-range issues
    type VARCHAR(45)
);

-- Creating the Doctor table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    hospital_id INT,
    doctor_name VARCHAR(45),
    doctor_phone BIGINT,  -- Changed to BIGINT
    doctor_email VARCHAR(45),
    years_of_experience INT,
    salary INT,
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)  -- Add this line to reference Hospital
);



-- Creating the Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    hospital_id INT,
    department_head_id INT,
    department_name VARCHAR(45),
    department_phone BIGINT,
    size INT,
    floor INT
);

-- Creating the Patient table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    hospital_id INT,
    patient_name VARCHAR(45),
    patient_address VARCHAR(45),
    patient_email VARCHAR(45),
    patient_phone BIGINT,
    sex VARCHAR(45),
    race VARCHAR(45),
    age INT
);

-- Creating the Appointment table
CREATE TABLE Appointment (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason_for_appointment VARCHAR(45),
    PRIMARY KEY (patient_id, doctor_id, appointment_date)
);

-- Creating the Medication table
CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    medication_name VARCHAR(45),
    dosage VARCHAR(45),
    price DECIMAL(6,2)
);

-- Creating the Prescription table
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication_id INT,
    prescription_date DATE
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

INSERT INTO Medication (medication_id, medication_name, dosage, price) VALUES 
(1, 'Aspirin', '500mg', 12.50),
(2, 'Ibuprofen', '200mg', 10.00),
(3, 'Acetaminophen', '500mg', 8.00),
(4, 'Amoxicillin', '250mg', 15.75),
(5, 'Lisinopril', '10mg', 20.00),
(6, 'Metformin', '500mg', 18.50),
(7, 'Simvastatin', '20mg', 22.00),
(8, 'Omeprazole', '20mg', 19.99),
(9, 'Levothyroxine', '50mcg', 24.00),
(10, 'Sertraline', '50mg', 28.00);


-- Adding Foreign Keys after data insertion
ALTER TABLE Department
ADD CONSTRAINT FK_Hospital_Department FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id),
ADD CONSTRAINT FK_Doctor_Department FOREIGN KEY (department_head_id) REFERENCES Doctor(doctor_id);

ALTER TABLE Patient
ADD CONSTRAINT FK_Hospital_Patient FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id);

ALTER TABLE Appointment
ADD CONSTRAINT FK_Patient_Appointment FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
ADD CONSTRAINT FK_Doctor_Appointment FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id);

ALTER TABLE Prescription
ADD CONSTRAINT FK_Patient_Prescription FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
ADD CONSTRAINT FK_Doctor_Prescription FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
ADD CONSTRAINT FK_Medication_Prescription FOREIGN KEY (medication_id) REFERENCES Medication(medication_id);



-- Queries

--- Simple Queries

-- 1. List all doctors
SELECT * FROM Doctor;

-- 2. Get all patients from a specific hospital
SELECT patient_name, patient_address
FROM Patient
WHERE hospital_id = 1;  -- Change the hospital_id as needed

-- 3. Retrieve all medications and their prices
SELECT medication_name, price
FROM Medication;

-- 4. Count the number of appointments for each doctor
SELECT doctor_id, COUNT(*) AS appointment_count
FROM Appointment
GROUP BY doctor_id;

-- Complex Queries

-- 1. Find doctors and their corresponding hospitals
SELECT D.doctor_name, H.hospital_name 
FROM Doctor D 
JOIN Hospital H ON D.hospital_id = H.hospital_id 
ORDER BY H.hospital_name;


-- 2. Get the average salary of doctors by their years of experience
SELECT years_of_experience, AVG(salary) AS average_salary 
FROM Doctor 
GROUP BY years_of_experience 
HAVING AVG(salary) > 200000;


-- 3. List patients and their doctors for a specific appointment date
SELECT P.patient_name, D.doctor_name, A.appointment_date
FROM Appointment A
JOIN Patient P ON A.patient_id = P.patient_id
JOIN Doctor D ON A.doctor_id = D.doctor_id
WHERE A.appointment_date = '2023-09-24';  -- Change the date as needed

-- 4. Get the total number of appointments per hospital, filtering those with more than 1 appointment.
SELECT H.hospital_name, COUNT(A.patient_id) AS total_appointments 
FROM Appointment A 
JOIN Patient P ON A.patient_id = P.patient_id 
JOIN Hospital H ON P.hospital_id = H.hospital_id 
GROUP BY H.hospital_name 
HAVING COUNT(A.patient_id) > 1;


-- 5.Find patients who have appointments with doctors earning above a certain salary using a correlated subquery
SELECT P.patient_name 
FROM Patient P 
WHERE EXISTS (
    SELECT 1 
    FROM Appointment A 
    JOIN Doctor D ON A.doctor_id = D.doctor_id 
    WHERE A.patient_id = P.patient_id AND D.salary > 200000
);


-- 6. Get the list of patients who have appointments with a specific doctor
SELECT P.patient_name, A.appointment_date
FROM Appointment A
JOIN Patient P ON A.patient_id = P.patient_id
WHERE A.doctor_id = 102;  -- Change the doctor_id as needed
