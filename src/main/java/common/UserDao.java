package common;

import java.sql.*;

public class UserDao {
	// �����ͺ��̽� ����̹�, URL, ����ڸ�, ��й�ȣ ����
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "localhost";
	final String DB_PORT = "3306";
	final String DB_NAME = "test";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	
	// ����� ������ �����ͺ��̽��� �����ϴ� �޼ҵ�
	public void insertUser(User user) throws SQLException{
		Connection connection = null;
		try {
			// MariaDB JDBC ����̹� �ε�
			Class.forName(driver);
			// �����ͺ��̽� ���� ����
			connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			if(connection != null) {
				System.out.println("DB ���� ����");
			}
		} catch(ClassNotFoundException e) {
			// ����̹� Ŭ������ ã�� �� ���� ���� ���� ó��
			System.out.println("����̹� �ε� ����");
			e.printStackTrace();
		} catch(SQLException e) {
			// �����ͺ��̽� ���� ���� ���� ���� ó��
			System.out.println("DB ���� ����");
			e.printStackTrace();
		}
		// ȸ������ ������Ʈ (SQL ������ �غ��ϰ� ����� ������ ����)
		PreparedStatement stmt = connection.prepareStatement("INSERT INTO user (id, password, name, email) VALUES (?, ?, ?, ?)");
		stmt.setString(1, user.getId());
		stmt.setString(2, user.getPassword());
		stmt.setString(3, user.getName());
		stmt.setString(4, user.getEmail());		
		stmt.executeUpdate();		// ���� ����
	}	
	
	// ����� �α��� Ȯ�� �޼ҵ�
	public boolean login(User user) {
        Connection connection = null;
        ResultSet rs = null;   // ��ȯ�� ������ ���� ���� �ʱ�ȭ
        PreparedStatement stmt = null;
        boolean exUser = false;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
            if (connection != null) {
                System.out.println("DB ���� ����");
            }            
            stmt = connection.prepareStatement("SELECT * FROM user WHERE id = ? AND password = ?");
            stmt.setString(1, user.getId());
            stmt.setString(2, user.getPassword());
            rs = stmt.executeQuery();
            
        	// ���� ���� ����� �����ϸ� ��ȿ�� ����ڷ� ����
            if (rs.next()) {  // ResultSet Ŀ���� ���������� �̵��ϴ� �޼ҵ�(��ȯ��: boolean)
            	user.setName(rs.getString("name")); // �α��� �� ������ �̸��� �������� ���� name �Ӽ� ����
            	exUser = true;                
            }
        } catch (ClassNotFoundException e) {
            System.out.println("����̹� �ε� ����");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB ���� ����");
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
		
		
		




