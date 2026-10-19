SELECT m.category_code, COUNT(*) AS count
FROM tbl_menu m
GROUP BY m.category_code
;

SELECT m.category_code, SUM(m.menu_price) AS 총가격
FROM tbl_menu m
GROUP BY m.category_code
;

SELECT m.category_code, AVG(m.menu_price) AS 평균가격
FROM tbl_menu m
GROUP BY m.category_code
;

SELECT category_code, COUNT(*) AS COUNT
FROM tbl_menu
GROUP BY category_code
HAVING category_code BETWEEN 5 AND 8;

SELECT category_code, SUM(menu_price) AS SUM
FROM tbl_menu
GROUP BY category_code
WITH ROLLUP;

SELECT
    menu_price,
    category_code,
    SUM(menu_price) AS SUM
FROM
    tbl_menu
GROUP BY
    menu_price,
    category_code
WITH ROLLUP ;