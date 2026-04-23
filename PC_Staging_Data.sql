
-- Dim_Customer
SELECT DISTINCT
     [Customer_Name]       AS Cust_Name,
     [Customer_Surname]    AS Cust_Surname,
     [Customer_Contact_Number] AS Cust_Contact_Number,
     [Customer_Email_Address]  AS Cust_Email_Address
INTO [PC_staging_data].[dbo].[Dim_Customer]
FROM [PC_staging_data].[dbo].[raw_pc_data];

-- Dim_Shop
SELECT DISTINCT
     [Shop_Name],
     [Shop_Age]
INTO [PC_staging_data].[dbo].[Dim_Shop]
FROM [PC_staging_data].[dbo].[raw_pc_data];

-- Dim_Product
SELECT DISTINCT
     [PC_Make],
     [PC_Model] AS PC_Mode,
     [Storage_Type],
     [RAM],
     [Storage_Capacity]
INTO [PC_staging_data].[dbo].[Dim_Product]
FROM [PC_staging_data].[dbo].[raw_pc_data];

-- Dim_Salesperson
SELECT DISTINCT
     [Sales_Person_Name]       AS Salesperson_Name,
     [Sales_Person_Department] AS Salesperson_Department
INTO [PC_staging_data].[dbo].[Dim_Salesperson]
FROM [PC_staging_data].[dbo].[raw_pc_data];

-- Dim_Date
SELECT DISTINCT
     [Purchase_Date],
     [Ship_Date]
INTO [PC_staging_data].[dbo].[Dim_Date]
FROM [PC_staging_data].[dbo].[raw_pc_data];

-- Dim_Channel
SELECT DISTINCT
     [Channel] AS Type
INTO [PC_staging_data].[dbo].[Dim_Channel]
FROM [PC_staging_data].[dbo].[raw_pc_data];

-- Dim_Priority
SELECT DISTINCT
     [Priority] AS Level
INTO [PC_staging_data].[dbo].[Dim_Priority]
FROM [PC_staging_data].[dbo].[raw_pc_data];

-- Dim_Payment Method
SELECT DISTINCT
     [Payment_Method] 
INTO [PC_staging_data].[dbo].[Dim_Payment_method]
FROM [PC_staging_data].[dbo].[raw_pc_data];


-- Fact_Sales
SELECT 
    [Purchase_Date]       AS PurchaseDate,
    [Ship_Date]           AS ShipDate,
    [Priority]            AS Priority,
    [Shop_Name],
    [Shop_Age],
    [Customer_Name]       AS Cust_Name,
    [Customer_Surname]    AS Cust_Surname,
    [Customer_Contact_Number] AS Cust_Contact_Number,
    [Customer_Email_Address]  AS Cust_Email_Address,
    [PC_Make],
    [PC_Model]            AS PC_Mode,
    [Storage_Type],
    [RAM],
    [Storage_Capacity],
    [Sales_Person_Name]   AS SalesPerson_Name,
    [Sales_Person_Department] AS Salesperson_Department,
    [Cost_Price],
    [Sale_Price],
    [Discount_Amount],
    [Finance_Amount],
    [Credit_Score],
    [Cost_of_Repairs],
    [Total_Sales_per_Employee],
    [PC_Market_Price]
INTO [PC_staging_data].[dbo].[Fact_Sales]
FROM [PC_staging_data].[dbo].[raw_pc_data];