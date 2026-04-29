CREATE PROCEDURE sp_create_dim_payment
AS
BEGIN
    DROP TABLE IF EXISTS Dim_Payment;
    CREATE TABLE Dim_Payment (
        Payment_ID     INT IDENTITY(1,1) PRIMARY KEY,
        Payment_Method VARCHAR(50)
    );
    INSERT INTO Dim_Payment (Payment_Method)
    SELECT DISTINCT Payment_Method
    FROM [PC_staging_data].[dbo].[raw_pc_data];
END