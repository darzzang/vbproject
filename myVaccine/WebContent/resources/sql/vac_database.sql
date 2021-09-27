drop table vac;
drop table data;
drop table bigdata;

create table if not exists vac(
	v_vaccine varchar(10) not null,
	v_name varchar(10),
	v_idNum1 varchar(10),
	v_idNum2 varchar(10),
	v_phone1 varchar(10),
	v_phone2 varchar(10),
	v_phone3 varchar(10),
	v_idNum varchar(10),
	v_phone varchar(20),
	p_appDate DATE, 
	p_instAddress1 VARCHAR(50),
	p_instAddress2 VARCHAR(50),
	p_instAddress3 VARCHAR(50),
	p_instAddress4 VARCHAR(50),
	p_instName VARCHAR(50),
	p_instPhone VARCHAR(20),
	p_instWorkHour TEXT,
	primary key(v_name)
)default CHARSET=utf8;

create table if not exists data(
	v_vaccine varchar(10) not null,
	v_name varchar(10),
	v_idNum1 varchar(10),
	v_idNum2 varchar(10),
	v_phone1 varchar(10),
	v_phone2 varchar(10),
	v_phone3 varchar(10),
	v_idNum varchar(10),
	v_phone varchar(20),
	primary key(v_phone)
)default CHARSET=utf8;

create table if not exists bigdata(
	v_vaccine varchar(10) not null,
	v_name varchar(10),
	v_idNum1 varchar(10),
	v_idNum2 varchar(10),
	v_phone1 varchar(10),
	v_phone2 varchar(10),
	v_phone3 varchar(10),
	v_idNum varchar(10),
	v_phone varchar(20),
	p_appDate DATE, 
	p_instAddress1 VARCHAR(50),
	p_instAddress2 VARCHAR(50),
	p_instAddress3 VARCHAR(50),
	p_instAddress4 VARCHAR(50),
	p_instName VARCHAR(50),
	p_instPhone VARCHAR(20),
	p_instWorkHour TEXT,
	primary key(v_phone)
)default CHARSET=utf8;


delete from data where v_phone = '01111111111';
select * from data where v_phone = '01111111111';
insert into vac values('pakf');
select * from vac;
select * from data;
select * from bigdata;
select v_phone from data where v_phone = '01111111111';
select v_phone from vac;
select v_phone from data where v_name ="가가가";
show tables;
insert into vac from data where v_phone = "01111111111";
desc vac;