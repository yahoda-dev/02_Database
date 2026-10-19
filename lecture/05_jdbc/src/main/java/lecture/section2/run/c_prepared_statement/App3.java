package lecture.section2.run.c_prepared_statement;

import lecture.section2.common.JDBCTemplate;
import lecture.section2.model.MenuDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class App3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("문자열을 입력하세요: ");
        String inputValue = scanner.nextLine();


        String query = "SELECT * FROM tbl_menu WHERE menu_name LIKE ?";

        ArrayList<MenuDTO> dtos = new ArrayList<>();
        try (
                Connection con = JDBCTemplate.getConnection();
                PreparedStatement pstmt = con.prepareStatement(query);
        ) {
            pstmt.setString(1, "%" + inputValue + "%");
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