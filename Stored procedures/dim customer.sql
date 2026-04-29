CREATE PROCEDURE sp_create_dim_customer
AS
BEGIN
    DROP TABLE IF EXISTS Dim_Customer;
    CREATE TABLE Dim_Customer (
        Customer_ID         INT IDENTITY(1,1) PRIMARY KEY,
        Cust_Name           VARCHAR(100),
        Cust_Surname        VARCHAR(100),
        Cust_Contact_Number VARCHAR(100),
        Cust_Email_Address  VARCHAR(100)
    );
    INSERT INTO Dim_Customer (Cust_Name, Cust_Surname, Cust_Contact_Number, Cust_Email_Address)
    SELECT DISTINCT
        Customer_Name,
        Customer_Surname,
        Customer_Contact_Number,
        Customer_Email_Address
    FROM [PC_staging_data].[dbo].[raw_pc_data];
END