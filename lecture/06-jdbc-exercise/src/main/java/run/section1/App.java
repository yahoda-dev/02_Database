package run.section1;


import common.JDBCTemplate;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


public class App {
    public static void main(String[] args) {
        Connection conn = JDBCTemplate.getConnection();
        PreparedStatement pstmt = null;
        Properties prop = new Properties();
        try {
            prop.loadFromXML(new FileInputStream(
                    "src/main/java/mapper/menu-query.xml"
            ));

            pstmt = conn.prepareStatement(prop.getProperty("insertMenu"));
            pstmt.setString(1, "봉골레청국장");
            pstmt.setInt(2, 50000);
            pstmt.setInt(3, 1);
            pstmt.setString(4, "Y");

            int result = pstmt.executeUpdate();
            System.out.println(result);

        } catch (IOException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }
}
