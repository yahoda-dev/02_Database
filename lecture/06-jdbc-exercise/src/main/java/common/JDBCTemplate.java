package common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class JDBCTemplate {
    public static Connection getConnection() {
        // Connection 생성
        Connection con = null;
        Properties prop = new Properties();

        try {
            prop.load(new FileReader("src/main/java/config/db.properties"));

            System.out.println("설정 파일을 읽어 왔습니다.");

            Class.forName(prop.getProperty("driver"));
            con = DriverManager.getConnection(
                    prop.getProperty("url"),
                    prop);
        } catch (ClassNotFoundException | SQLException | IOException e) {
            e.printStackTrace();
        }
        System.out.println("커넥션 생성이 완료되었습니다.");
        return con;
    }

    public static void close(Connection con) {
        if (con != null) {
            try {
                con.close();
                System.out.println("Connection을 종료합니다...");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
                System.out.println("Statement를 종료합니다...");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
                System.out.println("ResultSet를 종료합니다...");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
