package lecture.section2.model;

import lombok.*;

/// tbl_menu의 한 행을 계층 간 전달하기 위한 데이터 객체
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MenuDTO {
    private int menu_code;
    private String menu_name;
    private int price;
    private int categoryCode;
    private String orderableStatus;
}
