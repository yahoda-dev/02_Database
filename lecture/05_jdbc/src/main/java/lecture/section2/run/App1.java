package lecture.section2.run;

import lecture.section2.common.JDBCTemplate;

import java.sql.Connection;

public class App1 {
    public static void main(String[] args) {
        Connection con = JDBCTemplate.getConnection();
        JDBCTemplate.close(con);
    }
}
