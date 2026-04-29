USE [PC_staging_data];
GO

DROP TABLE IF EXISTS Dim_Date;
DROP TABLE IF EXISTS Dim_Priority;
DROP TABLE IF EXISTS Dim_Channel;
DROP TABLE IF EXISTS Dim_Shop;
DROP TABLE IF EXISTS Dim_Customer;
DROP TABLE IF EXISTS Dim_Product;
DROP TABLE IF EXISTS Dim_Salesperson;
DROP TABLE IF EXISTS Dim_Payment;
GO

DROP TABLE IF EXISTS Dim_Date;

CREATE TABLE Dim_Date (
    Date_ID       INT IDENTITY(1,1) PRIMARY KEY,
    Purchase_Date DATE,
    Ship_Date     DATE
);
INSERT INTO Dim_Date (Purchase_Date, Ship_Date)
SELECT DISTINCT
    CAST(Purchase_Date AS DATE),
    TRY_CAST(Ship_Date AS DATE)
FROM [PC_staging_data].[dbo].[raw_pc_data];
 
-------------------------------------------------------------------------
DROP TABLE IF EXISTS  Dim_Priority;

CREATE TABLE Dim_Priority (
    Priority_ID INT IDENTITY(1,1) PRIMARY KEY,
    Level       VARCHAR(50)
);
INSERT INTO Dim_Priority (Level)
SELECT DISTINCT Priority
FROM [PC_staging_data].[dbo].[raw_pc_data];

----------------------------------------------------------------------------------

DROP TABLE IF EXISTS Dim_Channel;

CREATE TABLE Dim_Channel (
    Channel_ID INT IDENTITY(1,1) PRIMARY KEY,
    Type       VARCHAR(50)
);
INSERT INTO Dim_Channel (Type)
SELECT DISTINCT Channel
FROM [PC_staging_data].[dbo].[raw_pc_data];

-------------------------------------------

DROP TABLE IF EXISTS Dim_Shop;

CREATE TABLE Dim_Shop (
    Shop_ID   INT IDENTITY(1,1) PRIMARY KEY,
    Shop_Name VARCHAR(100),
    Shop_Age  INT
);
INSERT INTO Dim_Shop (Shop_Name, Shop_Age)
SELECT DISTINCT Shop_Name, Shop_Age
FROM [PC_staging_data].[dbo].[raw_pc_data];

---------------------------------------------------------------

DROP TABLE IF EXISTS Dim_Customer;

CREATE TABLE Dim_Customer (
    Customer_ID          INT IDENTITY(1,1) PRIMARY KEY,
    Cust_Name            VARCHAR(100),
    Cust_Surname         VARCHAR(100),
    Cust_Contact_Number  VARCHAR(100),
    Cust_Email_Address   VARCHAR(100)
);
INSERT INTO Dim_Customer (Cust_Name, Cust_Surname, Cust_Contact_Number, Cust_Email_Address)
SELECT DISTINCT
    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number,
    Customer_Email_Address
FROM [PC_staging_data].[dbo].[raw_pc_data];

-----------------------------------------------------------
DROP TABLE IF EXISTS Dim_Product;

CREATE TABLE Dim_Product (
    Product_ID       INT IDENTITY(1,1) PRIMARY KEY,
    PC_Make          VARCHAR(50),
    PC_Model         VARCHAR(50),
    Storage_Type     VARCHAR(50),
    RAM              VARCHAR(50),
    Storage_Capacity VARCHAR(50)
);
INSERT INTO Dim_Product (PC_Make, PC_Model, Storage_Type, RAM, Storage_Capacity)
SELECT DISTINCT
    PC_Make,
    PC_Model,
    Storage_Type,
    RAM,
    Storage_Capacity
FROM [PC_staging_data].[dbo].[raw_pc_data];

-------------------------------------------------------------------------
DROP TABLE IF EXISTS Dim_Salesperson;

CREATE TABLE Dim_Salesperson (
    SalesPerson_ID         INT IDENTITY(1,1) PRIMARY KEY,
    Sales_Person_Name      VARCHAR(100),
    Sales_Person_Department VARCHAR(100)
);
INSERT INTO Dim_Salesperson (Sales_Person_Name, Sales_Person_Department)
SELECT DISTINCT
    Sales_Person_Name,
    Sales_Person_Department
FROM [PC_staging_data].[dbo].[raw_pc_data];

----------------------------------------------------------------------

DROP TABLE IF EXISTS Dim_Payment;

CREATE TABLE Dim_Payment (
    Payment_ID     INT IDENTITY(1,1) PRIMARY KEY,
    Payment_Method VARCHAR(50)
);
INSERT INTO Dim_Payment (Payment_Method)
SELECT DISTINCT Payment_Method
FROM [PC_staging_data].[dbo].[raw_pc_data];


select * from Dim_Payment
--------------------------------------------------------------

