USE [PC_staging_data]
GO
---- Go line by line
  EXEC sp_create_dim_date;
  EXEC sp_create_dim_priority;
  EXEC sp_create_dim_channel;
  EXEC sp_create_dim_shop;
  EXEC sp_create_dim_customer;
  EXEC sp_create_dim_product;
  EXEC sp_create_dim_salesperson;
  EXEC sp_create_dim_payment;
  EXEC sp_create_fact_sales;