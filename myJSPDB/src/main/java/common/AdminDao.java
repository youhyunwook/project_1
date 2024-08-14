package common;

import java.sql.*;

public class AdminDao {
		// �����ͺ��̽� ����̹�, URL, ����ڸ�, ��й�ȣ ����
		final String driver = "org.mariadb.jdbc.Driver";
		final String DB_IP = "localhost";
		final String DB_PORT = "3306";
		final String DB_NAME = "admin";
		final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
		private static final String DB_USER = "root";
		private static final String DB_PASSWORD = "1234";
		
		// ����� ������ �����ͺ��̽��� �����ϴ� �޼ҵ�
		public void insertAdmin(Admin admin) throws SQLException{
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
			PreparedStatement stmt = connection.prepareStatement("INSERT INTO adminuser (id, password, name, scode) VALUES (?, ?, ?, ?)");
			stmt.setString(1, admin.getId());
			stmt.setString(2, admin.getPassword());
			stmt.setString(3, admin.getName());
			stmt.setString(4, admin.getScode());		
			stmt.executeUpdate();		// ���� ����
		}	
		
		// ������ �α��� Ȯ�� �޼ҵ�
		public boolean adminLogin(Admin admin) {
	        Connection connection = null;
	        ResultSet rs = null;   // ��ȯ�� ������ ���� ���� �ʱ�ȭ
	        PreparedStatement stmt = null;
	        boolean exAdmin = false;
	        try {
	            Class.forName(driver);
	            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	            if (connection != null) {
	                System.out.println("DB ���� ����");
	            }            
	            stmt = connection.prepareStatement("SELECT * FROM adminuser WHERE id = ? AND password = ?");
	            stmt.setString(1, admin.getId());
	            stmt.setString(2, admin.getPassword());
	            rs = stmt.executeQuery();
	            
	        	// ���� ���� ����� �����ϸ� ��ȿ�� ����ڷ� ����
	            if (rs.next()) {  // ResultSet Ŀ���� ���������� �̵��ϴ� �޼ҵ�(��ȯ��: boolean)
	            	admin.setName(rs.getString("name")); // �α��� �� ������ �̸��� �������� ���� name �Ӽ� ����
	            	exAdmin = true;                
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
	        return exAdmin;				
	    }	
}
