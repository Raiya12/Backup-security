use [backup]
------------------------------------------------------------------Part 1:
-- Step 1: Create the TrainingDB database
CREATE DATABASE TrainingDB;
GO

-- Switch to the TrainingDB database
USE TrainingDB;
GO

-- Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    EnrollmentDate DATE
);
GO

-- Insert sample data into the Students table
INSERT INTO Students (StudentID, FullName, EnrollmentDate) VALUES  
(1, 'Sara Ali', '2023-09-01'),  
(2, 'Mohammed Nasser', '2023-10-15');
GO

------------------------------------------------------------------Step 2: Perform Backup Operations 
--1. Full Backup
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\Backup-securityTrainingDB_Full.bak';

--2. Insert New Record (simulate data change)
INSERT INTO Students VALUES (3, 'Fatma Said', '2024-01-10'); 

--3. Differential Backup
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Diff.bak' WITH DIFFERENTIAL;

--4. Transaction Log Backup
	--Set Recovery Model to FULL
	ALTER DATABASE TrainingDB SET RECOVERY FULL;
	--Perform the log backup:
	BACKUP LOG TrainingDB 
	TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Log.trn';

--5. Copy-Only Backup
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_CopyOnly.bak' WITH COPY_ONLY;


------------------------------------------------------------------Part 3: Real-World Scenario Simulation 
-- Create HospitalDB for testing
CREATE DATABASE HospitalDB;
GO

USE HospitalDB;
GO

-- Sample table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    DateOfAdmission DATE
);

-- Sample data
INSERT INTO Patients VALUES
(1, 'Amina Youssef', '2025-05-01'),
(2, 'Khaled Omar', '2025-05-20');
GO

-- Example full backup (adjust path if needed)
BACKUP DATABASE HospitalDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB\HospitalDB_Full_20250529.bak' 
WITH INIT, COMPRESSION;
