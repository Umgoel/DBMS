create database umang_studentfaculty;
use umang_studentfaculty;
create table STUDENT (snum int primary key, sname varchar(50), major varchar(5), level varchar(3), age integer);
create table FACULTY (fid integer primary key, fname varchar(50), deptid integer);
CREATE TABLE enrolled(snum int, name char(30), FOREIGN KEY(snum) REFERENCES student(snum));
CREATE TABLE class(name char(30), meet time, room char(30), fid int, FOREIGN KEY(fid) REFERENCES faculty(fid));

insert into student values (1,"Vijaya","CSE","JR",20),(2,"Toshin Felix","CSE","JR",19),(3,"Sarthak","ISE","JR",19),(4,"Vinayaka","CV","SR",22),(5,"Bassi","LLB","SSR",25);
insert into faculty values (1,"MDR",123),(2,"NM",123),(3,"BJ",123),(4,"ABC",101),(5,"DEF",102),(6,"GHI",102);
insert into enrolled values (1,"C01"), (2,"C01"), (1,"C02"), (2,"C02"),(1,"C03"),(3,"C02"),(4,"C04"),(5,"C04");
insert into class values ("C01","08:55","CR401",1),("C02","9:50","CR408",2),("C03","11:15","CR402",3);

select * from student;
select * from faculty;
select * from enrolled;
select * from class;

/*i. Find the names of all Juniors (level = JR) who are enrolled in a class taught by MDR*/
select distinct sname from student s, class c where level = "JR" and fid in (select fid from faculty where fname = "MDR");


/*ii. Find the names of all classes that either meet in room R128 or have five or more Students enrolled */
select name from class where room="CR408";
select count(*) from class;
commit;