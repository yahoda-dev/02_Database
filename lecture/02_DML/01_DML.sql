-- Insert
INSERT INTO tbl_menu
VALUES (null, '바나나 해장국', 8500, 4, 'Y');

INSERT INTO tbl_menu
VALUES (null, '참치맛아이스크림', 8500, 1, 'Y'),
       (null, '김치맛아이스크림', 8500, 5, 'Y'),
       (null, '소시지맛아이스크림', 8500, 10, 'Y');

-- Update
UPDATE tbl_menu
SET orderable_status = 'N' -- 바꿀 값
WHERE menu_code = '38'
;

-- DELETE
DELETE
FROM tbl_menu
WHERE menu_code = '38';

-- 가장 가격이 저렴한 메뉴 두 가지 삭제
DELETE
FROM tbl_menu
ORDER BY menu_price
LIMIT 2;

-- REPLACE
INSERT INTO tbl_menu
VALUES (1, '바나나 해장국', 8500, 4, 'Y');

REPLACE INTO tbl_menu
VALUES (1, '바나나 해장국', 8500, 4, 'Y');