PC Sales Data Warehouse
📖 Overview
This project demonstrates the design and implementation of a data warehouse for PC sales using a star schema. The goal is to transform raw staging data into a structured warehouse model that supports efficient querying and business intelligence reporting.

The warehouse is built around a central Fact_Sales table, which records transactional measures such as cost, sale price, discounts, and financial metrics. Surrounding dimension tables provide descriptive attributes for customers, products, shops, salespersons, dates, channels, priorities, and payment methods.

🗂️ Star Schema Design
The schema follows a classic star layout:

Fact_Sales

Surrogate key: SalesID

Foreign keys: Date_ID, Priority_ID, Channel_ID, Shop_ID, Customer_ID, Product_ID, SalesPerson_ID, Payment_Method_ID

Measures: Cost_Price, Sale_Price, Discount_Amount, Finance_Amount, Credit_Score, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price

Dimension Tables

Dim_Date: Purchase and shipping dates

Dim_Priority: Order priority levels

Dim_Channel: Sales channels

Dim_Shop: Shop details (name, age)

Dim_Customer: Customer details (name, surname, contact, email)

Dim_Product: Product specifications (make, model, RAM, storage)

Dim_Salesperson: Salesperson details (name, department)

Dim_Payment_Method: Payment types

⚙️ Workflow
Staging Data  
Raw data is loaded into [PC_staging_data].[dbo].[raw_pc_data].

Dimension Creation  
Each dimension table is created with a surrogate key (IDENTITY) and populated using SELECT DISTINCT from staging.
Example:

sql
CREATE TABLE Dim_Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    Cust_Name VARCHAR(100),
    Cust_Surname VARCHAR(100),
    Cust_Contact_Number VARCHAR(50),
    Cust_Email_Address VARCHAR(255)
);

INSERT INTO Dim_Customer (Cust_Name, Cust_Surname, Cust_Contact_Number, Cust_Email_Address)
SELECT DISTINCT Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address
FROM [PC_staging_data].[dbo].[raw_pc_data];
Fact Table Creation  
The fact table is created with surrogate key SalesID.
Dimension IDs are initially set to NULL placeholders, while measures are inserted directly from staging.
Example:

sql
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
    Cost_Price DECIMAL(10,2),
    Sale_Price DECIMAL(10,2),
    Discount_Amount DECIMAL(10,2),
    Finance_Amount DECIMAL(10,2),
    Credit_Score INT,
    Cost_of_Repairs DECIMAL(10,2),
    Total_Sales_per_Employee DECIMAL(10,2),
    PC_Market_Price DECIMAL(10,2)
);

INSERT INTO Fact_Sales (
    Date_ID, Priority_ID, Channel_ID, Shop_ID, Customer_ID, Product_ID, SalesPerson_ID, Payment_Method_ID,
    Cost_Price, Sale_Price, Discount_Amount, Finance_Amount, Credit_Score, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price
)
SELECT NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
       Cost_Price, Sale_Price, Discount_Amount, Finance_Amount, Credit_Score, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price
FROM [PC_staging_data].[dbo].[raw_pc_data];
Future Enhancement  
Later, the NULL IDs in the fact table can be updated by joining to the dimension tables, fully normalizing the schema.

🚀 Usage
Clone the repository.

Run the SQL scripts in order:

Dimension creation scripts

Fact table creation script

Load raw data into staging before executing inserts.

📊 Benefits
Clear separation of measures (facts) and descriptive attributes (dimensions).

Surrogate keys ensure consistency and scalability.

Ready for integration with BI tools (Power BI, Tableau, etc.).

Supports efficient analytical queries across sales, customers, products, and shops.