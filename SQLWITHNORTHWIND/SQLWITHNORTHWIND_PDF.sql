--Select all the rows from the "Customers" table.
SELECT * FROM Customers;

--Get distinct countries from the Customers table. (Hint: research the DISTINCT keyword.)
SELECT DISTINCT Country FROM Customers;

--Get all the rows from the table Customers where the Customer’s ID starts with “BL”.
SELECT * FROM Customers WHERE CustomerID LIKE 'BL%';

--Get the first 100 records of the orders table. (Hint: research the TOP keyword.) DISCUSS: Why would you do this? What else would you likely need to include in this query?
SELECT TOP 100 * FROM Orders; -- create a limit, so you dont want to bring in everything. Helps get bairing on whats in the table. Something you include a WHERE clause.

--Get all customers that live in the postal codes 1010, 3012, 12209, and 05023. (Hint: research the IN keyword.)
SELECT * FROM Customers WHERE PostalCode IN ('1010', '3012', '12209', '05023');

--Get all orders where the ShipRegion is not equal to NULL.
SELECT * FROM Orders WHERE ShipRegion IS NOT NULL;

--Get all customers ordered by the country, then by the city.
SELECT * FROM Customers ORDER BY Country, City;

--Add a new customer to the customers table. You can use whatever values.
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('NEWCUST', 'New Customer Co.', 'John Doe', 'Manager', '123 New St.', 'New City', NULL, '12345', 'NewCountry', '123-456-7890', '123-456-7891');

--Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.  
UPDATE Orders SET ShipRegion = 'EuroZone' WHERE ShipCountry = 'France';

--Delete all orders from OrderDetails that have quantity of 1. 
DELETE FROM [Order Details] WHERE Quantity = '1';

--Find the CustomerID that placed order 10290 (orders table).
SELECT CustomerID FROM Orders WHERE OrderID = '10290';

--Join the orders table to the customers table.
SELECT * FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;

--Get employees’ firstname for all employees who report to no one.
SELECT FirstName FROM Employees WHERE ReportsTo IS NULL;

--Get employees’ firstname for all employees who report to Andrew.
SELECT FirstName FROM Employees WHERE ReportsTo = (SELECT EmployeeID FROM Employees WHERE FirstName = 'Andrew');
--OR
SELECT FirstName FROM Employees WHERE ReportsTo = 'Andrew'

--Write an SQL command to create an index on the CustomerID column in the Customers table.
CREATE INDEX index_CustomerID ON Customers (CustomerID);



--Calculate the average, max, and min of the quantity at the orderdetails table, grouped by the orderid. 
SELECT OrderID, AVG(Quantity) AS AvgQuantity, MAX(Quantity) AS MaxQuantity, MIN(Quantity) AS MinQuantity
FROM [Order Details]
GROUP BY OrderID;

--Calculate the average, max, and min of the quantity at the orderdetails table.
SELECT AVG(Quantity) AS AvgQuantity, MAX(Quantity) AS MaxQuantity, MIN(Quantity) AS MinQuantity
FROM [Order Details];

--Find all customers living in London or Paris
SELECT * FROM Customers WHERE City IN ('London', 'Paris');

--Do an inner join, left join, right join on orders and customers tables. 
SELECT * FROM Orders O INNER JOIN Customers C ON O.CustomerID = C.CustomerID;

SELECT * FROM Orders O LEFT JOIN Customers C ON O.CustomerID = C.CustomerID;

SELECT * FROM Orders O RIGHT JOIN Customers C ON O.CustomerID = C.CustomerID;

--Make a list of cities where customers are coming from. The list should not have any duplicates or nulls.
SELECT DISTINCT City FROM Customers WHERE City IS NOT NULL;

--Show a sorted list of employees’ first names. 
SELECT FirstName FROM Employees ORDER BY FirstName;

--Find total for each order
SELECT OrderID, SUM(UnitPrice * Quantity) AS 'Total'
FROM [Order Details]
GROUP BY OrderID;

--Get a list of all employees who got hired between 1/1/1994 and today
SELECT * FROM Employees WHERE HireDate BETWEEN '1994-01-01' AND GETDATE();

--Find how long employees have been working for Northwind (in years!)
SELECT FirstName, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked
FROM Employees;

--Get a list of all products sorted by quantity (ascending and descending order)
SELECT * FROM Products ORDER BY QuantityPerUnit ASC; --OR leave ASC off since its default

SELECT * FROM Products ORDER BY QuantityPerUnit DESC;

--Find all products that are low on stock (quantity less than 6)
SELECT * FROM Products WHERE UnitsInStock < 6;

--Find a list of all discontinued products. 
SELECT * FROM Products WHERE Discontinued = 1;

--Find a list of all products that have Tofu in the product name.
SELECT * FROM Products WHERE ProductName LIKE '%Tofu%';

--Find the product that has the highest unit price. 
SELECT TOP 1 * FROM Products ORDER BY UnitPrice DESC;

--Get a list of all employees who got hired after 1/1/1993
SELECT * FROM Employees WHERE HireDate > '1993-01-01';

--Get all employees who have title : “Ms.” And “Mrs.”
SELECT * FROM Employees WHERE TitleOfCourtesy IN ('Ms.', 'Mrs.');

--Get all employees who have a Home phone number that has area code 206
SELECT * FROM Employees WHERE HomePhone LIKE '(206)%';


---PDF STUFFFFFFFF
--1. Retrieve all the columns from the Customers table for customers who are from the UK.
SELECT * FROM Customers WHERE Country = 'UK';

--2. Using the Products table, list the product names and their unit prices where the unit price is greater than 30.
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice > 30;

--3. Count the number of products in the Products table that have been discontinued.
SELECT COUNT(*) AS DiscontinuedCount FROM Products WHERE Discontinued = 1;

--4. Find the average, maximum, and minimum unit prices from the Products table.
SELECT AVG(UnitPrice) AS AveragePrice, MAX(UnitPrice) AS MaximumPrice, MIN(UnitPrice) AS MinimumPrice FROM Products;

--5. Retrieve the names of categories and the count of products in each category from the Categories and Products tables.
SELECT C.CategoryName, COUNT(P.ProductID) AS ProductCount
FROM Categories C
JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName;

--6. List the suppliers (SupplierID and CompanyName) from the Suppliers table who are not from USA, Germany, or UK.
SELECT SupplierID, CompanyName FROM Suppliers WHERE Country NOT IN ('USA', 'Germany', 'UK');

--7. Retrieve all the distinct countries from the Customers table.
SELECT DISTINCT Country FROM Customers;

--8. Find the top 5 most expensive products (Product name and Unit price) from the Products table.
SELECT TOP 5 ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC;

--9. Using the Orders and Order Details tables, calculate the total revenue for each order (OrderID).
SELECT O.OrderID, 
       CONVERT(DECIMAL(10, 2), SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount))) AS TotalRevenue
FROM Orders O
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID;


--10. List all employees (FirstName and LastName) and the count of orders they have taken from the Employees and Orders tables.
SELECT E.FirstName, E.LastName, COUNT(O.OrderID) AS OrderCount
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName, E.LastName;

--11. Retrieve customers (CustomerID and CompanyName) who have placed more than 10 orders using the Customers and Orders tables.
SELECT C.CustomerID, C.CompanyName, COUNT(O.OrderID) AS OrderCount
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CompanyName
HAVING COUNT(O.OrderID) > 10;


--12. From the Products table, retrieve the names of products that are out of stock (units in stock is 0).
SELECT ProductName FROM Products WHERE UnitsInStock = 0;

--13. Using the Products and Categories tables, list the names of products and their respective categories where the category is either 'Beverage' or 'Confectionery'.
SELECT P.ProductName, C.CategoryName
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName IN ('Beverages', 'Confections');

--14. Identify which supplier (SupplierID and CompanyName from Suppliers table) has the highest number of products in the Products table.
SELECT TOP 1 S.SupplierID, S.CompanyName, COUNT(P.ProductID) AS ProductCount
FROM Suppliers S
JOIN Products P ON S.SupplierID = P.SupplierID
GROUP BY S.SupplierID, S.CompanyName
ORDER BY ProductCount DESC


--15. List all the products (ProductID and ProductName) which have never been ordered. Use the Products and Order Details tables.
SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN [Order Details] OD ON P.ProductID = OD.ProductID
WHERE OD.ProductID IS NULL;

--16. Retrieve all orders (OrderID from Orders table) that were placed in December 1997.
SELECT OrderID FROM Orders WHERE OrderDate BETWEEN '1997-12-01' AND '1997-12-31';

--17. Using the Employees and Orders tables, find out which employee has processed the most number of orders in 1998.
SELECT TOP 1 E.EmployeeID, (E.FirstName + ' '+ E.LastName) 'Employee First & Last', COUNT(O.OrderID) AS OrderCount
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE YEAR(O.OrderDate) = 1998
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY OrderCount DESC;


--18. Find the customer (CustomerID and CompanyName from Customers table) who has purchased the most by quantity in the Order Details table.
SELECT TOP 1 S.ShipperID, S.CompanyName, COUNT(O.OrderID) AS OrderCount
FROM Shippers S
JOIN Orders O ON S.ShipperID = O.ShipVia
GROUP BY S.ShipperID, S.CompanyName
ORDER BY OrderCount DESC;


--19. From the Shippers and Orders tables, determine which shipper has delivered the most number of orders.
SELECT TOP 1  S.ShipperID, S.CompanyName, COUNT(O.OrderID) AS OrderCount
FROM Shippers S
JOIN Orders O ON S.ShipperID = O.ShipVia
GROUP BY S.ShipperID, S.CompanyName
ORDER BY OrderCount DESC


--20. Identify the top 3 categories in terms of the number of products they have using the Categories and Products tables.
SELECT TOP 3 C.CategoryID, C.CategoryName, COUNT(P.ProductID) AS ProductCount
FROM Categories C
JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID, C.CategoryName
ORDER BY ProductCount DESC;



