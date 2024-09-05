package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;

public class boardDao {
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "localhost";
	final String DB_PORT = "3306";
	final String DB_NAME = "project";
	final String DB_URL1 = "jdbc:mariadb://"+DB_IP+":"+DB_PORT+"/"+DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	
	public void insertintoboard(board board) throws SQLException{
	
		Connection connection = null;
		PreparedStatement stmt = null;
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			if(connection != null) {
				System.out.println("DB 접속 성공");
			}
			
		stmt = connection.prepareStatement
				("INSERT INTO posts (Customer_user_id, title, body) VALUES (?, ?, ?)");
		stmt.setString(1, board.getCustomer_user_id());
		stmt.setString(2, board.getTitle());
		stmt.setString(3, board.getBody());
		stmt.executeUpdate();
		
	}catch (ClassNotFoundException e) {
        System.out.println("드라이버 로드 실패");
        e.printStackTrace();
    }finally {
        // 자원 해제
        if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        if (connection != null) try { connection.close(); } catch (Exception e) { e.printStackTrace(); }
    	}
	}
	
	public void delete_post(board board) throws SQLException {


	}
}
