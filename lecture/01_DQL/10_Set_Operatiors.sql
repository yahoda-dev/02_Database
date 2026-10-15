SELECT menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
FROM tbl_menu
WHERE category_code = 10
UNION
SELECT menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
FROM tbl_menu
WHERE menu_price < 9000;


SELECT menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
FROM tbl_menu
WHERE category_code = 10

UNION ALL

SELECT menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
FROM tbl_menu
WHERE menu_price < 9000
ORDER BY menu_name;


-- 표준 SQL의 INTERSECT(교집합) 구현
SELECT a.menu_code,
       a.menu_name,
       a.menu_price,
       a.category_code,
       a.orderable_status
FROM tbl_menu a
         JOIN (SELECT menu_code,
                      menu_name,
                      menu_price,
                      category_code,
                      orderable_status
               FROM tbl_menu
               WHERE menu_price < 9000) b on (a.menu_code = b.menu_code);