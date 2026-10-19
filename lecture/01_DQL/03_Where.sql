/*SELECT menu_name as name,
       menu_price as price
       -- orderable_status as orderable
FROM tbl_menu
WHERE menu_price = 13000;*/

/*
SELECT menu_name, menu_code, menu_price
FROM tbl_menu
WHERE (orderable_status = 'Y' AND category_code = 10)
ORDER BY menu_price;
*/


-- 메뉴 가격이 10,000원 이상이고 25,000원 이하이면서 menu 가격순으로 정렬해서 출력하라.
/*
SELECT menu_name, menu_price, category_code
FROM tbl_menu
-- WHERE (menu_price >= 10000 AND menu_price <= 25000)
WHERE menu_price BETWEEN 10000 AND 25000
ORDER BY menu_price;
*/
/*
SELECT menu_name
FROM tbl_menu
WHERE menu_name like '_마늘%';*/


/*
SELECT DISTINCT category_code, orderable_status
FROM tbl_menu;
*/

SELECT  menu_code, menu_name, menu_price
FROM tbl_menu
LIMIT 3, 5;