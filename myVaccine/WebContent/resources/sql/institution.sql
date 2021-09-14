drop table institution;

create table if not exists institution(
	p_instID int(10) not null auto_increment primary key, 
	p_instAddress1 VARCHAR(50),
	p_instAddress2 VARCHAR(50),
	p_instAddress3 VARCHAR(50),
	p_instAddress4 VARCHAR(50),
	p_instName VARCHAR(50),
	p_instPhone VARCHAR(20),
	p_instWorkHour TEXT
)default charset=utf8;

select * from institution;

/* 기관 이름(p_instName)을 primary key로 지정 */
alter table institution add primary key(p_instName);

/* 테스트를 위한 데이터 입력 */
insert into institution values(1, '대구광역시', '동구', '검사동', '1005-8', '동구보건소','053-662-3201','평일 09:00 - 18:00. 주말 및 공휴일 휴무');
insert into institution values(2, '대구광역시', '동구', '효목동', '1084', '동구 예방접종센터','053-951-3300','평일 09:00 - 18:00. 주말 및 공휴일 휴무');

/* instTBL = institution table + vaccine table */
CREATE TABLE instTBL SELECT * FROM institution JOIN vaccine ON institution.p_instID=vaccine.vac_instCode;
select * from instTBL;

select * from  institution where p_instAddress3 = '검사동';
