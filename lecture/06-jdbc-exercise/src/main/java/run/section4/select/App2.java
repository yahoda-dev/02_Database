package run.section4.select;

import common.JDBCTemplate;
import lombok.*;
import model.CategoryDTO;
import model.MenuDTO;
import model.TempDTO;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

public class App2 {
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

            pstmt = conn.prepareStatement(prop.getProperty("joinMenuAndCategory"));
            pstmt.setInt(1, menuNumber);
            System.out.println("Query:  " + pstmt);
            ResultSet rSet = pstmt.executeQuery();
            if (rSet.next()) {
                System.out.println(rSet);
                MenuDTO menu = new MenuDTO();
                menu.setMenu_code(rSet.getInt("menu_code"));
                menu.setMenu_name(rSet.getString("menu_name"));
                menu.setPrice(rSet.getInt("menu_price"));
                menu.setOrderableStatus(rSet.getString("orderable_status"));

                CategoryDTO category = new CategoryDTO(
                        rSet.getInt("category_code"),
                        rSet.getString("category_name"),
                        rSet.getInt("ref_category_code")
                );
                TempDTO temp = new TempDTO(menu, category);
                System.out.println("Result: " + temp);
            } else {
                System.out.println("조회되는 결과가 없습니다.");
            }

        } catch (IOException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
