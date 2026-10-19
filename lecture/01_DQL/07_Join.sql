SELECT menu.category_code, menu.menu_name
FROM tbl_menu menu
         INNER JOIN tbl_category category
                    ON menu.category_code = category.category_code;



SELECT a.category_code, b.menu_name, a.category_name
FROM tbl_category a
         LEFT JOIN tbl_menu b
                    ON a.category_code = b.category_code;




SELECT a.category_name 카테고리명, b.category_name 상위_카테고리
FROM tbl_category a
JOIN tbl_category b
ON a.ref_category_code = b.category_code
;