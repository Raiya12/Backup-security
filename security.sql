use Security
-----------------------------------------------1. Login and User Setup
-- Create logins
CREATE LOGIN hr_login WITH PASSWORD = 'HrPassword123!';
CREATE LOGIN sales_login WITH PASSWORD = 'SalesPassword123!';

-- Create users in the database
CREATE USER hr_user FOR LOGIN hr_login;
CREATE USER sales_user FOR LOGIN sales_login;


------------------------------------------------2. Create Schemas
CREATE SCHEMA HR AUTHORIZATION hr_user;
CREATE SCHEMA Sales AUTHORIZATION sales_user;

--3. Create Sample Tables
-- HR Schema
CREATE TABLE HR.Employees (
    EmpID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Sales Schema
CREATE TABLE Sales.Customers (
    CustID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Region NVARCHAR(50)
);
------------------------------------------------4. Grant Permissions