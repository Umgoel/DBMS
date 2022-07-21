-- PROGRAM 6. ORDER PROCESSING DATABASE
create database orders;
use orders;
create table customer(
cust_no int primary key,
cname varchar(30),
city varchar(30)
);
create table order_t(
order_no int primary key,
odate date,
cust_no int,
order_amt int,
foreign key (cust_no) references customer(cust_no)
);
create table item(
item_no int primary key,
unit_price int
);

create table order_Item(
order_no int,
item_no int,
qty int,
foreign key (order_no) references order_t(order_no) on update cascade on delete cascade,
foreign key (item_no) references item(item_no) on update cascade on delete cascade
);

create table warehouse(
warehouse_no int primary key, 
city varchar(30));

create table shipment(
order_no int,
warehouse_no int,
ship_date date,
foreign key (order_no) references order_t(order_no) on update cascade on delete cascade,
foreign key (warehouse_no) references warehouse(warehouse_no) on update cascade on delete cascade
);

insert into customer values('1','ABC','Banglore'),('3','GHI','Banglore'), ('4','JKL','CHITOOR') ,('5','MNO','MYSORE') ,('2','DEF','KOLAR');


INSERT INTO CUSTORDER VALUES('1','2006-01-06',2,5000.5), ('2', '2006-04-26' ,3 ,2500 ),('3', '2006-04-27' ,3 ,1000),('4','2006-04-30', 5, 1000 ),('5', '2006-05-25', 1, 5000 );

insert into item values (1,2500),(2,5000),(3,1000),(4,5),(5,200); 

insert into order_item VALUES(1,2,1),(1,4,1),(2,1,1),(3,5,5),(4,2,2); 
insert into warehouse VALUES(2,'KOLAR'),(1,'Banglore'),(3,'CHITOOR'),(4,'Manglore'),(5,'Mysore');
insert into shipment values(1,1,'2006-04-26'),(2,2,'2006-04-29'),(3,2,'2006-04-24'),(4,5,'2006-04-30'),(5,3,'2006-06-01');


