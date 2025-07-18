package book.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PublisherDAO {
	private static PublisherDAO dao = new PublisherDAO();

	public static PublisherDAO getDAO() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private PublisherDAO() {
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
	public void insert(String pname) { //출판사명 입력
		try {
			conn = getConnection();
			String sql="insert into publisher values(publisher_seq.nextval,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			endConnection();
		}
	}
	public List<PublisherDTO> selectList(){
		List<PublisherDTO> list=new ArrayList<>();
		try {
			conn=getConnection();
			String sql="select * from publisher";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PublisherDTO dto=new PublisherDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setPname(rs.getString("pname"));
				list.add(dto);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
		return list;
	}
	public List<PublisherDTO> selectList(int page,int size) { //페이징처리됨
		List<PublisherDTO> list=new ArrayList<>();
		try {
			conn=getConnection();
			String sql="select * FROM (" +
					" select ROWNUM as rn,p.* FROM (" +
					" 		select * FROM publisher ORDER BY pnum" +
					"	) p where ROWNUM <= ?" +
					") WHERE rn > ?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, page*size);//끝번호
			pstmt.setInt(2, (page-1)*size);//시작번호
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PublisherDTO dto=new PublisherDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setPname(rs.getString("pname"));
				list.add(dto);
			}
					
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
		return list;
	}
	//전체 레코드 수 조회
	public int getTotalCount() {
		int totalCount=0;
		try {
			conn=getConnection();
			String sql="select count(*) from publisher";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalCount=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			endConnection();
		}
		return totalCount;
	}
	//전체 페이지 수 계산
	public int getTotalPages(int size) {
		int totalCount=getTotalCount();
		return (int) Math.ceil((double) totalCount/size);
	}

}
