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