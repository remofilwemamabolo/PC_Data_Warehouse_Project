CREATE PROCEDURE sp_create_dim_shop
AS 
BEGIN

DROP TABLE IF EXISTS Dim_Shop;
CREATE TABLE Dim_Shop (
    Shop_ID INT IDENTITY(1,1) PRIMARY KEY,
    Shop_Name VARCHAR(100),
    Shop_Age INT
);

INSERT INTO Dim_Shop (Shop_Name, Shop_Age)
SELECT DISTINCT
    Shop_Name,
    Shop_Age
FROM [PC_staging_data].[dbo].[raw_pc_data]
END