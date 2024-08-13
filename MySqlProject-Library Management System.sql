-- PROJECT LIBRARY MANAGEMENT SYSTEM

CREATE DATABASE LIBRARY;
USE LIBRARY;

create table branch(branch_no int primary key,manager_id int,branch_address varchar(10),contact_no bigint);
CREATE TABLE employee(
    emp_id int PRIMARY KEY,
    emp_name varchar(10),
    position varchar(10),
    salary int,
    branch_no int,
    FOREIGN KEY (branch_no) REFERENCES branch(branch_no)
);
desc branch;
desc employee;
create table books(isbn int primary key,book_title varchar(10),category varchar(10),rental_price int,status varchar(10),author varchar(10),publisher varchar(10));
desc books;

create table customer(customer_id int primary key,customer_name varchar(10),customer_address varchar(10),reg_date date);
desc customer;
create table issuestatus(issue_id int primary key,issued_cust int,issued_book_name varchar(10),
issue_date date,isbn_book int,foreign key(issued_cust)references customer(customer_id),foreign key(isbn_book) references books(isbn));
desc issuestatus;
create table returnstatus(returnid int primary key,return_cust varchar(10),return_book_name varchar(10),
return_date date,isbn_book2 int,foreign key(isbn_book2) references books(isbn));
desc returnstatus;

insert into branch values(100,200,'ekm',9496903309);
select * from branch;
insert into branch values(101,201,'tvm',9387464352);
insert into branch values(102,202,'klm',9496903381);
insert into branch values(103,203,'pta',9496903902);
insert into branch values(104,204,'alp',9496903813);
insert into branch values(105,205,'ktm',9496903449);
insert into branch values(106,206,'idukki',9496903698);
insert into branch values(107,207,'tsr',9496903745);
insert into branch values(108,208,'kkd',9496903358);
insert into branch values(109,209,'wnd',9496903667);

select * from employee;
alter table employee modify position varchar(50);

insert into employee values(300,'Vihaan','manager',100000,100);
insert into employee values(301,'Sherin','SeniorManager',200000,101);
insert into employee values(302,'Neauman','StoreKeeper',10000,101);
insert into employee values(303,'Samveda','Clerk',15000,103);
insert into employee values(304,'Rini','Clerk',15000,104);
insert into employee values(305,'Saawan','Accounts Officer',50000,105);
insert into employee values(306,'Sanvi','Security',10000,106);
insert into employee values(307,'Deva','TechnicalAssitant',80000,106);
insert into employee values(308,'Abhinav','Personal Assistant',30000,108);
insert into employee values(309,'Abhinya','Senior Clerk',40000,109);

alter table books modify book_title varchar(50);
alter table books modify category varchar(50);
insert into books values (1000,'Operating Systems','Computer Science',800,'yes','Clavinski','JK');
select * from books;

insert into books values(1001,'System Software','Computer Science',600,'yes','Jack','Selins');
insert into books values(1002,'Accountancy','Management',800,'no','Clavinski','Hachette ');
insert into books values(1003,'Netwok Systems','Computer Science',700,'yes','Selen','Bloomsbury');
insert into books values(1004,'Java','Computer Science',900,'yes','Macbeth','Rupa');
insert into books values(1005,'C++','Computer Science',600,'yes','MaryShelly','Aleph');
insert into books values(1006,'Mechanics','Mechanical',1800,'yes','JohnMilton','SAGE');
insert into books values(1007,'Renewable Energy','Electrical',580,'yes','Ghosh','Westland');
insert into books values(1008,'Cryptography','Computer Science',900,'no','Thomson','HarprColin');
insert into books values(1009,'Python','Computer Science',400,'yes','Jenny','Bloomsbury');

insert into customer values(400,'Sarang','Souparnika','1981-02-25');
select * from customer;
insert into customer values(401,'Sarang','Gagan','1984-04-26');
insert into customer values(402,'Kumar','Pournami','1989-03-22');
insert into customer values(403,'Ajith','Silver','1987-01-15');
insert into customer values(404,'Ananya','Lagoons','1991-06-15');
insert into customer values(405,'Gaurav','Souparnika','1984-07-10');
insert into customer values(406,'Sayooj','Glen','1986-10-19');
insert into customer values(407,'Binil','Greens','1981-02-25');
insert into customer values(408,'Shenaya','Yaari','1987-11-25');
insert into customer values(409,'Dhyan','Bluelane','1981-11-08');
select * from books;
insert into issuestatus values(500,400,'operatingsystems','2024-07-20',1000);

insert into issuestatus values(501,402,'operating systems','2024-07-22',1000);
insert into issuestatus values(502,403,'System Software','2024-07-19',1001);
insert into issuestatus values(503,405,'Accountancy','2024-07-15',1002);
insert into issuestatus values(504,406,'operating systems','2024-07-18',1000);
insert into issuestatus values(505,407,'operating systems','2024-07-07',1000);
insert into issuestatus values(506,400,'Accountancy','2024-07-16',1002);
insert into issuestatus values(507,402,'C++','2024-07-08',1005);
insert into issuestatus values(508,407,'Mechanics','2024-07-30',1006);
insert into issuestatus values(509,407,'Renewable Energy','2024-07-28',1007);
desc issuestatus;
select * from issuestatus;
alter table returnstatus modify return_book_name varchar(20);
select * from returnstatus;
insert into returnstatus values (600,'Sarang','operatingSystems','2024-07-25',1000);
insert into returnstatus values(601,'Kumar','operatingSystems','2024-07-24',1000);
insert into returnstatus values(602,'Ajith','SystemSoftware','2024-07-25',1001);
insert into returnstatus values(603,'Gaurav','Accountancy','2024-07-20',1002);
insert into returnstatus values(604,'Sayooj','operatingSystems','2024-07-25',1000);
insert into returnstatus values(605,'Binil','operatingSystems','2024-07-25',1000);
insert into returnstatus values(606,'Sarang','Accountancy','2024-07-20',1002);
insert into returnstatus values(607,'Kumar','C++','2024-07-15',1005);
insert into returnstatus values(608,'Binil','Mechanics','2024-07-31',1006);
insert into returnstatus values(609,'Binil','Renewable Energy','2024-07-31',1007);

select book_title,category,rental_price from books;
select * from books;
select * from employee;
Select emp_name,salary from employee order by salary desc;
select * from branch;
select * from issuestatus;

select * from customer;
select issued_book_name,customer_name from customer,issuestatus where customer.customer_id=issuestatus.issued_cust;
select * from books;
select count(book_title) as Noofbooks,category from books group by category;
select * from employee;
select emp_name,position from employee where salary>50000;
select * from customer;
select * from issuestatus;
select customer_name from customer where reg_date<'2022-01-01' and customer_id not in(select issued_cust from issuestatus);
select * from branch;
select * from employee;

select branch_no,count(emp_id) from branch inner join employee on branch.branch_no=employee.ebranch_no;
select count(emp_id) from employee group by branch_no;
   

select branch.branch_no,count(employee.emp_id) as NoofEmployees from branch inner join 
employee on branch.branch_no=employee.branch_no group by employee.branch_no;
select branch.branch_no,count(employee.emp_id) as NoofEmployees from branch inner join 
employee on branch.branch_no=employee.branch_no group by employee.branch_no;

update issuestatus set issue_date='2023-06-14' where issued_cust=406;

select customer.customer_id,customer.customer_name from customer inner join issuestatus on customer.customer_id=issuestatus.issued_cust;

select distinct customer.customer_id,customer.customer_name from customer inner join issuestatus 
on customer.customer_id=issuestatus.issued_cust and month(issue_date)=6;

select * from branch;
select * from employee;
select branch_no,count(emp_id) as NoofEmployees from employee group by branch_no having count(emp_id)>5;
select emp_name,branch_address from employee inner join branch on branch.branch_no=employee.branch_no and position in('manager','SeniorManager');




insert into employee values(310,'Saaagi','SeniorManager',200000,101);
insert into employee values(311,'Neau','StoreKeeper',10000,101);
insert into employee values(312,'Shans','SeniorManager',200000,101);
insert into employee values(313,'Samvy','StoreKeeper',10000,101);
select * from customer;
select * from books;
select * from issuestatus;
select distinct customer_id,customer_name from customer inner join books inner join issuestatus on customer.customer_id=issuestatus.issued_cust
and issuestatus.isbn_book=books.isbn and rental_price>=25 order by customer_id;
insert into books values(1010,'Lanka','History',500,'yes','Jenny','Bloomsbury');
select book_title from books where category='history';