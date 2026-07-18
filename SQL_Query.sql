CREATE DATABASE E_Commerce_System

USE E_Commerce_System

ALTER AUTHORIZATION ON DATABASE:: E_Commerce_System TO sa;

SELECT TOP 5 * FROM Categories;
SELECT TOP 5 * FROM Suppliers;
SELECT TOP 5 * FROM Products;
SELECT TOP 5 * FROM Customers;
SELECT TOP 5 * FROM Orders;
SELECT TOP 5 * FROM Order_Details;
SELECT TOP 5 * FROM Payments;
SELECT TOP 5 * FROM shipments;


-- 1. Categories:
ALTER TABLE Categories ALTER COLUMN CategoryID INT NOT NULL;
ALTER TABLE Categories ADD CONSTRAINT PK_Categories PRIMARY KEY (CategoryID);

-- 2. Suppliers:
ALTER TABLE Suppliers ALTER COLUMN SupplierID INT NOT NULL;
ALTER TABLE Suppliers ADD CONSTRAINT PK_Suppliers PRIMARY KEY (SupplierID);

-- 3. Products:
ALTER TABLE Products ALTER COLUMN ProductID INT NOT NULL;
ALTER TABLE Products ADD CONSTRAINT PK_Products PRIMARY KEY (ProductID);

-- 4. Customers:
ALTER TABLE Customers ALTER COLUMN CustomerID INT NOT NULL;
ALTER TABLE Customers ADD CONSTRAINT PK_Customers PRIMARY KEY (CustomerID);

-- 5. Orders:
ALTER TABLE Orders ALTER COLUMN OrderID INT NOT NULL;
ALTER TABLE Orders ADD CONSTRAINT PK_Orders PRIMARY KEY (OrderID);

-- 6. Order Details:
ALTER TABLE Order_Details ALTER COLUMN OrderID INT NOT NULL;
ALTER TABLE Order_Details ALTER COLUMN ProductID INT NOT NULL;
ALTER TABLE Order_Details ADD CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID);

-- 7. Payments:
ALTER TABLE Payments ALTER COLUMN PaymentID INT NOT NULL;
ALTER TABLE Payments ADD CONSTRAINT PK_Payments PRIMARY KEY (PaymentID);

-- 8. Shipments:
ALTER TABLE shipments ALTER COLUMN shipment_id INT NOT NULL;
ALTER TABLE shipments ADD CONSTRAINT PK_Shipments PRIMARY KEY (shipment_id);


-- 
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

ALTER TABLE Products 
ADD CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID) 
REFERENCES Suppliers(SupplierID);

-- 
ALTER TABLE Orders 
ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) 
REFERENCES Customers(CustomerID);


ALTER TABLE Order_Details 
ADD CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) 
REFERENCES Orders(OrderID);

ALTER TABLE Order_Details 
ADD CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) 
REFERENCES Products(ProductID);


ALTER TABLE Payments 
ADD CONSTRAINT FK_Payments_Orders FOREIGN KEY (OrderID) 
REFERENCES Orders(OrderID);
