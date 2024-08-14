package common;

import java.sql.*;

public class UserDao {
	// �����ͺ��̽� ����̹�, URL, ����ڸ�, ��й�ȣ ����
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "localhost";
	final String DB_PORT = "3306";
	final String DB_NAME = "customer";
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
		PreparedStatement stmt = connection.prepareStatement("INSERT INTO user (customer_user_id, customer_user_pwd, customer_user_name, customer_user_address, customer_user_phoneNumber, customer_user_email) VALUES (?, ?, ?, ?, ?, ?)");
		stmt.setString(1, user.getCustomer_user_id());
		stmt.setString(2, user.getCustomer_user_pwd());
		stmt.setString(3, user.getCustomer_user_name());
		stmt.setString(4, user.getCustomer_user_address());
		stmt.setString(5, user.getCustomer_user_phoneNumber());
		stmt.setString(6, user.getCustomer_user_email());		
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
            stmt = connection.prepareStatement("SELECT * FROM user WHERE customer_user_id = ? AND customer_user_pwd = ?");
            stmt.setString(1, user.getCustomer_user_id());
            stmt.setString(2, user.getCustomer_user_pwd());
            rs = stmt.executeQuery();
            
        	// ���� ���� ����� �����ϸ� ��ȿ�� ����ڷ� ����
            if (rs.next()) {  // ResultSet Ŀ���� ���������� �̵��ϴ� �޼ҵ�(��ȯ��: boolean)
            	user.setCustomer_user_name(rs.getString("customer_user_name")); // �α��� �� ������ �̸��� �������� ���� name �Ӽ� ����
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
		
		
		




