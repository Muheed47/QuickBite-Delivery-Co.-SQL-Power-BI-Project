# QuickBite-Delivery-Co.-SQL-Power-BI-Project

## Project Overview

This project analyses data for QuickBite Delivery, a fictional food delivery company. It combines a MySQL database with a Power BI dashboard to demonstrate database design, SQL data management, and business intelligence reporting.

The database stores information about:

Customers
Restaurants
Riders
Orders
Order Items
Payments

The Power BI report uses this data to create interactive dashboards that provide insights into delivery performance, customer activity, restaurant performance, and payment trends.

# Files Included
File	Purpose
QuickBite_Delivery.sql	Creates the database, tables, and inserts sample data into MySQL.
QuickBite Delivery project.pbix	Power BI report connected to the QuickBite database.

# Software Requirements

Before opening the project, install:

MySQL Server
MySQL Workbench (recommended)
Microsoft Power BI Desktop

# Setup Instructions

## Step 1 – Create the Database
Open MySQL Workbench.
Open the file:
QuickBite_Delivery.sql
Execute the script.

The script will:

Create the database
Create all required tables
Insert sample data

# Step 2 – Verify the Database

After running the script, check that the following tables exist:

customers
restaurants
riders
orders
order_items
payments

You can verify using:

USE quickbite_db;

SHOW TABLES;

# Step 3 – Open the Power BI Report
Open Power BI Desktop.
Open:
QuickBite Delivery project.pbix

# Step 4 – Update the Data Source (if required)

If Power BI cannot find your MySQL database:

Go to Transform Data.
Select Data Source Settings.
Change the server/database connection to your MySQL instance.
Refresh the data.

# Step 5 – Refresh the Report

Click Refresh to load the latest data from the MySQL database.

# Expected Outcome

After completing the setup, the Power BI dashboard should display interactive reports using the QuickBite database.

The report will allow users to:

View customer information
Analyse restaurant performance
Monitor rider activity
Track order status
Review payment information
Explore delivery performance using interactive visuals and filters

Users should be able to filter and interact with the dashboard to gain business insights from the stored data.

# Database Structure

The project contains six main tables:

Table	Description
Customers	Stores customer details
Restaurants	Stores restaurant information
Riders	Stores delivery rider information
Orders	Stores customer orders and delivery times
Order Items	Stores products within each order
Payments	Stores payment details and status

# Troubleshooting
## Database does not exist

Run the SQL script again to recreate the database.

## Power BI cannot connect
Ensure MySQL Server is running.
Verify the server name and database name.
Update the Power BI data source settings if necessary.
## No data appears
Refresh the Power BI report.
Confirm that the SQL script completed successfully without errors.
Verify that the tables contain records.

## Project Outcome
By completing this project, users will have:

A fully functional MySQL relational database.
Sample business data for a food delivery service.
An interactive Power BI dashboard connected to the database.
Business insights that support data-driven decision making through visual analytics.
