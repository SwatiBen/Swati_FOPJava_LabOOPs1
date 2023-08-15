/* 1 & 2 - Creating the tables. */

Create Database if not exists `Ecommerse_Web` ;
use `Ecommerse_Web`;

CREATE TABLE IF NOT EXISTS `supplier`(
`SUPP_ID` INT PRIMARY KEY,
`SUPP_NAME` VARCHAR(50) not null,
`SUPP_CITY` VARCHAR(50) not null,
`SUPP_PHONE` VARCHAR(10) not null);

CREATE TABLE IF NOT EXISTS `customer` (
`CUS_ID` INT NOT NULL,
`CUS_NAME` VARCHAR(20) NULL DEFAULT NULL,
`CUS_PHONE` VARCHAR(10),
`CUS_CITY` varchar(30),
`CUS_GENDER` CHAR,
PRIMARY KEY (`CUS_ID`));

CREATE TABLE IF NOT EXISTS `category` (
cat_id int primary key, 
cat_name varchar(20) not null);

CREATE TABLE IF NOT EXISTS `product` (
`PRO_ID` INT NOT NULL,
`PRO_NAME` VARCHAR(20) NULL DEFAULT NULL,
`PRO_DESC` VARCHAR(60) NULL DEFAULT NULL,
`CAT_ID` INT NOT NULL,
PRIMARY KEY (`PRO_ID`),
FOREIGN KEY (`CAT_ID`) REFERENCES category (`CAT_ID`)
);

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
`pricing_id` INT NOT NULL,
`PRO_ID` INT NOT NULL,
`SUPP_ID` INT NOT NULL,
`supp_price` INT NOT NULL,
PRIMARY KEY (`pricing_id`),
FOREIGN KEY (`PRO_ID`) REFERENCES product(`PRO_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES supplier(`SUPP_ID`)
);

CREATE TABLE IF NOT EXISTS `order` (
`ORD_ID` INT NOT NULL,
`ORD_AMOUNT` INT NOT NULL,
`ORD_DATE` DATE,
`CUS_ID` INT NOT NULL,
`pricing_id` INT NOT NULL,
PRIMARY KEY (`ORD_ID`),
FOREIGN KEY (`CUS_ID`) REFERENCES customer(`CUS_ID`),
FOREIGN KEY (`pricing_id`) REFERENCES supplier_pricing(`pricing_id`)
);

create table ratings(
rating_id int primary key,
rat_ratstarts int,
ord_id int,
foreign key (ord_id) references Orders(ord_id));;

/* 3 Insert values in all the tables */

INSERT INTO Supplier (supp_id, supp_name, supp_city, supp_phone) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Bangalore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

INSERT INTO Customer (cus_id, cus_name, cus_phone, cus_city, cus_gender) VALUES
    (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
    (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
    (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
    (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
    (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');


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

INSERT INTO `orders` (`ord_id`, `ord_date`, `cus_id`, `pricing_id`) VALUES
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

INSERT INTO ratings (rating_ID, ord_id,rat_ratstarts) VALUES
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

/* 4. Display the number of customers based on gender who have placed individual orders of worth at least Rs. 3000 */

select customer.cus_gender, count(customer.cus_gender) as count from customer 
inner join `order` on customer.cus_id = `order`.cus_id where `order`.ord_amount >= 3000
group by customer.cus_gender;


/* 5. Display all the orders along with the product name ordered by a customer 
	  having Customer_Id=2. */

select `order`.*, product.pro_name from `order`, supplier_pricing, product where 
`order`.cus_id = 2 and `order`.pricing_id = supplier_pricing.pricing_id and 
supplier_pricing.pricing_id = product.pro_id;


/* 6. Display the Supplier details who can supply more than one product*/

select supplier.* from supplier, supplier_pricing where supplier.supp_id in 
(select supplier_pricing.supp_id from supplier_pricing group by supplier_pricing.supp_id
having count(supplier_pricing.supp_id)>1) group by supplier.supp_id;


/* 7. Find the least expensive product */

select category.* from `order`, supplier_pricing, product, category
where `order`.pricing_id = supplier_pricing.pricing_id
and supplier_pricing.pro_id = product.pro_id
and product.cat_id = category.cat_id
and `order`.ord_amount = (SELECT MIN(ord_amount) FROM `order`);


/* 8. Display the Id and Name of the Product ordered after “2021-10-05”. */

select product.pro_id, product.pro_name from `order` inner join supplier_pricing 
on supplier_pricing.pricing_id = `order`.pricing_id inner join product on 
product.pro_id = supplier_pricing.pro_id where `order`.ord_date > "2021-10-05";


/* 9. Display customer name and gender whose names start or end with 
      character 'A'. */

select customer.cus_name, customer.cus_gender from customer where
customer.cus_name like 'A%' or customer.cus_name like '%A';


/* 10. */

select supplier.supp_id, supplier.supp_name, rating.rat_ratstars,
CASE
	WHEN rating.rat_ratstars>4 THEN 'Good Service'
    WHEN rating.rat_ratstars>2 THEN 'Average Service'
    ELSE 'Poor Service'
END AS verdict from rating inner join supplier on supplier.supp_id=rating.supp_id;
