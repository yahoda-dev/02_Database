package model;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDTO {
    private int categoryCode;
    private String categoryName;
    private int refCategoryCode;
}
