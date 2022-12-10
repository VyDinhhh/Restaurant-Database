DROP DATABASE IF EXISTS `restaurant_management`;
CREATE DATABASE `restaurant_management`;
USE `restaurant_management`;

DROP TABLE IF EXISTS `Restaurant`;
CREATE TABLE `Restaurant`(
`Restaurant_ID` int(5) NOT NULL AUTO_INCREMENT UNIQUE,
`Restaurant_name` varchar(200) NOT NULL UNIQUE,
`R_contact_number` varchar(12) NOT NULL,
`R_address` varchar(500) NOT NULL,
`R_description` varchar(500),
PRIMARY KEY (`Restaurant_ID`));


DROP TABLE IF EXISTS `Menu`;
CREATE TABLE `Menu`(
`Item_ID` int(5) NOT NULL UNIQUE PRIMARY KEY,
`Item_name` varchar(200) NOT NULL UNIQUE,
`Price` float(20) NOT NULL,
`Status` varchar(100) ,
`Description` varchar(500),
`Restaurant_ID` int(5) NOT NULL,
CONSTRAINT `FK_menu_restaurant_ID`
FOREIGN KEY (`Restaurant_ID`) REFERENCES `Restaurant`(`Restaurant_ID`));



DROP TABLE IF EXISTS `Main_employee_role`;
CREATE TABLE `Main_employee_role`(
`Role_ID` int(5) NOT NULL AUTO_INCREMENT UNIQUE,
`Role_name` varchar(20) NOT NULL,
`Description` varchar(500));



DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
`Employee_ID` int(10) NOT NULL AUTO_INCREMENT UNIQUE,
`Employee_name` varchar(200) NOT NULL,
`E_contact_number` varchar(12) NOT NULL,
`Restaurant_ID` int(5) NOT NULL,
`Role_ID` int(5) NOT NULL,
CONSTRAINT `FK_employee_restaurant_ID`
FOREIGN KEY (`Restaurant_ID`) REFERENCES `Restaurant`(`Restaurant_ID`),
CONSTRAINT `FK_employee_role`
FOREIGN KEY (`Role_ID`) REFERENCES `Main_employee_role`(`Role_ID`));

DROP TABLE IF EXISTS `Shift_info`;
CREATE TABLE `Shift_info`(
`Shift_number` int(5) NOT NULL AUTO_INCREMENT UNIQUE,
`Start_time` TIME NOT NULL,
`End_time` TIME NOT NULL,
`Description` varchar(500));



DROP TABLE IF EXISTS `Employee_timesheet`;
CREATE TABLE `Employee_timesheet`(
`Shift_number` int(5) NOT NULL,
`Employee_ID` int(10) NOT NULL,
`Extra_hours` int(10) DEFAULT 0,
`Work_date` DATE NOT NULL,
`Note` varchar(500) DEFAULT 'No Note',
FOREIGN KEY (`Shift_number`) REFERENCES `Shift_info`(`Shift_number`),
FOREIGN KEY (`Employee_ID`) REFERENCES `Employee`(`Employee_ID`));



DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers`(
`Customer_ID` int(5) NOT NULL AUTO_INCREMENT UNIQUE,
`Customer_name` varchar(200)  DEFAULT "Unregister & Dine in Customer",
`Customer_contact` varchar(12),
PRIMARY KEY (`Customer_ID`));



DROP TABLE IF EXISTS `Order_method`;
CREATE TABLE `Order_method`(
`Order_method_ID` int(10) NOT NULL AUTO_INCREMENT UNIQUE,
`Method_name` varchar(200) NOT NULL,
`Description` varchar(500),
PRIMARY KEY (`Order_method_ID`));



DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
`Order_number` int(10) NOT NULL AUTO_INCREMENT UNIQUE,
`Order_method_ID` int(10) NOT NULL,
`Customer_ID` int (5) NOT NULL,
`Order_date` DATE NOT NULL,
`Order_time` TIME NOT NULL,
PRIMARY KEY (`Order_number`),
CONSTRAINT `FK_order_customer`
FOREIGN KEY (`Customer_ID`) REFERENCES `Customers`(`Customer_ID`),
FOREIGN KEY (`Order_method_ID`) REFERENCES `Order_method`(`Order_method_ID`));


DROP TABLE IF EXISTS `Employee_task`;
CREATE TABLE `Employee_task` (
`Employee_ID` int(10) NOT NULL,
`Order_number` int(10) NOT NULL,
`Description` varchar(500),
FOREIGN KEY (`Employee_ID`) REFERENCES `Employee`(`Employee_ID`),
FOREIGN KEY (`Order_number`) REFERENCES `Order`(`Order_number`));



DROP TABLE IF EXISTS `Order_item`;
CREATE TABLE `Order_item` (
`Order_number` int(10) NOT NULL,
`Item_ID` int(5) NOT NULL,
`Quantity` int(10) NOT NULL,
FOREIGN KEY (`Order_number`) REFERENCES `Order`(`Order_number`),
FOREIGN KEY (`Item_ID`) REFERENCES `Menu`(`Item_ID`));


DROP TABLE IF EXISTS `Bill`;
CREATE TABLE `Bill` (
`Bill_number` int(10) NOT NULL UNIQUE AUTO_INCREMENT,
`Order_number` int(10) NOT NULL,
`Customer_ID` int(5) NOT NULL,
`Bill_date` DATE NOT NULL,
`Time` TIME NOT NULL,
`Area_ID` int(5) NOT NULL,
`Discount_ID` varchar(100) ,
PRIMARY KEY (`Bill_number`),
FOREIGN KEY (`Order_number`) REFERENCES `Order`(`Order_number`),
FOREIGN KEY (`Customer_ID`) REFERENCES `Customers`(`Customer_ID`));


DROP TABLE IF EXISTS `Tax`;
CREATE TABLE `Tax` (
`Area_ID` int(5) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
`Tax_percentage` float(10) NOT NULL);
DROP TABLE IF EXISTS `Discount`;
CREATE TABLE `Discount` (
`Discount_ID` varchar(100) NOT NULL UNIQUE PRIMARY KEY,
`Event_name` varchar(100) NOT NULL,
`Discount_percentage` float(10) NOT NULL,
`Start_date` DATE NOT NULL ,
`End_date` DATE NOT NULL,
`Description` varchar(500));

ALTER TABLE `Bill`
ADD CONSTRAINT `FK_bill_area`
FOREIGN KEY (`Area_ID`) REFERENCES `Tax`(`Area_ID`);
ALTER TABLE `Bill`
ADD CONSTRAINT `FK_bill_discount`
FOREIGN KEY (`Discount_ID`) REFERENCES `Discount`(`Discount_ID`);
-- ALTER TABLE `Bill`
-- ADD
-- FOREIGN KEY (`Order_number`) REFERENCES `Order_receipt`(`Order_number`);























