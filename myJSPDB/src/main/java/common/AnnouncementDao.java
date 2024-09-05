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
    
//    // 최대 ID 값을 가져오는 메서드
//    public int getMaxId() {
//        Connection conn = null;
//        int maxId = 0;     
//        PreparedStatement stmt = null;       
//        ResultSet rs = null;        
//            
//        try {            
//            Class.forName(driver);        
//            conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
//                        
//            if (conn != null) {
//                System.out.println("DB 접속 성공");
//            }            
//            stmt = conn.prepareStatement("SELECT IFNULL(MAX(Ann_id), 0) FROM announcement");
//            rs = stmt.executeQuery();
//            
//            if (rs.next()) {
//                maxId = rs.getInt(1);
//            }
//            
//        } catch (ClassNotFoundException e) {
//            System.out.println("드라이버 로드 실패");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.out.println("DB 접속 실패");
//            e.printStackTrace();
//        } finally {
//            closeResources(rs, stmt, conn);
//        }
//        return maxId;
//    }
    
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
    
    // 검색 키와 검색 값으로 데이터 수를 계산하는 메서드
//    public int getDataCount(String searchKey, String searchValue) {
//        int totalCount = 0;
//        PreparedStatement stmt = null;
//        ResultSet rs = null;
//        Connection conn = null;
//        String sql;
//        try {
//            Class.forName(driver);        
//            conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
//                        
//            if (conn != null) {
//                System.out.println("DB 접속 성공");
//            } 
//            
//            searchValue = "%" + searchValue + "%";
//            
//            sql = "SELECT IFNULL(COUNT(*), 0) FROM announcement WHERE " + searchKey + " LIKE ?";
//            
//            stmt = conn.prepareStatement(sql);
//            stmt.setString(1, searchValue);
//            rs = stmt.executeQuery();
//            
//            if (rs.next()) {
//                totalCount = rs.getInt(1);
//            }
//            
//        } catch (ClassNotFoundException e) {
//            System.out.println("드라이버 로드 실패");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.out.println("DB 접속 실패");
//            e.printStackTrace();
//        } finally {
//            closeResources(rs, stmt, conn);
//        }
//        return totalCount;
//    }
//    
//    // 공지사항 목록을 페이지별로 가져오는 메서드
//    public List<Announcement> getLists(int start, int end, String searchKey, String searchValue) {
//        List<Announcement> lists = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rs = null;
//        String sql;
//
//        try {
//            Class.forName(driver);        
//            conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
//
//            if (conn != null) {
//                System.out.println("DB 접속 성공");
//            }
//            
//            searchValue = "%" + searchValue + "%";
//
//            sql = "SELECT * FROM (";
//            sql += "SELECT @rownum := @rownum + 1 AS rnum, data.* FROM (";
//            sql += "SELECT Ann_id, Ann_author_name, Ann_title, Ann_body, create_date ";
//            sql += "FROM announcement WHERE " + searchKey + " LIKE ? ";
//            sql += "ORDER BY Ann_id DESC) data, (SELECT @rownum := 0) r) AS numbered ";
//            sql += "WHERE rnum BETWEEN ? AND ?";
//
//            stmt = conn.prepareStatement(sql);
//            stmt.setString(1, searchValue);
//            stmt.setInt(2, start);
//            stmt.setInt(3, end);
//            
//            rs = stmt.executeQuery();
//            
//            while (rs.next()) {
//                Announcement dto = new Announcement();
//                dto.setAnn_id(rs.getInt("Ann_id"));
//                dto.setAnn_author_name(rs.getString("Ann_author_name"));
//                dto.setAnn_title(rs.getString("Ann_title"));
//                dto.setAnn_body(rs.getString("Ann_body"));
//                dto.setCreate_date(rs.getDate("create_date"));
//                
//                lists.add(dto);
//            }
//            
//        } catch (ClassNotFoundException e) {
//            System.out.println("드라이버 로드 실패");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.out.println("DB 접속 실패");
//            e.printStackTrace();
//        } finally {
//            closeResources(rs, stmt, conn);
//        }    
//        return lists;
//    }
//    
//    // 공지사항을 수정하는 메서드
//    public int updateData(Announcement Ann) {
//        int result = 0;        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        String sql;
//        
//        try {
//            Class.forName(driver);        
//            conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
//
//            if (conn != null) {
//                System.out.println("DB 접속 성공");
//            }
//            
//            sql = "UPDATE announcement SET Ann_author_name=?, Ann_title=?, Ann_body=?, create_date=NOW() WHERE Ann_id=?";
//                    
//            stmt = conn.prepareStatement(sql);
//            
//            stmt.setString(1, Ann.getAnn_author_name());
//            stmt.setString(2, Ann.getAnn_title());
//            stmt.setString(3, Ann.getAnn_body());
//            stmt.setInt(4, Ann.getAnn_id());
//                        
//            result = stmt.executeUpdate();
//            
//        } catch (ClassNotFoundException e) {
//            System.out.println("드라이버 로드 실패");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.out.println("DB 접속 실패");
//            e.printStackTrace();
//        } finally {
//            closeResources(null, stmt, conn);
//        }    
//        return result;
//    }
//    
//    // 공지사항을 삭제하는 메서드
//    public int deleteData(int Ann_id) {
//        int result = 0;        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        String sql;
//        
//        try {
//            Class.forName(driver);        
//            conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
//
//            if (conn != null) {
//                System.out.println("DB 접속 성공");
//            }
//            
//            sql = "DELETE FROM announcement WHERE Ann_id=?";
//            
//            stmt = conn.prepareStatement(sql);            
//            stmt.setInt(1, Ann_id);
//            
//            result = stmt.executeUpdate();            
//            
//        } catch (ClassNotFoundException e) {
//            System.out.println("드라이버 로드 실패");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.out.println("DB 접속 실패");
//            e.printStackTrace();
//        } finally {
//            closeResources(null, stmt, conn);
//        }    
//        return result;
//    }
    
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
