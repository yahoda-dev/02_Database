package run.section1;


import common.JDBCTemplate;
import model.MenuDTO;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;


public class App2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Connection conn = JDBCTemplate.getConnection();
        PreparedStatement pstmt = null;
        Properties prop = new Properties();

        System.out.print("메뉴의 이름을 입력해주세요 : ");
        String menuName = sc.nextLine();

        System.out.print("메뉴 가격을 입력하세요 : ");
        int menuPrice = sc.nextInt();

        System.out.print("카테고리 코드를 입력하세요 : ");
        int categoryCode = sc.nextInt();

        System.out.print("판매 여부를 결정해주세요(Y/N) : ");
        sc.nextLine();
        String orderableStatus = sc.nextLine().toUpperCase();


        MenuDTO newMenu = new MenuDTO();
        newMenu.setPrice(menuPrice);
        newMenu.setMenu_name(menuName);
        newMenu.setCategoryCode(categoryCode);
        newMenu.setOrderableStatus(orderableStatus);

        try {
            prop.loadFromXML(new FileInputStream(
                    "src/main/java/mapper/menu-query.xml"
            ));

            pstmt = conn.prepareStatement(prop.getProperty("insertMenu"));
            pstmt.setString(1, newMenu.getMenu_name());
            pstmt.setInt(2, newMenu.getPrice());
            pstmt.setInt(3, newMenu.getCategoryCode());
            pstmt.setString(4, newMenu.getOrderableStatus());

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
