-- Smart Healthcare Clinic Network Database
-- MySQL demo project for managing clinics, doctors, patients, appointments,
-- prescriptions, medicines, billing, and clinic inventory.
-- The records are fictional sample data. Review and change demo credentials
-- and permissions before using this script in any real environment.
-- Run this script in a local/test database only.

-- *************************************************
-- Create Database
-- *************************************************
CREATE DATABASE smartHealthcareClinicNetwork;
USE smartHealthcareClinicNetwork;

-- *************************************************
-- Create Tables
-- *************************************************

CREATE TABLE Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    phoneNumber VARCHAR(100)
);

-- Clinic Table
CREATE TABLE Clinic (
    ClinicID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    BranchName VARCHAR(100) NOT NULL
);
    
-- Doctor Table
CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    workHours VARCHAR(50),
    ClinicID INT,
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);

-- Appointment Table
CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    VisitDate DATETIME NOT NULL,
    VisitType VARCHAR(50),
	Status VARCHAR(50),
    Duration INT, -- duration in minutes
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Prescription Table
CREATE TABLE Prescription (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    Notes VARCHAR(300),
    AppointmentID INT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- Medicine Table
CREATE TABLE Medicine (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    Description VARCHAR(200) NOT NULL,
    Price DECIMAL(10,2),
    StockQuantity VARCHAR(100) NOT NULL
);

-- Billing Table
CREATE TABLE Billing (
    BillingID INT AUTO_INCREMENT PRIMARY KEY,
    BillingDate DATETIME NOT NULL,
    TotalPrice DECIMAL(10,2),
    Discount DECIMAL(5,2),
    AppointmentID INT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- Prescription_Details (Junction Table)
CREATE TABLE Prescription_Details (
    PrescriptionID INT,
    MedicineID INT,
    Dosage INT,
    PRIMARY KEY (PrescriptionID, MedicineID),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID),
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
);

-- Clinic_Inventory(Junction Table)
CREATE TABLE Clinic_Inventory(
    ClinicID INT,
    MedicineID INT,
	StockQuantity INT,
    PRIMARY KEY (ClinicID, MedicineID),
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID),
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
);



-- *************************************************
-- Populate Tables with fictional sample data
-- *************************************************

INSERT INTO Clinic (FullName, Location, BranchName) VALUES
('Capital Care Clinic', 'Riyadh', 'Riyadh Main Branch'),
('Red Sea Health Center', 'Jeddah', 'Jeddah North Branch'),
('Noble Wellness Clinic', 'Medina', 'Medina Central Branch'),
('Eastern Horizon Clinic', 'Dammam', 'Dammam East Branch'),
('Sacred Health Clinic', 'Mecca', 'Mecca Haram Branch'),
('Highlands Medical Center', 'Taif', 'Taif Heights Branch'),
('Aseer Life Clinic', 'Abha', 'Abha West Branch'),
('Northern Gate Clinic', 'Tabuk', 'Tabuk Main Branch'),
('Coastal Health Hub', 'Khobar', 'Khobar Corniche Branch'),
('Desert Bloom Clinic', 'Najran', 'Najran South Branch');


INSERT INTO Doctor (FullName, Specialty, workHours, ClinicID) VALUES
('Ali AlSaeed', 'Cardiology', '08:00 AM - 03:00 PM', 1),
('Maha AlFahad', 'Dermatology', '09:00 AM - 04:00 PM', 1),
('Omar AlKhalid', 'Pediatrics', '10:00 AM - 05:00 PM', 2),
('Lina AlHarbi', 'Orthopedics', '08:30 AM - 03:30 PM', 2),
('Tariq AlOtaibi', 'Neurology', '09:00 AM - 04:00 PM', 3),
('Sara AlZahrani', 'General Medicine', '07:00 AM - 02:00 PM', 4),
('Hassan AlJaber', 'ENT', '11:00 AM - 06:00 PM', 5),
('Reem AlSaud', 'Ophthalmology', '09:00 AM - 03:00 PM', 5),
('Khaled AlMutairi', 'Cardiology', '10:00 AM - 04:00 PM', 6),
('Fatima AlHassan', 'Gynecology', '08:00 AM - 02:00 PM', 7),
('Ahmed Yassin', 'Orthopedics', '01:00 PM - 08:00 PM', 8),
('Mohamed Mostafa', 'Neurology', '09:00 AM - 05:00 PM', 9),
('Noura AlHamid', 'General Medicine', '07:00 AM - 01:00 PM', 10);


INSERT INTO Patient (FullName, phoneNumber, Gender) VALUES
('Fahad AlHassan', '0501212121', 'male'),
('Sara Mohammed', '0505656565', 'Female'),
('Khalid Hassan', '0541288621', 'Male'),
('Lama Salem', '0508989898', 'Female'),
('Mohammed Zayed', '0507878787', 'Male'),
('Noura Hamad', '0506767676', 'Female'),
('Yousef Omar', '0565321963', 'Male'),
('Razan Ali', '0502323232', 'Female'),
('Omar Saleh', '0504545454', 'Male'),
('Dana Ahmed', '0566349213', 'Female');


INSERT INTO Appointment (VisitDate, Duration, VisitType, Status, PatientID, DoctorID) VALUES
('2025-11-24 09:00:00', 30, 'Checkup', 'Completed', 1, 1),
('2025-12-04 10:30:00', 30, 'Checkup', 'Completed', 1, 1),
('2025-12-07 14:00:00', 30, 'Checkup', 'Completed', 1, 1),
('2025-11-25 11:00:00', 45, 'Consultation', 'Completed', 2, 2),
('2025-12-05 13:00:00', 45, 'Consultation', 'Completed', 2, 2),
('2025-12-11 15:30:00', 45, 'Consultation', 'Completed', 2, 2),
('2025-11-26 09:30:00', 60, 'Checkup', 'Completed', 3, 3),
('2025-12-06 12:00:00', 60, 'Checkup', 'Completed', 3, 3),
('2025-12-12 16:00:00', 60, 'Checkup', 'Completed', 3, 3),
('2025-11-27 10:00:00', 30, 'Checkup', 'Completed', 4, 4),
('2025-11-28 11:30:00', 45, 'Consultation', 'Completed', 5, 5),
('2025-11-29 14:30:00', 60, 'Checkup', 'Completed', 6, 6),
('2025-11-30 09:45:00', 30, 'Checkup', 'Completed', 7, 7),
('2025-12-01 13:15:00', 45, 'Consultation', 'Completed', 8, 8),
('2025-12-02 15:45:00', 60, 'Checkup', 'Completed', 9, 9),
('2025-12-03 10:15:00', 30, 'Checkup', 'Completed', 10, 10);


INSERT INTO Billing (BillingDate, TotalPrice, Discount, AppointmentID) VALUES
('2025-11-24 09:00:00', 300, 0, 1),
('2025-11-25 10:00:00', 350, 10, 2),
('2025-11-26 11:00:00', 400, 0, 3),
('2025-11-27 12:00:00', 300, 0, 4),
('2025-11-28 13:00:00', 350, 10, 5),
('2025-11-29 14:00:00', 400, 0, 6),
('2025-11-30 15:00:00', 300, 0, 7),
('2025-12-01 16:00:00', 350, 10, 8),
('2025-12-02 17:00:00', 400, 0, 9),
('2025-12-03 18:00:00', 300, 0, 10),
('2025-12-04 09:00:00', 300, 0, 1),
('2025-12-05 10:00:00', 350, 10, 2),
('2025-12-06 11:00:00', 400, 0, 3),
('2025-12-07 12:00:00', 300, 0, 1),
('2025-12-08 13:00:00', 350, 10, 2),
('2025-12-09 14:00:00', 400, 0, 3),
('2025-12-10 15:00:00', 300, 0, 1),
('2025-12-11 16:00:00', 350, 10, 2),
('2025-12-12 17:00:00', 400, 0, 3);


INSERT INTO Prescription (Notes, AppointmentID) VALUES
('Take 2 tablets of paracetamol every 6 hours', 1),
('Apply ointment to affected area once daily', 2),
('Syrup 10ml three times a day', 3),
('Take one capsule before lunch', 4),
('Use inhaler three times a day', 5),
('Complete antibiotic course for 5 days', 6),
('Instill eye drops twice daily', 7),
('Apply ear drops at bedtime', 8),
('Take painkiller as needed', 9),
('Rinse mouth with antiseptic solution twice daily', 10);


INSERT INTO Medicine (MedicineName, Description, Price, StockQuantity) VALUES
('Paracetamol', 'Pain reliever and fever reducer', 15.00, 'In Stock'),
('Hydrocortisone Cream', 'Topical steroid for skin irritation', 25.00, 'In Stock'),
('Cough Syrup', 'Relief for cough and cold symptoms', 18.00, 'In Stock'),
('Omeprazole', 'Reduces stomach acid', 30.00, 'In Stock'),
('Salbutamol Inhaler', 'Asthma relief inhaler', 45.00, 'In Stock'),
('Amoxicillin', 'Antibiotic for bacterial infections', 22.00, 'In Stock'),
('Artificial Tears', 'Eye lubrication drops', 12.00, 'In Stock'),
('Ear Drops', 'Treatment for ear infections', 14.00, 'In Stock'),
('Ibuprofen', 'Pain reliever and anti-inflammatory', 16.00, 'In Stock'),
('Mouthwash', 'Oral hygiene antiseptic', 20.00, 'In Stock');


INSERT INTO Prescription_Details (PrescriptionID, MedicineID, Dosage) VALUES
(1, 3, 5),
(2, 7, 2),
(3, 1, 4),
(4, 6, 3),
(5, 9, 2),
(6, 2, 1),
(7, 10, 1),
(8, 4, 2),
(9, 8, 1),
(10, 5, 1);


INSERT INTO Clinic_Inventory (ClinicID, MedicineID, StockQuantity) VALUES
(1, 5, 80),
(2, 3, 60),
(3, 8, 45),
(4, 2, 90),
(5, 7, 150),
(6, 1, 70),
(7, 4, 120),
(8, 6, 95),
(9, 10, 40),
(10, 9, 110);



-- *******************************
-- Sample Requested Queries
-- *******************************



-- Query 1: List the names and contact details of patients with more than two appointments in the last month.
SELECT 
    p.FullName AS PatientName,
    p.phoneNumber,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM 
    Patient p
JOIN 
    Appointment a ON p.PatientID = a.PatientID
WHERE 
    a.VisitDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY 
    p.PatientID, p.FullName, p.phoneNumber
HAVING 
    COUNT(a.AppointmentID) > 2;



-- Query 2: List all available doctors by specialty at a given clinic (e.g., in Riyadh).
SELECT 
    d.FullName AS DoctorName,
    d.Specialty,
    c.FullName AS ClinicName,
    c.Location
FROM 
    Doctor d
JOIN 
    Clinic c ON d.ClinicID = c.ClinicID
WHERE 
    c.Location = 'Jeddah';


-- Query 3: Retrieve all prescriptions issued by a doctor within a specific time frame.

SELECT 
    d.FullName AS DoctorName,
    p.PrescriptionID,
    p.Notes,
    a.VisitDate AS AppointmentDate
FROM 
    Prescription p
JOIN 
    Appointment a ON p.AppointmentID = a.AppointmentID
JOIN 
    Doctor d ON a.DoctorID = d.DoctorID
WHERE 
    d.FullName = 'Maha AlFahad'
    AND a.VisitDate BETWEEN '2025-11-3' AND '2025-11-30';



-- Query 4: List medicines running low in stock at any location (inventory management).

SELECT 
    c.FullName AS ClinicName,
    c.Location,
    m.MedicineName AS MedicineName,
    cm.StockQuantity
FROM 
    Clinic_Inventory cm
JOIN 
    Clinic c ON cm.ClinicID = c.ClinicID
JOIN 
    Medicine m ON cm.MedicineID = m.MedicineID
WHERE 
    cm.StockQuantity < 60
ORDER BY 
    c.Location, m.MedicineName;


-- Query 5: Display appointments longer than 30 minutes, with patient and doctor details.

SELECT 
    a.AppointmentID,
    a.VisitDate,
    a.Duration,
    p.FullName AS PatientName,
    d.FullName AS DoctorName,
    d.Specialty
FROM 
    Appointment a
JOIN 
    Patient p ON a.PatientID = p.PatientID
JOIN 
    Doctor d ON a.DoctorID = d.DoctorID
WHERE 
    a.Duration > 30;



-- Query 6: Produce a report of revenue generated per clinic (by location/city).

SELECT 
    c.Location,
    c.FullName AS ClinicName,
    SUM(b.TotalPrice) AS TotalRevenue
FROM 
    Billing b
JOIN 
    Appointment a ON b.AppointmentID = a.AppointmentID
JOIN 
    Doctor d ON a.DoctorID = d.DoctorID
JOIN 
    Clinic c ON d.ClinicID = c.ClinicID
GROUP BY 
    c.Location, c.FullName
ORDER BY 
    TotalRevenue;


-- *******************************
-- User Roles
-- *******************************

-- Create roles
-- Role for medical staff
DROP ROLE IF EXISTS medical_staff_role;
CREATE ROLE medical_staff_role;
-- Role for billing staff
DROP ROLE IF EXISTS billing_staff_role;
CREATE ROLE billing_staff_role;


-- *******************************
-- Role Assignment
-- *******************************

-- Medical staff user
DROP USER IF EXISTS 'dr_ali';
-- Demo account only. Replace the password before using outside a local demo.
CREATE USER 'dr_ali' IDENTIFIED BY 'REPLACE_WITH_A_STRONG_PASSWORD';

-- Billing staff user
DROP USER IF EXISTS 'finance_maya';
-- Demo account only. Replace the password before using outside a local demo.
CREATE USER 'finance_maya' IDENTIFIED BY 'REPLACE_WITH_A_STRONG_PASSWORD';

-- Assign roles to users
GRANT medical_staff_role TO 'dr_ali';
GRANT billing_staff_role TO 'finance_maya';

-- Medical staff can access medical data
GRANT SELECT, INSERT, UPDATE ON smartHealthcareClinicNetwork.Patient TO medical_staff_role;
GRANT SELECT, INSERT, UPDATE ON smartHealthcareClinicNetwork.Doctor TO medical_staff_role;
GRANT SELECT, INSERT, UPDATE ON smartHealthcareClinicNetwork.Appointment TO medical_staff_role;
GRANT SELECT, INSERT, UPDATE ON smartHealthcareClinicNetwork.Prescription TO medical_staff_role;

-- Billing staff can access financial and inventory data
GRANT SELECT, INSERT, UPDATE ON smartHealthcareClinicNetwork.Billing TO billing_staff_role;
GRANT SELECT, INSERT, UPDATE ON smartHealthcareClinicNetwork.Medicine TO billing_staff_role;


-- *******************************
--  Example Security Enforcement
-- *******************************
UPDATE Patient SET phoneNumber='0554129809' WHERE PatientID=1;

INSERT INTO Appointment (AppointmentID, VisitDate, VisitType, Status, Duration) 
VALUES (101, '2025-1-01', 'Checkup', 'Scheduled', 30);

UPDATE Billing SET TotalPrice = TotalPrice - Discount WHERE BillingID = 10;


-- Extract role-permission table from system
SELECT * FROM  INFORMATION_SCHEMA.TABLE_PRIVILEGES;