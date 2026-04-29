CREATE PROCEDURE sp_create_dim_salesperson
AS
BEGIN
    DROP TABLE IF EXISTS Dim_Salesperson;
    CREATE TABLE Dim_Salesperson (
        SalesPerson_ID          INT IDENTITY(1,1) PRIMARY KEY,
        Sales_Person_Name       VARCHAR(100),
        Sales_Person_Department VARCHAR(100)
    );
    INSERT INTO Dim_Salesperson (Sales_Person_Name, Sales_Person_Department)
    SELECT DISTINCT
        Sales_Person_Name,
        Sales_Person_Department
    FROM [PC_staging_data].[dbo].[raw_pc_data];
END