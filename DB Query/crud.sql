
-- crud.sql: Perform sample CRUD operations

-- CREATE: Add a new user
INSERT INTO Users (FullName, Email, PasswordHash, Role)
VALUES ('Mohan', 'Mohan@example.com', 'hashedpassword123', 'Customer');

-- CREATE: Add a new restaurant
INSERT INTO Restaurants (OwnerID, Name, Address, PhoneNumber, OpeningHours)
VALUES (1, 'New Tasty Bites', '789 Oak Ave', '321-654-0987', '11:00 AM - 11:00 PM');

-- CREATE: Add a new menu item
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus)
VALUES (1, 'Grilled Cheese Sandwich', 'Cheesy and toasty delight', 5.99, 'Available');

-- READ: Retrieve all users
SELECT * FROM Users;

-- READ: Get all menu items for a specific restaurant
SELECT * FROM MenuItems WHERE RestaurantID = 1;

-- UPDATE: Update an order status
UPDATE Orders SET OrderStatus = 'Preparing' WHERE OrderID = 1;

-- UPDATE: Change the price of a menu item
UPDATE MenuItems SET Price = 10.99 WHERE MenuItemID = 1;

-- DELETE: Remove a specific review
DELETE FROM Reviews WHERE ReviewID = 1;

-- DELETE: Remove a user (and cascade related records if applicable)
DELETE FROM Users WHERE UserID = 3;

-- JOIN: Get all orders with user details
SELECT Orders.OrderID, Users.FullName, Restaurants.Name AS Restaurant, Orders.OrderStatus, Orders.TotalPrice
FROM Orders
JOIN Users ON Orders.UserID = Users.UserID
JOIN Restaurants ON Orders.RestaurantID = Restaurants.RestaurantID;

-- JOIN: Fetch order details including menu items
SELECT OrderDetails.OrderID, MenuItems.ItemName, OrderDetails.Quantity, OrderDetails.SubTotal
FROM OrderDetails
JOIN MenuItems ON OrderDetails.MenuItemID = MenuItems.MenuItemID
WHERE OrderDetails.OrderID = 1;
