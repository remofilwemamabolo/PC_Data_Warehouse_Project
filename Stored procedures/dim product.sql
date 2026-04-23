CREATE PROCEDURE sp_create_dim_product
AS
BEGIN
    DROP TABLE IF EXISTS Dim_Product;

    CREATE TABLE Dim_Product (
        Product_ID INT IDENTITY(1,1) PRIMARY KEY,
        PC_Make VARCHAR(50),
        PC_Model VARCHAR(50),
        Storage_Type VARCHAR(50),
        RAM VARCHAR(50),
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
END
