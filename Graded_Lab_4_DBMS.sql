/*---------------------------------------------------------------------------*/
/* 1 Create the Database and the tables. */
/*---------------------------------------------------------------------------*/
Create Database if not exists `ecomm_DBMS` ;
use `ecomm_DBMS`;
/* Supplier Scema */
CREATE TABLE IF NOT EXISTS `supplier`(
`SUPP_ID` INT PRIMARY KEY,
`SUPP_NAME` VARCHAR(50),
`SUPP_CITY` VARCHAR(50),
`SUPP_PHONE` VARCHAR(10)
);
/* Customer Scema */
CREATE TABLE IF NOT EXISTS `customer` (
`CUS_ID` INT NOT NULL,
`CUS_NAME` VARCHAR(20) NULL DEFAULT NULL,
`CUS_PHONE` VARCHAR(10),
`CUS_CITY` varchar(30),
`CUS_GENDER` CHAR,
PRIMARY KEY (`CUS_ID`)
);
/* Product category schema */
CREATE TABLE IF NOT EXISTS `category` (
`CAT_ID` INT NOT NULL,
`CAT_NAME` VARCHAR(20) NULL DEFAULT NULL,
PRIMARY KEY (`CAT_ID`)
);
/* Product Schema */
CREATE TABLE IF NOT EXISTS `product` (
`PRO_ID` INT NOT NULL,
`PRO_NAME` VARCHAR(20) NULL DEFAULT NULL,
`PRO_DESC` VARCHAR(60) NULL DEFAULT NULL,
`CAT_ID` INT NOT NULL,
PRIMARY KEY (`PRO_ID`),
FOREIGN KEY (`CAT_ID`) REFERENCES category (`CAT_ID`)
);
/* Product details schema */
CREATE TABLE IF NOT EXISTS `productDetails` (
`PROD_ID` INT NOT NULL,
`PRO_ID` INT NOT NULL,
`SUPP_ID` INT NOT NULL,
`PROD_PRICE` INT NOT NULL,
PRIMARY KEY (`PROD_ID`),
FOREIGN KEY (`PRO_ID`) REFERENCES product (`PRO_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES supplier(`SUPP_ID`)
);
/* Order details schema */
CREATE TABLE IF NOT EXISTS `order` (
`ORD_ID` INT NOT NULL,
`ORD_AMOUNT` INT NOT NULL,
`ORD_DATE` DATE,
`CUS_ID` INT NOT NULL,
`PROD_ID` INT NOT NULL,
PRIMARY KEY (`ORD_ID`),
FOREIGN KEY (`CUS_ID`) REFERENCES customer(`CUS_ID`),
FOREIGN KEY (`PROD_ID`) REFERENCES productDetails(`PROD_ID`)
);
/* product rating schema */
CREATE TABLE IF NOT EXISTS `rating` (
`RAT_ID` INT NOT NULL,
`CUS_ID` INT NOT NULL,
`SUPP_ID` INT NOT NULL,
`RAT_RATSTARS` INT NOT NULL,
PRIMARY KEY (`RAT_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES supplier (`SUPP_ID`),
FOREIGN KEY (`CUS_ID`) REFERENCES customer(`CUS_ID`)
);
/*---------------------------------------------------------------------------*/
/* 2 Insert values in all the tables */
/*---------------------------------------------------------------------------*/
insert into `supplier` values(1, "Rajesh Retails", "Delhi", "1234567890");
insert into `supplier` values(2, "Appario Ltd.", "Mumbai", "2589631470");
insert into `supplier` values(3, "Knome products", "Banglore", "9785462315");
insert into `supplier` values(4, "Bansal Retails", "Kochi", "8975463285");
insert into `supplier` values(5, "Mittal Ltd.", "Lucknow", "7898456532");

insert into `customer` values(1, "AAKASH", "9999999999", "DELHI", "M");
insert into `customer` values(2, "AMAN", "9785463215", "NOIDA", "M");
insert into `customer` values(3, "NEHA", "9999999999", "MUMBAI", "F");
insert into `customer` values(4, "MEGHA", "9994562399", "KOLKATA", "F");
insert into `customer` values(5, "PULKIT", "7895999999", "LUCKNOW", "M");

insert into `category` values(1, "BOOKS"); 
insert into `category` values(2, "GAMES"); 
insert into `category` values(3, "GROCERIES"); 
insert into `category` values(4, "ELECTRONICS"); 
insert into `category` values(5, "CLOTHES");

insert into `product` values(1, "GTA V", "DFJDJFDJFDJFDJFJF", 2);
insert into `product` values(2, "TSHIRT", "DFDFJDFJDKFD", 5);
insert into `product` values(3, "ROG LAPTOP", "DFNTTNTNTERND", 4);
insert into `product` values(4, "OATS", "REURENTBTOTH", 3);
insert into `product` values(5, "HARRY POTTER", "NBEMCTHTJTH", 1);

insert into `productDetails` values(1, 1, 2, 1500);
insert into `productDetails` values(2, 3, 5, 30000);
insert into `productDetails` values(3, 5, 1, 3000);
insert into `productDetails` values(4, 2, 3, 2500);
insert into `productDetails` values(5, 4, 1, 1000);

insert into `order` values(20, 1500, "2021-10-12", 3, 5);
insert into `order` values(25, 30500, "2021-09-16", 5, 2);
insert into `order` values(26, 2000, "2021-10-05", 1, 1);
insert into `order` values(30, 3500, "2021-08-16", 4, 3);
insert into `order` values(50, 2000, "2021-10-06", 2, 1);

insert into `rating` values(1, 2, 2, 4);
insert into `rating` values(2, 3, 4, 3);
insert into `rating` values(3, 5, 1, 5);
insert into `rating` values(4, 1, 3, 2);
insert into `rating` values(5, 4, 5, 4);

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
select `order`.*, product.pro_name from `order`, productDetails, product where 
`order`.cus_id = 2 and `order`.prod_id = productDetails.prod_id and 
productDetails.prod_id = product.pro_id;

/*---------------------------------------------------------------------------*/
/* 5. Display the Supplier details who can supply more than one product*/
/*---------------------------------------------------------------------------*/
select supplier.* from supplier, productDetails where supplier.supp_id in 
(select productDetails.supp_id from productDetails group by productDetails.supp_id
having count(productDetails.supp_id)>1) group by supplier.supp_id;

/*---------------------------------------------------------------------------*/
/* 6. Find the category of the product whose order amount is minimum. */
/*---------------------------------------------------------------------------*/
select category.* from `order`, productDetails, product, category
where `order`.prod_id = productDetails.prod_id
and productDetails.pro_id = product.pro_id
and product.cat_id = category.cat_id
and `order`.ord_amount = (SELECT MIN(ord_amount) FROM `order`);

/*---------------------------------------------------------------------------*/
/* 7. Display the Id and Name of the Product ordered after “2021-10-05”. */
/*---------------------------------------------------------------------------*/
select product.pro_id, product.pro_name from `order` inner join productDetails 
on productDetails.prod_id = `order`.prod_id inner join product on 
product.pro_id = productDetails.pro_id where `order`.ord_date > "2021-10-05";

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