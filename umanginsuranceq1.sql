alter table owns add primary key(driver_id, regno);
alter table participated add primary key(driver_id, regno, report_number);
show tables;
desc owns;
ALTER TABLE owns ADD FOREIGN KEY (driver_id) REFERENCES person(driver_id) on delete cascade;
ALTER TABLE owns ADD FOREIGN KEY (regno) REFERENCES car(regno) on delete cascade;
ALTER TABLE participated ADD FOREIGN KEY (driver_id) REFERENCES person(driver_id) on delete cascade;
ALTER TABLE participated ADD FOREIGN KEY (regno) REFERENCES car(regno) on delete cascade;
ALTER TABLE participated ADD FOREIGN KEY (report_number) REFERENCES accident(report_number) on delete cascade;
show tables;


insert into participated values("DRV001","KA01",1,25000);
insert into participated values("DRV002","KA02",2,35000);
insert into participated values("DRV003","KA03",3,20000);
insert into participated values("DRV004","KA04",4,250000);
insert into participated values("DRV005","KA05",5,23000);

update participated set damage_amount = 25000 where report_number = 2 and regno="KA02";
insert into accident values(006,"2022-05-06","Kammanahalli");
select count(report_number) from ACCIDENT WHERE date_of_accident like "2022%";
select * from participated;
use umang;