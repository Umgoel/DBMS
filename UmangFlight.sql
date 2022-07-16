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
primary key(eid)
);

alter table employee drop foreign key employee_ibfk_1;
alter table employee add primary key (eid);
show create table employee;
desc employee;

insert into flights values (001,"BLR","CCU",2000,"08:00","12:30",12000), (002,"MAA","CCU",1800,"10:00","12:00",11000),(003,"IXR","CCU",2000,"06:00","08:00",4000),(004,"DEL","BLR",2200,"14:00","16:00",10000),(005,"BOM","DEL",1750,"00:00","02:00",8000),(010,"BLR","CCU",2000,"09:00","11:30",200),(011,"BLR","CCU",2000,"16:00","18:30",2000),(012,"BLR","CCU",2000,"18:00","20:30",25000);
insert into aircraft values (101,"AIRBUS A320",8000),(102,"AIRBUS A320neo",8300),(103,"Boeing 747",10000),(104,"AIRBUS A380",15000),(105,"Bombardier q400",5000),(106,"Gulf",800);
insert into employee values (1001,"Umang",150000), (1002,"Vijaya",150002), (1003,"Toshin",100000),(1004,"Valmika",110000),(1005,"Vishnu",155000),(1006,"Sakshi",79000),(1007,"Verma",500);
insert into employee values (9001,"ABC",50000),(9002,"BCD",45000),(9003,"DEF",30000);
insert into certified values (1001,101),(1001,102),(1001,103),(1002,101),(1002,105),(1003,101),(1006,104);

select * from flights;
select * from aircraft;
select * from employee;
select * from certified;


-- Q1 Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80,000 ;
select distinct a.aname from employee e, aircraft a, certified c where e.salary >=80000 and a.aid IN
(select c.aid from certified c where c.eid = e.eid);


# Q2 For each pilot who is certified for more than three aircrafts, find the eid and the maximum cruising range of the aircraft for which she or he is certified ;
-- select c.eid, max(cruising_Range) from employee e, aircraft a, certified c
-- where e.eid = c.eid AND
-- a.aid = c.aid AND
-- a.aid IN 
-- (select aid from certified where eid IN
-- (select eid from certified group by eid having count(*) >=3));

select c.eid, max(cruising_Range)
from certified c, aircraft a
where c.aid = a.aid
group by c.eid
having count(*)>2;

#Q3 Find the names of pilots whose salary is less than the price of the cheapest route from Bengaluru to Frankfurt.
select ename from employee where salary < (
select min(price) from flights where dept_city = "BLR" AND arrival_city = "CCU");


#Q4 For all aircraft with cruising range over 1000 Kms, find the name of the aircraft and the average salary of all pilots certified for this aircraft.
select a.aname, avg(e.salary) 
from employee e, aircraft a, certified c
where a.aid = c.aid AND e.eid = c.eid
group by a.aname
having a.aname in(
select aname from aircraft where cruising_Range > 1000);


#Q5. Find the names of pilots certified for some Boeing aircraft.
select distinct ename
from certified c, employee e, aircraft a
where e.eid = c.eid AND c.aid = a.aid and aname like "Boeing%";


-- Q6. Find the aids of all aircraft that can be used on routes from Bengaluru to New Delhi.
select aid from aircraft a 
where cruising_Range > (select min(distance) from flights where dept_city = "BLR" and arrival_city = "CCU");

-- Q7. A customer wants to travel from Madison to New York with no more than two changes of flight. 
-- List the choice of departure times from Madison if the customer wants to arrive in New York by 6 p.m.


-- Q8 Print the name and salary of every non-pilot whose salary is more than the average salary for pilots.
select e.ename, e.salary
from employee e
where e.eid not in ( select distinct c.eid from certified c)
and e.salary > (select avg(e1.salary) from employee e1 where e1.eid in (select distinct c1.eid from certified c1));
