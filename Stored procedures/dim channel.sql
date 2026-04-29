CREATE PROCEDURE sp_create_dim_channel
AS
BEGIN
    DROP TABLE IF EXISTS Dim_Channel;
    CREATE TABLE Dim_Channel (
        Channel_ID INT IDENTITY(1,1) PRIMARY KEY,
        Type       VARCHAR(50)
    );
    INSERT INTO Dim_Channel (Type)
    SELECT DISTINCT Channel
    FROM [PC_staging_data].[dbo].[raw_pc_data];
END