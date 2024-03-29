USE FoodService;
GO
CREATE TABLE TypeOfFood(
TypeOfFoodId INT PRIMARY KEY IDENTITY(1, 1),
Name VARCHAR(50))
GO

CREATE TABLE FoodItem(
FoodItemId INT PRIMARY KEY IDENTITY(1, 1),
TypeOfFoodIdRef INT NOT NULL FOREIGN KEY REFERENCES TypeOfFood(TypeOfFoodId),
Name VARCHAR(50) NOT NULL,
UnitPrice DECIMAL(4, 2) NOT NULL,
)




CREATE TABLE Customer(
CustomerId INT PRIMARY KEY IDENTITY(1 ,1),
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Email VARCHAR(30) NOT NULL,
)

CREATE TABLE Employee(
EmployeeId INT PRIMARY KEY IDENTITY(1 ,1),
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Email VARCHAR(30) NOT NULL
)

CREATE TABLE Payment(
PaymentId INT PRIMARY KEY IDENTITY(1 ,1),
Code CHAR(3) NOT NULL UNIQUE,
Name VARCHAR(30) NOT NULL
)

CREATE TABLE [Order](
OrderId INT PRIMARY KEY IDENTITY(1 ,1),
CustomerIdRef INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
EmployeeRef INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeId),
PaymentIdRef INT NOT NULL FOREIGN KEY REFERENCES Payment(PaymentId),
Timestamp DATETIME NOT NULL,
Description VARCHAR(100),
Status VARCHAR(30) NOT NULL
)

CREATE TABLE OrderItem(
OrderItemId INT PRIMARY KEY IDENTITY(1 ,1),
FoodItemIdRef INT NOT NULL FOREIGN KEY REFERENCES FoodItem(FoodItemId),
OrderId INT NOT NULL FOREIGN KEY REFERENCES [Order](OrderId),
Quantity INT NOT NULL
)

CREATE TABLE OrderCustomer(
OrderIdRef INT NOT NULL FOREIGN KEY REFERENCES [Order](OrderId),
CustomerIdRef INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),

PRIMARY KEY(OrderIdRef, CustomerIdRef)
)

CREATE TABLE OrderEmployee(
OrderIdRef INT NOT NULL FOREIGN KEY REFERENCES [Order](OrderId),
EmployeeIdRef INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeId),


PRIMARY KEY(OrderIdRef, EmployeeIdRef)
)
