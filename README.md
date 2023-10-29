# Super Store Sales Analysis Project

**Project Overview**

This data analysis project provide insights infomation of sales performance and customer's behvaivior of a Super Store over the past year. By analysing various aspect of sales data, we can learn about the store's customers and we can identify shopping trends and provide data-driven recoomendation to the stakeholders. 

## Data Sources
1. Dowloand raw data from Kagle: Ecommerce.customer.csv file.
2. Created schema on MySQL and imported data into MySQL Workbench database.
   
## Tools
- Spreadsheet for data cleaning 
- MySQL Server for analysis
- Tableau for data visualization 

## Data Cleaning/ Preparation 

We inspect the raw data and perform the following cleaning processes:

1. Checking for null records. Go to Format--> Conditional Formatting--> Format rules--Format cell, select 'Cell is empty' and 'Text is exactly null', selecing Red and Green for background color respectively. This allows Google sheet to show us the empty sheet or row that specified as 'null' in the specified background colors in our data.
   
2. Adding filter to all columns, sort the columns you want by cell color. Remove the ones that shows in the colors,and ensure the data that you are removing is not useable in the analysis. Make sure to always save a copy of raw data. 

## Exploratory Data Analysis
Exploring the sales and customer's data to answer business questions, such as:
 - Which customer's demograhphic group are top buyers? 
 - Which products category are the top seller?
 - Did customers shop more online or visiting the physical store?
 - What is the most used payment method?
 - Who are the top spenders? (for promotional offers and outreach opportunity)

## Results/Findings
Analysis results are summarized as follows:
- We found our customers are in the age between 18 and 70. However, the top spenders are in senior prod=fessional group and age between 30 and 44 years told.
- Top spenders are in the senior profession group with the age group 
- PayPal was the most poppular payment method in the pasrt year which means most purchases were occured online.
- We found that clothing category products were the most popular and most sold.
- We found 50 top spenders that made a purchase $5000 or above in the past year and we see an oppourtinity to retain these top spenders or customers by offering personalized promotional sales campaign and rewards programe. 


## Recomendation 

Based on the analysis we recommed the following actions:

1. We recommend on expand in clothing product category options. Since this categry is the top product sellers, we see oppoutunity to explor varioty of new clothing style or vendors.
2. We recommend to lauch Cutomer Loyalty rewards program, creating rapport with top spender exisiting customers by offering personalized sales campaign and rewards programs. 
3. Per our analysis, it is clear that most customers prefer online shopping more than traditional shopping at a physical store. We recommend to re-desgin the company's store website to be more robust and user-friendly, easy for customer to make online purchase.

## Data Analysis
Using SQL to analyze data.

- Checking the whole table named'cx'

```sql
SELECT * FROM cx;
```
- Checking if the primary key column has any null records
  
```sql
SELECT count(Customer_ID)
FROM cx
WHERE Customer_ID IS NULL;
```

### Question 1 : What is the customers' demograpic? (i.e. age and gender)

```sql
SELECT
MIN(Customer_Age)AS Youngest,  MAX(Customer_Age) AS Oldest, AVG(Customer_Age) AS AverageCxAge
FROM cx;
```
 ![Screenshot 2023-10-26 at 8 15 59 PM](https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/94c0e19a-47c5-4e44-95eb-d1683281959a)

### Question 2 : Who are the top buyers? (i.e age group, professions and gender)

```sql

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
```
![Screenshot 2023-10-26 at 8 15 38 PM](https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/f6a80eb3-a286-4988-8c39-5d9d7c21393e)


### Question 3 : Do we have more male or female customers? 

```sql
SELECT Gender, count(Gender) AS Num_cx ,Count(Gender)*0.0005 AS Percentage
FROM cx
WHERE Gender = 'Female'
GROUP BY Gender
UNION
SELECT Gender, Count(Gender) AS Num_cx, Count(Gender)*0.0005 AS Percentage
FROM cx
WHERE Gender = 'Male'
GROUP BY Gender;
```
![Screenshot 2023-10-26 at 8 14 54 PM](https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/c3f267b4-7c07-4b0a-be1e-27945962d6d1)


### Question 4 : What is the most used payment method?

```sql
SELECT 
Payment_Method, 
count(Payment_Method) AS Most_Popular_Payment
FROM cx
GROUP BY Payment_Method
ORDER BY count(Payment_Method) DESC;
```
![Screenshot 2023-10-26 at 8 14 35 PM](https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/11563363-ad69-4576-96c2-342764af2d39)


### Question 5: What is the cheapest and the most expensive products in the store?

```sql
SELECT
distinct Product_Category,
MIN(Product_Price) AS Cheapest_Product,
MAX(Product_Price) AS Most_Expensive_Product,
AVG(Product_Price) AS Avergare_Product_Price
FROM cx
GROUP BY Product_Category
```
 ![Screenshot 2023-10-26 at 9 20 37 PM](https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/39aa2e86-e3f4-4d08-87aa-f642dc7e3a5c)


### Question 6 : What is the product catagory that made higest sales amount?

```sql
SELECT distinct Product_Category,SUM(Total_Purchase_Amount)AS Total_Purchase
FROM cx
GROUP BY Product_Category
ORDER BY SUM(Total_Purchase_Amount) DESC;
```
  ![Screenshot 2023-10-26 at 9 15 15 PM](https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/de4821aa-ea4e-4029-ae12-a4412036ae6f)

### Question 7 : What product category is the top seller? 

```sql
SELECT Product_Category, Count(*)
FROM cx
GROUP BY Product_Category
ORDER BY Count(*) DESC;
```
<img width="194" alt="Screenshot 2023-10-29 at 12 57 56 PM" src="https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/4d8671f9-a083-489a-867a-445a4ee2ab3a">


### Question 8 : Checking summary of purchase in general (min, max and averagre pricing)
```sql
SELECT MIN(Total_Purchase), MAX(Total_Purchase), AVG(Total_Purchase)
FROM cx;
```

### Question 9 : Find avergage sales and total sales amount per each year.

```sql
SELECT
'2020' AS Year, AVG(Total_Purchase) AS AverageSales, SUM(Total_Purchase) AS 'Totalsales'
FROM cx
WHERE Purchase_Date LIKE '%2020%'
UNION
SELECT
'2021' AS Year, AVG(Total_Purchase) AS AverageSales,SUM(Total_Purchase) AS 'Totalsales'
FROM cx
WHERE Purchase_Date LIKE '%2021%'
UNION
SELECT
'2022' AS Year, AVG(Total_Purchase) AS AverageSales,SUM(Total_Purchase) AS 'Totalsales'
FROM cx
WHERE Purchase_Date LIKE '%2022%'
UNION
SELECT
'2023' AS Year, AVG(Total_Purchase) AS AverageSales,SUM(Total_Purchase) AS 'Totalsales'
FROM cx
WHERE Purchase_Date LIKE '%2023%';
```
### Question 10: Find top 50 spenders.

```sql
WITH CTE_Spenders AS (
SELECT  Customer_ID, Customer_Name, MAX(Total_Purchase)
FROM cx
WHERE Purchase_Date Between '2022-01-01' AND '2022-12-31'
GROUP BY Customer_ID, Customer_Name
ORDER BY MAX(Total_Purchase) DESC
LIMIT 50)
SELECT * FROM CTE_Spenders;
```
<img width="342" alt="Screenshot 2023-10-29 at 1 21 30 PM" src="https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/67cc590e-49bb-44d6-839d-9431e7bd5f8f">


