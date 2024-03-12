/*task 1: database design*/

/*1*/
create database sisdb;

use sisdb;

/*2*/
create table students(
    student_id int primary key,
    first_name varchar(255),
    last_name varchar(255),
    date_of_birth date,
    email varchar(255),
    phone_number varchar(20)
);

create table courses(
    course_id int primary key,
    course_name varchar(255),
    credits int,
    teacher_id int,
    foreign key (teacher_id) references teacher(teacher_id)
);

create table enrollments(
    enrollment_id int primary key,
    student_id int,
    course_id int,
    enrollment_date date,
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

create table teacher(
    teacher_id int primary key,
    first_name varchar(255),
    last_name varchar(255),
    email varchar(255)
);

create table payments(
    payment_id int primary key,
    student_id int,
    amount decimal(10, 2),
    payment_date date,
    foreign key (student_id) references students(student_id)
);

/*5*/
insert into students (student_id, first_name, last_name, date_of_birth, email, phone_number)
values
(1, 'Aarav', 'Patel', '1995-01-15', 'aarav.patel@gmail.com', '1234567890'),
(2, 'Isha', 'Sharma', '1998-07-20', 'isha.sharma@gmail.com', '9876543210'),
(3, 'Vikram', 'Singh', '1997-03-10', 'vikram.singh@gmail.com', '5551234567'),
(4, 'Ananya', 'Gupta', '1996-09-05', 'ananya.gupta@gmail.com', '1112223333'),
(5, 'Sanya', 'Kumar', '1999-11-25', 'sanya.kumar@gmail.com', '9998887777'),
(6, 'Aryan', 'Das', '1994-05-08', 'aryan.das@gmail.com', '7776665555'),
(7, 'Aditi', 'Chopra', '1998-02-18', 'aditi.chopra@gmail.com', '4443332222'),
(8, 'Rohan', 'Malhotra', '1996-12-30', 'rohan.malhotra@gmail.com', '2224446666'),
(9, 'Dia', 'Thakur', '1997-06-14', 'dia.thakur@gmail.com', '8889991111'),
(10, 'Kabir', 'Joshi', '1995-08-29', 'kabir.joshi@gmail.com', '7778889999');

insert into courses (course_id, course_name, credits, teacher_id)
values
(1, 'Mathematics', 3, 1),
(2, 'Physics', 4, 2),
(3, 'Computer Science', 3, 3),
(4, 'History', 3, 4),
(5, 'Economics', 3, 5),
(6, 'Biology', 4, 6),
(7, 'Chemistry', 4, 7),
(8, 'English Literature', 3, 8),
(9, 'Geography', 3, 9),
(10, 'Political Science', 3, 10);

insert into enrollments (enrollment_id, student_id, course_id, enrollment_date)
values
(1, 1, 1, '2023-09-01'),
(2, 2, 2, '2023-09-01'),
(3, 3, 3, '2023-09-01'),
(4, 5, 7, '2023-09-01'),
(5, 5, 5, '2023-09-01'),
(6, 6, 7, '2023-09-01'),
(7, 7, 7, '2023-09-01'),
(8, 7, 8, '2023-09-01'),
(9, 7, 9, '2023-09-01'),
(10, 10, 10, '2023-09-01');

insert into teacher (teacher_id, first_name, last_name, email)
values
(1, 'Rajesh', 'Sharma', 'rajesh.sharma@gmail.com'),
(2, 'Priya', 'Patil', 'priya.patil@gmail.com'),
(3, 'Amit', 'Singh', 'amit.singh@gmail.com'),
(4, 'Meera', 'Gupta', 'meera.gupta@gmail.com'),
(5, 'Vivek', 'Kumar', 'vivek.kumar@gmail.com'),
(6, 'Neha', 'Das', 'neha.das@gmail.com'),
(7, 'Rahul', 'Chopra', 'rahul.chopra@gmail.com'),
(8, 'Nisha', 'Malhotra', 'nisha.malhotra@gmail.com'),
(9, 'Sachin', 'Thakur', 'sachin.thakur@gmail.com'),
(10, 'Pooja', 'Joshi', 'pooja.joshi@gmail.com');

insert into payments (payment_id, student_id, amount, payment_date)
values
(1, 1, 50000.00, '2023-09-15'),
(2, 2, 40000.00, '2023-09-20'),
(3, 3, 55000.00, '2023-09-25'),
(4, 4, 55500.00, '2023-09-30'),
(5, 5, 45000.00, '2023-10-05'),
(6, 6, 60000.00, '2023-10-10'),
(7, 7, 52000.00, '2023-10-15'),
(8, 8, 65000.00, '2023-10-20'),
(9, 9, 53000.00, '2023-10-25'),
(10, 10, 72000.00, '2023-10-30');

/*task 2*/

/*1*/
insert into students (student_id, first_name, last_name, date_of_birth, email, phone_number)
values (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

/*2*/
insert into enrollments (student_id, course_id, enrollment_date)
values (1, 4, '2023-10-01');

/*3*/
update teacher
set email = 'sachinthakur77@gmail.com'
where teacher_id = 9;

/*4*/
delete from enrollments
where student_id = 9 and course_id = 9;

/*5*/
update courses
set teacher_id = 2
where course_id = 3;

/*6*/
delete from students
where student_id = 7;
delete from enrollments
where student_id = 7;

/*7*/
update payments
set amount = 10.00
where payment_id = 9;

/*task 3*/

/*1*/
select s.first_name, s.last_name, sum(p.amount) as total_payments
from students s
left join payments p on s.student_id = p.student_id
where s.student_id = 9;

/*2*/
select c.course_name, count(e.student_id) as enrolled_students_count
from courses c
left join enrollments e on c.course_id = e.course_id
group by c.course_name;

/*3*/
select s.first_name, s.last_name
from students s
left join enrollments e on s.student_id = e.student_id
where e.student_id is null;

/*4*/
select s.first_name, s.last_name, c.course_name
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id;

/*5*/
select t.first_name, t.last_name, c.course_name
from teacher t
join courses c on t.teacher_id = c.teacher_id;

/*6*/
select s.first_name, s.last_name, e.enrollment_date
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
where c.course_id = 7;

/*7*/
select s.first_name, s.last_name
from students s
left join payments p on s.student_id = p.student_id
where p.student_id is null;

/*8*/
select c.course_name
from courses c
left join enrollments e on c.course_id = e.course_id
where e.course_id is null;

/*9*/
select s.first_name, s.last_name
from students s
join enrollments e1 on s.student_id = e1.student_id
join enrollments e2 on s.student_id = e2.student_id
where e1.course_id <> e2.course_id;

/*10*/
select t.first_name, t.last_name
from teacher t
left join courses c on t.teacher_id = c.teacher_id
where c.teacher_id is null;

/*task 4*/

/*1*/
select avg(enrollment_count) as average_enrollment_count
from (
    select count(*) as enrollment_count
    from enrollments
    group by course_id
) as subquery;

/*2*/
select student_id
from payments
where amount = (
    select max(amount)
    from payments
);

/*3*/
select course_id
from (
    select course_id, count(*) as enrollment_count
    from enrollments
    group by course_id
) as subquery
where enrollment_count = (
    select max(enrollment_count)
    from (
        select count(*) as enrollment_count
        from enrollments
        group by course_id
    ) as inner_subquery
);

/*4*/
select teacher_id, sum(amount) as total_payments
from payments
join courses on payments.course_id = courses.course_id
group by teacher_id;

/*5*/
select student_id
from (
    select student_id, count(distinct course_id) as enrolled_courses_count
    from enrollments
    group by student_id
) as subquery
where enrolled_courses_count = (
    select count(distinct course_id)
    from courses
);

/*6*/
select first_name, last_name
from teacher
where teacher_id not in (
    select distinct teacher_id
    from courses
);

/*7*/
select avg(timestampdiff(year, date_of_birth, curdate())) as average_age
from students;

/*8*/
select course_id
from courses
where course_id not in (
    select distinct course_id
    from enrollments
);

/*9*/
select student_id, course_id, sum(amount) as total_payments
from payments
group by student_id, course_id;

/*10*/
select student_id
from payments
group by student_id
having count(*) > 1;

/*11*/
select student_id, sum(amount) as total_payments
from payments
group by student_id;

/*12*/
select c.course_name, count(e.student_id) as enrolled_students_count
from courses c
left join enrollments e on c.course_id = e.course_id
group by c.course_name;

/*13*/
select avg(amount) as average_payment_amount
from payments;
