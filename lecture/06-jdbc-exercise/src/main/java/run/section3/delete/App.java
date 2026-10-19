package run.section3.delete;

import common.JDBCTemplate;
import model.MenuDTO;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Connection conn = JDBCTemplate.getConnection();
        PreparedStatement pstmt = null;
        Properties prop = new Properties();
        System.out.print("변경할 메뉴 번호를 입력하세요 : ");
        int menuNumber = sc.nextInt();
        sc.nextLine();


        try (FileInputStream fis = new FileInputStream("src/main/java/mapper/menu-query.xml")) {
            prop.loadFromXML(fis);

            pstmt = conn.prepareStatement(prop.getProperty("deleteMenu"));
            pstmt.setInt(1, menuNumber);

            int result = pstmt.executeUpdate();
            System.out.println("영향을 받은 행의 수: " + result);

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