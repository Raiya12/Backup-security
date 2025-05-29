use [backup]

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
