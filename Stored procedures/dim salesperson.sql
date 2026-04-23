CREATE PROCEDURE sp_create_dim_salesperson
AS
BEGIN
    DROP TABLE IF EXISTS Dim_Salesperson;

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
END
