-- Q1 and 2  You are required to create tables for a supplier,customer, category, product,supplier_pricing,order, rating to 
-- store the data for the E-commerce with the schema definition given below.

Create Database if not exists `Ecommerse_Web` ;
use `Ecommerse_Web`;

create table category(
	cat_id int(15) not null,
	cat_name varchar(20) not null,
	primary key (cat_id));

create table product(
	pro_id int(5) primary key,
	pro_name varchar(15) not null,
	pro_desc varchar(50) default null,
	cat_id int(5),
	foreign key(cat_id) references category(cat_id));

create table supplier(
	supp_id int(5) primary key,
	supp_name varchar(15) not null,
	supp_city varchar(15) not null,
	supp_phone varchar(10) not null);

create table supplier_pricing(
	pricing_id int(5) primary key,
	pro_id int(5) not null,
	supp_id int(5) not null,
	supp_price int(5) default 0,
	foreign key(pro_id) references product(pro_id),
	foreign key(pro_id) references supplier(supp_id));

create table customer(
	cus_id int(5) primary key,
	cus_name varchar(15) not null,
	cus_phone varchar(10) not null,
	cus_city varchar(10) not null,
	cus_gender varchar(1) not null);

create table orders(
	ord_id int(5) primary key,
	ord_date date,
	ord_amount int default 0,
	cus_id int(5),
	pricing_id int(5),
	foreign key(cus_id) references customer(cus_id),
	foreign key(pricing_id) references supplier_pricing(pricing_id));

create table rating(
	rat_id int(5) primary key,
	ord_id int(5),
	rat_ratstars int(1) not null default 5,
	foreign key(ord_id) references orders(order_id));

-- Q3 Insert the following data in the table created above

INSERT INTO Category (cat_id, cat_name) VALUES
    (1, 'BOOKS'),
    (2, 'GAMES'),
    (3, 'GROCERIES'),
    (4, 'ELECTRONICS'),
    (5, 'CLOTHES');

 INSERT INTO Product (pro_id, pro_name, pro_desc, cat_id) VALUES
    (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
    (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
    (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
    (4, 'OATS', 'Highly Nutritious from Nestle', 3),
    (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
    (6, 'MILK', '1L Toned MIlk', 3),
    (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
    (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
    (9, 'Project IGI', 'compatible with windows 7 and above', 2),
    (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
    (11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
    (12, 'Train Your Brain', 'By Shireen Stephen', 1);

INSERT INTO Supplier (supp_id, supp_name, supp_city, supp_phone) VALUES
	(1, 'Rajesh Retails', 'Delhi', '1234567890'),
	(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
	(3, 'Knome products', 'Bangalore', '9785462315'),
	(4, 'Bansal Retails', 'Kochi', '8975463285'),
	(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

INSERT INTO Supplier_Pricing (pricing_id, pro_id, supp_id, supp_price) VALUES
	(1, 1, 2, 1500),
	(2, 3, 5, 30000),
	(3, 5, 1, 3000),
	(4, 2, 3, 2500),
	(5, 4, 1, 1000),
	(6, 12, 2, 780),
	(7, 12, 4, 789),
	(8, 3, 1, 31000),
	(9, 1, 5, 1450),
	(10, 4, 2, 999),
	(11, 7, 3, 549),
	(12, 7, 4, 529),
	(13, 6, 2, 105),
	(14, 6, 1, 99),
	(15, 2, 5, 2999),
	(16, 5, 2, 2999);	


INSERT INTO Customer (cus_id, cus_name, cus_phone, cus_city, cus_gender) VALUES
    (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
    (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
    (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
    (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
    (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

INSERT INTO orders (ord_id, ord_date, cus_id, pricing_id) VALUES
	(101, '2021-10-06', 2, 1),
	(102, '2021-10-12', 3, 5),
	(103, '2021-09-16', 5, 2),
	(104, '2021-10-05', 1, 1),
	(105, '2021-08-16', 4, 3),
	(106, '2021-08-18', 1, 9),
	(107, '2021-09-01', 3, 7),
	(108, '2021-09-07', 5, 6),
	(109, '2021-09-10', 5, 3),
	(110, '2021-09-10', 2, 4),
	(111, '2021-09-15', 4, 5),
	(112, '2021-09-16', 4, 7),
	(113, '2021-09-16', 1, 8),
	(114, '2021-09-16', 3, 5),
	(115, '2021-09-16', 5, 3),
	(116, '2021-09-17', 2, 14);

INSERT INTO rating (rat_ID, ord_id, rat_ratstars) VALUES
	(1, 101, 4),
	(2, 102, 3),
	(3, 103, 1),
	(4, 104, 2),
	(5, 105, 4),
	(6, 106, 3),
	(7, 107, 4),
	(8, 108, 4),
	(9, 109, 3),
	(10, 110, 5),
	(11, 111, 3),
	(12, 112, 4),
	(13, 113, 2),
	(14, 114, 1),
	(15, 115, 1),
	(16, 116, 0);

	

-- /* 4.  Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.


SELECT c.cus_gender, COUNT(DISTINCT o.cus_id) AS total_customers
FROM customer c
JOIN orders o ON c.cus_id = o.cus_id
JOIN supplier_pricing sp ON o.pricing_id = sp.pricing_id
WHERE sp.supp_price >= 3000
GROUP BY c.cus_gender;


-- Q5.  Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT o.ord_id, o.ord_date, p.pro_name
FROM orders o
JOIN supplier_pricing sp ON o.pricing_id = sp.pricing_id
JOIN product p ON sp.pro_id = p.pro_id
WHERE o.cus_id = 2;


-- -- 6. Display the Supplier details who can supply more than one product

SELECT s.*
FROM supplier s
JOIN supplier_pricing sp ON s.supp_id = sp.supp_id
GROUP BY s.supp_id
HAVING COUNT(DISTINCT sp.pro_id) > 1;


-- -- 7.  Find the least expensive product from each category and print the table with category id, name,
-- product name and price of the product

SELECT c.cat_id, c.cat_name, p.pro_name, sp.supp_price
FROM category c
JOIN product p ON c.cat_id = p.cat_id
JOIN supplier_pricing sp ON p.pro_id = sp.pro_id
WHERE sp.supp_price = (
    SELECT MIN(supp_price) 
    FROM supplier_pricing sp2 
    WHERE sp2.pro_id = p.pro_id
)
ORDER BY c.cat_id;


-- -- 8.  Display the Id and Name of the Product ordered after “2021-10-05”.

select pro_id, pro_name from product
inner join supplier_pricing using(pro_id)
inner join orders using(pricing_id) where ord_date > '2021-10-05'


-- --  9. Display customer name and gender whose names start or end with character 'A'

SELECT cus_name, cus_gender
FROM customer
WHERE cus_name LIKE 'A%' OR cus_name LIKE '%A'
ORDER BY cus_name;


-- --  10. Create a stored procedure to display supplier id, name, Rating(Average rating of all the
--products sold by every customer) and Type_of_Service. For Type_of_Service, If rating =5, print 
-- “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print
-- “Poor Service”. Note that there should be one rating per supplier

CREATE PROCEDURE GetSupplierServiceType()
BEGIN
    SELECT
        s.supp_id,
        s.supp_name,
        CASE
            WHEN AVG(r.rat_ratstars) = 5 THEN 'Excellent Service'
            WHEN AVG(r.rat_ratstars) > 4 THEN 'Good Service'
            WHEN AVG(r.rat_ratstars) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service,
        AVG(r.rat_ratstars) AS Rating
    FROM supplier s
    LEFT JOIN supplier_pricing sp ON s.supp_id = sp.supp_id
    LEFT JOIN orders o ON sp.pricing_id = o.pricing_id
    LEFT JOIN rating r ON o.ord_id = r.ord_id
    GROUP BY s.supp_id, s.supp_name;
END //
