package lecture.section2.run.c_prepared_statement;

import lecture.section2.common.JDBCTemplate;
import lecture.section2.model.MenuDTO;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class App2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("최소 메뉴 가격을 입력하세요: ");
        int minPrice = Integer.parseInt(scanner.nextLine());

        System.out.print("최대 메뉴 가격을 입력하세요: ");
        int maxPrice = Integer.parseInt(scanner.nextLine());

        System.out.print("판매 여부를 입력하세요(Y/N): ");
        String orderableStatus = scanner.nextLine();


        String querry = "select * from tbl_menu where menu_price between ? and ? and orderable_status = ?";

        ArrayList<MenuDTO> dtos = new ArrayList<>();
        try (
                Connection con = JDBCTemplate.getConnection();
                PreparedStatement pstmt = con.prepareStatement(querry);
        ) {
            pstmt.setInt(1, minPrice);
            pstmt.setInt(2, maxPrice);
            pstmt.setString(3, orderableStatus);


            ResultSet rSet = pstmt.executeQuery();

            while (rSet.next()) {
                dtos.add(new MenuDTO(
                                rSet.getInt("menu_code"),
                                rSet.getString("menu_name"),
                                rSet.getInt("menu_price"),
                                rSet.getInt("category_code"),
                                rSet.getString("orderable_status")
                        )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        for (MenuDTO dto : dtos) {
            System.out.println(dto);
        }
    }
}