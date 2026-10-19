package lecture.section2.run.a_statement;

import lecture.section2.common.JDBCTemplate;
import lecture.section2.model.MenuDTO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class App {
    public static void main(String[] args) {
        Connection con = JDBCTemplate.getConnection();

        Statement stat = null;
        ResultSet rs = null;


        try {
            String querry  = "SELECT menu_code, menu_name FROM tbl_menu";
            stat = con.createStatement();
            rs = stat.executeQuery(querry);

            while(rs.next()) {
                System.out.println(rs.getInt("menu_code"));
                System.out.println(rs.getString("menu_name"));
            }
            System.out.println(rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
