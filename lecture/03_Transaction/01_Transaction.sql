SELECT * FROM  tbl_menu;








START TRANSACTION;

INSERT INTO tbl_menu VALUES (null, '바나나해장국', 8500, 4, 'Y');

UPDATE tbl_menu SET menu_name = '수정된 메뉴' WHERE menu_code = 5;

DELETE FROM tbl_menu WHERE menu_code = 1;

ROLLBACK ; -- or COMMIT;