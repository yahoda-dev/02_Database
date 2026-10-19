package lecture.section2.run.c_prepared_statement;

import lecture.section2.common.JDBCTemplate;
import lecture.section2.model.MenuDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class App {
    public static void main(String[] args) {
        String querry = "select * from tbl_menu where menu_code = ?";


        try (
                Connection con = JDBCTemplate.getConnection();
                PreparedStatement pstmt = con.prepareStatement(querry);

        ) {
            // 검색할 메뉴 코드
            int menuCode = 1;
            // 동적파라미터에 값을 대입하는 코드
            pstmt.setInt(1, menuCode);
            ResultSet rSet = pstmt.executeQuery();

            if(rSet.next()) {
                MenuDTO dto = new MenuDTO(
                        rSet.getInt("menu_code"),
                        rSet.getString("menu_name"),
                        rSet.getInt("menu_price"),
                        rSet.getInt("category_code"),
                        rSet.getString("orderable_status")
                );
                System.out.println(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}