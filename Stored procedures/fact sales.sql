CREATE PROCEDURE sp_create_fact_sales
AS
BEGIN
    DROP TABLE IF EXISTS Fact_Sales;

    CREATE TABLE Fact_Sales (
        SalesID INT IDENTITY(1,1) PRIMARY KEY,
        Date_ID INT NULL,
        Priority_ID INT NULL,
        Channel_ID INT NULL,
        Shop_ID INT NULL,
        Customer_ID INT NULL,
        Product_ID INT NULL,
        SalesPerson_ID INT NULL,
        Payment_Method_ID INT NULL,
        Cost_Price DECIMAL(10,2) NOT NULL,
        Sale_Price DECIMAL(10,2) NOT NULL,
        Discount_Amount DECIMAL(10,2) NOT NULL,
        Finance_Amount DECIMAL(10,2) NOT NULL,
        Credit_Score INT NOT NULL,
        Cost_of_Repairs DECIMAL(10,2) NOT NULL,
        Total_Sales_per_Employee DECIMAL(10,2) NOT NULL,
        PC_Market_Price DECIMAL(10,2) NOT NULL
    );

    INSERT INTO Fact_Sales (
        Date_ID, Priority_ID, Channel_ID, Shop_ID, Customer_ID, Product_ID, SalesPerson_ID, Payment_Method_ID,
        Cost_Price, Sale_Price, Discount_Amount, Finance_Amount, Credit_Score, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price
    )
    SELECT 
        NULL AS Date_ID,
        NULL AS Priority_ID,
        NULL AS Channel_ID,
        NULL AS Shop_ID,
        NULL AS Customer_ID,
        NULL AS Product_ID,
        NULL AS SalesPerson_ID,
        NULL AS Payment_Method_ID,
        r.Cost_Price,
        r.Sale_Price,
        r.Discount_Amount,
        r.Finance_Amount,
        r.Credit_Score,
        r.Cost_of_Repairs,
        r.Total_Sales_per_Employee,
        r.PC_Market_Price
    FROM [PC_staging_data].[dbo].[raw_pc_data] r;
END
