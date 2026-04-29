USE [PC_staging_data]
GO
CREATE PROCEDURE sp_create_fact_sales
AS
BEGIN
      DROP TABLE IF EXISTS Fact_Sales;

    CREATE TABLE Fact_Sales (
        SalesID INT IDENTITY(1,1) PRIMARY KEY,
        Date_ID INT NOT NULL,
        Priority_ID INT NOT NULL,
        Channel_ID INT NOT NULL,
        Shop_ID INT NOT NULL,
        Customer_ID INT NOT NULL,
        Product_ID INT NOT NULL,
        SalesPerson_ID INT NOT NULL,
        Payment_Method_ID INT NOT NULL,
        Cost_Price DECIMAL(10,2) NOT NULL,
        Sale_Price DECIMAL(10,2) NOT NULL,
        Discount_Amount DECIMAL(10,2) NOT NULL,
        Finance_Amount DECIMAL(10,2) NOT NULL,
        Credit_Score INT NOT NULL,
        Cost_of_Repairs DECIMAL(10,2) NOT NULL,
        Total_Sales_per_Employee DECIMAL(10,2) NOT NULL,
        PC_Market_Price DECIMAL(10,2) NOT NULL,

        CONSTRAINT fk_date FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
        CONSTRAINT fk_priority FOREIGN KEY (Priority_ID) REFERENCES Dim_Priority(Priority_ID),
        CONSTRAINT fk_channel FOREIGN KEY (Channel_ID) REFERENCES Dim_Channel(Channel_ID),
        CONSTRAINT fk_shop FOREIGN KEY (Shop_ID) REFERENCES Dim_Shop(Shop_ID),
        CONSTRAINT fk_customer FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID),
        CONSTRAINT fk_product FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
        CONSTRAINT fk_salesperson FOREIGN KEY (SalesPerson_ID) REFERENCES Dim_Salesperson(SalesPerson_ID),
        CONSTRAINT fk_payment FOREIGN KEY (Payment_Method_ID) REFERENCES Dim_Payment_Method(Payment_Method_ID)
    );

    INSERT INTO Fact_Sales (
        Date_ID, Priority_ID, Channel_ID, Shop_ID, Customer_ID, Product_ID, SalesPerson_ID, Payment_Method_ID,
        Cost_Price, Sale_Price, Discount_Amount, Finance_Amount, Credit_Score, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price
    )
    SELECT 
        d.Date_ID,
        p.Priority_ID,
        c.Channel_ID,
        s.Shop_ID,
        cu.Customer_ID,
        pr.Product_ID,
        sp.SalesPerson_ID,
        pm.Payment_Method_ID,
        r.Cost_Price,
        r.Sale_Price,
        r.Discount_Amount,
        r.Finance_Amount,
        r.Credit_Score,
        r.Cost_of_Repairs,
        r.Total_Sales_per_Employee,
        r.PC_Market_Price
    FROM [PC_staging_data].[dbo].[raw_pc_data] r
    JOIN Dim_Date d ON r.Purchase_Date = d.Purchase_Date AND r.Ship_Date = d.Ship_Date
    JOIN Dim_Priority p ON r.Priority = p.Level
    JOIN Dim_Channel c ON r.Channel = c.Type
    JOIN Dim_Shop s ON r.Shop_Name = s.Shop_Name AND r.Shop_Age = s.Shop_Age
    JOIN Dim_Customer cu ON r.Customer_Name = cu.Cust_Name AND r.Customer_Surname = cu.Cust_Surname
    JOIN Dim_Product pr ON r.PC_Make = pr.PC_Make AND r.PC_Model = pr.PC_Model
    JOIN Dim_Salesperson sp ON r.Sales_Person_Name = sp.Salesperson_Name AND r.Sales_Person_Department = sp.Salesperson_Department
    JOIN Dim_Payment_Method pm ON r.Payment_Method = pm.Payment_Method;
END

Select * from fact_sales