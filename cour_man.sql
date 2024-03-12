CREATE DATABASE CourierDB;

USE CourierDB;

-- create the user table
create table user (
    userid int primary key,
    name varchar(255),
    email varchar(255) unique,
    password varchar(255),
    contactnumber varchar(20),
    address text
);

-- create the courier table
create table courier (
    courierid int primary key,
    sendername varchar(255),
    senderaddress text,
    receivername varchar(255),
    receiveraddress text,
    weight decimal(5, 2),
    status varchar(50),
    trackingnumber varchar(20) unique,
    deliverydate date
);

-- create the courierservices table
create table courierservices (
    serviceid int primary key,
    servicename varchar(100),
    cost decimal(8, 2)
);

-- create the employee table
create table employee (
    employeeid int primary key,
    name varchar(255),
    email varchar(255) unique,
    contactnumber varchar(20),
    role varchar(50),
    salary decimal(10, 2)
);

-- create the location table
create table location (
    locationid int primary key,
    locationname varchar(100),
    address text
);

-- create the payment table
create table payment (
    paymentid int primary key,
    courierid int,
    locationid int,
    amount decimal(10, 2),
    paymentdate date,
    foreign key (courierid) references courier(courierid),
    foreign key (locationid) references location(locationid)
);

-- Task 1:
-- customers
insert into user (userid, name, email, password, contactnumber, address) values
(1, 'Rahul Sharma', 'rahul.sharma@example.com', 'password123', '9876543210', '123 Main Street, Mumbai'),
(2, 'Priya Patel', 'priya.patel@example.com', 'password456', '9876543211', '456 Park Avenue, Delhi'),
(3, 'Amit Singh', 'amit.singh@example.com', 'password789', '9876543212', '789 Elm Road, Bangalore'),
(4, 'Deepika Gupta', 'deepika.gupta@example.com', 'passwordabc', '9876543213', '101 River Street, Kolkata'),
(5, 'Rajesh Kumar', 'rajesh.kumar@example.com', 'passworddef', '9876543214', '210 Lakeview Drive, Chennai');

-- courier
insert into courier (courierid, sendername, senderaddress, receivername, receiveraddress, weight, status, trackingnumber, deliverydate) values
(1, 'Anil Kumar', '456 Park Avenue, Delhi', 'Manish Singh', '123 Main Street, Mumbai', 2.5, 'Delivered', 'TRACK123', '2024-03-01'),
(2, 'Sneha Sharma', '789 Elm Road, Bangalore', 'Rahul Patel', '101 River Street, Kolkata', 3.2, 'In Transit', 'TRACK456', NULL),
(3, 'Sanjay Gupta', '123 Main Street, Mumbai', 'Anita Sharma', '456 Park Avenue, Delhi', 1.8, 'Pending', 'TRACK789', NULL),
(4, 'Kavita Singh', '101 River Street, Kolkata', 'Vikas Gupta', '789 Elm Road, Bangalore', 4.5, 'Delivered', 'TRACKABC', '2024-03-02'),
(5, 'Arun Kumar', '210 Lakeview Drive, Chennai', 'Sneha Patel', '210 Lakeview Drive, Chennai', 2.0, 'Delivered', 'TRACKDEF', '2024-03-03');

-- courierservices
insert into courierservices (serviceid, servicename, cost) values
(1, 'Express', 150.00),
(2, 'Standard', 100.00),
(3, 'Economy', 75.00);

-- employee
insert into employee (employeeid, name, email, contactnumber, role, salary) values
(1, 'Ravi Kumar', 'ravi.kumar@example.com', '9876543201', 'Delivery Executive', 2000.00),
(2, 'Priya Sharma', 'priya.sharma@example.com', '9876543202', 'Manager', 4000.00),
(3, 'John Singh', 'john.singh@example.com', '9876543203', 'Customer Service Representative', 2500.00),
(4, 'Deepak Gupta', 'deepak.gupta@example.com', '9876543204', 'Courier Handler', 2200.00),
(5, 'Neha Patel', 'neha.patel@example.com', '9876543205', 'Accountant', 3500.00);

-- location
insert into location (locationid, locationname, address) values
(1, 'Mumbai', '123 Main Street, Mumbai'),
(2, 'Delhi', '456 Park Avenue, Delhi'),
(3, 'Kolkata', '789 Elm Road, Bangalore'),
(4, 'Bangalore', '101 River Street, Kolkata'),
(5, 'Chennai', '210 Lakeview Drive, Chennai');

-- Payment
INSERT INTO payment (paymentid, courierid, locationid, amount, paymentdate) VALUES
(1, 1, 1, 2500.00, '2024-03-01'),
(2, 2, 2, 1500.00, '2024-03-02'),
(3, 3, 2, 1500.00, '2024-03-03'),
(4, 4, 4, 200.00, '2024-03-04'),
(5, 5, 4, 900.00, '2024-03-05'); 

-- Task 2:
-- 1.
select * from user;

-- 2.
select * from courier where sendername = 'Anil Kumar';

-- 3.
select * from courier;

-- 4.
select * from courier where courierid = 1;

-- 5.
select * from courier where status = 'Delivered';

-- 6.
select * from courier where status != 'Delivered';

-- 7.
select * from courier where deliverydate = curdate();

-- 8.
select * from courier where status = 'Pending';

-- 9.
select courierid, count(*) as totalpackages from courier group by courierid;

-- 10.
select courierid, avg(deliverydate) as averagedeliverytime from courier where status = 'Delivered' group by courierid;

-- 11.
select * from courier where weight between 2 and 4;

-- 12.
select * from employee where name like '%John%';

-- 13.
select * from courier where courierid in (select courierid from payment where amount > 50);


-- Task 3:
-- 14.
select e.employeeid, e.name as employeename, count(c.courierid) as totalcouriershandled
from employee e
left join courier c on e.employeeid = c.courierid
group by e.employeeid, e.name;

-- 15.
select l.locationid, l.locationname, sum(p.amount) as totalrevenue
from location l
left join payment p on l.locationid = p.locationid
group by l.locationid, l.locationname;

-- 16.
select l.locationid, l.locationname, count(c.courierid) as totalcouriersdelivered
from location l
left join courier c on l.locationid = c.courierid
where c.status = 'Delivered'
group by l.locationid, l.locationname;

-- 17.
select courierid, avg(deliverydate) as averagedeliverytime
from courier
where status = 'Delivered'
group by courierid
order by averagedeliverytime desc
limit 1;

-- 18.
select l.locationid, l.locationname, sum(p.amount) as totalpayments
from payment p
inner join location l on p.locationid = l.locationid
group by locationid, locationname
having totalpayments < 5000;

-- 19.
select l.locationid, l.locationname, sum(p.amount) as totalpayments
from payment p
inner join location l on p.locationid = l.locationid
group by locationid, locationname;

-- 20.
select c.courierid, c.sendername, c.receivername, sum(p.amount) as totalpayments
from courier c
inner join payment p on c.courierid = p.courierid
where p.locationid = 2
group by c.courierid, c.sendername, c.receivername
having totalpayments > 1000;

-- 21.
select c.courierid, c.sendername, c.receivername, sum(p.amount) as totalpayments
from courier c
inner join payment p on c.courierid = p.courierid
where p.paymentdate > '2024-03-03'
group by c.courierid, c.sendername, c.receivername
having totalpayments > 1000;

-- 22.
select l.locationid, l.locationname, sum(p.amount) as totalpayments
from location l
inner join payment p on l.locationid = p.locationid
where p.paymentdate > '2024-03-04'
group by l.locationid, l.locationname
having totalpayments > 5000;
