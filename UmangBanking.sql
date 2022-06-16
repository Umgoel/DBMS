create database Umangbank;
create table branch(
Branch_Name varchar(20) primary key,
City varchar(20),
Assets real
);
create table accounts(
accno int,
branch_name varchar(20),
balance real
);

alter table accounts add foreign key(branch_name) references branch(Branch_Name) on delete cascade;
alter table accounts add primary key(accno);
create table depositor(
customer_name varchar(50),
customer_street varchar(50),
customer_city varchar(50)
);

create table loan(
 loan_no int,
 branch_name varchar(20),
 amount real,
 foreign key (branch_name) references branch (Branch_Name) on delete cascade on update cascade
);

alter table loan add primary key(loan_no);

create table borrower(
customer_name varchar(50),
loan_number int,
foreign key(loan_number) references loan(loan_no) on delete cascade on update cascade
);

desc branch;
insert into branch values('Basvangudi','Bengaluru',200000);
insert into branch values('Gandhi Bazaar','Bengaluru',150000);
insert into branch values('BTM Layout','Bengaluru',500000);
insert into branch values('Anna Nagar','Chennai',200000);
insert into branch values('Sarojini Nagar','New Delhi',500000);
insert into branch values('JP Nagar','Bengaluru',950000);
select * from branch;
insert into accounts values('003','Basvangudi',49000);
insert into accounts values('001','Gandhi Bazaar',49000);
insert into accounts values('003','BTM Layout',49000);
insert into accounts values('004','Anna Nagar',4500);
insert into accounts values('6239','JP Nagar',53000);
insert into accounts values('889','Sarojini Nagar',40000);
select * from accounts;

insert into depositor values('Umang Goel','BTM','Bengaluru');
insert into depositor values('Vijaya Verma','Sarojini Nagar','New Delhi');
insert into depositor values