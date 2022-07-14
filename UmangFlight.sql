create database Umang_Airlines;
use umang_airlines;
create table flights (
flno int,
dept_city varchar(15),
arrival_city varchar(15),
distance int,
departs time,
arrives time,
price int,
primary key (flno));

create table aircraft(
aid int,
aname varchar(15),
cruising_Range int,
primary key (aid)
);

create table certified(
eid int,
aid int,
foreign key (aid) references aircraft(aid) on update cascade on delete cascade,
foreign key (eid) references employee(eid) on update cascade on delete cascade
);

create table employee(
eid int,
ename varchar(15),
salary int,
foreign key (eid) references certified(eid) on update cascade on delete cascade
);

alter table employee drop foreign key employee_ibfk_1;
alter table employee add primary key (eid);
show create table employee;
desc employee;

insert into flights values (001,"BLR","CCU",2000,"08:00","12:30",12000, (002,"MAA","CCU",1800,"10:00","12:00",11000),(003,"IXR","CCU",2000,"06:00","08:00",4000),(004,"DEL","BLR",2200,"14:00","16:00",10000),(005,"BOM","DEL",1750,"00:00","02:00",8000);
insert into aircraft values (101,"AIRBUS A320",8000),(102,"AIRBUS A320neo",8300),(103,"Boeing 747",10000),(104,"AIRBUS A380",15000),(105,"Bombardier q400",5000);
insert into certified values (1001,101),(1001,102),(1001,103),(1002,101),(1002,105),(1003,101);
insert into employee values (1001,"Umang",150000), (1002,"Vijaya",150002), (1003,"Toshin",100000),(1004,"Valmika",110000),(1005,"Vishnu",155000);
insert into employee values (1006,"Sakshi",79000);
insert into certified values (1006,104);

select * from flights;
select * from aircraft;
select * from employee;
select * from certified;

Q1 Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80,000 ;

select distinct a.aname from employee e, aircraft a, certified c where e.salary >=80000 and a.aid IN
(select c.aid from certified c where c.eid = e.eid);

Q2 For each pilot who is certified for more than three aircrafts, find the eid and the maximum cruising range of
the aircraft for which she or he is certified ;

select eid, max(cruising_Range) from employee e, aircraft a, certified c
where e.eid = 

