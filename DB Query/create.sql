-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INTEGER PRIMARY KEY AUTOINCREMENT,
    FullName TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    PasswordHash TEXT NOT NULL,
    Role TEXT CHECK(Role IN ('Customer', 'RestaurantOwner', 'Admin')) NOT NULL
);

-- Restaurants Table
CREATE TABLE IF NOT EXISTS Restaurants (
    RestaurantID INTEGER PRIMARY KEY AUTOINCREMENT,
    OwnerID INTEGER NOT NULL,
    Name TEXT NOT NULL,
    Address TEXT NOT NULL,
    PhoneNumber TEXT NOT NULL,
    OpeningHours TEXT NOT NULL,
    FOREIGN KEY (OwnerID) REFERENCES Users(UserID)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INTEGER PRIMARY KEY AUTOINCREMENT,
    RestaurantID INTEGER NOT NULL,
    ItemName TEXT NOT NULL,
    Description TEXT,
    Price REAL NOT NULL,
    AvailabilityStatus TEXT CHECK(AvailabilityStatus IN ('Available', 'Unavailable')) NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER NOT NULL,
    RestaurantID INTEGER NOT NULL,
    OrderStatus TEXT CHECK(OrderStatus IN ('Pending', 'Preparing', 'Delivered')) NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalPrice REAL NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- OrderDetails Table
CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderID INTEGER NOT NULL,
    MenuItemID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    SubTotal REAL NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

-- Payments Table
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderID INTEGER NOT NULL,
    TransactionID TEXT UNIQUE NOT NULL,
    PaymentStatus TEXT CHECK(PaymentStatus IN ('Success', 'Failed', 'Pending')) NOT NULL,
    PaymentMethod TEXT NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Reviews Table
CREATE TABLE IF NOT EXISTS Reviews (
    ReviewID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER NOT NULL,
    RestaurantID INTEGER NOT NULL,
    Rating INTEGER CHECK(Rating BETWEEN 1 AND 5) NOT NULL,
    Comment TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
