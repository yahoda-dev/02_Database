package run.section4.select;

import common.JDBCTemplate;
import model.MenuDTO;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Connection conn = JDBCTemplate.getConnection();
        PreparedStatement pstmt = null;
        Properties prop = new Properties();
        System.out.print("검색할 메뉴 번호를 입력하세요 : ");
        int menuNumber = sc.nextInt();
        sc.nextLine();


        try (FileInputStream fis = new FileInputStream("src/main/java/mapper/menu-query.xml")) {
            prop.loadFromXML(fis);

            pstmt = conn.prepareStatement(prop.getProperty("selectMenu"));
            pstmt.setInt(1, menuNumber);

            ResultSet rSet = pstmt.executeQuery();
            if (rSet.next()) {
                MenuDTO menu = new MenuDTO(
                        rSet.getInt("menu_code"),
                        rSet.getString("menu_name"),
                        rSet.getInt("menu_price"),
                        rSet.getInt("category_code"),
                        rSet.getString("orderable_status")
                );
                System.out.println("결과: " + menu.toString());
            }

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