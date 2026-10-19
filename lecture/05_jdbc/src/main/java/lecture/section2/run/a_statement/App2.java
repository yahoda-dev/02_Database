package lecture.section2.run.a_statement;

import lecture.section2.common.JDBCTemplate;
import lecture.section2.model.MenuDTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class App2 {
    public static void main(String[] args) {
        MenuDTO dto = null;


        Connection con = JDBCTemplate.getConnection();
        Statement stat = null;
        ResultSet rs = null;


        try {
            String querry = "SELECT * FROM tbl_menu WHERE menu_code = '5'";
            stat = con.createStatement();
            rs = stat.executeQuery(querry);

            while (rs.next()) {
                dto = new MenuDTO(
                        rs.getInt("menu_code"),
                        rs.getString("menu_name"),
                        rs.getInt("menu_price"),
                        rs.getInt("category_code"),
                        rs.getString("orderable_status")
                );
            }
            System.out.println(dto);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
