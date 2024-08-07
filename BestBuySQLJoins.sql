SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM reviews;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name as ProductName, categories.Name as CategoryName
 FROM products
 INNER JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE categories.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
 FROM products
 INNER JOIN reviews on products.ProductID = reviews.ProductID
 WHERE Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS TotalSold
FROM employees
INNER JOIN sales on employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName
ORDER BY TotalSold desc
limit 1;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS DepartmentsName, categories.Name AS CategoryName
FROM departments
INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name IN ("Appliances", "Games");
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name AS ProductName, SUM(sales.Quantity) AS TotalSold, SUM(sales.Quantity * sales.PricePerUnit) AS TotalPriceSold
FROM products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name LIKE "%Hotel California%"
GROUP BY products.Name;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name AS ProductName, reviews.Reviewer AS ReviewerName, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%Visio TV%"
ORDER BY reviews.Rating ASC
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name AS ProductName, SUM(sales.Quantity) AS QuantitySold
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName, products.Name
ORDER BY employees.EmployeeID, products.Name;
