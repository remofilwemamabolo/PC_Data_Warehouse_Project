CREATE PROCEDURE sp_create_dim_priority
AS
BEGIN
    DROP TABLE IF EXISTS Dim_Priority;
    CREATE TABLE Dim_Priority (
        Priority_ID INT IDENTITY(1,1) PRIMARY KEY,
        Level       VARCHAR(50)
    );
    INSERT INTO Dim_Priority (Level)
    SELECT DISTINCT Priority
    FROM [PC_staging_data].[dbo].[raw_pc_data];
END