package common;

import java.sql.*;

public class UserDao {
	// 데이터베이스 드라이버, URL, 사용자명, 비밀번호 설정
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "localhost";
	final String DB_PORT = "3306";
	final String DB_NAME = "test";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	
	// 사용자 정보를 데이터베이스에 삽입하는 메소드
	public void insertUser(User user) throws SQLException{
		Connection connection = null;
		try {
			// MariaDB JDBC 드라이버 로드
			Class.forName(driver);
			// 데이터베이스 연결 생성
			connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			if(connection != null) {
				System.out.println("DB 접속 성공");
			}
		} catch(ClassNotFoundException e) {
			// 드라이버 클래스를 찾을 수 없을 때의 예외 처리
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		} catch(SQLException e) {
			// 데이터베이스 연결 실패 시의 예외 처리
			System.out.println("DB 접속 실패");
			e.printStackTrace();
		}
		// 회원가입 업데이트 (SQL 쿼리를 준비하고 사용자 정보를 삽입)
		PreparedStatement stmt = connection.prepareStatement("INSERT INTO user (id, password, name, email) VALUES (?, ?, ?, ?)");
		stmt.setString(1, user.getId());
		stmt.setString(2, user.getPassword());
		stmt.setString(3, user.getName());
		stmt.setString(4, user.getEmail());		
		stmt.executeUpdate();		// 쿼리 실행
	}	
	
	// 사용자 로그인 확인 메소드
	public boolean login(User user) {
        Connection connection = null;
        ResultSet rs = null;   // 반환값 데이터 저장 공간 초기화
        PreparedStatement stmt = null;
        boolean exUser = false;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
            if (connection != null) {
                System.out.println("DB 접속 성공");
            }            
            stmt = connection.prepareStatement("SELECT * FROM user WHERE id = ? AND password = ?");
            stmt.setString(1, user.getId());
            stmt.setString(2, user.getPassword());
            rs = stmt.executeQuery();
            
        	// 쿼리 실행 결과가 존재하면 유효한 사용자로 간주
            if (rs.next()) {  // ResultSet 커서를 다음행으로 이동하는 메소드(반환값: boolean)
            	user.setName(rs.getString("name")); // 로그인 후 보여줄 이름을 가져오기 위한 name 속성 설정
            	exUser = true;                
            }
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로드 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 접속 실패");
            e.printStackTrace();
        } finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(connection != null && !connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
        return exUser;				
    }
		
}
		
		
		




