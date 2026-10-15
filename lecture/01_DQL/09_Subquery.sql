SELECT *
FROM tbl_menu
WHERE category_code = (SELECT category_code
                       FROM tbl_menu
                       WHERE menu_name = '민트미역국')
;


-- SELECT절 서브쿼리
SELECT a.menu_code,
       a.menu_name,
       a.menu_price,
       (SELECT b.category_name
        FROM tbl_category b
        WHERE b.category_code = a.category_code) as category_name
FROM tbl_menu a
;

-- FROM절 서브쿼리
SELECT category_summary.category_code,
       category_summary.menu_count,
       category_summary.avg_price
FROM (SELECT category_code,
             COUNT(*)               AS menu_count,
             FLOOR(AVG(menu_price)) AS avg_price
      FROM tbl_menu
      GROUP BY category_code) AS category_summary;


-- WHERE절 서브쿼리
SELECT menu_code,
       menu_name,
       menu_price
FROM tbl_menu
WHERE menu_price > (SELECT AVG(menu_price)
                    FROM tbl_menu);

-- HAVING 절 서브쿼리
SELECT category_code,
       FLOOR((AVG(menu_price))) AS avg_price
FROM tbl_menu
GROUP BY category_code
HAVING AVG(menu_price > (SELECT AVG(menu_price)
                         FROM tbl_menu));


-- 상관 서브쿼리
-- 카테고리 별로 평균 가격보다 높은 메뉴 조회
SELECT menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
FROM tbl_menu a
WHERE menu_price > (SELECT AVG(menu_price)
                    FROM tbl_menu b
                    WHERE b.category_code = a.category_code);



SELECT category_name,
       category_code
FROM tbl_category a
WHERE EXISTS((SELECT 1 -- EXISTS는 해당 서브 쿼리의 결과가 1일 경우 해당 SELECT문의 결과를 사용
              FROM tbl_menu b
              WHERE b.category_code = a.category_code))
;



-- common table expression
WITH menucate as (SELECT menu_name,
                         category_name

                  FROM tbl_menu a
                           JOIN tbl_category b
                                ON a.category_code = b.category_code)
SELECT *
FROM menucate
ORDER BY menu_name;