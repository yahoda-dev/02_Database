package lecture.section2.run.b_sql_injection;

import lecture.section2.common.JDBCTemplate;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import static lecture.section2.common.JDBCTemplate.getConnection;

public class App {
    // 사용자에게 입력 받은 값이라고 가정하고 생성한 static 변수
    private static String menuName = "한우딸기국밥";
    private static String orderableStatus = "Y";

    public static void main(String[] args) {
        // 1. 커넥션생성
        Connection con = getConnection();
        // 2. Statement 객체 생성
        Statement stmt = null;
        // 3. ResultSet 객체 생성
        ResultSet rset = null;

        // 4. 쿼리 작성 ( menu name과 주문가능여부를 확인하는 쿼리)
        String query =
                "select * from tbl_menu where menu_name = '"
                        + menuName
                        + "' and orderable_status = '" + orderableStatus + "'";

        try {
            stmt = con.createStatement();
            rset = stmt.executeQuery(query);
            if (rset.next()) {
                System.out.println(rset.getString("menu_name") + " 메뉴는 주문 가능합니다.");
            } else {
                System.out.println("주문 가능한 메뉴가 아닙니다.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(stmt);
            JDBCTemplate.close(con);
        }
    }
}