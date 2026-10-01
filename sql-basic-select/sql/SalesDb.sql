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

-- SQL Aggregation Basics: 10 queries using COUNT, SUM, AVG, MIN, MAX (MySQL )

-- 1. Total number of products (COUNT)
SELECT COUNT(*) AS total_products
FROM Products;

-- 2. Number of products per category (COUNT + GROUP BY)
SELECT CategoryID, COUNT(*) AS product_count
FROM Products
GROUP BY CategoryID
ORDER BY CategoryID;

-- 3. Total quantity ordered across all order lines (SUM)
SELECT SUM(Quantity) AS total_quantity
FROM OrderDetails;

-- 4. Total quantity ordered per order (SUM + GROUP BY)
SELECT OrderID, SUM(Quantity) AS total_quantity
FROM OrderDetails
GROUP BY OrderID
ORDER BY total_quantity DESC;

-- 5. Average price of all products (AVG)
SELECT AVG(Price) AS avg_price
FROM Products;

-- 6. Average product price per category (AVG + GROUP BY)
SELECT CategoryID, AVG(Price) AS avg_price
FROM Products
GROUP BY CategoryID
ORDER BY avg_price DESC;

-- 7. Cheapest and priciest product overall (MIN, MAX)
SELECT MIN(Price) AS min_price, MAX(Price) AS max_price
FROM Products;

-- 8. Price range per category (MIN, MAX + GROUP BY)
SELECT CategoryID, MIN(Price) AS min_price, MAX(Price) AS max_price
FROM Products
GROUP BY CategoryID;

-- 9. Number of orders per customer (COUNT + GROUP BY)
SELECT CustomerID, COUNT(*) AS order_count
FROM Orders
GROUP BY CustomerID
ORDER BY order_count DESC;

-- 10. Suppliers with more than 2 products (COUNT, AVG + HAVING)
SELECT SupplierID, COUNT(*) AS product_count, AVG(Price) AS avg_price
FROM Products
GROUP BY SupplierID
HAVING COUNT(*) > 2
ORDER BY product_count DESC;

-- SQL Joins Practice: 10 queries using INNER JOIN, LEFT JOIN, multi-table joins (MySQL )

-- 1. Orders with customer name (INNER JOIN)
SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate;

-- 2. Products with category name (INNER JOIN)
SELECT p.ProductName, cat.CategoryName, p.Price
FROM Products p
INNER JOIN Categories cat ON p.CategoryID = cat.CategoryID
ORDER BY cat.CategoryName;

-- 3. Products with supplier name (INNER JOIN)
SELECT p.ProductName, s.SupplierName, p.Price
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY s.SupplierName;

-- 4. Order lines with product names (INNER JOIN)
SELECT od.OrderID, p.ProductName, od.Quantity
FROM OrderDetails od
INNER JOIN Products p ON od.ProductID = p.ProductID
ORDER BY od.OrderID;

-- 5. Orders with shipper name (INNER JOIN)
SELECT o.OrderID, o.OrderDate, s.CompanyName AS Shipper
FROM Orders o
INNER JOIN Shippers s ON o.ShipperID = s.ShipperID
ORDER BY o.OrderDate;

-- 6. Every customer, with orders if any (LEFT JOIN)
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName;

-- 7. Customers with no matching orders (LEFT JOIN + IS NULL)
SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 8. Every product, with order quantities if ordered (LEFT JOIN)
SELECT p.ProductName, od.OrderID, od.Quantity
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
ORDER BY p.ProductName;

-- 9. Order lines with customer and product names (3-table JOIN)
SELECT o.OrderID, c.CustomerName, p.ProductName, od.Quantity
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderID;

-- 10. Total revenue per product (JOIN + GROUP BY)
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS total_revenue
FROM OrderDetails od
INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY total_revenue DESC;

