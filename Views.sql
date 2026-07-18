USE E_Commerce_System;


-- 1. Order Summary
CREATE VIEW vw_OrderSummary AS
SELECT 
    OD.OrderID, 
    O.CustomerID, 
    O.OrderDate, 
    O.OrderStatus, 
    SUM(OD.UnitPrice * OD.Quantity) AS LineTotal
FROM Order_Details OD
JOIN Orders O ON OD.OrderID = O.OrderID
GROUP BY OD.OrderID, O.CustomerID, O.OrderDate, O.OrderStatus;
GO

-- 2. Product Sales
CREATE VIEW vw_ProductSales AS
SELECT 
    OrderID, 
    ProductID,
    Quantity, 
    SUM(UnitPrice * Quantity) AS Total_price 
FROM Order_Details 
GROUP BY OrderID, ProductID, Quantity;
GO

-- 3. Customers Orders
CREATE VIEW vw_CustomerOrders AS
SELECT 
    C.FirstName, 
    C.CustomerID, 
    COUNT(O.OrderID) AS Total_orders 
FROM Customers C 
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.CustomerID;
GO

-- 4. Available Stock (Inventory Status)
CREATE VIEW vw_InventoryStatus AS
SELECT 
    P.ProductID, 
    P.ProductName, 
    P.UnitPrice, 
    OD.Quantity 
FROM Order_Details OD 
JOIN Products P ON P.ProductID = OD.ProductID;
GO