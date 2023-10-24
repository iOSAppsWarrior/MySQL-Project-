/* My SQL Project*/

-- Created schema and imported data into MySQL Workbench database. 
-- Data source: Kagle: Ecommerce.customer.csv file

-- Lookig at all information in the cx table
SELECT * FROM cx;

-- Q.1 What is the customers' demograpic? (i.e. age and gender)
-- 1.1 Customers'age
SELECT
MIN(Customer_Age)AS Youngest,  MAX(Customer_Age) AS Oldest, AVG(Customer_Age) AS AverageCxAge
FROM cx;

-- What customes' professional target group made the most purchase? 
SELECT
Gender, Count(Customer_Age) AS Total_num_of, 'Students' AS Customers_Profession
FROM cx
WHERE Customer_Age BETWEEN 18 AND 22
GROUP BY Gender
UNION
SELECT
Gender, Count(Customer_Age) AS Total_num_of, 'Junior Profession' AS Customers_Profession
FROM cx
WHERE Customer_Age BETWEEN 22 AND 40
GROUP BY Gender
UNION
SELECT
Gender, Count(Customer_Age) AS Total_num_of, 'Senior Profession' AS Customers_Profession
FROM cx
WHERE Customer_Age BETWEEN 41 AND 55
GROUP BY Gender
UNION
SELECT
Gender, Count(Customer_Age) AS Total_num_of, 'Retire' AS Customers_Profession
FROM cx
WHERE Customer_Age BETWEEN 56 AND 80
GROUP BY Gender;

-- Do we have more male or female customers? 

SELECT Gender, count(Gender) AS Num_cx ,Count(Gender)*0.0005 AS Percentage
FROM cx
WHERE Gender = 'Female'
GROUP BY Gender
UNION
SELECT Gender, Count(Gender) AS Num_cx, Count(Gender)*0.0005 AS Percentage
FROM cx
WHERE Gender = 'Male'
GROUP BY Gender;


-- What is the most used payment method?

SELECT 
Payment_Method, 
count(Payment_Method) AS Most_Popular_Payment
FROM cx
GROUP BY Payment_Method
ORDER BY count(Payment_Method) DESC;


-- What is the most popular item? 
SELECT distinct Product_Category,SUM(Total_Purchase_Amount)AS Total_Purchase
FROM cx
GROUP BY Product_Category
ORDER BY SUM(Total_Purchase_Amount) DESC;



-- What is the cheaoest and the most expensive products in the store?
SELECT
distinct Product_Category,
MIN(Product_Price) AS Cheapest_Product,
MAX(Product_Price) AS Most_Expensive_Product,
AVG(Product_Price) AS Avergare_Product_Price
FROM cx
GROUP BY Product_Category

-- Looking at Products' return

SELECT * Count(Returns)
FROM cx;



-- When is the time cx make purchase the most? Which months or which seasons? 

