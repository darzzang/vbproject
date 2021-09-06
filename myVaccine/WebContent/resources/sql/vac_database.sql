drop table vac;
drop table data;

create table if not exists vac(
	v_vaccine varchar(10) not null,
	v_name varchar(10),
	v_idNum1 varchar(10),
	v_idNum2 varchar(10),
	v_phone1 varchar(10),
	v_phone2 varchar(10),
	v_phone3 varchar(10),
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


select * from data where v_phone = '11111111111';
insert into vac values('pakf');
select * from vac;
select * from data;
select v_phone from data;
show tables;
insert into check from data where v_phone = '11111111111';
desc vac;