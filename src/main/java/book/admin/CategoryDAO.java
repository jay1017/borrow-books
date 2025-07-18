package book.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CategoryDAO {

	private static CategoryDAO dao = new CategoryDAO();

	public static CategoryDAO getDAO() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private CategoryDAO() {
	}

	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.219.198:1521/orcl";
			String user = "team02";
			String password = "1234";
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB 연결 실패");
		}
		return conn;
	}

	private void endConnection() {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void insert(String caname) {
		try {
			conn = getConnection();
			String sql="insert into category2 values(category2_seq.nextval,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, caname);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			endConnection();
		}

	}
}
