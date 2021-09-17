drop table vaccine;

create table if not exists vaccine(
	vac_inst VARCHAR(50) NOT NULL, /* 접종 기관 */
	vac_time TIME, /* 접종 가능 시간 */
	vac_mdnTotal INT(2), /* 시간별 모더나 총량 */
	vac_mdnUse INT(2), /* 시간별 모더나 잔여량 */
	vac_pfzrTotal INT(2), /* 시간별 화이자 총량 */
	vac_pfzrUse INT(2) /* 시간별 화이자 잔여량 */
)default charset=utf8;

select * from vaccine;

/* 기관 이름을 FK로 지정 */
alter table vaccine add foreign key(vac_inst) references institution(p_instName);

/* 테스트를 위한 데이터 입력 */
insert into vaccine values('동구보건소', '09:00:00', 30, 25, 30, 30);
insert into vaccine values('동구보건소', '10:00:00', 30, 30, 29, 30);
insert into vaccine values('동구보건소', '11:00:00', 30, 30, 30, 30);
insert into vaccine values('동구보건소', '12:00:00', 30, 30, 30, 30);
insert into vaccine values('동구보건소', '13:00:00', 30, 30, 30, 30);
insert into vaccine values('동구보건소', '14:00:00', 30, 30, 30, 30);
insert into vaccine values('동구보건소', '15:00:00', 30, 30, 30, 30);
insert into vaccine values('동구보건소', '16:00:00', 30, 30, 30, 30);
insert into vaccine values('동구보건소', '17:00:00', 30, 30, 30, 30);
insert into vaccine values('동구보건소', '18:00:00', 30, 30, 30, 30);

insert into vaccine values('동구 예방접종센터', '09:00:00', 30, 25, 30, 30);
insert into vaccine values('동구 예방접종센터', '10:00:00', 30, 30, 29, 30);
insert into vaccine values('동구 예방접종센터', '11:00:00', 30, 30, 30, 30);
insert into vaccine values('동구 예방접종센터', '12:00:00', 30, 30, 30, 30);
insert into vaccine values('동구 예방접종센터', '13:00:00', 30, 30, 30, 30);
insert into vaccine values('동구 예방접종센터', '14:00:00', 30, 30, 30, 30);
insert into vaccine values('동구 예방접종센터', '15:00:00', 30, 30, 30, 30);
insert into vaccine values('동구 예방접종센터', '16:00:00', 30, 30, 30, 30);
insert into vaccine values('동구 예방접종센터', '17:00:00', 30, 30, 30, 30);
insert into vaccine values('동구 예방접종센터', '18:00:00', 30, 30, 30, 30);
