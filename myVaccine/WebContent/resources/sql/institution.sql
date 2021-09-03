create table if not exists institution(
	p_appDate DATE,
	p_instAddress1 VARCHAR(50),
	p_instAddress2 VARCHAR(50),
	p_instAddress3 VARCHAR(50),
	p_instAddress4 VARCHAR(50),
	p_instName VARCHAR(50),
	p_instPhone VARCHAR(20),
	p_instWorkHour TEXT,
	p_modslnStock LONG,
	p_pfislnStock LONG
)default charset=utf8;


select * from institution;

/* 테스트를 위한 데이터 입력 */
insert into institution values('2021-09-03', '대구광역시', '동구', '동촌로', '79', '동구보건소','053-662-3201','평일 09:00 - 18:00',30, 30);

