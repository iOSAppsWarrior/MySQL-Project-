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
 - What is the top seller product catagory?
 - What are the peask sales period? 

## Results/Findings
Analysis results are summarized as follows:
- We found that the youngest customer's age is 18, oldest customer's age is 70 and avergare of customers' age is 43.8 ~ 44 years old.
- Top spenders are in the senior profession group with the age group 
- PayPal was the most poppular payment method in the pasrt year which means most purchases were occured online.
- We found that products in Home category is the most popular and most purchased.



## Recomendation 
Based on the analysis we recommed the following actions:
- 
-
-

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


### Question 6 : What is the most popular item? 

```sql
SELECT distinct Product_Category,SUM(Total_Purchase_Amount)AS Total_Purchase
FROM cx
GROUP BY Product_Category
ORDER BY SUM(Total_Purchase_Amount) DESC;
```
  ![Screenshot 2023-10-26 at 9 15 15 PM](https://github.com/iOSAppsWarrior/MySQL-Project-/assets/113806109/de4821aa-ea4e-4029-ae12-a4412036ae6f)

### Question 7 : Checking summary of purchase in general (min, max and averagre pricing)
```sql
SELECT MIN(Total_Purchase), MAX(Total_Purchase), AVG(Total_Purchase)
FROM cx;
```



### Question 7 : When is the peask sales period? 


