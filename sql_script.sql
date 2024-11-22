-- Create the Databse

DROP DATABASE IF EXISTS dealership_workshop;
CREATE DATABASE IF NOT EXISTS dealership_workshop;
USE dealership_workshop;

DROP TABLE IF EXISTS dealerships;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_contracts;

-- Create the Tables

  CREATE TABLE `dealership_workshop`.`dealerships` (
  `DealershipID` INT NOT NULL AUTO_INCREMENT,
  `DealershipName` VARCHAR(50) NOT NULL,
  `Address` VARCHAR(50) NOT NULL,
  `Phone` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`DealershipID`));
  
  CREATE TABLE `dealership_workshop`.`vehicles` (
  `VIN` VARCHAR(50) NOT NULL,
  `VehicleYear` INT NOT NULL,
  `Make` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `VehicleType` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Odometer` INT NOT NULL,
  `Price` FLOAT NOT NULL,
  `SOLD` BOOLEAN NOT NULL,
  PRIMARY KEY (`VIN`));
  
  CREATE TABLE `dealership_workshop`.`inventory` (
  `DealershipID` INT NOT NULL,
  `VIN` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`VIN`));
  
  CREATE TABLE `dealership_workshop`.`sales_contracts` (
  `CarID` INT NOT NULL AUTO_INCREMENT,
  `ContractDate` VARCHAR(15) NOT NULL,
  `CustomerName` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `VIN` VARCHAR(50) NOT NULL,
  `SalesTax` FLOAT NOT NULL,
  `RecordingFee` FLOAT NOT NULL,
  `ProcessingFee` FLOAT NOT NULL,
  `TotalCost` FLOAT NOT NULL,
  `FINANCE` BOOLEAN NOT NULL,
  `MonthlyPayment` FLOAT NOT NULL,
  PRIMARY KEY (`CarID`),
  FOREIGN KEY (`VIN`) REFERENCES `vehicles`(`VIN`));
  
    CREATE TABLE `dealership_workshop`.`lease_contracts` (
  `CarID` INT NOT NULL AUTO_INCREMENT,
  `ContractDate` VARCHAR(15) NOT NULL,
  `CustomerName` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `VIN` VARCHAR(50) NOT NULL,
  `EndingValue` FLOAT NOT NULL,
  `LeaseFee` FLOAT NOT NULL,
  `TotalCost` FLOAT NOT NULL,
  `MonthlyPayment` FLOAT NOT NULL,
  PRIMARY KEY (`CarID`),
  FOREIGN KEY (`VIN`) REFERENCES `vehicles`(`VIN`));
  
  -- Populate the Tables
  
	-- Dealerships
  
  INSERT INTO dealerships (DealershipID, DealershipName, Address, Phone)
  VALUES (null, 'Auto World', '123 Main St, Springfield', '123-456-7890'),
(null, 'City Motors', '456 Oak Ave, Shelbyville', '234-567-8901'),
(null, 'Prime Auto', '789 Elm Rd, Rivertown', '345-678-9012'),
(null, 'Speedy Cars', '101 Maple Dr, Hilltop', '456-789-0123'),
(null, 'Luxury Rides', '202 Pine Blvd, Lakeside', '567-890-1234'),
(null, 'DriveTime Motors', '303 Cedar Ln, Meadowbrook', '678-901-2345'),
(null, 'Precision Autos', '404 Birch St, Brookstone', '789-012-3456'),
(null, 'Elite Motors', '505 Willow Ct, Westend', '890-123-4567'),
(null, 'CarMaxx', '606 Redwood Blvd, Greenfield', '901-234-5678'),
(null, 'Fast Lane Autos', '707 Birchwood Rd, Oakhill', '012-345-6789');
  
  -- Vehicles
  
  INSERT INTO vehicles (VIN, VehicleYear, Make, Model, VehicleType, Color, Odometer, Price, SOLD)
  VALUES ('1HGBH41JXMN109186', 2020, 'Honda', 'Civic', 'Sedan', 'Blue', 25000, 20000.00, FALSE),
('2G1FP22G7Y2103456', 2021, 'Chevrolet', 'Camaro', 'Coupe', 'Red', 15000, 30000.00, FALSE),
('3FA6P0LU9JR243526', 2022, 'Ford', 'Fusion', 'Sedan', 'White', 12000, 22000.00, TRUE),
('1FA6P8TH4J5152398', 2020, 'Ford', 'Mustang', 'Coupe', 'Black', 18000, 35000.00, TRUE),
('5N1AT2MV0KC757021', 2021, 'Nissan', 'Rogue', 'SUV', 'Silver', 10000, 25000.00, FALSE),
('1C4PJMCX0KD505626', 2020, 'Jeep', 'Cherokee', 'SUV', 'Green', 22000, 28000.00, TRUE),
('1FMCU0GD3HUA00428', 2019, 'Ford', 'Escape', 'SUV', 'Gray', 30000, 18000.00, FALSE),
('1G1ZC5ST2GF101978', 2020, 'Chevrolet', 'Malibu', 'Sedan', 'Yellow', 16000, 22000.00, FALSE),
('1FTFW1E57JFC51624', 2021, 'Ford', 'F-150', 'Truck', 'Blue', 13000, 35000.00, TRUE),
('3VW267AJXEM376314', 2021, 'Volkswagen', 'Golf', 'Hatchback', 'Orange', 11000, 19000.00, FALSE);
  
  -- Inventory
  
  INSERT INTO inventory (DealershipID, VIN)
  VALUES (1, '1HGBH41JXMN109186'),
(2, '2G1FP22G7Y2103456'),
(3, '3FA6P0LU9JR243526'),
(4, '1FA6P8TH4J5152398'),
(5, '5N1AT2MV0KC757021'),
(6, '1C4PJMCX0KD505626'),
(7, '1FMCU0GD3HUA00428'),
(8, '1G1ZC5ST2GF101978'),
(9, '1FTFW1E57JFC51624'),
(10, '3VW267AJXEM376314');
  
  -- Sales Contracts
  
  INSERT INTO sales_contracts (CarID, ContractDate, CustomerName, Email, VIN, SalesTax, RecordingFee, ProcessingFee, TotalCost, FINANCE, MonthlyPayment)
  VALUES (null, '2024-11-01', 'John Doe', 'john.doe@example.com', '1HGBH41JXMN109186', 1500.00, 100.00, 300.00, 21500.00, TRUE, 350.00),
(null, '2024-11-05', 'Jane Smith', 'jane.smith@example.com', '2G1FP22G7Y2103456', 2000.00, 120.00, 250.00, 24250.00, FALSE, 0.00),
(null, '2024-11-10', 'Michael Johnson', 'michael.johnson@example.com', '3FA6P0LU9JR243526', 1600.00, 90.00, 280.00, 23490.00, TRUE, 390.00),
(null, '2024-11-12', 'Emily Brown', 'emily.brown@example.com', '1FA6P8TH4J5152398', 1800.00, 110.00, 300.00, 26000.00, FALSE, 0.00),
(null, '2024-11-15', 'David Williams', 'david.williams@example.com', '5N1AT2MV0KC757021', 1700.00, 130.00, 320.00, 25650.00, TRUE, 400.00);

  
  -- Lease Contracts
  
  INSERT INTO lease_contracts (CarID, ContractDate, CustomerName, Email, VIN, EndingValue, LeaseFee, TotalCost, MonthlyPayment)
  VALUES (null, '2024-11-06', 'Liam Turner', 'liam.turner@example.com', '1C4PJMCX0KD505626', 9300.00, 485.00, 21550.00, 375.00),
(null, '2024-11-07', 'Mia Anderson', 'mia.anderson@example.com', '1FMCU0GD3HUA00428', 9400.00, 500.00, 21800.00, 378.00),
(null, '2024-11-08', 'James Thompson', 'james.thompson@example.com', '1G1ZC5ST2GF101978', 8500.00, 430.00, 20500.00, 350.00),
(null, '2024-11-09', 'Sophia Davis', 'sophia.davis@example.com', '1FTFW1E57JFC51624', 9700.00, 520.00, 23000.00, 385.00),
(null, '2024-11-10', 'Benjamin Wilson', 'benjamin.wilson@example.com', '3VW267AJXEM376314', 9000.00, 460.00, 21000.00, 365.00);