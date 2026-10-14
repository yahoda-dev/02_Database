/*select menu_code, menu_name, menu_price
from tbl_menu
order by menu_price, menu_code;*/




-- select field('A', 'A', 'B', 'C');  -- result: 1

SELECT *
FROM tbl_menu
ORDER BY FIELD(orderable_status, 'N', 'Y');