package book.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class MainDAO {
		// DAO 객체 생성
		private static MainDAO dao = new MainDAO();

		// DAO를 가져오는 역할
		public static MainDAO getDAO() {
			return dao;
		}

		// 객체 생성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// DAO 생성자
		private MainDAO() { }

		// 커넥션 연결
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

		// 연결을 끊어주는 메소드
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
		public int memberCount() { //회원 수
			int result=0;
			try {
				conn=getConnection();
				String sql="select count(*) from member3";
				pstmt=conn.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				if(rs.next()) {
					result=rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				endConnection();
			}
			return result;
		}
		public int bookCount() {	//도서 수
			int result=0;
			try {
				conn=getConnection();
				String sql="select count(*) from book";
				pstmt=conn.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				if(rs.next()) {
					result=rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				endConnection();
			}
			return result;
		}
		public int loanCount() { //대출 수
			int result=0;
			try {
				conn=getConnection();
				String sql="select count(*) from loan";
				pstmt=conn.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				if(rs.next()) {
					result=rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				endConnection();
			}
			return result;
		}
		public int notCount() { //미납 수
			int result=0;
			try {
				conn=getConnection();
				String sql="select count(*) from loan where mrdate=null";
				pstmt=conn.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				if(rs.next()) {
					result=rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				endConnection();
			}
			return result;
		}
}
