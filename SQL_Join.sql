/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS product, c.Name AS category
FROM Products AS p JOIN Categories AS c
ON c.CategoryID = p.CategoryID
WHERE c.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating
 FROM products AS p
INNER JOIN reviews AS r
 ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, sum(s.Quantity) AS "Total"
FROM sales AS s
INNER JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS "Department Name", c.Name AS "Category Name" FROM departments AS d
INNER JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" or c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name, SUM(s.Quantity) AS "Total Amount Sold", SUM(s.Quantity * s.PricePerUnit) AS "Total Price" FROM sales AS s
 INNER JOIN products AS p
 ON s.ProductID = p.ProductID
 WHERE p.Name LIKE "%Hotel%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM reviews AS r
INNER JOIN products AS p 
ON r.ProductID = p.ProductID
WHERE p.Name LIKE "%Visio%" AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS "Product", s.Quantity AS "Total Quantity Sold" FROM sales AS s
INNER JOIN employees AS e 
ON s.EmployeeID = e.EmployeeID
INNER JOIN products AS p
ON s.ProductID = p.ProductID;
