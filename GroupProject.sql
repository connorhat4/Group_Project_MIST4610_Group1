USE ha_crh06350;

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    hospital_id INT,
    patient_name VARCHAR(45),
    patient_address VARCHAR(45),
    patient_email VARCHAR(45),
    patient_phone INT,
    sex VARCHAR(45),
    race VARCHAR(45),
    age INT
);

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
    doctor_id INT,
    department_name VARCHAR(45),
    department_phone INT,
    size INT,
    floor INT
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    department_id INT,
    doctor_name VARCHAR(45),
    doctor_phone INT,
    doctor_email VARCHAR(45),
    years_of_experience INT,
    salary INT
);

CREATE TABLE Appointment (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason_for_appointment VARCHAR(45),
    PRIMARY KEY (patient_id, doctor_id)
);

CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication_id INT,
    prescription_date DATE
);

CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    medication_name VARCHAR(45),
    dosage VARCHAR(45),
    price DECIMAL(6,2)
);

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
(1006, 106, '2023-09-20', 'Newborn checkup'),
(1007, 107, '2023-09-21', 'Skin rash treatment'),
(1008, 108, '2023-09-22', 'Cancer consultation'),
(1009, 109, '2023-09-23', 'Digestive issues consultation'),
(1010, 110, '2023-09-24', 'Hormone imbalance check');

INSERT INTO Medication VALUES 
(201, 'Aspirin', '100mg', 5.99),
(202, 'Ibuprofen', '200mg', 7.99),
(203, 'Lisinopril', '10mg', 15.49),
(204, 'Amoxicillin', '500mg', 12.99),
(205, 'Metformin', '850mg', 8.99),
(206, 'Prednisone', '20mg', 10.99),
(207, 'Loratadine', '10mg', 6.99),
(208, 'Acetaminophen', '500mg', 4.99),
(209, 'Atorvastatin', '40mg', 18.49),
(210, 'Clopidogrel', '75mg', 22.99);

INSERT INTO Prescription VALUES 
(301, 1001, 101, 201, '2023-09-15'),
(302, 1002, 102, 202, '2023-09-16'),
(303, 1003, 101, 203, '2023-09-17'),
(304, 1004, 104, 204, '2023-09-18'),
(305, 1005, 105, 205, '2023-09-19'),
(306, 1006, 106, 206, '2023-09-20'),
(307, 1007, 107, 207, '2023-09-21'),
(308, 1008, 108, 208, '2023-09-22'),
(309, 1009, 109, 209, '2023-09-23'),
(310, 1010, 110, 210, '2023-09-24');
