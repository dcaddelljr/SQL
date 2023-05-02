/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS 'Product Name', c.Name AS 'Category Name'
FROM products AS p JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE p.CategoryID = '1';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.name, p.price, r.Rating
FROM products AS p LEFT JOIN reviews AS r
ON r.ProductID = p.ProductID
WHERE r.rating = '5';
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, e.EmployeeID, sum(s.Quantity) AS 'Total Quantity Sold'
FROM sales AS s JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY sum(s.Quantity) desc
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name AS 'Dept Name', c.name AS 'Category Name'
FROM categories AS c JOIN departments as d
ON c.DepartmentID = d.DepartmentID
WHERE c.categoryID = 2 OR c.categoryID = 8;

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) as 'Total Sold', SUM(s.Quantity * s.PricePerUnit) as 'Total Price'
FROM products AS p INNER JOIN sales AS s
on s.ProductID = p.ProductID
where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name AS 'Product Name', r.Reviewer, r.Rating, r.comment AS 'Comment'
FROM reviews AS r JOIN products AS p
ON p.ProductID = r.ProductID
Where p.name = "Visio TV" AND r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.name, SUM(s.Quantity)
FROM sales AS s JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
JOIN products AS p 
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY SUM(s.Quantity) DESC;













