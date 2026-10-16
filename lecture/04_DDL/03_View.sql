create view hansik as
select
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from tbl_menu
where category_code = 4
with check option -- View 입력, 수정을 행이 View의 WHERE 조건을 만족하도록 검사
;


select * from hansik;

insert into tbl_menu (menu_name, menu_price, category_code, orderable_status)
VALUES ('뷰확인용 닭칼국수 김밥', 5000, 4, 'Y');

SET @menu_code = last_insert_id(); -- 변수처럼 쓰는 예시

select * from tbl_menu where menu_name = '뷰확인용 닭칼국수 김밥';

select *
from hansik
where menu_code = @menu_code;

delete from tbl_menu where menu_code = @menu_code;


-- View를 통한 DML 예제
insert into hansik (menu_name, menu_price, category_code, orderable_status)
VALUES ('뷰확인용 닭칼국수 김밥', 5000, 4, 'Y');

select *
from hansik
where menu_code = @menu_code;

insert into hansik (menu_name, menu_price, category_code, orderable_status)
VALUES ('뷰확인용 락토핏 에이드', 5000, 5, 'Y');




-- DML 못 쓰는 VIEW 예시들

CREATE VIEW category_menu_summary AS
SELECT
    category_code,
    COUNT(*) AS menu_count,
    FLOOR(AVG(menu_price)) AS avg_price
FROM
    tbl_menu
GROUP BY
    category_code;


select * from category_menu_summary;

update category_menu_summary
set avg_price = 10000
where category_code = 4;



create or replace view hansik as
select
    a.menu_code,
    a.menu_name,
    TRUNCATE((a.menu_price/1000), 1),
    b.category_name
from tbl_menu a
join tbl_category b
on a.category_code = b.category_code
where b.category_code = 4;

select * from hansik;

drop view if exists category_menu_summary;