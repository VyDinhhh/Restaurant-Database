
INSERT INTO `Restaurant`(Restaurant_ID, Restaurant_name,R_contact_number,R_address , R_description)
VALUE (1, 'EMC', '408-222-2222', '378 Santana Row Suite 1100, San Jose, CA 95128', 'In Santana Row'),
(2, 'Tay Ho', '408-222-2222', '378 Santana Row Suite 1100, San Jose, CA 95128', 'In Santana Row');

INSERT INTO `Menu`(Item_ID, Item_name, Price, Status,Description, Restaurant_ID)
VALUES (1,'Garlic Noodle', 15, 'Available','Galic Butter, Parmesan Cheese', 1),
(2,'Shrimp Garlic Noodle', 22, 'Available', ' ', 1),
(3, 'Salmon Fried Rice', 24, 'Available', 'Salmon,Soy, Scallions',1),
(4, 'Seafood Pasta', 25, 'Available', 'Assoted Seafood, Soy, Scallions', 1),
(5, 'Uni Pasta', 33, 'Comming soon', 'Uni Cream Sauce, Roasted Seaweed, Fish Roe',1),
(6, 'Truffle Crab Garlic Noodles',28,'Available', 'Truffle, crabmeat, chunks',1),
(7, 'Trout', 24,'Comming soon','Pan seared, seasalt, butter and herbs. All dishes are grilled unless otherwise specified', 1),
(8, 'Hickory Smoked Salmaon 12 Oz', 33,'Available', 'House smoked seasoning, drawn butter and herb citra, 12 oz.All dishes are grilled unless otherwise specified',1),
(9, 'Charred Branzino Whole', 36,'Available', 'Herb stuffed. All dishes are grilled unless otherwise specified', 1),
(10, 'Seabass 12 Oz', 38, 'Available', 'Basil cilantro lime sauce. All dishes are grilled unless otherwise specified',1),
(11, 'Banh xeo', 10, 'Available', 'Basil cilantro lime sauce. All dishes are grilled unless otherwise specified',2);




INSERT INTO `Main_employee_role`(Role_ID, Role_name, Description)
VALUES 
(1, 'Waiter/Waitress', 'Taking order at tables and serve assigned table'),
(2, 'Cashier', 'Taking order by phone and giving checks'),
(3, 'Chef', 'Cooking'),
(4, 'Cleaner', 'Cleaning table and the restaurant'),
(5, 'Manager', 'Manage the restaurant service');

INSERT INTO `Employee`(Employee_ID, Employee_name, E_contact_number,Restaurant_ID, Role_ID)
VALUE 
(1111, 'Jessica Vu', '408-253-8763', 1, 1),
(1112, 'Johny Grey', '408-673-2341', 1, 1),
(1113, 'Chris Oma', '408-567-8742', 1,2),
(1114, 'Ku Wong', '408-773-6539', 1, 4),
(1115, 'Anna Su', '408-555-7890', 1, 3),
(1116, 'Tina Hes', '408-234-5634',1,5),
(1117, 'Bushra Bernard', '408-123-4562',1,1),
(1118, 'Ana Mccarthy', '408-345-6754',1,1),
(1119, 'Xanthe Barrera', '408-765-8436',1,2),
(1120, 'Jaxon Howard', '408-675-3212',1,3);

INSERT INTO `Shift_info`(Shift_number, Start_time, End_time, Description)
VALUES
(1, '8:00:00','16:00:00', 'Open shift'),
(2, '12:00:00', '19:00:00', 'Middle shift'),
(3,'16:00:00', '22:00:00', 'Closed shift');


INSERT INTO `Employee_timesheet`(Shift_number, Employee_ID, Extra_hours, Work_date)
VALUES (1, 1111, 0, '2022-12-02'),
(1, 1112, 0, '2022-12-02'),
(3,1117,0, '2022-12-02'),
(3,1117,0, '2022-12-02'),
(1, 1113, 0, '2022-12-02'),
(3, 1119, 0, '2022-12-02'),
(1, 1115, 0, '2022-12-02'),
(3, 1120, 0, '2022-12-02'),
(1, 1114, 0, '2022-12-02'),
(3, 1114, 0, '2022-12-02'),
(2, 1116, 0, '2022-12-02'),
(3, 1111, 0, '2022-12-03'),
(3, 1112, 0, '2022-12-03'),
(1,1117,0, '2022-12-03'),
(1,1117,0, '2022-12-03'),
(3, 1113, 0, '2022-12-03'),
(1, 1119, 0, '2022-12-03'),
(3, 1115, 0, '2022-12-03'),
(1, 1120, 0, '2022-12-03'),
(1, 1114, 0, '2022-12-03'),
(3, 1114, 0, '2022-12-03'),
(2, 1116, 0, '2022-12-03');



INSERT INTO `Customers`(Customer_ID, Customer_name, Customer_contact)
VALUES (1, 'Table 1', null),
(2, 'Table 2', null),
(3, 'Table 3', null),
(4, 'Table 4', null),
(5, 'Table 5', null),
(6, 'Table 6', null),
(7, 'Table 7', null),
(8, 'Table 8', null),
(9, 'Table 9', null),
(10, 'Table 10', null),
(11, 'Johnny lee', '408-345-7853'),
(12, 'Rowan Velasquez', '408-345-3542'),
(13, 'Tamara Wise', '408-345-1231'),
(14, 'Mariyah Patel', '408-675-2323'),
(15, 'Jaxon BlackBurn', '408-222-4343'),
(16, 'Chester Tyler', '408-345-2276'),
(17, 'Wilson Meadows', '408-345-3072'),
(18, 'Hector Schneider', '408-333-4343'),
(19, 'Iwan Schultz', '408-444-4343'),
(20, 'Prince Wheeler', '408-555-4343');

INSERT INTO `Order_method`(Order_method_ID, Method_name, Description)
VALUES (1, 'Dine in', 'Order and eat at the store with assigned table'),
(2, 'By phone', 'Order by phone to pick up in store'),
(3, 'Restanrant website', 'Order with the restaurant website');

INSERT INTO `Order`(Order_number, Order_method_ID, Customer_ID, Order_date, Order_time)
VALUES (1,1,1, '2022-12-02', '11:32:43'),
(2,1,5, '2022-12-02','10:00:00'),
(3,1,4, '2022-12-02','15:00:00'),
(4,1,4, '2022-12-02','12:00:00'),
(5,1,3, '2022-12-02','10:00:00'),
(6,1,6, '2022-12-02','14:00:00'),
(7,1,8, '2022-12-02','13:00:00'),
(8,1,10, '2022-12-02','11:00:00'),
(9,1,9, '2022-12-02','10:00:00'),
(10,1,2, '2022-12-02','9:00:00'),
(11,2,13, '2022-12-02','16:00:00'),
(12,2,15, '2022-12-02','16:30:00'),
(13,2,14, '2022-12-02','17:00:00'),
(14,2,16, '2022-12-02','18:00:00'),
(15,2,13, '2022-12-02','18:30:00'),
(16,2,11, '2022-12-02','19:00:00'),
(17,3,17, '2022-12-02','20:00:00'),
(18,3,18, '2022-12-02','19:30:00'),
(19,3,19, '2022-12-02','20:00:00'),
(20,3,20, '2022-12-02','20:40:00');

INSERT INTO `Employee_task`(Employee_ID, Order_number, Description)
VALUES (1112, 1, 'Serve table'),
(1111, 2, 'Serve table'),
(1112, 3, 'Serve table'),
(1111, 4, 'Serve table'),
(1111, 5, 'Serve table'),
(1112, 6, 'Serve table'),
(1112, 7, 'Serve table'),
(1112, 8, 'Serve table'),
(1111, 9, 'Serve table'),
(1111, 10, 'Serve table'),
(1111, 11, 'Serve table'),
(1113,1,'Cashier'),
(1113,3,'Cashier'),
(1113,5,'Cashier'),
(1113,2,'Cashier'),
(1119,11,'Cashier'),
(1119,13,'Cashier'),
(1119,12,'Cashier'),
(1119,17,'Cashier'),
(1119,18,'Cashier'),
(1114,1,'Cleaning'),
(1114,8,'Cleaning'),
(1114,11,'Cleaning'),
(1114,12,'Cleaning'),
(1114,19,'Cleaning'),
(1116,6, 'Help customers with their issues'),
(1115,1,'Cooking'),
(1115,2,'Cooking'),
(1115,3,'Cooking'),
(1115,4,'Cooking'),
(1115,5,'Cooking'),
(1115,6,'Cooking'),
(1115,7,'Cooking'),
(1115,8,'Cooking'),
(1115,9,'Cooking'),
(1115,10,'Cooking'),
(1120,11,'Cooking'),
(1120,12,'Cooking'),
(1120,13,'Cooking'),
(1120,14,'Cooking'),
(1120,15,'Cooking'),
(1120,16,'Cooking'),
(1120,17,'Cooking'),
(1120,18,'Cooking'),
(1120,19,'Cooking'),
(1120,10,'Cooking');
          

INSERT INTO `Order_item`(Order_number, Item_ID, Quantity)
VALUES (1, 1, 2),
(1,2,1),
(1,3,1),
(2,4,2),
(3,8, 2),
(4,6,1),
(5,9,1),
(8,10,2),
(9, 8, 2),
(9, 2, 1),
(9, 4, 1),
(10,9,1),
(11,3,6),
(12,9,2),
(13, 1, 2),
(13, 4, 1),
(13, 6, 1),
(14,2,1),
(15,3,1),
(16,2,2),
(16,3,3),
(16,9,5),
(17, 6, 2),
(18,2,1),
(19,3,1),
(19,8,2),
(19,9,1),
(20,8,2);


INSERT INTO `Tax`(Area_ID, Tax_percentage)
VALUES (1, 0.0938);

INSERT INTO `Discount`(Discount_ID, Event_name, Discount_percentage, Start_date, End_date, Description)
VALUES (0, 'Not applied', 0.0 , '2022-12-01', '2022-12-25', 'No discount'),
(1, 'Restaurant anniversary', 0.1 , '2022-12-01', '2022-12-03', '5 years anniversary'),
(2,'Employee Discount', 0.3, '2022-01-02','2022-12-02','Discount for empoyees'),
(3,'Birthday', 0.2, '2022-01-02','2022-12-02','Discount for birthday customer');

INSERT INTO `Bill`(Bill_number, Order_number, Customer_ID, Bill_date, Time, Area_ID, Discount_ID)
VALUES (1, 1, 1, '2022-12-02', '14:00:00', 1, 3),
(2,2,5,'2022-12-02', '13:00:00', 1,1),
(3,3, 4, '2022-12-02', '16:00:00', 1, 1),
(4,4,4,'2022-12-02', '13:00:00', 1,2),
(5, 5, 3, '2022-12-02', '12:00:00', 1, 3),
(6,6,6,'2022-12-02', '15:30:00', 1,1),
(7, 7, 8, '2022-12-02', '14:40:00', 1, 1),
(8,8,10,'2022-12-02', '13:00:00', 1,3),
(9, 9, 9, '2022-12-02', '12:00:00', 1, 1),
(10,10,2,'2022-12-02', '13:00:00', 1,1),
(11, 11, 13, '2022-12-02', '16:50:00', 1, 1),
(12,12,15,'2022-12-02', '17:00:00', 1,1),
(13, 13, 14, '2022-12-02', '17:00:00', 1, 1),
(14,14,16,'2022-12-02', '19:00:00', 1,1),
(15, 15, 13, '2022-12-02', '19:00:00', 1, 1),
(16,16,11,'2022-12-02', '19:00:00', 1,1),
(17, 17, 17, '2022-12-02', '20:00:00', 1, 1),
(18,18,18,'2022-12-02', '19:30:00', 1,1),
(19, 19, 19, '2022-12-02', '20:00:00', 1, 1),
(20,20,20,'2022-12-02', '20:40:00', 1,1);


