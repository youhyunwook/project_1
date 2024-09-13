package common;

import java.sql.*;

public class UserDao {
	// 데이터베이스 드라이버, URL, 사용자명, 비밀번호 설정
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "localhost";
	final String DB_PORT = "3306";
	final String DB_NAME = "project";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	
	// 사용자 정보를 데이터베이스에 삽입하는 메소드
	public void insertUser(User user, String emailId, String emailDomain) throws SQLException{
		Connection connection = null;
		String customer_user_email = emailId + "@" + emailDomain;
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
		PreparedStatement stmt = connection.prepareStatement("INSERT INTO user (customer_user_id, customer_user_pwd, customer_user_name, customer_user_company, customer_user_phoneNumber, customer_user_email) VALUES (?, ?, ?, ?, ?, ?)");
		stmt.setString(1, user.getCustomer_user_id());
		stmt.setString(2, user.getCustomer_user_pwd());
		stmt.setString(3, user.getCustomer_user_name());
		stmt.setString(4, user.getCustomer_user_company());
		stmt.setString(5, user.getCustomer_user_phoneNumber());
		stmt.setString(6, customer_user_email);		
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
            stmt = connection.prepareStatement("SELECT * FROM user WHERE customer_user_id = ? AND customer_user_pwd = ?");
            stmt.setString(1, user.getCustomer_user_id());
            stmt.setString(2, user.getCustomer_user_pwd());
            rs = stmt.executeQuery();
            
        	// 쿼리 실행 결과가 존재하면 유효한 사용자로 간주
            if (rs.next()) {  // ResultSet 커서를 다음행으로 이동하는 메소드(반환값: boolean)
            	user.setCustomer_user_name(rs.getString("customer_user_name")); // 로그인 후 보여줄 이름을 가져오기 위한 name 속성 설정
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
	
	// findId 아이디 찾기
	public boolean findId(User user) throws ClassNotFoundException {
		String customer_user_id = null;
        Connection connection = null;
        PreparedStatement pstmt = null;
        boolean exUser = false;
        ResultSet rs = null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
            if (connection != null) {
                System.out.println("DB 접속 성공");
            }
            pstmt = connection.prepareStatement("SELECT * FROM user WHERE customer_user_name = ? AND customer_user_email = ?");
            pstmt.setString(1, user.getCustomer_user_name());
            pstmt.setString(2, user.getCustomer_user_email());
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user.setCustomer_user_id(rs.getString("customer_user_id"));
                exUser = true;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (connection != null && !connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return exUser;			
	}
	
	// findId 비밀번호 찾기
	public boolean findPwd(User user) throws ClassNotFoundException {
		String customer_user_pwd = null;
	    Connection connection = null;
	    PreparedStatement pstmt = null;
	    boolean exUser = false;
	    ResultSet rs = null;
	    try {
	        Class.forName(driver);
	        connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	        if (connection != null) {
	            System.out.println("DB 접속 성공");
	        }
	        pstmt = connection.prepareStatement("SELECT * FROM user WHERE customer_user_id = ? AND customer_user_name = ? AND customer_user_email = ?");
	        pstmt.setString(1, user.getCustomer_user_id());
	        pstmt.setString(2, user.getCustomer_user_name());
	        pstmt.setString(3, user.getCustomer_user_email());
	        rs = pstmt.executeQuery();
	            
	        if (rs.next()) {
	            user.setCustomer_user_pwd(rs.getString("customer_user_pwd"));
	            exUser = true;
	        }
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pstmt != null) {
	                pstmt.close();
	            }
	            if (connection != null && !connection.isClosed()) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return exUser;			
	}
	
    // 사용자 정보 조회
    public User getUserById(String userId) throws SQLException {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM user WHERE customer_user_id = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();                
                user.setCustomer_user_pwd(rs.getString("customer_user_pwd"));
                user.setCustomer_user_name(rs.getString("customer_user_name"));
                user.setCustomer_user_company(rs.getString("customer_user_company"));
                user.setCustomer_user_phoneNumber(rs.getString("customer_user_phoneNumber"));
                user.setCustomer_user_email(rs.getString("customer_user_email"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (connection != null && !connection.isClosed()) connection.close();
        }

        return user;
    }

    // 사용자 정보 수정
    public void updateUser(User user) throws SQLException {
        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);

            String sql = "UPDATE user SET customer_user_pwd = ?, customer_user_name = ?, customer_user_company = ?, customer_user_phoneNumber = ?, customer_user_email = ? WHERE customer_user_id = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, user.getCustomer_user_pwd());
            pstmt.setString(2, user.getCustomer_user_name());
            pstmt.setString(3, user.getCustomer_user_company());
            pstmt.setString(4, user.getCustomer_user_phoneNumber());
            pstmt.setString(5, user.getCustomer_user_email());
            pstmt.setString(6, user.getCustomer_user_id());
            pstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (connection != null && !connection.isClosed()) connection.close();
        }
    }
}
		
		
		




