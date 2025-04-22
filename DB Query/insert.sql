-- insert.sql: Insert sample data into tables

-- Insert Users
INSERT INTO Users (FullName, Email, PasswordHash, Role) VALUES
('Mohan', 'Mohan@example.com', 'hashedpassword123', 'Customer');

-- Insert 20 Unique Restaurants
INSERT INTO Restaurants (OwnerID, Name, Address, PhoneNumber, OpeningHours) VALUES
(1, 'Bella Italia', '101 Sunset Blvd', '555-123-0001', '11:00 AM - 10:00 PM'),
(2, 'The Curry House', '202 Sunrise Ave', '555-123-0002', '10:30 AM - 9:30 PM'),
(3, 'Sushi Zen', '303 Ocean Dr', '555-123-0003', '12:00 PM - 11:00 PM'),
(4, 'Burger Haven', '404 Maple St', '555-123-0004', '10:00 AM - 8:00 PM'),
(5, 'Taco Town', '505 Cedar Rd', '555-123-0005', '9:00 AM - 10:00 PM'),
(6, 'Noodle Nook', '606 Pine Ave', '555-123-0006', '11:30 AM - 9:30 PM'),
(7, 'Falafel Fiesta', '707 Birch Ln', '555-123-0007', '10:00 AM - 11:00 PM');



INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Classic Burger', 'Juicy beef patty with cheese', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Spicy Chicken Burger', 'Grilled chicken with spicy mayo', 10.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Veggie Delight', 'Loaded with grilled vegetables', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Fries', 'Crispy golden fries', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Onion Rings', 'Deep-fried onion rings', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Caesar Salad', 'Romaine, croutons & Caesar dressing', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Milkshake', 'Chocolate or vanilla shake', 4.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Iced Tea', 'Fresh brewed lemon iced tea', 2.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Chicken Wings', 'Spicy buffalo wings', 11.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Mozzarella Sticks', 'Cheesy and crispy sticks', 5.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Mac & Cheese', 'Creamy cheddar macaroni', 7.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Double Cheeseburger', 'Two patties, double cheese', 11.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Club Sandwich', 'Turkey, bacon, lettuce & tomato', 9.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Soft Drink', 'Coke, Sprite, or Pepsi', 1.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Grilled Chicken Salad', 'Healthy salad with grilled chicken', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Fish Fillet Sandwich', 'Breaded fish with tartar sauce', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Tater Tots', 'Mini fried potato bites', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Chili Cheese Fries', 'Fries with chili and cheese', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Root Beer Float', 'Classic soda float dessert', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (1, 'Brownie Sundae', 'Warm brownie with ice cream', 5.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Classic Burger', 'Juicy beef patty with cheese', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Spicy Chicken Burger', 'Grilled chicken with spicy mayo', 10.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Veggie Delight', 'Loaded with grilled vegetables', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Fries', 'Crispy golden fries', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Onion Rings', 'Deep-fried onion rings', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Caesar Salad', 'Romaine, croutons & Caesar dressing', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Milkshake', 'Chocolate or vanilla shake', 4.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Iced Tea', 'Fresh brewed lemon iced tea', 2.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Chicken Wings', 'Spicy buffalo wings', 11.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Mozzarella Sticks', 'Cheesy and crispy sticks', 5.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Mac & Cheese', 'Creamy cheddar macaroni', 7.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Double Cheeseburger', 'Two patties, double cheese', 11.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Club Sandwich', 'Turkey, bacon, lettuce & tomato', 9.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Soft Drink', 'Coke, Sprite, or Pepsi', 1.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Grilled Chicken Salad', 'Healthy salad with grilled chicken', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Fish Fillet Sandwich', 'Breaded fish with tartar sauce', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Tater Tots', 'Mini fried potato bites', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Chili Cheese Fries', 'Fries with chili and cheese', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Root Beer Float', 'Classic soda float dessert', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (2, 'Brownie Sundae', 'Warm brownie with ice cream', 5.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Classic Burger', 'Juicy beef patty with cheese', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Spicy Chicken Burger', 'Grilled chicken with spicy mayo', 10.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Veggie Delight', 'Loaded with grilled vegetables', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Fries', 'Crispy golden fries', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Onion Rings', 'Deep-fried onion rings', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Caesar Salad', 'Romaine, croutons & Caesar dressing', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Milkshake', 'Chocolate or vanilla shake', 4.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Iced Tea', 'Fresh brewed lemon iced tea', 2.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Chicken Wings', 'Spicy buffalo wings', 11.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Mozzarella Sticks', 'Cheesy and crispy sticks', 5.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Mac & Cheese', 'Creamy cheddar macaroni', 7.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Double Cheeseburger', 'Two patties, double cheese', 11.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Club Sandwich', 'Turkey, bacon, lettuce & tomato', 9.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Soft Drink', 'Coke, Sprite, or Pepsi', 1.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Grilled Chicken Salad', 'Healthy salad with grilled chicken', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Fish Fillet Sandwich', 'Breaded fish with tartar sauce', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Tater Tots', 'Mini fried potato bites', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Chili Cheese Fries', 'Fries with chili and cheese', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Root Beer Float', 'Classic soda float dessert', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (3, 'Brownie Sundae', 'Warm brownie with ice cream', 5.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Classic Burger', 'Juicy beef patty with cheese', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Spicy Chicken Burger', 'Grilled chicken with spicy mayo', 10.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Veggie Delight', 'Loaded with grilled vegetables', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Fries', 'Crispy golden fries', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Onion Rings', 'Deep-fried onion rings', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Caesar Salad', 'Romaine, croutons & Caesar dressing', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Milkshake', 'Chocolate or vanilla shake', 4.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Iced Tea', 'Fresh brewed lemon iced tea', 2.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Chicken Wings', 'Spicy buffalo wings', 11.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Mozzarella Sticks', 'Cheesy and crispy sticks', 5.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Mac & Cheese', 'Creamy cheddar macaroni', 7.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Double Cheeseburger', 'Two patties, double cheese', 11.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Club Sandwich', 'Turkey, bacon, lettuce & tomato', 9.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Soft Drink', 'Coke, Sprite, or Pepsi', 1.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Grilled Chicken Salad', 'Healthy salad with grilled chicken', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Fish Fillet Sandwich', 'Breaded fish with tartar sauce', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Tater Tots', 'Mini fried potato bites', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Chili Cheese Fries', 'Fries with chili and cheese', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Root Beer Float', 'Classic soda float dessert', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (4, 'Brownie Sundae', 'Warm brownie with ice cream', 5.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Classic Burger', 'Juicy beef patty with cheese', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Spicy Chicken Burger', 'Grilled chicken with spicy mayo', 10.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Veggie Delight', 'Loaded with grilled vegetables', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Fries', 'Crispy golden fries', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Onion Rings', 'Deep-fried onion rings', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Caesar Salad', 'Romaine, croutons & Caesar dressing', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Milkshake', 'Chocolate or vanilla shake', 4.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Iced Tea', 'Fresh brewed lemon iced tea', 2.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Chicken Wings', 'Spicy buffalo wings', 11.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Mozzarella Sticks', 'Cheesy and crispy sticks', 5.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Mac & Cheese', 'Creamy cheddar macaroni', 7.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Double Cheeseburger', 'Two patties, double cheese', 11.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Club Sandwich', 'Turkey, bacon, lettuce & tomato', 9.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Soft Drink', 'Coke, Sprite, or Pepsi', 1.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Grilled Chicken Salad', 'Healthy salad with grilled chicken', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Fish Fillet Sandwich', 'Breaded fish with tartar sauce', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Tater Tots', 'Mini fried potato bites', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Chili Cheese Fries', 'Fries with chili and cheese', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Root Beer Float', 'Classic soda float dessert', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (5, 'Brownie Sundae', 'Warm brownie with ice cream', 5.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Classic Burger', 'Juicy beef patty with cheese', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Spicy Chicken Burger', 'Grilled chicken with spicy mayo', 10.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Veggie Delight', 'Loaded with grilled vegetables', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Fries', 'Crispy golden fries', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Onion Rings', 'Deep-fried onion rings', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Caesar Salad', 'Romaine, croutons & Caesar dressing', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Milkshake', 'Chocolate or vanilla shake', 4.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Iced Tea', 'Fresh brewed lemon iced tea', 2.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Chicken Wings', 'Spicy buffalo wings', 11.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Mozzarella Sticks', 'Cheesy and crispy sticks', 5.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Mac & Cheese', 'Creamy cheddar macaroni', 7.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Double Cheeseburger', 'Two patties, double cheese', 11.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Club Sandwich', 'Turkey, bacon, lettuce & tomato', 9.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Soft Drink', 'Coke, Sprite, or Pepsi', 1.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Grilled Chicken Salad', 'Healthy salad with grilled chicken', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Fish Fillet Sandwich', 'Breaded fish with tartar sauce', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Tater Tots', 'Mini fried potato bites', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Chili Cheese Fries', 'Fries with chili and cheese', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Root Beer Float', 'Classic soda float dessert', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (6, 'Brownie Sundae', 'Warm brownie with ice cream', 5.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Classic Burger', 'Juicy beef patty with cheese', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Spicy Chicken Burger', 'Grilled chicken with spicy mayo', 10.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Veggie Delight', 'Loaded with grilled vegetables', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Fries', 'Crispy golden fries', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Onion Rings', 'Deep-fried onion rings', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Caesar Salad', 'Romaine, croutons & Caesar dressing', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Milkshake', 'Chocolate or vanilla shake', 4.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Iced Tea', 'Fresh brewed lemon iced tea', 2.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Chicken Wings', 'Spicy buffalo wings', 11.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Mozzarella Sticks', 'Cheesy and crispy sticks', 5.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Mac & Cheese', 'Creamy cheddar macaroni', 7.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Double Cheeseburger', 'Two patties, double cheese', 11.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Club Sandwich', 'Turkey, bacon, lettuce & tomato', 9.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Soft Drink', 'Coke, Sprite, or Pepsi', 1.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Grilled Chicken Salad', 'Healthy salad with grilled chicken', 8.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Fish Fillet Sandwich', 'Breaded fish with tartar sauce', 9.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Tater Tots', 'Mini fried potato bites', 3.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Chili Cheese Fries', 'Fries with chili and cheese', 6.99, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Root Beer Float', 'Classic soda float dessert', 4.49, 'Available');
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus) VALUES (7, 'Brownie Sundae', 'Warm brownie with ice cream', 5.49, 'Available');

-- Insert Orders
INSERT INTO Orders (UserID, RestaurantID, OrderStatus, OrderDate, TotalPrice) VALUES
(1, 1, 'Delivered', '2025-03-31 12:00:00', 21.98);

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, SubTotal) VALUES
(1, 1, 2, 17.98);

-- Insert Reviews
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (4, 1, 4, 'The taste was not up to the mark.', '2025-03-30 13:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (3, 2, 4, 'Average experience overall.', '2025-03-25 04:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (9, 3, 4, 'Had a wonderful time, highly recommend.', '2025-03-29 03:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (2, 4, 5, 'The taste was not up to the mark.', '2025-03-25 07:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (2, 5, 4, 'Good portions for the price.', '2025-03-30 03:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (6, 6, 3, 'Excellent food and service!', '2025-03-22 09:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (5, 7, 3, 'Amazing dishes and quick service!', '2025-03-27 13:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (10, 9, 4, 'Excellent food and service!', '2025-03-22 11:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (5, 10, 3, 'Loved the ambiance and friendly staff.', '2025-03-24 12:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (5, 11, 4, 'Average experience overall.', '2025-03-24 13:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (7, 12, 3, 'Average experience overall.', '2025-03-26 10:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (1, 13, 4, 'Decent place, would visit again.', '2025-03-30 13:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (9, 14, 3, 'Excellent food and service!', '2025-03-24 06:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (8, 15, 3, 'Food was okay, not exceptional.', '2025-03-23 13:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (9, 16, 3, 'Amazing dishes and quick service!', '2025-03-31 05:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (1, 17, 5, 'Food was okay, not exceptional.', '2025-03-22 07:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (8, 18, 3, 'Decent place, would visit again.', '2025-03-23 13:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (3, 19, 5, 'Food was okay, not exceptional.', '2025-03-21 04:00:00');
INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment, ReviewDate) VALUES (9, 20, 3, 'Good portions for the price.', '2025-03-31 06:00:00');