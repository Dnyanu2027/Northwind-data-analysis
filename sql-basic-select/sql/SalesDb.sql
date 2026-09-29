Create database SalesDB;
use SalesDB;


-- 1. List all product categories
SELECT * FROM Categories;

-- 2. Customers from Germany
SELECT CustomerName, City, Country
FROM Customers
WHERE Country = 'Germany';

-- 3. Products priced above 20
SELECT ProductName, Price
FROM Products
WHERE Price > 20;

-- 4. Products from most to least expensive
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

-- 5. US suppliers sorted by city
SELECT SupplierName, City, Country
FROM Suppliers
WHERE Country = 'USA'
ORDER BY City ASC;

-- 6. Condiments (CategoryID 2) priced under 20
SELECT ProductName, CategoryID, Price
FROM Products
WHERE CategoryID = 2 AND Price < 20
ORDER BY Price;

-- 7. Customers whose name starts with 'A'
SELECT CustomerName, Country
FROM Customers
WHERE CustomerName LIKE 'A%'
ORDER BY CustomerName;

-- 8. First five shippers, sorted by name
SELECT ShipperID, CompanyName, Phone
FROM Shippers
WHERE ShipperID <= 5
ORDER BY CompanyName;

-- 9. Orders placed between 10 and 20 July 2022
SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '2022-07-10' AND '2022-07-20'
ORDER BY OrderDate;

-- 10. Five largest order lines by quantity
SELECT OrderID, ProductID, Quantity
FROM OrderDetails
ORDER BY Quantity DESC
LIMIT 5;

-- 1. SELECT: all customers
SELECT * FROM Customers;

-- 2. SELECT specific columns: product names and prices
SELECT ProductName, Price
FROM Products;

-- 3. WHERE: customers from Germany
SELECT CustomerName, City, Country
FROM Customers
WHERE Country = 'Germany';

-- 4. WHERE with comparison: products priced above 50
SELECT ProductName, Price
FROM Products
WHERE Price > 50;

-- 5. ORDER BY: products from most to least expensive
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

-- 6. WHERE + ORDER BY: suppliers from USA, sorted by city
SELECT SupplierName, City, Country
FROM Suppliers
WHERE Country = 'USA'
ORDER BY City ASC;

-- 7. WHERE with AND: beverages (CategoryID 1) under 20
SELECT ProductName, CategoryID, Price
FROM Products
WHERE CategoryID = 1 AND Price < 20;

-- 8. LIKE: customers whose name starts with 'A'
SELECT CustomerName, Country
FROM Customers
WHERE CustomerName LIKE 'A%'
ORDER BY CustomerName;

-- 9. WHERE with date: orders placed in 1997
SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE OrderDate >= '1997-01-01' AND OrderDate < '1998-01-01'
ORDER BY OrderDate;

-- 10. ORDER BY + LIMIT: top 5 largest order lines
SELECT OrderID, ProductID, Quantity
FROM OrderDetails
ORDER BY Quantity DESC
LIMIT 5;

-- SQL Filtering Practice: 12 queries using WHERE, IN, BETWEEN, LIKE (MySQL )
-- 1. Products priced between 15 and 30 (BETWEEN)
select ProductName, Price
from Products
where Price between 15 and 30
order by Price;

-- 2. Customers from three specific countries (IN)
select CustomerName, Country
from Customers
where Country in ('Germany', 'France', 'Mexico')
order by Country;

-- 3. Products NOT in a set of categories (NOT IN)
SELECT ProductName, CategoryID
FROM Products
WHERE CategoryID NOT IN (1, 2)
ORDER BY CategoryID;

-- 4. Customers whose name ends in 's' (LIKE)
select CustomerName, City 
from Customers
where CustomerName like '%s'
order by CustomerName;

-- 5. Products with 'Cha' anywhere in the name (LIKE wildcard both sides) 
SELECT ProductName, Price
FROM Products
WHERE ProductName LIKE '%Cha%';

-- 6. Suppliers NOT from the USA (WHERE + <>)
select SupplierName, Country
from Suppliers
Where country <> 'USA'
order by Country;

-- 7. Orders from a specific set of shippers (IN)
SELECT OrderID, CustomerID, ShipperID
FROM Orders
WHERE ShipperID IN (1, 2)
ORDER BY OrderID;

-- 8. Orders placed in a date range (BETWEEN on dates)
SELECT OrderID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '2022-07-01' AND '2022-07-10'
ORDER BY OrderDate;

 -- 9. Order lines with quantity between 5 and 10 (BETWEEN)
 SELECT OrderID, ProductID, Quantity
FROM OrderDetails
WHERE Quantity BETWEEN 5 AND 10
ORDER BY Quantity;

-- 10. Products priced under 10 OR over 50 (WHERE + OR)
SELECT ProductName, Price
FROM Products
WHERE Price < 10 OR Price > 50
ORDER BY Price;

-- 11. Customers whose City starts with 'M' (LIKE)
SELECT CustomerName, City
FROM Customers
WHERE City LIKE 'M%'
ORDER BY City;

-- 12. Categories with an ID in a chosen list (IN)
SELECT CategoryID, CategoryName
FROM Categories
WHERE CategoryID IN (1, 3, 5);

