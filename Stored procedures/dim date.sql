CREATE PROCEDURE sp_create_dim_date
AS
BEGIN
DROP TABLE IF EXISTS Dim_Date
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
END
