DROP TABLE Dim_Date;

CREATE TABLE Dim_Date (
    Date_ID INT IDENTITY(1,1) PRIMARY KEY,
    Purchase_Date DATE,
    Ship_Date Varchar(255)
);

INSERT INTO Dim_Date (Purchase_Date, Ship_Date)
SELECT DISTINCT
    Purchase_Date,
    Ship_Date
FROM [PC_staging_data].[dbo].[raw_pc_data];

-------------------------------------------------------------------------
DROP TABLE Dim_Priority;

CREATE TABLE Dim_Priority (
    Priority_ID INT IDENTITY(1,1) PRIMARY KEY,
    Level VARCHAR(50)
);

INSERT INTO Dim_Priority (Level)
SELECT DISTINCT
    Priority
FROM [PC_staging_data].[dbo].[raw_pc_data];

----------------------------------------------------------------------------------

DROP TABLE Dim_Channel;

CREATE TABLE Dim_Channel (
    Channel_ID INT IDENTITY(1,1) PRIMARY KEY,
    Type VARCHAR(50)
);

INSERT INTO Dim_Channel (Type)
SELECT DISTINCT
    Channel
FROM [PC_staging_data].[dbo].[raw_pc_data];
 
 -------------------------------------------------------------------------

DROP TABLE Dim_Shop;

CREATE TABLE Dim_Shop (
    Shop_ID INT IDENTITY(1,1) PRIMARY KEY,
    Shop_Name VARCHAR(100),
    Shop_Age INT
);

INSERT INTO Dim_Shop (Shop_Name, Shop_Age)
SELECT DISTINCT
    Shop_Name,
    Shop_Age
FROM [PC_staging_data].[dbo].[raw_pc_data];

---------------------------------------------------------------

DROP TABLE Dim_Customer;

CREATE TABLE Dim_Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    Cust_Name VARCHAR(100),
    Cust_Surname VARCHAR(100),
    Cust_Contact_Number VARCHAR(100),
    Cust_Email_Address VARCHAR(100)
);

INSERT INTO Dim_Customer (Cust_Name, Cust_Surname, Cust_Contact_Number, Cust_Email_Address)
SELECT DISTINCT
    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number,
    Customer_Email_Address
FROM [PC_staging_data].[dbo].[raw_pc_data];


-----------------------------------------------------------
DROP TABLE Dim_Product;

CREATE TABLE Dim_Product (
    Product_ID INT IDENTITY(1,1) PRIMARY KEY,
    PC_Make VARCHAR(50),
    PC_Mode VARCHAR(50),
    Storage_Type VARCHAR(50),
    RAM VARCHAR(50),
    Storage_Capacity VARCHAR(50)
);

INSERT INTO Dim_Product (PC_Make, PC_Mode, Storage_Type, RAM, Storage_Capacity)
SELECT DISTINCT
    PC_Make,
    PC_Model,
    Storage_Type,
    RAM,
    Storage_Capacity
FROM [PC_staging_data].[dbo].[raw_pc_data];

-------------------------------------------------------------------------
DROP TABLE Dim_Salesperson;

CREATE TABLE Dim_Salesperson (
    SalesPerson_ID INT IDENTITY(1,1) PRIMARY KEY,
    Salesperson_Name VARCHAR(100),
    Salesperson_Department VARCHAR(100)
);

INSERT INTO Dim_Salesperson (Salesperson_Name, Salesperson_Department)
SELECT DISTINCT
    Sales_Person_Name,
    Sales_Person_Department
FROM [PC_staging_data].[dbo].[raw_pc_data];

----------------------------------------------------------------------

DROP TABLE Dim_Payment_Method;

CREATE TABLE Dim_Payment_Method (
    Payment_Method_ID INT IDENTITY(1,1) PRIMARY KEY,
    Payment_Method VARCHAR(50)
);

INSERT INTO Dim_Payment_Method (Payment_Method)
SELECT DISTINCT
    Payment_Method
FROM [PC_staging_data].[dbo].[raw_pc_data];

--------------------------------------------------------------

