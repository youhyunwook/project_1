package common;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnnouncementDao {
    // 데이터베이스 드라이버, URL, 사용자명, 비밀번호 설정
    final String driver = "org.mariadb.jdbc.Driver";
    final String DB_IP = "localhost";
    final String DB_PORT = "3306";
    final String DB_NAME = "project";
    final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";
    
    // 공지사항을 등록하는 메서드
    public void insertAnn(Announcement Ann) {
        Connection conn = null;
        PreparedStatement stmt = null;  
        String sql;
                
        try {
            Class.forName(driver);        
            conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
                        
            if (conn != null) {
                System.out.println("DB 접속 성공");
            } 
            
            sql = "INSERT INTO announcement (Ann_author_id, Ann_title, Ann_body, create_date) ";
            sql += "VALUES (?, ?, ?, NOW())";
            
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, Ann.getAnn_author_id());
            stmt.setString(2, Ann.getAnn_title());
            stmt.setString(3, Ann.getAnn_body());
            stmt.executeUpdate();
            
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로드 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 접속 실패");
            e.printStackTrace();
        } finally {
            if (stmt != null) try { stmt.close(); } catch(Exception e) { e.printStackTrace(); }
            if( conn != null) try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
        }        
    }
    
    public void AnnouncementDel(int postId) throws SQLException {
		// TODO Auto-generated method stub
    	String sql_del = "DELETE FROM announcement WHERE Ann_id = ?";
		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	            PreparedStatement pstmt = conn.prepareStatement(sql_del)) {
	            pstmt.setInt(1, postId);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e; // 예외를 다시 던져서 호출자에게 알림
	        }
	}
    
   
    // 자원 해제 메서드
    private void closeResources(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
