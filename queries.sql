-- Database Queries

-- Find all customers with postal code 1010
SELECT CustomerName, ContactName
FROM Customers
WHERE PostalCode = 1010;

Answer: CustomerName/ContactName 

Cactus Comidas para llevar/Patricio Simpson
Oceano Atlantico Ltda./Yvonne Moncada
Rancho Grande/Sergio Gutierrez

-- Find the phone number for the supplier with the id 11
SELECT Phone
FROM Suppliers
WHERE SupplierID = 11;

Answer: (010) 9984510

-- List first 10 orders placed, sorted descending by the order date
SELECT * 
FROM Orders
ORDER BY "OrderDate" DESC
LIMIT 10;

Anser: OrderDate
1997-02-12
1997-02-11
1997-02-10
1997-02-10
1997-02-07
1997-02-06
1997-02-05
1997-02-05
1997-02-04
1997-02-03

-- Find all customers that live in London, Madrid, or Brazil
SELECT CustomerID
FROM Customers
WHERE City = "London"
OR City = "Madrid"
OR Country = "Brazil"

Answer: CustomerID
4
8
11
15
16
19
21
22
31
34
53
61
62
67
69
72
81
88

-- Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ("The Shire", "Bilbo Baggins", "1 Hobbit-Hole", "Bag End", "111", "Middle Earth")

-- Update Bilbo Baggins record so that the postal code changes to "11122"
UPDATE Customers
SET PostalCode = "11122"
WHERE CustomerID = 92;

-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted

-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name
