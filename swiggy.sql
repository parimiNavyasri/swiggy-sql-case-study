CREATE DATABASE Swiggy_Case_Study;
USE Swiggy_Case_Study;
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
City VARCHAR(30),
Membership VARCHAR(20)
);
CREATE TABLE Restaurants (
RestaurantID INT PRIMARY KEY,
RestaurantName VARCHAR(50),
Cuisine VARCHAR(30),
City VARCHAR(30),
Rating DECIMAL(2,1)
);
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
RestaurantID INT,
OrderAmount INT,
DeliveryPartner VARCHAR(30),
OrderDate DATE,
OrderStatus VARCHAR(20),
FOREIGN KEY(CustomerID) REFERENCES
Customers(CustomerID),
FOREIGN KEY(RestaurantID) REFERENCES
Restaurants(RestaurantID)
);
INSERT INTO Customers  VALUES
(101,'Amit Sharma','Delhi','Gold'),
(102,'Priya Verma','Mumbai','Silver'),
(103,'Rahul Singh','Delhi','Gold'),
(104,'Sneha Gupta','Pune','Regular'),
(105,'Karan Mehta','Bangalore','Silver'),
(106,'Anjali Jain','Delhi','Gold'),
(107,'Rohit Kumar','Hyderabad','Regular'),
(108,'Neha Kapoor','Mumbai','Gold'),
(109,'Pooja Arora','Pune','Silver'),
(110,'Vikas Malhotra','Chennai','Regular'),
(111,'Riya Sharma','Jaipur','Gold'),
(112,'Aditya Singh','Lucknow','Regular');
INSERT INTO Restaurants VALUES
(201,'Burger King','Fast Food','Delhi',4.4),
(202,'Dominos','Pizza','Mumbai',4.5),
(203,'Biryani Blues','Biryani','Delhi',4.7),
(204,'Pizza Hut','Pizza','Pune',4.3),
(205,'Subway','Healthy','Bangalore',4.2),
(206,'KFC','Fast Food','Hyderabad',4.1),
(207,'Haldiram''s','North Indian','Delhi',4.6),
(208,'Wow Momo','Chinese','Mumbai',4.2),
(209,'Barbeque Nation','BBQ','Pune',4.8),
(210,'Faasos','Rolls','Chennai',4.0),
(211,'McDonalds','Fast Food','Delhi',4.3),
(212,'Behrouz Biryani','Biryani','Bangalore',4.7);
INSERT INTO Orders VALUES
(1001,101,201,450,'Rahul','2026-08-01','Delivered'),
(1002,102,202,780,'Aman','2026-08-01','Delivered'),
(1003,103,203,620,'Rohit','2026-08-02','Delivered'),
(1004,104,204,540,'Rahul','2026-08-02','Cancelled'),
(1005,105,205,390,'Aman','2026-08-03','Delivered'),
(1006,106,207,860,'Neha','2026-08-03','Delivered'),
(1007,107,206,710,'Rohit','2026-08-04','Delivered'),
(1008,108,208,580,'Rahul','2026-08-04','Delivered'),
(1009,109,209,950,'Aman','2026-08-05','Delivered'),
(1010,110,210,430,'Neha','2026-08-05','Delivered'),
(1011,101,203,720,'Rahul','2026-08-06','Delivered'),
(1012,102,202,810,'Aman','2026-08-06','Delivered'),
(1013,103,207,650,'Neha','2026-08-07','Delivered'),
(1014,104,204,490,'Rohit','2026-08-07','Delivered'),
(1015,105,212,880,'Rahul','2026-08-08','Delivered'),
(1016,106,211,520,'Aman','2026-08-08','Cancelled'),
(1017,107,206,640,'Neha','2026-08-09','Delivered'),
(1018,108,208,760,'Rahul','2026-08-09','Delivered'),
(1019,109,209,990,'Rohit','2026-08-10','Delivered'),
(1020,110,210,450,'Aman','2026-08-10','Delivered');
SELECT * FROM Customers;
SELECT * FROM Restaurants;
SELECT * FROM Orders;
SELECT COUNT(*) AS Total_Orders
FROM Orders;
SELECT SUM(OrderAmount) AS Total_Revenue
FROM Orders;
SELECT ROUND(AVG(OrderAmount),2) AS Average_Order_Value
FROM Orders;
SELECT OrderID,
       CustomerID,
       OrderAmount
FROM Orders
ORDER BY OrderAmount DESC
LIMIT 5;
SELECT C.City,
       SUM(O.OrderAmount) AS Total_Revenue
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID
GROUP BY C.City
ORDER BY Total_Revenue DESC
LIMIT 1;
SELECT R.RestaurantName,
       SUM(O.OrderAmount) AS Total_Revenue
FROM Restaurants R
JOIN Orders O
ON R.RestaurantID = O.RestaurantID
GROUP BY R.RestaurantName
ORDER BY Total_Revenue DESC
LIMIT 1;
SELECT R.Cuisine,
       COUNT(*) AS Total_Orders
FROM Restaurants R
JOIN Orders O
ON R.RestaurantID = O.RestaurantID
GROUP BY R.Cuisine
ORDER BY Total_Orders DESC
LIMIT 1;
SELECT DeliveryPartner,
       COUNT(*) AS Successful_Deliveries
FROM Orders
WHERE OrderStatus='Delivered'
GROUP BY DeliveryPartner
ORDER BY Successful_Deliveries DESC
LIMIT 1;
SELECT DISTINCT
       C.CustomerName,
       O.OrderAmount
FROM Customers C
JOIN Orders O
ON C.CustomerID=O.CustomerID
WHERE O.OrderAmount>
(
SELECT AVG(OrderAmount)
FROM Orders
);
SELECT MAX(OrderAmount) AS Second_Highest
FROM Orders
WHERE OrderAmount<
(
SELECT MAX(OrderAmount)
FROM Orders
);
SELECT RestaurantName,
       Rating
FROM Restaurants
ORDER BY Rating DESC
LIMIT 1;
SELECT C.City,
       SUM(O.OrderAmount) AS Revenue
FROM Customers C
JOIN Orders O
ON C.CustomerID=O.CustomerID
GROUP BY C.City
HAVING Revenue>2000;
SELECT C.CustomerName
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID=O.CustomerID
WHERE O.OrderID IS NULL;
SELECT R.RestaurantName
FROM Orders O
RIGHT JOIN Restaurants R
ON O.RestaurantID=R.RestaurantID
WHERE O.OrderID IS NULL;
SELECT
C.CustomerName,
R.RestaurantName,
R.Cuisine,
O.OrderAmount,
O.OrderStatus
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID=O.CustomerID
INNER JOIN Restaurants R
ON O.RestaurantID=R.RestaurantID;
SELECT
OrderID,
OrderAmount,
CASE
WHEN OrderAmount<500 THEN 'Budget'
WHEN OrderAmount BETWEEN 500 AND 800 THEN 'Medium'
ELSE 'Premium'
END AS Category
FROM Orders;
SELECT
C.CustomerName,
SUM(O.OrderAmount) AS Total_Spending,
RANK() OVER(ORDER BY SUM(O.OrderAmount) DESC) AS Ranking
FROM Customers C
JOIN Orders O
ON C.CustomerID=O.CustomerID
GROUP BY C.CustomerName;
SELECT
ROW_NUMBER() OVER(ORDER BY OrderAmount DESC) AS Serial_No,
OrderID,
OrderAmount
FROM Orders;
SELECT
R.RestaurantName,
SUM(O.OrderAmount) AS Revenue,
DENSE_RANK() OVER(ORDER BY SUM(O.OrderAmount) DESC) AS Ranking
FROM Restaurants R
JOIN Orders O
ON R.RestaurantID=O.RestaurantID
GROUP BY R.RestaurantName;
SELECT C.City,
SUM(O.OrderAmount) AS Revenue
FROM Customers C
JOIN Orders O
ON C.CustomerID=O.CustomerID
GROUP BY C.City
ORDER BY Revenue DESC
LIMIT 1;
SELECT C.City,
SUM(O.OrderAmount) AS Revenue
FROM Customers C
JOIN Orders O
ON C.CustomerID=O.CustomerID
GROUP BY C.City
ORDER BY Revenue DESC
LIMIT 1;
SELECT R.RestaurantName,
SUM(O.OrderAmount) AS Revenue
FROM Restaurants R
JOIN Orders O
ON R.RestaurantID=O.RestaurantID
GROUP BY R.RestaurantName
ORDER BY Revenue DESC
LIMIT 1;
