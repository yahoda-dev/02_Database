select *
from member_tbl;

insert into member_tbl(name, age, phone)
values ('김지원', 28, '010-9398-5626');


select *
from membership_tbl;




TRUNCATE table membership_tbl;


insert into membership_tbl(member_id, ott_type, plan_name, enroll_date, expiry_date, active)
values (1, '넷플릭스', '유료', '2026-10-16', '2027-10-16', TRUE);



ALTER TABLE membership_tbl ALTER COLUMN active SET DEFAULT TRUE;
ALTER TABLE membership_tbl ALTER COLUMN enroll_date SET DEFAULT (CURDATE());

insert into membership_tbl(member_id, ott_type, plan_name,  expiry_date )
values (1, 'ChatGPT', 'Pro',  '2027-10-16');


describe member_tbl;