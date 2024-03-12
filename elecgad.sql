-- 1.
create database techshop;

use techshop;
-- 2.

-- customers table
create table customers (
    customerid int primary key,
    firstname varchar(255),
    lastname varchar(255),
    email varchar(255),
    phone varchar(20),
    address text
);

-- products table
create table products (
    productid int primary key,
    productname varchar(255),
    category varchar(255),
    description text,
    price decimal(10, 2)
);

-- orders table
create table if not exists orders (
    orderid int primary key,
    customerid int,
    orderdate date,
    totalamount decimal(10, 2),
    foreign key (customerid) references customers(customerid)
);

-- orderdetails table
create table if not exists orderdetails (
    orderdetailid int primary key,
    orderid int,
    productid int,
    quantity int,
    foreign key (orderid) references orders(orderid),
    foreign key (productid) references products(productid)
);

-- inventory table
create table if not exists inventory (
    inventoryid int primary key,
    productid int,
    quantityinstock int,
    laststockupdate date,
    foreign key (productid) references products(productid)
);

-- 5.

-- customers
insert into customers (customerid, firstname, lastname, email, phone, address) values
(1, 'Aarav', 'Patel', 'aarav.patel@gmail.com', '1234567890', ' 123, idk St,Lawspet, Puducherry'),
(2, 'Isha', 'Sharma', 'isha.sharma@gmail.com', '9876543210', '143, Anna St., Anna nagar, Chennai'),
(3, 'Vikram', 'Singh', 'vikram.singh@gmail.com', '5551234567', '182, Gandhi St., Dadar, Mumbai'),
(4, 'Ananya', 'Gupta', 'ananya.gupta@gmail.com', '1112223333', '115, Central Market, Vikas puri, Delhi' ),
(5, 'Sanya', 'Kumar', 'sanya.kumar@gmail.com', '9998887777', '207, Parvati Indl Estate, Lower Parel, Mumbai'),
(6, 'Aryan', 'Das', 'aryan.das@gmail.com', '7776665555', '117, Manipal Centre, Dickenson Road,Bangalore'),
(7, 'Aditi', 'Chopra', 'aditi.chopra@gmail.com', '4443332222', '197, Manipal Centre, Dickenson Road,Bangalore'),
(8, 'Rohan', 'Malhotra', 'rohan.malhotra@gmail.com', '2224446666', '777, Sathy Main Road, Gandhipuram, Coimbatore'),
(9, 'Dia', 'Thakur', 'dia.thakur@gmail.com', '8889991111', '999, Stephens Road, Frazer Town, Bangalore'),
(10, 'Kabir', 'Joshi', 'kabir.joshi@gmail.com', '7778889999', '12, Stephens Road, Frazer Town,Bangalore');

-- products
insert into products (productid, productname, category, description, price) values
(1, 'Smartphone', 'High-end smartphone with advanced features', 'Electronic', 69999.99),
(2, 'Laptop', 'Powerful laptop for productivity and entertainment', 'Electronic', 129900.99),
(3, 'Smartwatch', 'Wearable device for tracking fitness and notifications', 'Electronic', 19999.99),
(4, 'Tablet', 'Portable tablet for browsing and entertainment', 'Electronic',39999.99),
(5, 'Headphones', 'Premium headphones for immersive audio experience', 'Electronic', 2999.99),
(6, 'Camera', 'Professional camera for photography enthusiasts', 'Electronic', 89999.99),
(7, 'Smart Speaker', 'Voice-controlled smart speaker for home automation', 1499.99),
(8, 'Gaming Console', 'Next-generation gaming console for gaming enthusiasts', 'Electronic', 49999.99),
(9, 'Fitness Tracker', 'Wristband fitness tracker for monitoring health', 'Electronic', 1499.99),
(10, 'Wireless Earbuds', 'Wireless earbuds for on-the-go music and calls', 'Electronic', 1999.99);

-- orders
insert into orders (orderid, customerid, orderdate, totalamount) values
(1, 1, '2024-01-15', 699.99),
(2, 2, '2024-01-16', 1299.99),
(3, 3, '2024-01-17', 499.98),
(4, 4, '2024-01-18', 1099.97),
(5, 5, '2024-01-19', 899.98),
(6, 6, '2024-01-20', 599.97),
(7, 7, '2024-01-21', 799.96),
(8, 8, '2024-01-22', 399.98),
(9, 9, '2024-01-23', 899.97),
(10, 10, '2024-01-24', 499.98);

-- orderdetails
insert into orderdetails (orderdetailid, orderid, productid, quantity) values
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 2),
(8, 8, 8, 1),
(9, 9, 9, 3),
(10, 10, 10, 2);

-- inventory
insert into inventory (inventoryid, productid, quantityinstock, laststockupdate) values
(1, 1, 20, '2024-01-15'),
(2, 2, 15, '2024-01-15'),
(3, 3, 30, '2024-01-15'),
(4, 4, 25, '2024-01-15'),
(5, 5, 10, '2024-01-15'),
(6, 6, 5, '2024-01-15'),
(7, 7, 12, '2024-01-15'),
(8, 8, 8, '2024-01-15'),
(9, 9, 18, '2024-01-15'),
(10, 10, 22, '2024-01-15');

-- task 2:

-- 1.
select firstname, lastname, email from customers;

-- 2.
select orders.orderid, orders.orderdate, customers.firstname, customers.lastname
from orders
inner join customers on orders.customerid = customers.customerid;

-- 3.
insert into customers (customerid, firstname, lastname, email, phone, address)
values (11, 'Ravi', 'Kumar', 'rav.kum@gmail.com', '1112777333', '123 Main St, Kandha Nagar, Chennai');

-- 4.
update products
set price = price * 1.1;

-- 5.
delete from orderdetails where orderid = 5;
delete from orders where orderid = 5;

-- 6.
insert into orders (orderid, customerid, orderdate, totalamount)
values (11, 11, '2024-03-05', 7777.99);

-- 7.
update customers
set email = 'ravi.kumar@gmail.com', address = '456 Muruga St., White town, Puducherry'
where customerid = 11;

-- 8.
update orders
set totalamount = (select sum(quantity * price) from orderdetails where orderdetails.orderid = orders.orderid);

-- 9.
delete from orderdetails where orderid in (select orderid from orders where customerid = 2);
delete from orders where customerid = 2;

-- 10.
insert into products (productid, productname, description, price) values (11, 'Wireless Controller', 'Wireless Controller with quick input times and a very efficient battery-life', 1799.99);

-- 11.

-- 12.
update customers
set numorders = (
    select count(*)
    from orders
    where orders.customerid = customers.customerid
);

-- task 3:
-- 1.
select orders.orderid, customers.firstname, customers.lastname, customers.email, orders.orderdate
from orders
inner join customers on orders.customerid = customers.customerid;

-- 2.
select products.productname, sum(orders.totalamount) as totalrevenue
from orderdetails
join products on orderdetails.productid = products.productid
join orders on orderdetails.orderid = orders.orderid
group by products.productname;

-- 3.
select distinct customers.firstname, customers.lastname, customers.email
from customers
join orders on customers.customerid = orders.customerid;

-- 4.
select products.productname, sum(orderdetails.quantity) as totalquantityordered
from orderdetails
join products on orderdetails.productid = products.productid
group by products.productname
order by totalquantityordered desc
limit 1;

-- 5.
select products.productname, categories.categoryname
from products
join categories on products.categoryid = categories.categoryid;

-- 6.
select customers.firstname, customers.lastname, avg(orders.totalamount) as averageordervalue
from customers
join orders on customers.customerid = orders.customerid
group by customers.customerid;

-- 7.
select orders.orderid, customers.firstname, customers.lastname, customers.email, sum(orders.totalamount) as totalrevenue
from orders
join customers on orders.customerid = customers.customerid
group by orders.orderid
order by totalrevenue desc
limit 1;

-- 8.
select products.productname, count(orderdetails.orderid) as numberoforders
from products
left join orderdetails on products.productid = orderdetails.productid
group by products.productname;

-- 9.
select distinct customers.firstname, customers.lastname, customers.email
from customers
join orders on customers.customerid = orders.customerid
join orderdetails on orders.orderid = orderdetails.orderid
join products on orderdetails.productid = products.productid
where products.productname = 'Wireless Earbuds';

-- 10.
select sum(totalamount) as totalrevenue
from orders
where orderdate between '2024-01-15' and '2024-01-19';

-- task 4

-- 1.
select firstname, lastname, email
from customers
where customerid not in (select distinct customerid from orders);

-- 2.
select count(*) as totalproducts
from products;

-- 3.
select sum(totalamount) as totalrevenue
from orders;

-- 4.
select avg(quantity) as averagequantityordered
from orderdetails
join products on orderdetails.productid = products.productid
where category = 'Electronics';

-- 5.
select sum(totalamount) as totalrevenue
from orders
where customerid = 7;

-- 6.
select customers.firstname, customers.lastname, count(*) as numberoforders
from customers
join orders on customers.customerid = orders.customerid
group by customers.customerid
order by numberoforders desc
limit 1;

-- 7.
select products.category, sum(orderdetails.quantity) as totalquantityordered
from orderdetails
join products on orderdetails.productid = products.productid
group by products.category
order by totalquantityordered desc
limit 1;

-- 8.
select customers.firstname, customers.lastname, sum(orders.totalamount) as totalspending
from customers
join orders on customers.customerid = orders.customerid
join orderdetails on orders.orderid = orderdetails.orderid
join products on orderdetails.productid = products.productid
where products.category = 'Electronics'
group by customers.customerid
order by totalspending desc
limit 1;

-- 9.
select avg(totalamount) as averageordervalue
from orders;

-- 10.
select customers.firstname, customers.lastname, count(*) as ordercount
from customers
join orders on customers.customerid = orders.customerid
group by customers.customerid;
