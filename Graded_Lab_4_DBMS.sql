/* 1 & 2 - Creating the tables. */

Create Database if not exists `ecomm_DBMS` ;
use `ecomm_DBMS`;

CREATE TABLE IF NOT EXISTS `supplier`(
`SUPP_ID` INT PRIMARY KEY,
`SUPP_NAME` VARCHAR(50),
`SUPP_CITY` VARCHAR(50),
`SUPP_PHONE` VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS `customer` (
`CUS_ID` INT NOT NULL,
`CUS_NAME` VARCHAR(20) NULL DEFAULT NULL,
`CUS_PHONE` VARCHAR(10),
`CUS_CITY` varchar(30),
`CUS_GENDER` CHAR,
PRIMARY KEY (`CUS_ID`)
);

CREATE TABLE IF NOT EXISTS `category` (
`CAT_ID` INT NOT NULL,
`CAT_NAME` VARCHAR(20) NULL DEFAULT NULL,
PRIMARY KEY (`CAT_ID`)
);

CREATE TABLE IF NOT EXISTS `product` (
`PRO_ID` INT NOT NULL,
`PRO_NAME` VARCHAR(20) NULL DEFAULT NULL,
`PRO_DESC` VARCHAR(60) NULL DEFAULT NULL,
`CAT_ID` INT NOT NULL,
PRIMARY KEY (`PRO_ID`),
FOREIGN KEY (`CAT_ID`) REFERENCES category (`CAT_ID`)
);

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
`PROD_ID` INT NOT NULL,
`PRO_ID` INT NOT NULL,
`SUPP_ID` INT NOT NULL,
`PROD_PRICE` INT NOT NULL,
PRIMARY KEY (`PROD_ID`),
FOREIGN KEY (`PRO_ID`) REFERENCES product (`PRO_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES supplier(`SUPP_ID`)
);

CREATE TABLE IF NOT EXISTS `order` (
`ORD_ID` INT NOT NULL,
`ORD_AMOUNT` INT NOT NULL,
`ORD_DATE` DATE,
`CUS_ID` INT NOT NULL,
`PROD_ID` INT NOT NULL,
PRIMARY KEY (`ORD_ID`),
FOREIGN KEY (`CUS_ID`) REFERENCES customer(`CUS_ID`),
FOREIGN KEY (`PROD_ID`) REFERENCES supplier_pricing(`PROD_ID`)
);

CREATE TABLE IF NOT EXISTS `rating` (
`RAT_ID` INT NOT NULL,
`CUS_ID` INT NOT NULL,
`SUPP_ID` INT NOT NULL,
`RAT_RATSTARS` INT NOT NULL,
PRIMARY KEY (`RAT_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES supplier (`SUPP_ID`),
FOREIGN KEY (`CUS_ID`) REFERENCES customer(`CUS_ID`)
);

/* 3 Insert values in all the tables */

INSERT INTO `supplier` (`supp_id`, `supp_name`, `supp_city`, `supp_phone`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_phone`, `cus_city`, `cus_gender`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');


INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES'),
(6, 'SPORTS');

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_desc`, `cat_id`) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB S', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and col', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor D', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

INSERT INTO `supplier_pricing` (`pricing_id`, `pro_id`, `supp_id`, `supp_price`) VALUES
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

insert into 'rating' ('rat_id')

/*---------------------------------------------------------------------------*/
/* 3. Display the number of the customer group by their genders who have 
	  placed any order of amount greater than or equal to Rs.3000.*/
/*---------------------------------------------------------------------------*/
select customer.cus_gender, count(customer.cus_gender) as count from customer 
inner join `order` on customer.cus_id = `order`.cus_id where `order`.ord_amount >= 3000
group by customer.cus_gender;

/*---------------------------------------------------------------------------*/
/* 4. Display all the orders along with the product name ordered by a customer 
	  having Customer_Id=2. */
/*---------------------------------------------------------------------------*/
select `order`.*, product.pro_name from `order`, supplier_pricing, product where 
`order`.cus_id = 2 and `order`.prod_id = supplier_pricing.prod_id and 
supplier_pricing.prod_id = product.pro_id;

/*---------------------------------------------------------------------------*/
/* 5. Display the Supplier details who can supply more than one product*/
/*---------------------------------------------------------------------------*/
select supplier.* from supplier, supplier_pricing where supplier.supp_id in 
(select supplier_pricing.supp_id from supplier_pricing group by supplier_pricing.supp_id
having count(supplier_pricing.supp_id)>1) group by supplier.supp_id;

/*---------------------------------------------------------------------------*/
/* 6. Find the category of the product whose order amount is minimum. */
/*---------------------------------------------------------------------------*/
select category.* from `order`, supplier_pricing, product, category
where `order`.prod_id = supplier_pricing.prod_id
and supplier_pricing.pro_id = product.pro_id
and product.cat_id = category.cat_id
and `order`.ord_amount = (SELECT MIN(ord_amount) FROM `order`);

/*---------------------------------------------------------------------------*/
/* 7. Display the Id and Name of the Product ordered after “2021-10-05”. */
/*---------------------------------------------------------------------------*/
select product.pro_id, product.pro_name from `order` inner join supplier_pricing 
on supplier_pricing.prod_id = `order`.prod_id inner join product on 
product.pro_id = supplier_pricing.pro_id where `order`.ord_date > "2021-10-05";

/*---------------------------------------------------------------------------*/
/* 8. Display customer name and gender whose names start or end with 
      character 'A'. */
/*---------------------------------------------------------------------------*/
select customer.cus_name, customer.cus_gender from customer where
customer.cus_name like 'A%' or customer.cus_name like '%A';

/*---------------------------------------------------------------------------*/
/* 9. Create a stored procedure to display the Rating for a Supplier if any 
	  along with the Verdict on that rating if any like if rating >4 then 
      “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should 
      not be considered”. */
/*---------------------------------------------------------------------------*/
select supplier.supp_id, supplier.supp_name, rating.rat_ratstars,
CASE
	WHEN rating.rat_ratstars>4 THEN 'Genuine Suppliers'
    WHEN rating.rat_ratstars>2 THEN 'Average Suppliers'
    ELSE 'Supplier should not be considered'
END AS verdict from rating inner join supplier on supplier.supp_id=rating.supp_id;
