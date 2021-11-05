-------------------------
-- Create Customers table
-------------------------
CREATE TABLE Customers
(
  cust_id      char(10)  NOT NULL ,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL 
);

--------------------------
-- Create OrderItems table
--------------------------
CREATE TABLE OrderItems
(
  order_num  int          NOT NULL ,
  order_item int          NOT NULL ,
  prod_id    char(10)     NOT NULL ,
  quantity   int          NOT NULL ,
  item_price decimal(8,2) NOT NULL 
);

----------------------
-- Create Orders table
----------------------
CREATE TABLE Orders
(
  order_num  int      NOT NULL ,
  order_date datetime NOT NULL ,
  cust_id    char(10) NOT NULL 
);

------------------------
-- Create Products table
------------------------
CREATE TABLE Products
(
  prod_id    char(10)      NOT NULL ,
  vend_id    char(10)      NOT NULL ,
  prod_name  char(255)     NOT NULL ,
  prod_price decimal(8,2)  NOT NULL ,
  prod_desc  varchar(1000) NULL 
);

-----------------------
-- Create Vendors table
-----------------------
CREATE TABLE Vendors
(
  vend_id      char(10) NOT NULL ,
  vend_name    char(50) NOT NULL ,
  vend_address char(50) NULL ,
  vend_city    char(50) NULL ,
  vend_state   char(5)  NULL ,
  vend_zip     char(10) NULL ,
  vend_country char(50) NULL 
);

----------------------
-- Define primary keys
----------------------
ALTER TABLE Customers WITH NOCHECK ADD CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED (cust_id);
ALTER TABLE OrderItems WITH NOCHECK ADD CONSTRAINT PK_OrderItems PRIMARY KEY CLUSTERED (order_num, order_item);
ALTER TABLE Orders WITH NOCHECK ADD CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (order_num);
ALTER TABLE Products WITH NOCHECK ADD CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (prod_id);
ALTER TABLE Vendors WITH NOCHECK ADD CONSTRAINT PK_Vendors PRIMARY KEY CLUSTERED (vend_id);

----------------------
-- Define foreign keys
----------------------
ALTER TABLE OrderItems ADD
CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (order_num) REFERENCES Orders (order_num),
CONSTRAINT FK_OrderItems_Products FOREIGN KEY (prod_id) REFERENCES Products (prod_id);
ALTER TABLE Orders ADD 
CONSTRAINT FK_Orders_Customers FOREIGN KEY (cust_id) REFERENCES Customers (cust_id);
ALTER TABLE Products ADD
CONSTRAINT FK_Products_Vendors FOREIGN KEY (vend_id) REFERENCES Vendors (vend_id);

---------------------------
-- Populate Customers table
---------------------------
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000001', 'Village Toys', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'John Smith', 'sales@villagetoys.com');
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES('1000000002', 'Kids Place', '333 South Lake Drive', 'Columbus', 'OH', '43333', 'USA', 'Michelle Green');
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000003', 'Fun4All', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'jjones@fun4all.com');
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000004', 'Fun4All', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Denise L. Stephens', 'dstephens@fun4all.com');
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES('1000000005', 'The Toy Store', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'Kim Howard');

-------------------------
-- Populate Vendors table
-------------------------
INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES('BRS01','Bears R Us','123 Main Street','Bear Town','MI','44444', 'USA');
INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES('BRE02','Bear Emporium','500 Park Street','Anytown','OH','44333', 'USA');
INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES('DLL01','Doll House Inc.','555 High Street','Dollsville','CA','99999', 'USA');
INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES('FRB01','Furball Inc.','1000 5th Avenue','New York','NY','11111', 'USA');
INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES('FNG01','Fun and Games','42 Galaxy Road','London', NULL,'N16 6PS', 'England');
INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES('JTS01','Jouets et ours','1 Rue Amusement','Paris', NULL,'45678', 'France');

--------------------------
-- Populate Products table
--------------------------
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('BR01', 'BRS01', '8 inch teddy bear', 5.99, '8 inch teddy bear, comes with cap and jacket');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('BR02', 'BRS01', '12 inch teddy bear', 8.99, '12 inch teddy bear, comes with cap and jacket');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('BR03', 'BRS01', '18 inch teddy bear', 11.99, '18 inch teddy bear, comes with cap and jacket');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('BNBG01', 'DLL01', 'Fish bean bag toy', 3.49, 'Fish bean bag toy, complete with bean bag worms with which to feed it');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('BNBG02', 'DLL01', 'Bird bean bag toy', 3.49, 'Bird bean bag toy, eggs are not included');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('BNBG03', 'DLL01', 'Rabbit bean bag toy', 3.49, 'Rabbit bean bag toy, comes with bean bag carrots');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('RGAN01', 'DLL01', 'Raggedy Ann', 4.99, '18 inch Raggedy Ann doll');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('RYL01', 'FNG01', 'King doll', 9.49, '12 inch king doll with royal garments and crown');
INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES('RYL02', 'FNG01', 'Queen doll', 9.49, '12 inch queen doll with royal garments and crown');

------------------------
-- Populate Orders table
------------------------
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20005, '2012-05-01', '1000000001');
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20006, '2012-01-12', '1000000003');
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20007, '2012-01-30', '1000000004');
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20008, '2012-02-03', '1000000005');
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20009, '2012-02-08', '1000000001');

----------------------------
-- Populate OrderItems table
----------------------------
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20005, 1, 'BR01', 100, 5.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20005, 2, 'BR03', 100, 10.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20006, 1, 'BR01', 20, 5.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20006, 2, 'BR02', 10, 8.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20006, 3, 'BR03', 10, 11.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20007, 1, 'BR03', 50, 11.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20007, 2, 'BNBG01', 100, 2.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20007, 3, 'BNBG02', 100, 2.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20007, 4, 'BNBG03', 100, 2.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20007, 5, 'RGAN01', 50, 4.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20008, 1, 'RGAN01', 5, 4.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20008, 2, 'BR03', 5, 11.99);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20008, 3, 'BNBG01', 10, 3.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20008, 4, 'BNBG02', 10, 3.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20008, 5, 'BNBG03', 10, 3.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20009, 1, 'BNBG01', 250, 2.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20009, 2, 'BNBG02', 250, 2.49);
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20009, 3, 'BNBG03', 250, 2.49);

------------------------------
-- LESSON 1: Understanding SQL
------------------------------

SELECT *
FROM Customers

SELECT *
FROM Vendors

SELECT *
FROM Products

SELECT *
FROM Orders

SELECT *
FROM OrderItems

----------------------------
-- LESSON 2: Retrieving Data
----------------------------

-- retrieve product names from products table
SELECT prod_name
FROM Products;

-- retrieve product id, product names, and product prices from products table
SELECT prod_id, prod_name, prod_price
FROM Products;

-- retrieve all columns from products table
SELECT *
FROM Products;

-- retrieve vendor ids from products table
SELECT vend_id
FROM Products;

-- retrieve distinct vendor ids from products table
SELECT DISTINCT vend_id
FROM Products;

-- retrieve top five rows of product names from products table
SELECT TOP 5 prod_name
FROM Products;

-- two comment syntax examples
/* This type of comment can span
multiple lines and is good for commenting out
lines of code */
SELECT prod_name	-- this is an inline comment
FROM Products;

/* SELECT prod_name
FROM Products; */

-- to comment out hightlighted lines: ctrl+k, ctrl+c
-- to uncomment highlighted lines: ctrl+k, ctrl+u

-----------------------------------
-- LESSON 3: Sorting Retrieved Data
-----------------------------------

-- retrieve product names from products table
SELECT prod_name
FROM Products;

-- retrieve product names from products table and order by product names
SELECT prod_name
FROM Products
ORDER BY prod_name;

-- retrieve product ids, product prices, and product names from products table and order by product price first and product name second
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price, prod_name;

-- alternative to above query
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY 2, 3; -- numbers corresponding to the columns after the SELECT clause

-- retrieve product ids, product prices,  and product names from products table and order by product price in descending order
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC;

-- same as the above query, but sorting by product names second in ascending order
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC, prod_name;

---------------------------
-- LESSON 4: Filtering Data
---------------------------

-- retrieve product names and product prices from products table where product price is equal to 3.49
SELECT prod_name, prod_price
FROM Products
WHERE prod_price = 3.49;

-- retrieve product names and product prices from products table where product price is less than 10
SELECT prod_name, prod_price
FROM Products
WHERE prod_price < 10;

-- retrieve product names and product prices from products table where product price is less than or equal to 10
SELECT prod_name, prod_price
FROM Products
WHERE prod_price <= 10;

-- retrieve vendor ids and product names from products table where vendor id is not equal to DLL01
SELECT vend_id, prod_name
FROM Products
WHERE vend_id <> 'DLL01';

-- alternative to above query
SELECT vend_id, prod_name
FROM Products
WHERE vend_id != 'DLL01';

-- retrieve product names and product prices from products table where product prices are between 5 and 10
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10;

-- retrieve product names from products table where product prices are null (returns nothing)
SELECT prod_name
FROM Products
WHERE prod_price IS NULL;

-- retrieve customer names from customers table where customer emails are null
SELECT cust_name
FROM Customers
WHERE cust_email IS NULL;

------------------------------------
-- LESSON 5: Advanced Data Filtering
------------------------------------

-- retrieve product ids, product prices, and product names from products table where vendor ids are DLL01 and product prices are less than 4
SELECT prod_id, prod_price, prod_name
FROM Products
WHERE vend_id = 'DLL01' AND prod_price <= 4;

-- retrieve product names and product prices from products table where vendor ids are DLL01 or BRS01
SELECT prod_name, prod_price
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';

-- retrieve product names and product prices from products table where vendor ids are DLL01 or (vendor ids are BRS01 and product prices are greater than or equal to 10)
SELECT  prod_name, prod_price
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01'
	AND prod_price >= 10;

-- retrieve product names and product prices from Products table where (vendor ids are DLL01 or BRS01) and product prices are greater than or equal to 10
SELECT prod_name, prod_price
FROM Products
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01')
	AND prod_price >= 10;

-- retrieve product names and product prices from products table where vendor ids are DLL01 and BRS01 and ordered by product names
SELECT prod_name, prod_price
FROM Products
WHERE vend_id IN ('DLL01', 'BRS01')
ORDER BY prod_name;

-- alternative to above query
SELECT prod_name, prod_price
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01'
ORDER BY prod_name;

-- retrieves product names from products table where vendor ids are not DLL01 and ordered by product names
SELECT prod_name
FROM Products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;

-- alternative to above query
SELECT prod_name
FROM Products
WHERE vend_id <> 'DLL01'
ORDER BY prod_name;

-------------------------------------
-- LESSON 6: Using Wildcard Filtering
-------------------------------------

-- retrieve product ids and product names from products table where product names start with "fish"
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE 'Fish%';

-- retrieve product ids and product names from products table where product names contains "bean bag"
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '%bean bag%';

-- retrieve product names from products table where product names start with an "F" and end in a "y"
SELECT prod_name
FROM Products
WHERE prod_name LIKE 'F%y';

-- retrieve product ids and product names from products table where product names contain two unknown values followed by " inch teddy bear"
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '__ inch teddy bear';

-- retrieve product ids and product names from products table where product names end with " inch teddy bear"
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '% inch teddy bear';

-- retrieve customer contacts from customers table where customer contacts start with either "J" or "M" and ordered by customer contacts
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[JM]%'
ORDER BY cust_contact;

-- retrieve customer contacts from customers table where customer contact does not begin with either "J" or "M" and ordered by customer contacts
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[^JM]%'
ORDER BY cust_contact;

-- alternative to above query
SELECT cust_contact
FROM Customers
WHERE NOT cust_contact LIKE '[JM]%'
ORDER BY cust_contact;

---------------------------------------
-- LESSON 7: Creating Calculated Fields
---------------------------------------

-- retrieve concatenation of vendor names and vendor countries (with parentheses) from vendors table and ordered by vendor names
SELECT vend_name + ' (' + vend_country + ')'
FROM Vendors
ORDER BY vend_name;

-- same as above query except with spaces (to the right) trimmed
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')'
FROM Vendors
ORDER BY vend_name;

-- same as above query except with alias
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors
ORDER BY vend_name;

-- retrieve product ids, quantities, and item prices from order items table where order numbers are 20008
SELECT prod_id, quantity, item_price
FROM OrderItems
WHERE order_num = 20008;

-- as as above query except with expanded price column
SELECT prod_id, quantity, item_price, quantity*item_price AS expanded_price
FROM OrderItems
WHERE order_num = 20008;

----------------------------------------------
-- LESSON 8: Using Data Manipulation Functions
----------------------------------------------

-- retrieve vendor names and uppercase versions of vendor names from vendors table and ordered by vendor names
SELECT vend_name, UPPER(vend_name) AS vend_name_upcase
FROM Vendors
ORDER BY vend_name;

-- retrieve customer names and customer contacts from customers table where customer contacts is "Michael Green" (no result, because type on entry)
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_contact = 'Michael Green';

-- same as above query except search for customer contacts that sound like "Michael Green"
SELECT cust_name, cust_contact
FROM Customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

-- retrieve order numbers from orders table where the year is 2012
SELECT order_num
FROM Orders
WHERE DATEPART(yy, order_date) = 2012;

-----------------------------
-- LESSON 9: Summarizing Data
-----------------------------

-- retrieve the average product price from products table
SELECT AVG(prod_price) AS avg_price
FROM Products;

-- retrieve the average product price from products table for vendor id 'DLL01'
SELECT AVG(prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';

-- retrieve count of number of rows in customers table including NULL values
SELECT COUNT(*) AS num_cust
FROM Customers;

-- retrieve count of number of customer emails in customers table excluding NULL values
SELECT COUNT(cust_email) AS num_emails
FROM Customers;

-- retrieve maximum product price from products table
SELECT MAX(prod_price) AS max_price
FROM Products;

-- retrieve minimum product price from products table
SELECT MIN(prod_price) AS min_price
FROM Products;

-- retrieve total number of items ordered from orderitems table where order number is 20005
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE order_num = 20005;

-- retrieve total price from orderitems table for order number 20005
SELECT SUM(item_price*quantity) AS total_price
FROM OrderItems
WHERE order_num = 20005;

-- retrieve average of unique product prices from products table where vendor id is 'DLL01'
SELECT AVG(DISTINCT prod_price) AS avg_unique_price
FROM Products
WHERE vend_id = 'DLL01';

-- retrieve number of items, minimum price, maximum price, and average price from products table
SELECT COUNT(*) AS num_items,
	MIN(prod_price) AS min_price,
	MAX(prod_price) AS max_price,
	AVG(prod_price) AS avg_price
FROM Products;

---------------------------
-- LESSON 10: Grouping Data
---------------------------

-- retrieve number of products from products table where vendor id is DLL01
SELECT COUNT(*) AS num_prod
FROM Products
WHERE vend_id = 'DLL01';

-- retrieve vendor ids and the number of products from each from products table
SELECT vend_id, COUNT(*) AS num_prod
FROM Products
GROUP BY vend_id;

-- HAVING is for group filtering, WHERE is for individual row filtering (WHERE before GROUP BY / HAVING after GROUP BY)
-- cannot use aliases with these

-- retrieve customer ids and the number of orders from orders table which have at least 2 orders
SELECT cust_id, COUNT(*) AS num_orders
FROM Orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

-- retrieve vendor ids their number of products for products with a price of at least 4 and vendors with at least 2 products
SELECT vend_id, COUNT(*) AS num_prod
FROM Products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-- same as the query above except without the where clause
SELECT vend_id, COUNT(*) AS num_prod
FROM Products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-- retrieve order numbers the number of items in the order from orderitems table if the number of items is at least 3
SELECT order_num, COUNT(*) AS num_items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3;

-- same as above query except ordered by number of items and then order number
SELECT order_num, COUNT(*) AS num_items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY num_items, order_num;

-------------------------------------
-- LESSON 11: Working with Subqueries
-------------------------------------

-- retrieve order numbers from orderitems table where the product ids are 'RGAN01'
SELECT order_num
FROM OrderItems
WHERE prod_id = 'RGAN01';

-- retriever customer ids from orders table where the order numbers are 20007 or 20008
SELECT cust_id
FROM Orders
WHERE order_num IN (20007, 20008);

-- combine the previous two queries
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num
					FROM OrderItems
					WHERE prod_id = 'RGAN01');

-- retrieve customer names and customer contacts from customers table who have customer ids 1000000004 or 1000000005
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (1000000004, 1000000005);

-- create a subquery using the two previous queries
-- this subquery returns customer names and customer contacts who ordered products with product id 'RGAN01'
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
				  FROM Orders
				  WHERE order_num IN (SELECT order_num
									  FROM OrderItems
									  WHERE prod_id = 'RGAN01'));

-- retrieve number of orders from orders table where customer id is 1000000001
SELECT COUNT(*) AS num_orders
FROM Orders
WHERE cust_id = 1000000001;

-- retrieve customer names, customer states, and number of orders per customer from orders and customers tables and order by customer names
SELECT cust_name,
	   cust_state,
	   (SELECT COUNT(*)
	   FROM Orders
	   WHERE Orders.cust_id = Customers.cust_id) AS num_orders
FROM Customers
ORDER BY cust_name;

-- same as above except the WHERE clause in the subquery does not specify the table, causing an incorrect result
SELECT cust_name,
	   cust_state,
	   (SELECT COUNT(*)
	   FROM Orders
	   WHERE cust_id = cust_id) AS num_orders
FROM Customers
ORDER BY cust_name;

----------------------------
-- LESSON 12: Joining Tables
----------------------------

-- retrieve vendor names, product names, and product prices from vendors and products tables
-- equijoin: based on testing equality between two tables (also an inner join)
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products
WHERE Vendors.vend_id = Products.vend_id;

-- same as above query except without the WHERE clause (returned table doesn't make sense)
-- cross join (or Cartesian product): returns a table with length equal to the number of rows in each table multiplied
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products;

-- same as the first query
-- (explicit) inner join
SELECT vend_name, prod_name, prod_price
FROM Vendors INNER JOIN Products
	ON Vendors.vend_id = Products.vend_id;

-- retrieve product names, vendor names, product prices, and quantity from orderitems, products, and vendors tables for order number 20007
SELECT prod_name, vend_name, prod_price, quantity
FROM OrderItems, Products, Vendors
WHERE Products.vend_id = Vendors.vend_id
	AND OrderItems.prod_id = Products.prod_id
	AND order_num = 20007;

-- previous subquery from LESSON 11
-- this subquery returns customer names and customer contacts who ordered products with product id 'RGAN01'
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
				  FROM Orders
				  WHERE order_num IN (SELECT order_num
									  FROM OrderItems
									  WHERE prod_id = 'RGAN01'));

-- alternative to above query
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
	AND Orders.order_num = OrderItems.order_num
	AND prod_id = 'RGAN01';

-------------------------------------
-- LESSON 13: Creating Advanced Joins
-------------------------------------

-- LESSON 7 query
-- retrieve concatenated vendor name and vendor country from vendors table and order by vendor name
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors
ORDER BY vend_name;

-- retrieve customer name and customer contact from customers, orders, and orderitems tables who ordered product id 'RGAN01'
SELECT cust_name, cust_contact
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
	AND O.order_num = OI.order_num
	AND prod_id = 'RGAN01';

-- retrieve customer ids, customer names, and customer contacts from customers table where customer name is the same as the customer name for customer contact 'Jim Jones'
SELECT cust_id, cust_name, cust_contact
FROM Customers
WHERE cust_name = (SELECT cust_name
				   FROM Customers
				   WHERE cust_contact = 'Jim Jones');

-- alternative to the above query (using a self join)
SELECT C1.cust_id, C1.cust_name, C1.cust_contact
FROM Customers AS C1, Customers AS C2
WHERE C1.cust_name = C2.cust_name
	AND C2.cust_contact = 'Jim Jones';

-- retrieve all columns from the customers table, order numbers, and order dates from orders and orderitems tables for customers who ordered product id 'RGAN01'
-- natural join (all previous inner joins have also been natural joins)
-- standard joins return all data including multiple occurances of the same column
-- natural joins eliminate multiple occurances (in practice, most inner joins will be natural)
SELECT C.*, O.order_num, O.order_date
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
	AND O.order_num = OI.order_num
	AND OI.prod_id = 'RGAN01';

-- retrieve customer ids and order numbers from customers and orders tables (inner join)
SELECT Customers.cust_id, Orders.order_num
FROM Customers INNER JOIN Orders
	ON Customers.cust_id = Orders.cust_id;

-- same as above query except LEFT OUTER JOIN (includes all of left table (Customers))
SELECT Customers.cust_id, Orders.order_num
FROM Customers LEFT OUTER JOIN Orders
	ON Customers.cust_id = Orders.cust_id;

-- same as above query except RIGHT OUTER JOIN (includes all of right table (Orders))
SELECT Customers.cust_id, Orders.order_num
FROM Customers RIGHT OUTER JOIN Orders
	ON Customers.cust_id = Orders.cust_id;

-- same as above query except FULL OUTER JOIN (includes all of both tables)
SELECT Customers.cust_id, Orders.order_num
FROM Customers FULL OUTER JOIN Orders
	ON Customers.cust_id = Orders.cust_id;

-- retrieve customer ids and number of orders from customers and orders tables and group by customer id
SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_orders
FROM Customers INNER JOIN Orders
	ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

-- same as above query except LEFT OUTER JOIN
SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_orders
FROM Customers LEFT OUTER JOIN Orders
	ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

-------------------------------
-- LESSON 14: Combining Queries
-------------------------------

-- retrieve customer names, customer contacts, and customer emails from customers table where the customer state is either IL IN or MI
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI');

-- retrieve customer names, customer contacts, and customer emails from customers table where the customer name is 'Fun4All'
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

-- combine the previous two queries using UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

-- alternative to above query (using multiple WHERE clauses)
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
	OR cust_name = 'Fun4All';

-- same as previous UNION query except use UNION ALL (to return duplicate rows)
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

-- same as previous UNION query except with an ORDER BY clause (note: only one ORDER BY is legal and must be at the end of the last SELECT statement)
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;

----------------------------
-- LESSON 15: Inserting Data
----------------------------

-- insert a row into customers table (avoid this method)
INSERT INTO Customers
VALUES('1000000006',
	   'Toy Land',
	   '123 Any Street',
	   'New York',
	   'NY',
	   '11111',
	   'USA',
	   NULL,
	   NULL);

-- alternative to above (use this method instead to ensure column order)
INSERT INTO Customers(cust_id,
					  cust_name,
					  cust_address,
					  cust_city,
					  cust_state,
					  cust_zip,
					  cust_country,
					  cust_contact,
					  cust_email)
VALUES('1000000006',
	   'Toy Land',
	   '123 Any Street',
	   'New York',
	   'NY',
	   '11111',
	   'USA',
	   NULL,
	   NULL);

-- alternative to above (different column order and different entry order, but still works as intended)
INSERT INTO Customers(cust_id,
					  cust_contact,
					  cust_email,
					  cust_name,
					  cust_address,
					  cust_city,
					  cust_state,
					  cust_zip,
					  cust_country)
VALUES('1000000006',
	   NULL,
	   NULL,
	   'Toy Land',
	   '123 Any Street',
	   'New York',
	   'NY',
	   '11111',
	   'USA');

-- alternative to above (inserting partial rows)
INSERT INTO Customers(cust_id,
					  cust_name,
					  cust_address,
					  cust_city,
					  cust_state,
					  cust_zip,
					  cust_country)
VALUES('1000000006',
	   'Toy Land',
	   '123 Any Street',
	   'New York',
	   'NY',
	   '11111',
	   'USA');

-- INSERT SELECT to use a SELECT statement instead of manually entering rows (table used in SELECT does not exist)
INSERT INTO Customers(cust_id,
					  cust_name,
					  cust_address,
					  cust_city,
					  cust_state,
					  cust_zip,
					  cust_country,
					  cust_contact,
					  cust_email)
SELECT cust_id,
	   cust_contact,
	   cust_email,
	   cust_name,
	   cust_address,
	   cust_city,
	   cust_state,
	   cust_zip,
	   cust_country
FROM CustNew;

-- INSERT SELECT can be thought as importing
-- SELECT INTO can be thought of as exporting (good for making copies for SQL query experimentation)

-- SELECT INTO all rows from customers table into custcopy table
SELECT *
INTO CustCopy
FROM Customers;

-- view the new table
SELECT *
FROM CustCopy;

----------------------------------------
-- LESSON 16: Updating and Deleting Data
----------------------------------------

-- update customer email for customer id 1000000005 to kim@thetoystore.com in customers table
UPDATE Customers
SET cust_email = 'kim@thetoystore.com'
WHERE cust_id = '1000000005';

-- update customer contact with Sam Roberts and customer email with sam@toyland.com for customer id 1000000006 in customers table
UPDATE Customers
SET cust_contact = 'Sam Roberts',
	cust_email = 'sam@toyland.com'
WHERE cust_id = '1000000006';

-- delete customer email for customer id 1000000005 in customers table
UPDATE Customers
SET cust_email = NULL
WHERE cust_id = '1000000005';

-- delete row from customers tables where customer id is 1000000006
DELETE FROM Customers
WHERE cust_id = '1000000006';

----------------------------------------------
-- LESSON 17: Creating and Manipulating Tables
----------------------------------------------

-- create products table with five columns
CREATE TABLE Products -- table name
(
	prod_id			CHAR(10)		NOT NULL, -- column name	datatype	NOT NULL means cannot be NULL	CHAR(10) means fixed length string of 10 characters
	vend_id			CHAR(10)		NOT NULL,
	prod_name		CHAR(254)		NOT NULL, -- CHAR(254) means fixed length string of 254 characters
	prod_price		DECIMAL(8,2)	NOT NULL, -- DECIMAL(8,2) means fixed length numeric value of 8 digits and a precision to the thousandth place
	prod_desc		VARCHAR(1000)	NULL -- can be NULL		VARCHAR(1000) means "variable length text" of 1000 characters max
);

-- create orders table with three columns (this table requires all new rows to have values for each column due to NOT NULL)
CREATE TABLE Orders
(
	order_num		INTEGER			NOT NULL, -- INTEGER means 4 byte integer from -2147483648 to 2147483647
	order_date		DATETIME		NOT NULL, -- DATETIME means date and time is stored
	cust_id			CHAR(10)		NOT NULL,
);

-- create vendors table where vendor id and vendor name is required and the rest are not required (NULL is default)
CREATE TABLE Vendors
(
	vend_id			CHAR(10)		NOT NULL,
	vend_name		CHAR(50)		NOT NULL,
	vend_address	CHAR(50)		,
	vend_city		CHAR(50)		,
	vend_state		CHAR(5)			,
	vend_zip		CHAR(10)		,
	vend_country	CHAR(50)
);

-- create orderitems table where quantity is 1 if no value is entered
CREATE TABLE OrderItems
(
	order_num		INTEGER			NOT NULL,
	order_item		INTEGER			NOT NULL,
	prod_id			CHAR(10)		NOT NULL,
	quantity		INTEGER			NOT NULL		DEFAULT 1,
	item_price		DECIMAL(8,2)	NOT NULL
);

-- alter table vendors by adding vendor phone number with a 20 character string limit
ALTER TABLE Vendors
ADD vend_phone CHAR(20);

-- alter table vendors by removing vendor phone number
ALTER TABLE Vendors
DROP COLUMN vend_phone;

-- delete table custcopy
DROP TABLE CustCopy;

-------------------------
-- LESSON 18: Using Views
-------------------------

-- query from LESSON 12
-- retrieve customer names and customer contacts from customers, orders, and orderitems tables where the customers ordered product id RGAN01
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
	AND Orders.order_num = OrderItems.order_num
	AND prod_id = 'RGAN01';

-- create a view to hide all but the last WHERE clause condition in the above query (the table is not stored--the query executes every time the view is called)
CREATE VIEW ProductCustomers AS
SELECT cust_name, cust_contact, prod_id
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
	AND Orders.order_num = OrderItems.order_num

-- use the above view to recreate the first query
SELECT cust_name, cust_contact
FROM ProductCustomers
WHERE prod_id = 'RGAN01';

-- query from LESSON 7
-- retrieve concatenated vendor name and vendor country from vendors table and order by vendor names
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors
ORDER BY vend_name;

-- create a view from the previous query
CREATE VIEW VendorLocations AS
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors;

-- use the above view
SELECT *
FROM VendorLocations;

-- create view that returns customer ids, customer names, and customer emails from customers table where the customer email exists
CREATE VIEW CustomerEMailList AS
SELECT cust_id, cust_name, cust_email
FROM Customers
WHERE cust_email IS NOT NULL;

-- use the above view
SELECT *
FROM CustomerEMailList;

-- query from LESSON 7
-- retrieve product ids, quantities, item prices, and expanded prices from orderitems table for order number 20008
SELECT prod_id, quantity, item_price, quantity*item_price AS expanded_price
FROM OrderItems
WHERE order_num = 20008;

-- create a view from the previous query
CREATE VIEW OrderItemsExpanded AS
SELECT order_num, prod_id, quantity, item_price, quantity*item_price AS expanded_price
FROM OrderItems;

-- use above view to recreate previous query
SELECT *
FROM OrderItemsExpanded
WHERE order_num = 20008;

-- common uses of views: 1. simplify complex joins, 2. reformat retrieved data, 3. filter unwanted data, 4. calculated fields

--------------------------------------------
-- LESSON 19: Working with Stored Procedures
--------------------------------------------

-- execute stored procedure to add a new product to the products table (stored procedure does not exist)
-- validates passed data, generates unique product ID (primary key), inserts data
EXECUTE AddNewProduct('JTS01',
					  'Stuffed Eiffel Tower',
					  6.49,
					  'Plush sutffed toy with the text La Tour Eiffel in red white and blue');

-- create a stored procedure to count the number of customers with an email
CREATE PROCEDURE MailingListCount
AS
DECLARE @cnt INTEGER -- creates a local variable using @
SELECT @cnt = COUNT(*) -- local variable contains value returned by count
FROM Customers 
WHERE NOT cust_email IS NULL;
RETURN @cnt -- return the count

-- invoke stored procedure
DECLARE @ReturnValue INT -- declares a variable to hold stored procedure return
EXECUTE @ReturnValue=MailingListCount;
SELECT @ReturnValue;

-- create a stored procedure to add a new order
CREATE PROCEDURE NewOrder @cust_id CHAR(10)
AS
DECLARE @order_num INTEGER -- declare variable for order number
SELECT @order_num=MAX(order_num) -- get current highest order number
FROM Orders
SELECT @order_num=@order_num+1 -- determine next order number
INSERT INTO Orders(order_num, order_date, cust_id) -- insert new order
VALUES(@order_num, GETDATE(), @cust_id)
RETURN @order_num; -- return order number

-- alternative to above stored procedure
CREATE PROCEDURE NewOrder2 @cust_id CHAR(10)
AS
INSERT INTO Orders(cust_id) -- insert new order
VALUES(@cust_id)
SELECT order_num = @@IDENTITY; -- return order number

---------------------------------------------
-- LESSON 20: Managing Transaction Processing
---------------------------------------------

-- define beginning and end of a transaction block
BEGIN TRANSACTION
-- transaction code here
COMMIT TRANSACTION

-- roll back (undo) SQL statements
DELETE FROM Orders;
ROLLBACK;

-- example of an (explicit) commit (sometimes SQL statements are executed and written directly to the table without COMMIT which is an implicit commit)
-- the entire code must execute successfully or else no changes are made
BEGIN TRANSACTION
DELETE OrderItems WHERE order_num = 12345
DELETE Orders WHERE order_num = 12345
COMMIT TRANSACTION

-- for partial transactions for when a complete rollback or commit is unwanted, savepoints are used
SAVE TRANSACTION delete1;

-- rollback transaction
ROLLBACK TRANSACTION delete1;

-- complete code example using everything from this lesson
-- create a transaction that inserts a new customer into customers table, inserts a new order into orders table, inserts new order items into orderitems table
-- create a savepoint after the new customer has been inserted into the customers table
-- if any error occurs during any subsequent insertion then revert back to this savepoint
BEGIN TRANSACTION
INSERT INTO Customers(cust_id, cust_name)
VALUES('100000010', 'Toys Emporium');
SAVE TRANSACTION StartOrder; -- savepoint which is rolled back to if any subsequent error occurs
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20100, '2001/12/1', '1000000010');
IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOrder; -- if @ERROR doesn't equal 0 then an error has occured
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20100, 1, 'BR01', 100, 5.49);
IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOver;
INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES(20100, 2, 'BR03', 100, 10.99);
IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOver;
COMMIT TRANSACTION -- iif all inserts were successful then commit

---------------------------
-- LESSON 21: Using Cursors
---------------------------

-- create a cursor that retrieves all customers without email addresses
DECLARE CustCursor CURSOR
FOR
SELECT * FROM Customers
WHERE cust_email IS NULL

-- open the cursor
OPEN CustCursor

-- close the cursor
CLOSE CustCursor

-- use a cursor to fetch rows from from the customers table where a customer email is not entered
DECLARE @cust_id CHAR(10),
		@cust_name CHAR(50),
		@cust_address CHAR(50),
		@cust_city CHAR(50),
		@cust_state CHAR(5),
		@cust_zip CHAR(10),
		@cust_country CHAR(50),
		@cust_contact CHAR(50),
		@cust_email CHAR(225)
OPEN CustCursor 
FETCH NEXT FROM CustCursor -- retrieves first row
	INTO @cust_id, @cust_name, @cust_address, @cust_city, @cust_state, @cust_zip, @cust_country, @cust_contact, @cust_email -- saves fetched row variables into local variables
	-- enter code here to complete with local variables
WHILE @@FETCH_STATUS = 0 -- when no more rows to be fetched terminate process/exit the loop
BEGIN
FETCH NEXT FROM CustCursor
	INTO @cust_id, @cust_name, @cust_address, @cust_city, @cust_state, @cust_zip, @cust_country, @cust_contact, @cust_email
END
CLOSE CustCursor

-------------------------------------------------
-- LESSON 22: Understanding Advanced SQL Features
-------------------------------------------------

-- create vendors table where vendor id is the primary key
CREATE TABLE Vendors
(
	vend_id			CHAR(10)		NOT NULL PRIMARY KEY, -- primary key is known as a constraint
	vend_name		CHAR(50)		NOT NULL,
	vend_address	CHAR(50)		NULL,
	vend_city		CHAR(50)		NULL,
	vend_state		CHAR(5)			NULL,
	vend_zip		CHAR(10)		NULL,
	vend_country	CHAR(50)		NULL
);

-- alternative to above table creation if table is already created
ALTER TABLE Vendors
ADD PRIMARY KEY (vend_id);

-- create orders table where customer id references a foreign key (customer id in customers table)
CREATE TABLE Orders
(
	order_num		INTEGER			NOT NULL PRIMARY KEY,
	order_date		DATETIME		NOT NULL,
	cust_id			CHAR(10)		NOT NULL REFERENCES Customers(cust_id) -- any customer id in orders table must already be a customer id in customers table
);

-- alternative to above table creation if table is already created
ALTER TABLE Orders
ADD
FOREIGN KEY (cust_id) REFERENCES Customers (cust_id) -- foreign keys are also known as a constraint

-- foreign keys help with referential integrity and to help prevent accidental deletions
-- UNIQUE can create a unique constraint (ensuring that every entry in a column is unique which could be used for social security numbers as an example)

-- create orderitems table with a check constraint that ensures quantity is greater than zero
CREATE TABLE OrderItems
(
	order_num		INTEGER			NOT NULL,
	order_itme		INTEGER			NOT NULL,
	prod_id			CHAR(10)		NOT NULL,
	quantity		INTEGER			NOT NULL CHECK (quantity > 0),
	item_price		MONEY			NOT NULL
);

-- to add a check constraint to an existing table (Persons) to ensure that the only allowable genders are "M" and "F"
ALTER TABLE Persons
ADD CHECK (Gender LIKE '[MF]')

-- create an index for the product names of the products table
-- improves sorting for columns that are frequently sorted by storing a sorted version of the column
CREATE INDEX prod_name_ind
ON Products (prod_name);

-- create a trigger that triggers on an insert update of the customers table that ensures the newly inserted customer state is capitalized
-- can be done on INSERT, UPDATE, or DELETE operations
CREATE TRIGGER customer_state
ON Customers
FOR INSERT, UPDATE
AS
UPDATE Customers
SET cust_state = UPPER(cust_state)
WHERE Customers.cust_id = inserted.cust_id;

-- use GRANT and REVOKE for database security purposes
